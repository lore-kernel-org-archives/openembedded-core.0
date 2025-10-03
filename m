Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEE7CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 21:13:15 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.1516.1759525994078114936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 14:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1nPcEfwj;
 spf=pass (domain: smile.fr, ip: 209.85.167.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57ea78e0618so3015465e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759525992; x=1760130792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v2MVppYAz04Vbs+gxMbvw4m3OMzsWK5Ppm2Dwu0KOtA=;
        b=1nPcEfwjbTUChxFWyBXGI01B9aS3nUphJVjwuvUYkD2rUddik/WiwTpEBGmxAQXhDa
         sy1qEO3X6qTD5DB5FKNuhISyZYcPhOpJN6yLQPYsQRx16b7c8k8Awk346PlSiUfIY58h
         RVjvGVdX1JrRzUP4A4IKMiZckapaZvRFeHrvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759525992; x=1760130792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2MVppYAz04Vbs+gxMbvw4m3OMzsWK5Ppm2Dwu0KOtA=;
        b=TCbgXI8zZ2l5B4lzwbgQR5dGU/9UtRpEjh7wi+as25I5KVcxcRyDR4jmYEM4DnWNYK
         U+g0KxALacmvDUj9WcL+X0xDqaLnJxSJHAxEicoKfT4hMJB9cald+DhJH89NTOXBXqzc
         nsk4i4sLZ9+PwNng9UJRgHo7Ui2aXB6E4LTYAnzVoBHFEGiBoNTUqXGZekGkwnj1kMTh
         gc8sU2yet3MgWpHoyciiNjxx+V8A5KPBx10GiZ6UNDKuvQKypqvuRBSDDpDVtvD2JA4g
         ZhtByur59IuinH87Y8yOuxI/b2j9ZBq4lI5RQwxtsbeGnh8yKqjXGrpdKH/5Z6BoOMCS
         4gNQ==
X-Gm-Message-State: AOJu0Yw+Cb3kjsn0lt3QF3c64+sORWVjil7IaXwf4X2I//VPF6ibYKwm
	mGfb9A+cJKxzMv2+oFoXQAdo+Gxh+bSLrGz/Lr6D7zASe1x1G3nXDpIZYR/2r6Kr3YwuCNPHylo
	yz40qfrM=
X-Gm-Gg: ASbGncse1vUVfqUbP62+yns1ZFnzG5km+oyFmHZA98j4/wkUSBGcCK2/043coSzPh0L
	xCzm8bU+32A0GzrmUVS6twAXok/pUvBcqM1Y7UQ5WexXlrgiKRN9piM+f1sEOsQxdj13HSq9dTH
	Z6IJL9EttqJfb8Uqt86Pu4WjhgmPHXbjyuzdKnXVwpSUMwJjEZzPLAQr2drYfx2MuICnwIWQOzA
	Wz2JbFDay44g+wk6y8FvUpQ9C0lvTUGWs2X8cOOSx7zCb1PIg2K9zJUI+uFP6ZiC9iBmw9mJJby
	MCT0S1RDj45Rw5IEeWzWOG/h3GANUGu/VNWk9+H5dim3wDj9XHzaemjz8gB5/Ox1IwalZTay7cx
	E69toJhsJ2w2fQJSM+Fkvc8uuxsMH5/GdmI8eBkAYq8MXiUc3njcAiC9vVi8879iAMIeePagdhr
	vM+BdKNWcwXmF+hNLZKTGJy9aHRtvTCmDRpDTdX3Vgrru3EevX40QkOw==
X-Google-Smtp-Source: AGHT+IFIg6gCPUQqswpM1ic87sP+GAC4JaToPYAE500PH6MFsx2kAGK9+UgVoWG8rR7CRliEHToqBQ==
X-Received: by 2002:a05:6512:3b88:b0:578:4239:162e with SMTP id 2adb3069b0e04-58cb96627d3mr1428871e87.11.1759525991530;
        Fri, 03 Oct 2025 14:13:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb001331aa0036c6349435ab0707.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:36c6:3494:35ab:707])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e878sm2168290e87.99.2025.10.03.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:13:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] oeqa/selftest/wic: fix PATH for wic.Wic2.test_extra_partition_space
Date: Fri,  3 Oct 2025 23:12:47 +0200
Message-Id: <20251003211248.1660154-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 21:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224423

From: Yoann Congal <yoann.congal@smile.fr>

Without importing PATH from the wic-tools recipes, the build host PATH
is used and this test may fail depending on tools (parted, dumpe2fs,
...) availability. This triggers build faillure on AB (e.g. [0])

To fix this, import PATH from wic-tools and ensure the original
environment is restored after.

