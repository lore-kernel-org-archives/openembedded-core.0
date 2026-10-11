Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08E6CA9EBD
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:59:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32780.1791748795180028612
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=ko9/yN2F;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202610111959531a87668086000207a0-r_3eii@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610111959531a87668086000207a0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jiywu+vFjiRrMIH+anyzNSMTD5oM4c2RHYXNEsrTynI=;
 b=ko9/yN2FMOLohA/I958O6C6/oQhIqFC4fJmSl06au6ntD7dzVyfijUfu3Ka1WhSxrISWEv
 zU5+G2Rb54hs/uHYYV4Qe1vQG6MkjZTqoQb3tOMv5ecau4j5vOkPubShXimNfqT4dDYZ9vYR
 PwQpN9OskOR/b1C89bNNwWVZniAhqf8dWhUROWZKhwmkOhSndjngJDLQEQV3HRpoHaEoklZI
 AdqHwIDI9NVjV2pXnylW/P0ImjsW57mv9Vu1dzY9I7Lx+rqOWyaDzwBO+XlrweOIAxZIs37N
 8nhnKRRd103bamhxE0O+PVKav3xDdkiSZSAUjX4ljGYU3ZFJjbSPScyw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/11] runqemu: make port lock directory patchable
Date: Sun, 11 Oct 2026 21:59:14 +0200
Message-ID: <20261011195949.2118607-10-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 19:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247585

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Use a class setting for the shared port-lock directory instead of a
literal path in NFS allocation. Keep the production default unchanged
and let subsequent slirp locking use the same setting.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c569fc7c84..0e0c77076c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -136,6 +136,8 @@ def get_first_file(globs):
     return ''
 
 class BaseConfig(object):
+    PORT_LOCK_DIR = "/tmp/qemu-port-locks"
+
     def __init__(self):
         # The self.d saved vars from self.set(), part of them are from qemuboot.conf
         self.d = {'QB_KERNEL_ROOT': '/dev/vda'}
@@ -1059,7 +1061,7 @@ to your build configuration.
                 self.nfs_server = '192.168.7.@GATEWAY@'
 
         nfsd_port = 3048 + self.nfs_instance
-        lockdir = "/tmp/qemu-port-locks"
+        lockdir = self.PORT_LOCK_DIR
         self.make_lock_dir(lockdir)
         while not self.check_free_port('localhost', nfsd_port, lockdir):
             self.nfs_instance += 1
-- 
2.56.0


