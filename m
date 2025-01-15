Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FBBC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 13:07:23 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.20366.1736946433773574943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 05:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=gh0UE5yk;
 spf=pass (domain: foundries.io, ip: 209.85.208.45, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso9607923a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 05:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1736946432; x=1737551232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOEAIj9CV+jmPP1JhtkOSK4iyapCSHWR+5Xo8/JfWZM=;
        b=gh0UE5ykaLSD28iH+UXUBdbubKzEldx1+n04xorINAYdZBjOJPTmAGE1+cTOjSut8e
         6IgvyREawouYeCDmg/AYPIT0SeoWWI4+xJstc8xPV83K7YoKo2zvbBbtftC5+CX7oEsY
         oO6P+Km/NNg8GO5ScfMppBAOxcMfsIa+38nvPFy+wfXPXGPEumZmnwsW5+5ZPY+XuE8d
         a2sbqMJSeH8f58boWw2T+SjefeaJnNZCW6SGUPBiYa6UMAs9d3iJ3cXNuBx3kt3Zv2qS
         evKDHBhH77ZwabbxGbyanAgNA3/QMx/q420WYh8xi7gD5FZo84xiAAiWrXGKz5cmiZPd
         KAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946432; x=1737551232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOEAIj9CV+jmPP1JhtkOSK4iyapCSHWR+5Xo8/JfWZM=;
        b=aapHM0o3iJlSJ0HeWN1YGCG5obvmGgfDfQqEJE0WecGkkH5qPMhKB/fcn0QUJpNwqI
         UZ1H3KDTfqLbxhSC0ffwc1bC30C9P3FeiQFq0CZNYCVCUz+wY7yLJYdzpwCzD08d9bem
         KpORQABNSowh7coK/Qr/5rDA12Pt3SvgSb1g2HzY/u3WuJPwmLPw5XTORLBX7ZSeqc3K
         QynTkkfe/8YZCnQkn58L3kSYTijICYXxwlpSTjKmTarOjx0jtHQ4xhw3FZMg6ZxoSWXk
         oRW2Gti0tb1QTnL3cNNcBv7C94fKbSF/ft9ZCEuT3xKJB4VF+kawKbokd7760cCkEsGt
         boxQ==
X-Gm-Message-State: AOJu0YwDa+ZjEzosAuwfL1emG7GJoQ+JmCBqriWUxUSvkC6ET0nszaEt
	qYC7XCPzy9+k6LHsbrUEFKaf1dnlOPoOnO8h83o9Wm18C8tDBy2O01Og6qpzA7usNFKlfoz8r99
	z
X-Gm-Gg: ASbGncvCNEofjGg7uDSE+JSGAS22+eevDu8CkgKCFuD11pPhPF1u7g28MsYegfJoHS1
	w6eOPUS8zHmJeLPSl/9BZmjHkbn4PwKf79+yqSbq/mB7SMnNEpTP7eYB/HkSs0JByyHd1zYdI1A
	+TA4abVkO/Vl8v6mfEtGyxh09FZ6DRIgseu4pWnNzq/QvKc730Nnvk69ZI8TRJZcLuTnTVjcwSZ
	mOPa2ReWA+6MSQAc2rG71woTWx65lYfT5XNcogxLjDlA0bKUVTcrrRK9z84pzfF
X-Google-Smtp-Source: AGHT+IFyW9rVwse3jNYJxFHmTIfzjMcbxU5jqCX5dfDMHki5es5oBd6AUdA6p4Ur+l2lkWBGx5ajBg==
X-Received: by 2002:a05:6402:3493:b0:5d0:bcdd:ffa7 with SMTP id 4fb4d7f45d1cf-5d972dfbbe3mr28603693a12.3.1736946431564;
        Wed, 15 Jan 2025 05:07:11 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a411csm7385113a12.72.2025.01.15.05.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:07:10 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH v3] lib/spdx30_tasks: support directories deployed by image recipes
Date: Wed, 15 Jan 2025 14:07:02 +0100
Message-ID: <20250115130702.355456-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 13:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209901

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

Changes in v3:
- Set a purpose and a timestamp for all artifact files in the same way
- Don't provide license_data to add_package_files(), so it skips license scanning
- Add additional check for license_data is not None in add_package_files()


Changes in v2:
- Rework using add_package_files()

 meta/lib/oe/spdx30_tasks.py | 61 +++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c60c97896c..658e533d75 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -135,7 +135,7 @@ def add_package_files(
     topdir,
     get_spdxid,
     get_purposes,
-    license_data,
+    license_data=None,
     *,
     archive=None,
     ignore_dirs=[],
@@ -169,7 +169,10 @@ def add_package_files(
             )
             spdx_files.add(spdx_file)
 
-            if oe.spdx30.software_SoftwarePurpose.source in file_purposes:
+            if (
+                oe.spdx30.software_SoftwarePurpose.source in file_purposes
+                and license_data is not None
+            ):
                 objset.scan_declared_licenses(spdx_file, filepath, license_data)
 
             if archive is not None:
@@ -1072,25 +1075,45 @@ def create_image_spdx(d):
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
+                a = add_package_files(
+                        d,
+                        objset,
+                        image_path,
+                        lambda file_counter: objset.new_spdxid(
+                            "imagefile", str(file_counter)
+                        ),
+                        lambda filepath: [],
+                        license_data=None,
+                        ignore_dirs=[],
+                        ignore_top_level_dirs=[],
+                        archive=None,
                 )
-            )
-            set_purposes(
-                d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE_PURPOSE"
-            )
-            set_timestamp_now(d, a, "builtTime")
+                artifacts.extend(a)
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
+                )
+
+                artifacts.append(a)
+
+            for a in artifacts:
+                set_purposes(
+                    d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE_PURPOSE"
+                )
+
+                set_timestamp_now(d, a, "builtTime")
 
-            artifacts.append(a)
 
         if artifacts:
             objset.new_scoped_relationship(
-- 
2.43.0


