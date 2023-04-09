Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FAFC77B70
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 09:39:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16634.1681033153662028033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Apr 2023 02:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hD5U9mJC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E7B3C0003;
	Sun,  9 Apr 2023 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681033151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L2nDDSCg8RCPohjtfgn6QCGbrchTafs940PYkIAl5Bc=;
	b=hD5U9mJCg+0fKllMoq3TnpiZIomY6ucpu00bTODQRQa9HXOQNbg+vgUShjMqn+Y1QLm8du
	oUoDsOqeVtiMFMU5rgfMLGtxsj81OBNa+2GOfOFeSXpafj0yTgqC37k/K15owYVIsWZgBp
	LCdOMZQArRS/JDPe903OstW5y7doKjWQXIzJhvQB7hJJyrAnQcchsypdnkB24DojpUOXyk
	vcEalx80rHqwX/d3kVGkZrJM0w1LXCeVYVynkjpAn5E5cwcG+8qELcJqfAkcjl62+2bH1t
	sMt0rAdcbEsopWEu0sPUL9Q6T/IIShPI0Tdv5fEETA3XJN5FJfU97FHlmvuyiA==
Date: Sun, 9 Apr 2023 11:39:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Rannou <lrannou@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, khilman@baylibre.com
Subject: Re: [OE-core] [PATCH v3 2/2] oeqa/selftest: change deprecated usage
 of run_serial
Message-ID: <20230409093910134a3fb4@mail.local>
References: <20230407142622.632035-1-lrannou@baylibre.com>
 <20230407142622.632035-3-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407142622.632035-3-lrannou@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 09:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179836

Hello,

This breaks the overlayfs tests:

https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/5075/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/5036/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/4994/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/5045/steps/15/logs/stdio

