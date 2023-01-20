Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C8AC38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:00 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.82181.1674238318084239910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=u6MB5OqW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 78so4740759pgb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1Dgq3cS9uqfVbGeGT7ikHu39TgI5JHNERaSqW2BFzg=;
        b=u6MB5OqW1b/KBxHLS5c+MT2uB/AKkrO8Akt1nURiR94tI5SV2NTtagUc/oVbKrao3g
         QsSV+UpRjbjatijoXWcguf0DbIuExVuzBKguQp0qruJ/Yp7cz4X59Ld3KrSk6sNd25F7
         +vvqGZXxxokfeALV2xBs7SLjkvwXgd4Nb0rUo3PJC01zjru8vaPAiupQtgpnio6BeHvo
         7ae599uaWtL3fpwZFrBMhWAWznwtmdXTD3hVJt0yldRiGuSV49jzI7c0MUwiq/goO2x/
         WU5+PmSb4NoBWpcT4pLxVVRcESnoNs/eY7V5JfbZKkPQhc9Gp/ynr/673pAGkIetphkI
         2ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1Dgq3cS9uqfVbGeGT7ikHu39TgI5JHNERaSqW2BFzg=;
        b=hO+D/h2OZ4t1uWGlBjlRsnP1UeqBENfTMlMz3G6GaRjQqd6NdVBxze2mCeOfqbtjBn
         AOx+6CFqQ/5YhmUYVY1HihRtDV2igOarNguFnB8PQoh8oBwwpweDBmfgE9DS4IlBU27X
         s+Iryn0QnfMrunalG9DGjEkgsM4B9pJLWwWhzzGnTbeG1JYr0P0alw9xakTh8H5sdU1K
         IqO2nF7/6H4FGbYWZq9AYwhD7azJaMkIE1g1sy/o5AW9WFvoO0VtIYF6geXhIzbB3B2W
         ghbAnrAZEaeS0M/kL2MIIDOwou1Kt9eBdwz9TZpY6ktcPXHE5eBnjnGmYMrD8oQMi/A5
         014Q==
X-Gm-Message-State: AFqh2kpMaxkavyveYXvfF7+KKUwDUtYKpuPoGaBiTXQriyf9btoYKy8u
	7blfrtcmmqxKAqFx2fQGn9h66jdA/1JKHxnFMac=
X-Google-Smtp-Source: AMrXdXsf1EZwxfiFiwNjebbThn+MKqWwtf/J5dWf3EjwzerBgymE8mPnvn0SbzbPilaI9I15JSM4Hw==
X-Received: by 2002:a05:6a00:4088:b0:58d:9ad6:6ae7 with SMTP id bw8-20020a056a00408800b0058d9ad66ae7mr17843277pfb.19.1674238317039;
        Fri, 20 Jan 2023 10:11:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 29/41] oeqa/selftest/debuginfod: improve testcase
Date: Fri, 20 Jan 2023 08:10:46 -1000
Message-Id: <fdce8ecdc27796955156b9c4a91ccaca80459ec5.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176236

From: Ross Burton <ross.burton@arm.com>

Primarily, before running the debuginfod-find tool, check that the
debuginfod server has finished sweeping the deploy directory.  If we
make the request too soon then there's a rare chance that we run the
client before it has scanned the right packages, and the log gets
swamped with warnings from sqlite due to a race.

Also:
- unset DEBUGINFOD_URLS so the debuginfod doesn't proxy to an upstream
  server provided by the host distro
- Lower concurrency to reduce system load and handle systems with lower
  maximum open file counts but lots of cores (as the concurrency means
  cores*2*2 open files)
- Set the refresh times to 0 so we never rescan during the test
- Only scan the packages for the format which the image is using
- Log the commands that are being invoked

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d65729748253eaa640333198ca8aec05946cb9e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 67 +++++++++++++++++++---
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/selftest/cases/debuginfod.py
index 3c40119282..37f51760fb 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -12,6 +12,36 @@ from oeqa.utils.commands import bitbake, get_bb_var, runqemu
 
 
 class Debuginfod(OESelftestTestCase):
+
+    def wait_for_debuginfod(self, port):
+        """
+        debuginfod takes time to scan the packages and requesting too early may
+        result in a test failure if the right packages haven't been scanned yet.
+
+        Request the metrics endpoint periodically and wait for there to be no
+        busy scanning threads.
+
+        Returns True if debuginfod is ready, False if we timed out
+        """
+        import time, urllib
+
+        # Wait a minute
+        countdown = 6
+        delay = 10
+
+        while countdown:
+            time.sleep(delay)
+            try:
+                with urllib.request.urlopen("http://localhost:%d/metrics" % port) as f:
+                    lines = f.read().decode("ascii").splitlines()
+                    if "thread_busy{role=\"scan\"} 0" in lines:
+                        return True
+            except urllib.error.URLError as e:
+                self.logger.error(e)
+            countdown -= 1
+        return False
+
+
     def test_debuginfod(self):
         self.write_config(
             """
@@ -25,29 +55,50 @@ CORE_IMAGE_EXTRA_INSTALL += "elfutils"
         cmd = [
             os.path.join(native_sysroot, "usr", "bin", "debuginfod"),
             "--verbose",
+            # In-memory database, this is a one-shot test
             "--database=:memory:",
+            # Don't use all the host cores
+            "--concurrency=8",
+            "--connection-pool=8",
+            # Disable rescanning, this is a one-shot test
+            "--rescan-time=0",
+            "--groom-time=0",
             get_bb_var("DEPLOY_DIR"),
         ]
-        for format in get_bb_var("PACKAGE_CLASSES").split():
-            if format == "package_deb":
-                cmd.append("--scan-deb-dir")
-            elif format == "package_ipk":
-                cmd.append("--scan-deb-dir")
-            elif format == "package_rpm":
-                cmd.append("--scan-rpm-dir")
+
+        format = get_bb_var("PACKAGE_CLASSES").split()[0]
+        if format == "package_deb":
+            cmd.append("--scan-deb-dir")
+        elif format == "package_ipk":
+            cmd.append("--scan-deb-dir")
+        elif format == "package_rpm":
+            cmd.append("--scan-rpm-dir")
+        else:
+            self.fail("Unknown package class %s" % format)
+
         # Find a free port
         with socketserver.TCPServer(("localhost", 0), None) as s:
             port = s.server_address[1]
             cmd.append("--port=%d" % port)
 
         try:
-            debuginfod = subprocess.Popen(cmd)
+            # Remove DEBUGINFOD_URLS from the environment so we don't try
+            # looking in the distro debuginfod
+            env = os.environ.copy()
+            if "DEBUGINFOD_URLS" in env:
+                del env["DEBUGINFOD_URLS"]
+
+            self.logger.info(f"Starting server {cmd}")
+            debuginfod = subprocess.Popen(cmd, env=env)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
+                self.assertTrue(self.wait_for_debuginfod(port))
+
                 cmd = (
                     "DEBUGINFOD_URLS=http://%s:%d/ debuginfod-find debuginfo /usr/bin/debuginfod"
                     % (qemu.server_ip, port)
                 )
+                self.logger.info(f"Starting client {cmd}")
                 status, output = qemu.run_serial(cmd)
                 # This should be more comprehensive
                 self.assertIn("/.cache/debuginfod_client/", output)
-- 
2.25.1