Since this indent a block of code into a try/finally block, here is the
diff ignoring white spaces change:
  diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
  index b1c318bd4e..34d844b90b 100644
  --- a/meta/lib/oeqa/selftest/cases/wic.py
  +++ b/meta/lib/oeqa/selftest/cases/wic.py
  @@ -1331,0 +1332,4 @@
  +        oldpath = os.environ['PATH']
  +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
  +
  +        try:
  @@ -1366,0 +1371,2 @@
  +        finally:
  +            os.environ['PATH'] = oldpath

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2456

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/wic.py | 74 ++++++++++++++++-------------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 1b59980f1c..bff3842305 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1330,41 +1330,47 @@ run_wic_cmd() {
     def test_extra_partition_space(self):
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
-        with NamedTemporaryFile("w", suffix=".wks") as tempf:
-            tempf.write("bootloader --ptable gpt\n" \
-                        "part                 --ondisk hda --size 10M        --extra-partition-space 10M --fstype=ext4\n" \
-                        "part                 --ondisk hda --fixed-size 20M  --extra-partition-space 10M --fstype=ext4\n" \
-                        "part --source rootfs --ondisk hda                   --extra-partition-space 10M --fstype=ext4\n" \
-                        "part --source rootfs --ondisk hda --fixed-size 200M --extra-partition-space 10M --fstype=ext4\n")
-            tempf.flush()
-
-            _, wicimg = self._get_wic(tempf.name)
-
-            res = runCmd("parted -m %s unit b p" % wicimg,
-                            native_sysroot=native_sysroot, stderr=subprocess.PIPE)
-
-            # parse parted output which looks like this:
-            # BYT;\n
-            # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
-            # 1:0.00MiB:200MiB:200MiB:ext4::;\n
-            partlns = res.output.splitlines()[2:]
-
-            self.assertEqual(4, len(partlns))
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
-            # Test for each partitions that the extra part space exists
-            for part in range(0, len(partlns)):
-                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % (part + 1))
-                partln = partlns[part].split(":")
-                self.assertEqual(7, len(partln))
-                self.assertRegex(partln[3], r'^[0-9]+B$')
-                part_size = int(partln[3].rstrip("B"))
-                start = int(partln[1].rstrip("B")) / 512
-                length = part_size / 512
-                runCmd("dd if=%s of=%s skip=%d count=%d" %
-                                            (wicimg, part_file, start, length))
-                res = runCmd("dumpe2fs %s -h | grep \"^Block count\"" % part_file)
-                fs_size = int(res.output.split(":")[1].strip()) * 1024
-                self.assertLessEqual(fs_size + 10485760, part_size, "part file: %s" % part_file)
+        try:
+            with NamedTemporaryFile("w", suffix=".wks") as tempf:
+                tempf.write("bootloader --ptable gpt\n" \
+                            "part                 --ondisk hda --size 10M        --extra-partition-space 10M --fstype=ext4\n" \
+                            "part                 --ondisk hda --fixed-size 20M  --extra-partition-space 10M --fstype=ext4\n" \
+                            "part --source rootfs --ondisk hda                   --extra-partition-space 10M --fstype=ext4\n" \
+                            "part --source rootfs --ondisk hda --fixed-size 200M --extra-partition-space 10M --fstype=ext4\n")
+                tempf.flush()
+
+                _, wicimg = self._get_wic(tempf.name)
+
+                res = runCmd("parted -m %s unit b p" % wicimg,
+                                native_sysroot=native_sysroot, stderr=subprocess.PIPE)
+
+                # parse parted output which looks like this:
+                # BYT;\n
+                # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+                # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+                partlns = res.output.splitlines()[2:]
+
+                self.assertEqual(4, len(partlns))
+
+                # Test for each partitions that the extra part space exists
+                for part in range(0, len(partlns)):
+                    part_file = os.path.join(self.resultdir, "selftest_img.part%d" % (part + 1))
+                    partln = partlns[part].split(":")
+                    self.assertEqual(7, len(partln))
+                    self.assertRegex(partln[3], r'^[0-9]+B$')
+                    part_size = int(partln[3].rstrip("B"))
+                    start = int(partln[1].rstrip("B")) / 512
+                    length = part_size / 512
+                    runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                                (wicimg, part_file, start, length))
+                    res = runCmd("dumpe2fs %s -h | grep \"^Block count\"" % part_file)
+                    fs_size = int(res.output.split(":")[1].strip()) * 1024
+                    self.assertLessEqual(fs_size + 10485760, part_size, "part file: %s" % part_file)
+        finally:
+            os.environ['PATH'] = oldpath
 
     # TODO this test could also work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])

