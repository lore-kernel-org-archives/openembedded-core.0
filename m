Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0CAC3271F
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4915.1720077022495875510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=duA8hbyY;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so1709095e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077021; x=1720681821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biYJs5eXheKm9DiAQNapPuCwj3pEhHbiXPaFy0LvGNc=;
        b=duA8hbyYI5dmGAzKyMR6CaqQxHvbxdP8zTmLrzWVhgr9YMPfadDQJX9+MKbCgLjTT+
         /4f48VwqUsD+1POgXHyZTo7gE2Gwjcv/Q9SjG6FOlBiR+ZxFMH9RDIk8EupvuxGVLEh9
         OX3pvuKqoQ3ORvtwA2J2Ou1WKo3LAhcqndbDcDHEAdyOJdpjQe1XVhkKCsU5CuNJVP6E
         BvsF1osqYreMM9r/owMk/tDED5SItWdW3XXBjNshnViXU5vWSl9PAkHweLAphFJwAL8i
         xomB+as2BeGs9xi/HlXzaxg9tmRyu4EXDMKOoetkTGbNCdef5RKtmTRuYf9KquRIvkXE
         8jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077021; x=1720681821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biYJs5eXheKm9DiAQNapPuCwj3pEhHbiXPaFy0LvGNc=;
        b=OG0riKdfIBO7jgN+Ap3IvN6rFnqkQejn1TNnrsxShHVP30m+Of0c21fV5UujVJPIwl
         BH6jgFuWjrLK9stWsrFrOT7YkIZTK0IXZGbnpX/bKwoqcJKbF6JWRtElL1uEnQYmVd2b
         901A8DYh8X1FM187XFghjUFsg5Ay9GNUXlKzSON5B/pv/Gb+M0EBxo3vLxVIcH4gVMD4
         8KGY7xvP+XpxF2FU5B9HRdrXQNeXtv8fQKwCx7mSVesWnMQYWw5ZGq5JpaHFSctarpxu
         QAE1kWdlXg4WwKYkgxmEWAbo+fd5by4Bkzubyb7MVKuo2lr9b1O35Z9Snp7WQBU71Hmd
         bRAQ==
X-Gm-Message-State: AOJu0YwdbDBsPt2l7QxL2FFcR5ztDkFD/MUlFECE3U/TCNUws3SUPDTx
	sUjmn+RDwfohGh1Le9S35DTMl4byu0ysp/FHNKUi06K9KXx+NvsA/mPvFw==
X-Google-Smtp-Source: AGHT+IEdHgWdEO5gRPGOAQ9dwUHJrHZPRfOtTbY1bKpX1trUG4ZhYyWIj28kruC0HwWVtBTMVMwcaQ==
X-Received: by 2002:a05:600c:2150:b0:425:7c42:d24b with SMTP id 5b1f17b1804b1-4264b181dbemr4275825e9.18.1720077020409;
        Thu, 04 Jul 2024 00:10:20 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:20 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/14] oe-selftest: wic fix deps of test_efi_plugin_unified_kernel_image_qemu
Date: Thu,  4 Jul 2024 09:09:37 +0200
Message-ID: <20240704071013.2982700-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201505

From: Adrian Freihofer <adrian.freihofer@siemens.com>

oe-selftest wic.Wic2.test_efi_plugin_unified_kernel_image_qemu failed
with:
  AssertionError: Command
    'bitbake  core-image-minimal core-image-minimal-initramfs ovmf'
    returned non-zero exit status 1:

bitbake reported:
  FileNotFoundError: [Errno 2] No such file or directory:
  '.../build-st-242167/tmp/deploy/images/qemux86-64/core-image-minimal-initramfs-qemux86-64.cpio.gz'
  WARNING: .../build-st-242167/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/temp/run.do_image_wic.986859:162
    exit 1 from 'BUILDDIR="/home/adrian/projets/oss/poky/build-st-242167" PSEUDO_UNLOAD=1
    wic create "$wks" --vars ".../build-st-242167/tmp/sysroots/qemux86-64/imgdata/"
       -e "core-image-minimal" -o "$build_wic/" -w "$tmp_wic"'

Creating a configuration as the test does and calling
  bitbake -g core-image-minimal
does not show a dependency from core-image-minimal:do_image_wic on
core-image-minimal-initramfs:do_image_complete.
Adding the dependency directly to the test case resolves the issue.

Since the dependency is basically created by the wks file solving this
in a more generic way, e.g. by handling the dependency in
image_types_wic.bbclass does not look like simple.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b616759209a..b1315c5b432 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1294,7 +1294,11 @@ class Wic2(WicTestCase):
                  'WKS_FILE = "test_efi_plugin.wks"\n'\
                  'MACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
-        bitbake('core-image-minimal core-image-minimal-initramfs ovmf')
+        # Rather than creating a special image which adds the dependency which is needed by the wks file
+        # core-image-minimal:do_image_wic[depends] += "core-image-minimal-initramfs:do_image_complete"
+        # core-image-minimal-initramf is built before it is used by core-image-minimal.
+        bitbake('core-image-minimal-initramfs')
+        bitbake('core-image-minimal ovmf')
         self.remove_config(config)
 
         with runqemu('core-image-minimal', ssh=False,
-- 
2.45.2