On 07/04/2023 16:26:22+0200, Louis Rannou wrote:
> Prefer the new function run_serial_socket. Change calls where the modification
> is easy.
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
>  meta/lib/oeqa/selftest/cases/debuginfod.py |  3 +-
>  meta/lib/oeqa/selftest/cases/gdbserver.py  |  7 ++--
>  meta/lib/oeqa/selftest/cases/locales.py    |  8 ++---
>  meta/lib/oeqa/selftest/cases/overlayfs.py  | 42 ++++++++++++++--------
>  meta/lib/oeqa/selftest/cases/package.py    |  7 ++--
>  meta/lib/oeqa/selftest/cases/runqemu.py    |  2 +-
>  6 files changed, 43 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/selftest/cases/debuginfod.py
> index 37f51760fb..2571ce6989 100644
> --- a/meta/lib/oeqa/selftest/cases/debuginfod.py
> +++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
> @@ -99,7 +99,8 @@ CORE_IMAGE_EXTRA_INSTALL += "elfutils"
>                      % (qemu.server_ip, port)
>                  )
>                  self.logger.info(f"Starting client {cmd}")
> -                status, output = qemu.run_serial(cmd)
> +                status, output = qemu.run_serial_socket(cmd)
> +                self.assertEqual(0, status)
>                  # This should be more comprehensive
>                  self.assertIn("/.cache/debuginfod_client/", output)
>          finally:
> diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
> index 9da97ae780..4f8c7d620f 100644
> --- a/meta/lib/oeqa/selftest/cases/gdbserver.py
> +++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
> @@ -43,7 +43,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
>              shutil.unpack_archive(filename, debugfs)
>  
>              with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
> -                status, output = qemu.run_serial("kmod --help")
> +                status, output = qemu.run_serial_socket("kmod --help")
> +                self.assertEqual(status, 0)
>                  self.assertIn("modprobe", output)
>  
>                  with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
> @@ -61,7 +62,7 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
>                              self.fail("Timed out connecting to gdb")
>                      future = executor.submit(run_gdb)
>  
> -                    status, output = qemu.run_serial("gdbserver --once :9999 kmod --help")
> -                    self.assertEqual(status, 1)
> +                    status, output = qemu.run_serial_socket("gdbserver --once :9999 kmod --help")
> +                    self.assertEqual(status, 0)
>                      # The future either returns None, or raises an exception
>                      future.result()
> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
> index 4ca8ffb7aa..98026d2c80 100644
> --- a/meta/lib/oeqa/selftest/cases/locales.py
> +++ b/meta/lib/oeqa/selftest/cases/locales.py
> @@ -27,15 +27,15 @@ class LocalesTest(OESelftestTestCase):
>  
>          with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
>              cmd = "locale -a"
> -            status, output = qemu.run_serial(cmd)
> +            status, output = qemu.run_serial_socket(cmd)
>              # output must includes fr_FR or fr_FR.UTF-8
> -            self.assertEqual(status, 1, msg='locale test command failed: output: %s' % output)
> +            self.assertEqual(status, 0, msg='locale test command failed: output: %s' % output)
>              self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
>  
>              cmd = "localedef --list-archive -v"
> -            status, output = qemu.run_serial(cmd)
> +            status, output = qemu.run_serial_socket(cmd)
>              # output must includes fr_FR.utf8
> -            self.assertEqual(status, 1, msg='localedef test command failed: output: %s' % output)
> +            self.assertEqual(status, 0, msg='localedef test command failed: output: %s' % output)
>              self.assertIn("fr_FR.utf8", output, msg='localedef test failed: output: %s' % output)
>  
>      def test_locales_on(self):
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
> index b4f0663828..753821490b 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -183,20 +183,24 @@ EOT
>  
>          with runqemu('core-image-minimal') as qemu:
>              # Check that application service started
> -            status, output = qemu.run_serial("systemctl status my-application")
> +            status, output = qemu.run_serial_socket("systemctl status my-application")
> +            self.assertEqual(0, status)
>              self.assertTrue("active (exited)" in output, msg=output)
>  
>              # Check that overlay mounts are dependencies of our application unit
> -            status, output = qemu.run_serial("systemctl list-dependencies my-application")
> +            status, output = qemu.run_serial_socket("systemctl list-dependencies my-application")
> +            self.assertEqual(0, status)
>              self.assertTrue("overlayfs-user-overlays.service" in output, msg=output)
>  
> -            status, output = qemu.run_serial("systemctl list-dependencies overlayfs-user-overlays")
> +            status, output = qemu.run_serial_socket("systemctl list-dependencies overlayfs-user-overlays")
> +            self.assertEqual(0, status)
>              self.assertTrue("usr-share-another\\x2doverlay\\x2dmount.mount" in output, msg=output)
>              self.assertTrue("usr-share-my\\x2dapplication.mount" in output, msg=output)
>  
>              # Check that we have /mnt/overlay fs mounted as tmpfs and
>              # /usr/share/my-application as an overlay (see overlayfs-user recipe)
> -            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
> +            status, output = qemu.run_serial_socket("/bin/mount -t tmpfs,overlay")
> +            self.assertEqual(0, status)
>  
>              line = getline_qemu(output, "on /mnt/overlay")
>              self.assertTrue(line and line.startswith("tmpfs"), msg=output)
> @@ -360,7 +364,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>          bitbake('core-image-minimal')
>  
>          with runqemu('core-image-minimal', image_fstype='wic') as qemu:
> -            status, output = qemu.run_serial("/bin/mount")
> +            status, output = qemu.run_serial_socket("/bin/mount")
> +            self.assertEqual(0, status)
>  
>              line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
>              self.assertFalse(line, msg=output)
> @@ -393,7 +398,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>          testFile = "/etc/my-test-data"
>  
>          with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
> -            status, output = qemu.run_serial("/bin/mount")
> +            status, output = qemu.run_serial_socket("/bin/mount")
> +            self.assertEqual(0, status)
>  
>              line = getline_qemu(output, "/dev/sda3")
>              self.assertTrue("/data" in output, msg=output)
> @@ -402,19 +408,24 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>              self.assertTrue(line and line.startswith("/data/overlay-etc/upper on /etc type overlay"), msg=output)
>  
>              # check that lower layer is not available
> -            status, output = qemu.run_serial("ls -1 /data/overlay-etc/lower")
> +            status, output = qemu.run_serial_socket("ls -1 /data/overlay-etc/lower")
> +            self.assertEqual(0, status)
>              line = getline_qemu(output, "No such file or directory")
>              self.assertTrue(line, msg=output)
>  
> -            status, output = qemu.run_serial("touch " + testFile)
> -            status, output = qemu.run_serial("sync")
> -            status, output = qemu.run_serial("ls -1 " + testFile)
> +            status, output = qemu.run_serial_socket("touch " + testFile)
> +            self.assertEqual(0, status)
> +            status, output = qemu.run_serial_socket("sync")
> +            self.assertEqual(0, status)
> +            status, output = qemu.run_serial_socket("ls -1 " + testFile)
> +            self.assertEqual(0, status)
>              line = getline_qemu(output, testFile)
>              self.assertTrue(line and line.startswith(testFile), msg=output)
>  
>          # Check that file exists in /etc after reboot
>          with runqemu('core-image-minimal', image_fstype='wic') as qemu:
> -            status, output = qemu.run_serial("ls -1 " + testFile)
> +            status, output = qemu.run_serial_socket("ls -1 " + testFile)
> +            self.assertEqual(0, status)
>              line = getline_qemu(output, testFile)
>              self.assertTrue(line and line.startswith(testFile), msg=output)
>  
> @@ -446,14 +457,17 @@ IMAGE_INSTALL:append = " overlayfs-user"
>          bitbake('core-image-minimal')
>  
>          with runqemu('core-image-minimal', image_fstype='wic') as qemu:
> -            status, output = qemu.run_serial("echo \"Modified in upper\" > /etc/" + testFile)
> -            status, output = qemu.run_serial("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
> +            status, output = qemu.run_serial_socket("echo \"Modified in upper\" > /etc/" + testFile)
> +            self.assertEqual(0, status)
> +            status, output = qemu.run_serial_socket("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
> +            self.assertEqual(0, status)
>              line = getline_qemu(output, "Modified in upper")
>              self.assertTrue(line, msg=output)
>              line = getline_qemu(output, "Original file")
>              self.assertTrue(line, msg=output)
>  
> -            status, output = qemu.run_serial("touch /data/overlay-etc/lower/ro-test.txt")
> +            status, output = qemu.run_serial_socket("touch /data/overlay-etc/lower/ro-test.txt")
> +            self.assertEqual(0, status)
>              line = getline_qemu(output, "Read-only file system")
>              self.assertTrue(line, msg=output)
>  
> diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
> index 1aa6c03f8a..78e8a4c26b 100644
> --- a/meta/lib/oeqa/selftest/cases/package.py
> +++ b/meta/lib/oeqa/selftest/cases/package.py
> @@ -135,7 +135,8 @@ class PackageTests(OESelftestTestCase):
>              Check that gdb ``binary`` to read symbols from separated debug file
>              """
>              self.logger.info("gdbtest %s" % binary)
> -            status, output = qemu.run_serial('/usr/bin/gdb.sh %s' % binary, timeout=60)
> +            status, output = qemu.run_serial_socket('/usr/bin/gdb.sh %s' % binary, timeout=60)
> +            self.assertEqual(0, status)
>              for l in output.split('\n'):
>                  # Check debugging symbols exists
>                  if '(no debugging symbols found)' in l:
> @@ -166,8 +167,8 @@ class PackageTests(OESelftestTestCase):
>  
>          def check_ownership(qemu, expected_gid, expected_uid, path):
>              self.logger.info("Check ownership of %s", path)
> -            status, output = qemu.run_serial('stat -c "%U %G" ' + path)
> -            self.assertEqual(status, 1, "stat failed: " + output)
> +            status, output = qemu.run_serial_socket('stat -c "%U %G" ' + path)
> +            self.assertEqual(status, 0, "stat failed: " + output)
>              try:
>                  uid, gid = output.split()
>                  self.assertEqual(uid, expected_uid)
> diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
> index f01e1eec66..be1481a82e 100644
> --- a/meta/lib/oeqa/selftest/cases/runqemu.py
> +++ b/meta/lib/oeqa/selftest/cases/runqemu.py
> @@ -183,7 +183,7 @@ class QemuTest(OESelftestTestCase):
>          # (such as the exception "Console connection closed unexpectedly")
>          # as qemu will disappear when we shut it down
>          qemu.runner.allowexit()
> -        qemu.run_serial("shutdown -h now")
> +        qemu.run_serial_socket("shutdown -h now")
>          time_track = 0
>          try:
>              while True:
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179825): https://lists.openembedded.org/g/openembedded-core/message/179825
> Mute This Topic: https://lists.openembedded.org/mt/98125364/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

