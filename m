Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02819C636D3
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 10:24:04 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.11295.1676024643375097950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 02:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A+fH4gBq;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ud5so14582413ejc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ou5HeekhF6p2Xe1l4Bd/awDMzWIWrZZawzFpB5+zY8=;
        b=A+fH4gBqIJjopSsUdlfa8YGzuBOYJfOCBbxQqegQEqSjDQ86ooad0LsL6KtvAtrizH
         hGUIotawlnAjvd6hkuWAT1zhhZWbX1z2CbPoLSgNio2iVQrWLwi6oqougyDE7ZurHk0z
         0YKMV73PguQ/24kOnDhwXjs8st59/a7GkM0cJlqqVlAZ9Gzywwi/Y+5BThecfCcHQ7AZ
         8RD6o+/yCGEIEvpfXFyUkRtpYd1hxsyd+Uvp5qf+Zd6R87jJKurBzQ9PdQGP9NYmx0E2
         ev4U/+zs4cfFD41WTr15EFVI+yqZAXLZ2MO50Hjez2M0O6fCfYVpxT72DgCStRIgoGPR
         jLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ou5HeekhF6p2Xe1l4Bd/awDMzWIWrZZawzFpB5+zY8=;
        b=T3JclSWBrABuQeXi1vUr+A8kzRFeDUqgMaXUmrAaBvA9HBvYoeG2j/gv57JvgrJS6B
         RhxBdYHWtJx3vI00wcssbqb8uT50ZBC8ffINZM30Vq3XcMb4sIB1uAorUTyeHYqlQJTH
         iZ89o3vq2bf+SNkdjPj0tw5SOHCn0BeZsicxR1K0QlAAKQSt+BgEhD0oMk2ZDNjDKEpC
         0USfDMmYFFFWyt3lYV244JQeQyM+AlAtnynOx8nNrhZ7P0t699oit1vjGiS6fyHTX+oM
         aLbyY97mzcUVE2SrgzrwZr1UCK/3NpjzmUWU+12c8msspSOGRTqMpA/ahK/yDpyx8OfS
         D3yQ==
X-Gm-Message-State: AO0yUKUiUBu3UcU8T0TF5KOtB0gyBnuOct6J2fpDs/YnyjfB3dzdWkxW
	C/vADxuTeCozgd8tfYgNAIuKJErsuOU/iZsT
X-Google-Smtp-Source: AK7set+RUhz8Vpesxcsy278yGYiJcSQQk75Wf87MSwTd3jCnu28ci1jX+7eFWis2Pay/vhezNhO7YQ==
X-Received: by 2002:a17:906:914:b0:877:a2d1:7560 with SMTP id i20-20020a170906091400b00877a2d17560mr15913818ejd.27.1676024641547;
        Fri, 10 Feb 2023 02:24:01 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709060dc900b0088c804c4ae2sm2138710eji.201.2023.02.10.02.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:24:00 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for configuring kernel image install into boot partition.
Date: Fri, 10 Feb 2023 11:23:37 +0100
Message-Id: <20230210102337.1527237-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210102337.1527237-1-kareem.zarka@huawei.com>
References: <20230210102337.1527237-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 10:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176990

- test_skip_kernel_install: This test verifies that the kernel is not
installed in the boot partition when the 'install-kernel-into-boot-dir'
parameter is set to false.

- test_kernel_install: This test verifies that the kernel is installed
in the boot partition when the 'install-kernel-into-boot-dir' parameter
is set to true .

Both tests use a WKS (Kickstart) file to specify the desired
configuration, build a disk image using WIC, and extract the disk image
to a temporary directory to verify the results.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ca1abb970a..b46dccc144 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -16,6 +16,7 @@ import hashlib
 from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
+from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -146,6 +147,71 @@ class CLITests(OESelftestTestCase):
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
 class Wic(WicTestCase):
+    def test_skip_kernel_install(self):
+        """Test the functionality of not installing the kernel in the boot directory using the wic plugin"""
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.write(
+                'part --source bootimg-efi '
+                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=false" '
+                '--label boot --active\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img = 'core-image-minimal'
+                # build the image using the WKS file
+                cmd = "wic create %s -e %s -o %s" % (
+                    wks.name, img, self.resultdir)
+                runCmd(cmd)
+                wksname = os.path.splitext(os.path.basename(wks.name))[0]
+                out = glob(os.path.join(
+                    self.resultdir, "%s-*.direct" % wksname))
+                self.assertEqual(1, len(out))
+                # extract the content of the disk image to the temporary directory
+                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
+                runCmd(cmd)
+                # check if the kernel is installed or not
+                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
+                for file in os.listdir(tmpdir):
+                    if file == kimgtype:
+                        raise AssertionError(
+                            "The kernel image '{}' was found in the partition".format(kimgtype)
+                        )
+
+    def test_kernel_install(self):
+        """Test the installation of the kernel to the boot directory in the wic plugin"""
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.write(
+                'part --source bootimg-efi '
+                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=true" '
+                '--label boot --active\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img = 'core-image-minimal'
+                # build the image using the WKS file
+                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                runCmd(cmd)
+                wksname = os.path.splitext(os.path.basename(wks.name))[0]
+                out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
+                self.assertEqual(1, len(out))
+                # extract the content of the disk image to the temporary directory
+                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
+                runCmd(cmd)
+                # check if the kernel is installed or not
+                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
+                found = False
+                for file in os.listdir(tmpdir):
+                    if file == kimgtype:
+                        found = True
+                        break
+                self.assertTrue(
+                    found, "The kernel image '{}' was not found in the boot partition".format(kimgtype)
+                )
+
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
         cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
-- 
2.25.1


