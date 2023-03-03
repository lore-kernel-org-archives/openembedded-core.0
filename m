Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20886C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.27637.1677860301704987727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jFLKrquU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id x34so3082654pjj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fr0oFBwmzYCw17JUxSodPNovrNCQ1/9rX9UIoADK20=;
        b=jFLKrquUkZodhnYM0F5PuxUA2G3BuvU+DSrboPiiY3oFg2ws+kSekXTJmj82L7MoKu
         bSz85dtj8zRFjTfc5Sok73pNo585J/4BRBkZNT2LXksDWJypqfIObgPHDNBRz30AHzJ3
         2bH8gAs06XqYpiKZHK/F+OiHdhcMMwky+k+UaNd9un12W/zB8A/q1Qf9tXN/HvCsmxNZ
         TfB2vDcnpdu8h4CIDRq3TwYXM9mwFx5PvcsZlLJ6vZJ9aB13rU7lrUT0feH6suTQD5Hp
         ySkq6llrftKO1JLBz8Lq1W6VHqQpS8zzXF6mSNEWqunPgfaQZ1QYQcIZmJfIcSXLyhhv
         l7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fr0oFBwmzYCw17JUxSodPNovrNCQ1/9rX9UIoADK20=;
        b=c7Nq+P3TeLed/NHwbmJwZA38vghos0oPzgEPV3dN/XXIFw93vAjdx+4g52EAg2TH/L
         mFO0FAA+ffnPRfDeTaqP8vSjW0CkiemuKaR+I6qRNfQn267OIzaNKyV4hJi5iwKKDJtY
         VlvvAJ/LefGLtf+ZCE7VUDTt2cdluiKLrrmYjouf/3ZaefrEojabwnc1rnArcz80+huI
         16YD9eI6KAzfNUKwPWvT5kKsbtc9NObng3+RQjBKK/3a9xMx8xFWtEQSHnzMdG1SD05O
         15MzC7bS/MkLtmfFTukLaqPKhXQ5Ju6lV57W8WxoXt7O/+nIWx07S9pTOnoPZpX8ecg6
         Tb5A==
X-Gm-Message-State: AO0yUKU545ye9XanzGGv16uptHFEjiJXYkdbql7CTH1YpG947KBVlLbU
	WwSYOxsGfRxIBLHHJSIwx1/gfi/oUuUZg9qYeEE=
X-Google-Smtp-Source: AK7set8Wc23n4dYW5hSc/qYcBIt7REl0PvBXZKL8FeQxCV7mqPoWWELED4Ug632pq8eUsG/unCdHmg==
X-Received: by 2002:a17:903:441:b0:19e:7d5b:90fd with SMTP id iw1-20020a170903044100b0019e7d5b90fdmr2289577plb.41.1677860300665;
        Fri, 03 Mar 2023 08:18:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/29] runqemu: kill qemu if it hangs
Date: Fri,  3 Mar 2023 06:17:26 -1000
Message-Id: <de9942f83af3eb24a84c59eace80b8db60d2e183.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178017

From: Mikko Rapeli <mikko.rapeli@linaro.org>

qemu doesn't always behave well and can hang too.
kill it with force if it was still alive. Move clean up
commands into cleanup() function.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 079c2935d2f585ce49e1c7daab2155fcf0094c48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0cce8bb96a..5a98abfffe 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -211,7 +211,7 @@ class BaseConfig(object):
         self.mac_slirp = "52:54:00:12:35:"
         # pid of the actual qemu process
         self.qemu_environ = os.environ.copy()
-        self.qemupid = None
+        self.qemuprocess = None
         # avoid cleanup twice
         self.cleaned = False
         # Files to cleanup after run
@@ -1512,7 +1512,7 @@ class BaseConfig(object):
             for descriptor in self.portlocks.values():
                 pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
-        self.qemupid = process.pid
+        self.qemuprocess = process
         retcode = process.wait()
         if retcode:
             if retcode == -signal.SIGTERM:
@@ -1528,6 +1528,15 @@ class BaseConfig(object):
         signal.signal(signal.SIGTERM, signal.SIG_IGN)
 
         logger.info("Cleaning up")
+
+        if self.qemuprocess:
+            try:
+                # give it some time to shut down, ignore return values and output
+                self.qemuprocess.send_signal(signal.SIGTERM)
+                self.qemuprocess.communicate(timeout=5)
+            except subprocess.TimeoutExpired:
+                self.qemuprocess.kill()
+
         with open('/proc/uptime', 'r') as f:
             uptime_seconds = f.readline().split()[0]
         logger.info('Host uptime: %s\n' % uptime_seconds)
@@ -1555,6 +1564,9 @@ class BaseConfig(object):
                 else:
                     shutil.rmtree(ent)
 
+        # Deliberately ignore the return code of 'tput smam'.
+        subprocess.call(["tput", "smam"])
+
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None):
@@ -1631,12 +1643,8 @@ def main():
             subprocess.check_call([renice, str(os.getpid())])
 
         def sigterm_handler(signum, frame):
-            logger.info("SIGTERM received")
-            if config.qemupid:
-                os.kill(config.qemupid, signal.SIGTERM)
+            logger.info("Received signal: %s" % (signum))
             config.cleanup()
-            # Deliberately ignore the return code of 'tput smam'.
-            subprocess.call(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1658,8 +1666,6 @@ def main():
         return 1
     finally:
         config.cleanup()
-        # Deliberately ignore the return code of 'tput smam'.
-        subprocess.call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.34.1


