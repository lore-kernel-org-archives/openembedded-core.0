Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B75C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 17:51:18 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.24272.1736790667855823578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 09:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=FP+PTyEx;
 spf=pass (domain: foundries.io, ip: 209.85.218.45, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaeecbb7309so863093966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1736790665; x=1737395465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dWj66HEprZcqCAWO0OzaZpicGp/piTGgVTbZvqR4is=;
        b=FP+PTyExnNXnf7sRfktSUzjFUuY52UEL8SDdvwVoVZTSkn968VrH/Cft23NSYjVIgb
         072OQfB508c9i+QjCLpsIOgS8sNrO7PmC+n3tvnUzRoCLm9bC0M1EDdwoKxq6BY+/Ce0
         vtxJJ9C4alZI8/zomzOQjZNeppOG/p98BojCtdoS8MeGODfemUERwxcv/eTTIpDm/tVV
         QCK3bScak2ziRdEBFVoq9TnJGzTBx/HK2ZXJKWQ7d4axMD2ou1EdKN3cUdOybF/wNq0j
         G4rmRcyZW6GuJutHzUPmHNQXnZ72wtMlaYlxa7ceP2msIohOwgs5/pL9FcLhyr+xhX/W
         Y15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790665; x=1737395465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dWj66HEprZcqCAWO0OzaZpicGp/piTGgVTbZvqR4is=;
        b=ubqMtWvlx52rQ9POjmadmwRwe0dpWYpP96zPe3LHAs6KsEOfUNdoz4cT0KAXgh81yP
         SVFw3T7+AV7YmbxOD2SxbhBwyoHBegnTln5vQKPSwANCGf+WP0bCIWLeo82E9klL2Vau
         ZkEWIQs3ceyoyCv2//4LroAo4Qfmc3vUYOOjZIopCNmbFgfvDWbff7bEaokCK4eOhZix
         obOHAfhiVwHYc59hlC+MkqsgczaxKgiA/EAoErqaNMae92gz5wlhcC7UVW9VN5u8K/MO
         5RlomHDRMaspSjmMdmbCXccqI4aTzsqkoLh60E6xIOZoWmH2q5U+iGZnauDSneMoqbSo
         25dQ==
X-Gm-Message-State: AOJu0YwP04OwW6ZjHB7eSGZb1xMKpgBfE9XmwECQjaHA0QkGyibBB2y2
	RH+byV050r18udwEBH7/595cre01R+Ms40PYEC/+p0Z7xGHTGKllGYIHSDqZXkh6fksv1puRBlM
	B4aU=
X-Gm-Gg: ASbGncu98MmlXJbHsupGDa/O4ZG5Fs0W69AinfshSf/7HyGvjP5Qfz5Su2vo4kS5mPW
	1jsn+BHwF2d64feXHS73iRNV+p0vbEP+ScedEUQ4nnpJHOtC0+xzwakqANLv1uyGdy2VqZGHaZP
	SQfW2LqUFzzZuqifXnxDUvSP4GgsVyIwtmuTMncLbiNtAcvuYRl1Lent9g5cXNOYQj7lo0UL5y3
	sEmTyNbuAYf6Nqrx82omT03vkC8TSduBq+lx9hx9Y0vIaJ4C9T23N4TdlKjc5ET
X-Google-Smtp-Source: AGHT+IEvXGiuu9U3SV/pyYP6mhsxHzyRf3GWrH3ayZVsKJ2REAJL7EgOWcHRqRvS/utVi5Co/h9TUg==
X-Received: by 2002:a17:907:971e:b0:aa6:18b6:310e with SMTP id a640c23a62f3a-ab2abc93dfbmr1647672966b.38.1736790665513;
        Mon, 13 Jan 2025 09:51:05 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d52edsm526246166b.42.2025.01.13.09.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:51:04 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH v2] lib/spdx30_tasks: support directories deployed by image recipes
Date: Mon, 13 Jan 2025 18:50:51 +0100
Message-ID: <20250113175051.1173919-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 17:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209740

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
 meta/lib/oe/spdx30_tasks.py | 51 ++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c60c97896c..d1a7df5b64 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1068,29 +1068,46 @@ def create_image_spdx(d):
         builds.append(image_build)
 
         artifacts = []
+        license_data = oe.spdx_common.load_spdx_license_data(d)
 
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
+                        lambda filepath: [oe.spdx30.software_SoftwarePurpose.file],
+                        license_data,
+                        ignore_dirs=None,
+                        ignore_top_level_dirs=None,
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
+                set_purposes(
+                    d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE_PURPOSE"
+                )
+                set_timestamp_now(d, a, "builtTime")
 
-            artifacts.append(a)
+                artifacts.append(a)
 
         if artifacts:
             objset.new_scoped_relationship(
-- 
2.43.0


