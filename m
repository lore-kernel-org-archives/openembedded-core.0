Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC72C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:26 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.69608.1677431002139547200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lGQXtwls;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so7736000pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYs3cfhwdNSUM+kzk4NAdYRnvFCQItvQOocSeYYJv3k=;
        b=lGQXtwlshRRIEdTkHADyqLhqKOMfDoK2x60g86xxB3Pu5dLi0u1FpALlRkIlHqdkz1
         ribCFXNYGKSCo69aVzVlfBv7+lKqutpM6ktYL2E3ypIho9jvutCleTLXS8l810epttvz
         LVxUPbUjq1xOoK7yMJ1uiqcbLxyDNyYyTixbprWH3jx4O6CwjX0zdFhQ34STe3KfoTj5
         /NEizeITqyoQYK4hx4M2QBQBOfdyYfzX6nWpbxVc4qyR7DhT6kXRZKpbCs3cL+eAPc6t
         hD/3nuQAlKGwxGu5j1yjweWGR4W/ejnSxolf+KAtV1xjXCARDrsfO03p2xrAtGxp3hpt
         +7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYs3cfhwdNSUM+kzk4NAdYRnvFCQItvQOocSeYYJv3k=;
        b=0DSc2z5jrOOvmxytuMW80ij6l1eQw2xJv+mKwpmMVaQXDJ5GOIvusGJ+6XhwIAcHab
         keNcddxd/rJVTyi3J0d8KfIifMDMnHwSAWrB1fqaZXxCHMSRfUePJg8EYklAwijIblsT
         GfzEY0N4NqWWdtgj3KUPKdwkkK2YVr7xU1ll0FKtQ0dQdZ/YP5KC1Dc6jWWj3BRzDNTT
         az/jwZrZUYuGzgBUM9CTfc8D2mXd8efimrM1sx8/zLeUpiFJ1c7lnMPRnnTQCTTsySSp
         3S2t0Ztgxa8Ew+nIF/BDQPRGTwkNtWiNk2wb+EvIWHAisSgWTxE7h8afQ/6f2xw/nc1Q
         tglg==
X-Gm-Message-State: AO0yUKXinrINpMX1AqDlHFATqU1l3ajCaCtrMPGle3lXQGLsLeLPcqEk
	VPyhpRVfJJiaLs72OMZE7ndzETa7x8jPfOgS+KM=
X-Google-Smtp-Source: AK7set8Fnfyas1YLq7B3lzDQB2OhetTUtFkpwGpzdNuSZjIQXqKLHxKAzE+27wzchxYYGK23Xb/FVA==
X-Received: by 2002:a17:90b:1d82:b0:232:cdb6:c4ad with SMTP id pf2-20020a17090b1d8200b00232cdb6c4admr22826610pjb.0.1677431001123;
        Sun, 26 Feb 2023 09:03:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/28] runqemu: kill qemu if it hangs
Date: Sun, 26 Feb 2023 07:02:24 -1000
Message-Id: <9047a07bc8a8c440cb30c6bb49710362eae41330.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177766

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
index a6ea578564..db35d83fa9 100755
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
@@ -1517,7 +1517,7 @@ class BaseConfig(object):
             for descriptor in self.portlocks.values():
                 pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
-        self.qemupid = process.pid
+        self.qemuprocess = process
         retcode = process.wait()
         if retcode:
             if retcode == -signal.SIGTERM:
@@ -1533,6 +1533,15 @@ class BaseConfig(object):
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
@@ -1560,6 +1569,9 @@ class BaseConfig(object):
                 else:
                     shutil.rmtree(ent)
 
+        # Deliberately ignore the return code of 'tput smam'.
+        subprocess.call(["tput", "smam"])
+
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None):
@@ -1636,12 +1648,8 @@ def main():
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
@@ -1663,8 +1671,6 @@ def main():
         return 1
     finally:
         config.cleanup()
-        # Deliberately ignore the return code of 'tput smam'.
-        subprocess.call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.34.1


