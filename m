Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739DDE7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 12:34:46 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.15659.1736771678728654062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 04:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=EUPhlOMZ;
 spf=pass (domain: foundries.io, ip: 209.85.167.46, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54298ec925bso1657892e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 04:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1736771676; x=1737376476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ghJwNSE4eE7qGf2veHeW1U+aUzzejy2G9fSLEdbNV8=;
        b=EUPhlOMZV0x8+uF490cjs2geSp6D6uWIk6tBqqGDKgmjRc6OHA9deueGoDQXBbrBKt
         hdeSSt1gViCNrk331qWbI7FYX/E2ZQYz08x4xPxgce/f5rBn4w58SmOM1YeCjPdYnSRj
         U4mzaD8TnvdvCKCVaI6yE9khq/8d3aoIML+qy+3PnDDPqsnt6ZERo0mefNNaQv3KCQaH
         tXpKp7gMrqWFavTPb4go9I2H60Srta6MIApVQEYb4WQyhfjlQDT4XrbQfhbn57eqPkuA
         qk/SFDnTlMgehOTMo9d3TfXHDX0d/8QD812XeKPDHAhb/TH/w8kiUoLfHBDQ4NjsQM0n
         ELdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771676; x=1737376476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ghJwNSE4eE7qGf2veHeW1U+aUzzejy2G9fSLEdbNV8=;
        b=XzoZocSj6gZIdh9/TTKNGaxDLDsnuiNH73DeoVGejIUyOEhYkbae+vALgvSruW8AdR
         5Qdn3ua+PpmNqZ7MTGPL+jIByEj04bydcYVGyLG4Q2CWqJvo7Sguk4potnFWTzW1oOgU
         X+wO1U1wt5B5k2a6NPabse/A613saZFS7jNSPg8jGUalE4xWZRO1W23v7d812p5akMEy
         qMbbfnvKYv3R/QBGJwtPg3VenpGjNMW5Sr286do5hfYSgJEtrdlIAyVjbgwuQWa+b6T1
         L+m1cHBlA2480n/oB/SeP85IEnAC+i+EwN2eHhZxGWNViZxEHA5C1hvDmpKa8Jxkz18F
         CBTA==
X-Gm-Message-State: AOJu0YwJY5ysBdcCmCdfgNWB6TZ7Wd/0du+Z/qzkVIIrpjz/4Om7ahqq
	1BYeV9kbYy7OwVoPZqyFPH5KnHYZvazJJI1Y/Bv1WvH7+5hu56OxVWzOImD9CJv87YwHnvnhQUQ
	10rw=
X-Gm-Gg: ASbGnctazcZfe99gQyxSDJiY+7l0AAmgwSK8Y+Fr00Qb7vmqLKYb76jSI836qXFy/q/
	Myg1ZqKQLCT8UgCx1FkcLCtik3I/4or1PKJvISefJ9Tt4/SE3mMc1YQDx7vM//cAeqxob6Fl8oY
	pfcY4VwHtnVL7MEg1ph/55g2MNkWL38Qp3u5hyMGtRz19/CbvS3fZXxlN8YByl7iCndkOvLf6Yl
	Z/jNItkhGCesLq54RcjbhIiHQ3UVcQZahn0UYc6ju5UXRpmyZ4CDrCq60w/8V0=
X-Google-Smtp-Source: AGHT+IGsHZ1lVDjwWKQ4hRnvym9ios/oL9Yrqj4VLtFbw18W2iXa4qcJKSSgSfOCc5UAmi3Vc+VSGQ==
X-Received: by 2002:a05:6512:3e19:b0:542:986c:11ef with SMTP id 2adb3069b0e04-542986c134emr2299436e87.5.1736771675703;
        Mon, 13 Jan 2025 04:34:35 -0800 (PST)
Received: from igor-t14.. ([109.108.76.111])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be54092sm1356405e87.83.2025.01.13.04.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:34:35 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [RFC PATCH] lib/spdx30_tasks: support directories deployed by image recipes
Date: Mon, 13 Jan 2025 13:34:32 +0100
Message-ID: <20250113123432.649645-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209717

From: Igor Opaniuk <igor.opaniuk@foundries.io>

create_image_spdx() implementation assumes that image is indeed a file.
If image recipe deploys a directory (for example, which contains an
hierarchy of flash artifacts, that is used by SoC vendor-specific
flashing tool) which follows ${IMAGE_NAME}.${IMAGE_TYPE} naming scheme,
create_image_spdx() function will fail after trying to hash a directory:

*** 0002:do_create_image_spdx(d)
     0003:
File: '.../meta/classes-recipe/create-spdx-image-3.0.bbclass', lineno: 48, function: do_create_image_spdx
     0044:addtask do_create_rootfs_spdx_setscene
     0045:
     0046:python do_create_image_spdx() {
     0047:    import oe.spdx30_tasks
 *** 0048:    oe.spdx30_tasks.create_image_spdx(d)
     0049:}
     0050:addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx before do_build
     0051:SSTATETASKS += "do_create_image_spdx"
...
File: '.../bitbake/lib/bb/utils.py', lineno: 536, function: _hasher
     0532:
     0533:def _hasher(method, filename):
     0534:    import mmap
     0535:
 *** 0536:    with open(filename, "rb") as f:
     0537:        try:
     0538:            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as mm:
     0539:                for chunk in iter(lambda: mm.read(8192), b''):
     0540:                    method.update(chunk)
Exception: IsADirectoryError: [Errno 21] Is a directory: '...'

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 meta/lib/oe/spdx30_tasks.py | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c60c97896c..20fb5644e3 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1072,19 +1072,28 @@ def create_image_spdx(d):
         for image in task["images"]:
             image_filename = image["filename"]
             image_path = image_deploy_dir / image_filename
-            a = objset.add_root(
-                oe.spdx30.software_File(
-                    _id=objset.new_spdxid("image", image_filename),
-                    creationInfo=objset.doc.creationInfo,
-                    name=image_filename,
-                    verifiedUsing=[
-                        oe.spdx30.Hash(
-                            algorithm=oe.spdx30.HashAlgorithm.sha256,
-                            hashValue=bb.utils.sha256_file(image_path),
-                        )
-                    ],
+            if os.path.isdir(image_path):
+                a = objset.add_root(
+                    oe.spdx30.software_Package(
+                        _id=objset.new_spdxid("image-files", image_filename),
+                        creationInfo=objset.doc.creationInfo,
+                        name=image_filename,
+                    )
+                )
+            else:
+                a = objset.add_root(
+                    oe.spdx30.software_File(
+                        _id=objset.new_spdxid("image", image_filename),
+                        creationInfo=objset.doc.creationInfo,
+                        name=image_filename,
+                        verifiedUsing=[
+                            oe.spdx30.Hash(
+                                algorithm=oe.spdx30.HashAlgorithm.sha256,
+                                hashValue=bb.utils.sha256_file(image_path),
+                            )
+                        ],
+                    )
                 )
-            )
             set_purposes(
                 d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE_PURPOSE"
             )
-- 
2.43.0


