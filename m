Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C84C624A3
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:54 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9454.1788100183423738933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=iXTwJIkV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2026083014294168724626d6000207e5-rla8vf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026083014294168724626d6000207e5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qQsiGQuN9PWLAXM0tV2Si2q1EIjTUFuCISwIE2mvvFs=;
 b=iXTwJIkVe07MRtQwu4/uBfo3n0Rlz0ACXyxpZH7oirlSlTc6uzCtmDpEzZbkhOYKwBtlOx
 hlkZTwPZK9RKSv7UZPdDQcTHK0P7pRCUjIucnA5QQZTXEvShCW+Obop6EHexSAHp0yM822kY
 mBqokg1KlMKfbXWCLyT8/Y2g0i+y6BymiVMAhTkpdWifjH+AEa2ZXEv/aGzOrdRfkhZ9AbMP
 op3mlha9QnLSwhsOfUYX3ch9rdrbZ7rOWa8qWukq+NkCrZ0Ir0sDTM6VaBCMJC6UlJN3Luyn
 KYu8o2GzrUvUmIBmgS6MFmmWd6QlrqbWDFYFpkeq9ot7iyeq+AHZ+HfQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 07/24] oeqa: QemuTarget: set use_slirp when slirp is in runqemuparams
Date: Sun, 30 Aug 2026 16:28:34 +0200
Message-ID: <20260830142922.17241-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244673

From: Adrian Freihofer <adrian.freihofer@siemens.com>

QemuRunner needs use_slirp=True to parse the guest IP address from the
hostfwd=tcp: entry in the QEMU command line rather than from the TAP-style
ip= kernel argument. QemuRunner is constructed before the runqemuparams
are known, so use_slirp defaults to False.

Set self.runner.use_slirp = True in QemuTarget.start() when 'slirp'
appears in runqemuparams, before calling the runner. This is the
earliest point at which runqemuparams is available and is the natural
place to propagate mode flags to the already-constructed runner.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/targetcontrol.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index fa6b43bb35..1deea2e5ce 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -24,6 +24,7 @@ class BaseTarget(object, metaclass=ABCMeta):
     def __init__(self, d, logger):
         self.connection = None
         self.ip = None
+        self.port = None
         self.server_ip = None
         self.datetime = d.getVar('DATETIME')
         self.testdir = d.getVar("TEST_LOG_DIR")
@@ -163,6 +164,8 @@ class QemuTarget(BaseTarget):
         super(QemuTarget, self).deploy()
 
     def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
+        if 'slirp' in runqemuparams.split():
+            self.runner.use_slirp = True
         if launch_cmd:
             start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd, qemuparams=params)
         else:
@@ -171,8 +174,16 @@ class QemuTarget(BaseTarget):
         if start:
             if ssh:
                 self.ip = self.runner.ip
+                self.port = None
+                if self.runner.use_slirp:
+                    # In slirp mode the runner's ip is "host:port"
+                    ip_port = self.runner.ip.split(':')
+                    if len(ip_port) == 2:
+                        self.ip, self.port = ip_port
+                    else:
+                        self.logger.error("Could not get host machine port to connect qemu with slirp, ssh will not be able to connect to qemu with slirp")
                 self.server_ip = self.runner.server_ip
-                self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
+                self.connection = SSHControl(ip=self.ip, logfile=self.sshlog, port=self.port)
         else:
             self.stop()
             if os.path.exists(self.qemulog):
@@ -192,13 +203,21 @@ class QemuTarget(BaseTarget):
         self.loggerhandler.close()
         self.connection = None
         self.ip = None
+        self.port = None
         self.server_ip = None
 
     def restart(self, params=None):
         if self.runner.restart(params):
             self.ip = self.runner.ip
+            self.port = None
+            if self.runner.use_slirp:
+                ip_port = self.runner.ip.split(':')
+                if len(ip_port) == 2:
+                    self.ip, self.port = ip_port
+                else:
+                    self.logger.error("Could not get host machine port to connect qemu with slirp, ssh will not be able to connect to qemu with slirp")
             self.server_ip = self.runner.server_ip
-            self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
+            self.connection = SSHControl(ip=self.ip, logfile=self.sshlog, port=self.port)
         else:
             raise RuntimeError("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
-- 
2.55.0


