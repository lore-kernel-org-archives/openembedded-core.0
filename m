Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A264EE57E9
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:37 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.35245.1726097013410483387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GLqBwV7A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718816be6cbso249502b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097013; x=1726701813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVO+vbLL22YwsQ7Adb7A5ZJyvle8m7eLMNdJA7KfFIE=;
        b=GLqBwV7AX0Kwr9CnRQC8gtWTwGvgPcSzvxNhAknG3A3fgtjLQ2CPxMaNNf6rpcaIet
         5pab9rW3ZZL0kZ+s3uZscOemqhzl8qt4MJqNx6F3lxi8/QlYUR6O5zgiVlqz1NmzGs58
         M+P26NNGw2LyeWbIDGOGmVYPyLoOgvj/NRmJrQKft6TkZ97g0y3NfJ7cWjL3hCBN0r12
         yoflQ8LAbJ3icXSeW6N1bHirqTB9jFKIUz3138qLHMdSh3ZjtJeMdl1HsEwpU2co5etw
         mUp25XrnfaRh6yOSrSmWXHwjWD/F7JVj0J1m2EV2S+CFSXAGvoEHVGIsoknGcUiAvhtx
         sAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097013; x=1726701813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVO+vbLL22YwsQ7Adb7A5ZJyvle8m7eLMNdJA7KfFIE=;
        b=GS6nkZG/ITkJ/zCzdqJFfuZTKtGVTRB5NzEznqKlKyD1yyjAM2luY5d/MKU1bVcOp/
         Hcpg0MSZYvxCMSrzLJHPEOYHZ2x0uZHszePsgHu2bxBflnHSlObQAb0FuQAFCzhM+W6M
         Aje6DEhp8fhYm3h0Klw4kOl4b+pUj2kwx/Uuv30bww0HiCyoeWb6uYepaCjv9rbS7RCi
         quzA2e1ve/m6uTc4grfCVJurfhVgy0sUhr7giMsgEbvb9bQ7pCtpd8LbRzfPutK3Jigu
         qgUetaoSqTNTHtxQsgucN2fpN2ux/nZAsGAyE7phQhQLrfTcuWHCz6bGdimGWUagya2o
         hdjQ==
X-Gm-Message-State: AOJu0YwE7uEkdIONpPrfx6rxRGCu7C6mRdRj06EEnAve06NmbmQmNcF3
	f/djafnqn6xANlvmYv0Q0WkLfeLNujwnYauuJyUGf5UJJqf0Cw/ibmvn6en3G2w3+DUcnttXnCm
	X
X-Google-Smtp-Source: AGHT+IFyryJ5gdC4K33YaSvTlbVDzT7KuRlIsHiZQ9nwY88L5qHDD5HZXriwpnH9eNqHFtB0B4ggGQ==
X-Received: by 2002:a05:6a00:4b52:b0:717:9754:4ade with SMTP id d2e1a72fcca58-719261edaaemr1502700b3a.22.1726097011784;
        Wed, 11 Sep 2024 16:23:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/22] qemu: Backport fix for CVE-2024-4467
Date: Wed, 11 Sep 2024 16:23:00 -0700
Message-Id: <c23ad8c89c3dd5b6004677cd0b534e22a293134d.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204397

From: Vijay Anusuri <vanusuri@mvista.com>

A flaw was found in the QEMU disk image utility (qemu-img) 'info' command. A specially crafted image file containing a `json:{}` value describing block devices in QMP could cause the qemu-img process on the host to consume large amounts of memory or CPU time, leading to denial of service or read/write to an existing external file.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-4467

Upstream commits:
https://gitlab.com/qemu-project/qemu/-/commit/bd385a5298d7062668e804d73944d52aec9549f1
https://gitlab.com/qemu-project/qemu/-/commit/2eb42a728d27a43fdcad5f37d3f65706ce6deba5
https://gitlab.com/qemu-project/qemu/-/commit/7e1110664ecbc4826f3c978ccb06b6c1bce823e6
https://gitlab.com/qemu-project/qemu/-/commit/83930780325b144a5908c45b3957b9b6457b3831
https://gitlab.com/qemu-project/qemu/-/commit/7ead946998610657d38d1a505d5f25300d4ca613

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2024-4467-0001.patch        | 214 +++++++
 .../qemu/qemu/CVE-2024-4467-0002.patch        |  73 +++
 .../qemu/qemu/CVE-2024-4467-0003.patch        |  76 +++
 .../qemu/qemu/CVE-2024-4467-0004.patch        | 571 ++++++++++++++++++
 .../qemu/qemu/CVE-2024-4467-0005.patch        | 265 ++++++++
 6 files changed, 1204 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4684e44524..6ff3c2f9bc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -113,6 +113,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-7409-0002.patch \
            file://CVE-2024-7409-0003.patch \
            file://CVE-2024-7409-0004.patch \
+           file://CVE-2024-4467-0001.patch \
+           file://CVE-2024-4467-0002.patch \
+           file://CVE-2024-4467-0003.patch \
+           file://CVE-2024-4467-0004.patch \
+           file://CVE-2024-4467-0005.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
new file mode 100644
index 0000000000..f7c6e7aaab
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
@@ -0,0 +1,214 @@
+From 5cdbc87ab24a8cc4cf926158ec429d43d8a45f15 Mon Sep 17 00:00:00 2001
+From: Jon Maloy <jmaloy@redhat.com>
+Date: Wed, 5 Jun 2024 19:56:51 -0400
+Subject: [PATCH 1/5] qcow2: Don't open data_file with BDRV_O_NO_IO
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+RH-Author: Jon Maloy <jmaloy@redhat.com>
+RH-MergeRequest: 5: EMBARGOED CVE-2024-4467 for rhel-8.10.z (PRDSC)
+RH-Jira: RHEL-35616
+RH-CVE: CVE-2024-4467
+RH-Acked-by: Kevin Wolf <kwolf@redhat.com>
+RH-Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+RH-Commit: [1/5] 2e72d21c14d86645cf68eec78f49d5cc5d77581f
+
+Conflicts: qcow2_do_open(): missing boolean ´open_data_file'.
+           We assume it to be true.
+
+commit f9843ce5c519901654a7d8ba43ee95ce25ca13c2
+Author: Kevin Wolf <kwolf@redhat.com>
+Date:   Thu Apr 11 15:06:01 2024 +0200
+
+    qcow2: Don't open data_file with BDRV_O_NO_IO
+
+    One use case for 'qemu-img info' is verifying that untrusted images
+    don't reference an unwanted external file, be it as a backing file or an
+    external data file. To make sure that calling 'qemu-img info' can't
+    already have undesired side effects with a malicious image, just don't
+    open the data file at all with BDRV_O_NO_IO. If nothing ever tries to do
+    I/O, we don't need to have it open.
+
+    This changes the output of iotests case 061, which used 'qemu-img info'
+    to show that opening an image with an invalid data file fails. After
+    this patch, it succeeds. Replace this part of the test with a qemu-io
+    call, but keep the final 'qemu-img info' to show that the invalid data
+    file is correctly displayed in the output.
+
+    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+    Reviewed-by: Eric Blake <eblake@redhat.com>
+    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+    Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+    Upstream: N/A, embargoed
+    Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
+
+Signed-off-by: Jon Maloy <jmaloy@redhat.com>
+
+Upstream-Status: Backport [import from rhel8 qemu-kvm-6.2.0-50.module+el8.10.0+22027+db0a70a4.src.rpm
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/bd385a5298d7062668e804d73944d52aec9549f1]
+CVE: CVE-2024-4467
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ block/qcow2.c              | 87 +++++++++++++++++++++++---------------
+ tests/qemu-iotests/061     |  6 ++-
+ tests/qemu-iotests/061.out |  8 +++-
+ 3 files changed, 62 insertions(+), 39 deletions(-)
+
+diff --git a/block/qcow2.c b/block/qcow2.c
+index d509016756..6ee1919612 100644
+--- a/block/qcow2.c
++++ b/block/qcow2.c
+@@ -1613,50 +1613,67 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
+         goto fail;
+     }
+ 
+-    /* Open external data file */
+-    s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
+-                                   &child_of_bds, BDRV_CHILD_DATA,
+-                                   true, errp);
+-    if (*errp) {
+-        ret = -EINVAL;
+-        goto fail;
+-    }
++    if (flags & BDRV_O_NO_IO) {
++        /*
++         * Don't open the data file for 'qemu-img info' so that it can be used
++         * to verify that an untrusted qcow2 image doesn't refer to external
++         * files.
++         *
++         * Note: This still makes has_data_file() return true.
++         */
++        if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
++            s->data_file = NULL;
++        } else {
++            s->data_file = bs->file;
++        }
++        qdict_extract_subqdict(options, NULL, "data-file.");
++        qdict_del(options, "data-file");
++    } else {
++        /* Open external data file */
++        s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
++                                       &child_of_bds, BDRV_CHILD_DATA,
++                                       true, errp);
++        if (*errp) {
++            ret = -EINVAL;
++            goto fail;
++        }
+ 
+-    if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
+-        if (!s->data_file && s->image_data_file) {
+-            s->data_file = bdrv_open_child(s->image_data_file, options,
+-                                           "data-file", bs, &child_of_bds,
+-                                           BDRV_CHILD_DATA, false, errp);
++        if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
++            if (!s->data_file && s->image_data_file) {
++                s->data_file = bdrv_open_child(s->image_data_file, options,
++                                               "data-file", bs, &child_of_bds,
++                                               BDRV_CHILD_DATA, false, errp);
++                if (!s->data_file) {
++                    ret = -EINVAL;
++                    goto fail;
++                }
++            }
+             if (!s->data_file) {
++                error_setg(errp, "'data-file' is required for this image");
+                 ret = -EINVAL;
+                 goto fail;
+             }
+-        }
+-        if (!s->data_file) {
+-            error_setg(errp, "'data-file' is required for this image");
+-            ret = -EINVAL;
+-            goto fail;
+-        }
+ 
+-        /* No data here */
+-        bs->file->role &= ~BDRV_CHILD_DATA;
++            /* No data here */
++            bs->file->role &= ~BDRV_CHILD_DATA;
+ 
+-        /* Must succeed because we have given up permissions if anything */
+-        bdrv_child_refresh_perms(bs, bs->file, &error_abort);
+-    } else {
+-        if (s->data_file) {
+-            error_setg(errp, "'data-file' can only be set for images with an "
+-                             "external data file");
+-            ret = -EINVAL;
+-            goto fail;
+-        }
++            /* Must succeed because we have given up permissions if anything */
++            bdrv_child_refresh_perms(bs, bs->file, &error_abort);
++        } else {
++            if (s->data_file) {
++                error_setg(errp, "'data-file' can only be set for images with an "
++                           "external data file");
++                ret = -EINVAL;
++                goto fail;
++            }
+ 
+-        s->data_file = bs->file;
++            s->data_file = bs->file;
+ 
+-        if (data_file_is_raw(bs)) {
+-            error_setg(errp, "data-file-raw requires a data file");
+-            ret = -EINVAL;
+-            goto fail;
++            if (data_file_is_raw(bs)) {
++                error_setg(errp, "data-file-raw requires a data file");
++                ret = -EINVAL;
++                goto fail;
++            }
+         }
+     }
+ 
+diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
+index 9507c223bd..6a5bd47efc 100755
+--- a/tests/qemu-iotests/061
++++ b/tests/qemu-iotests/061
+@@ -322,12 +322,14 @@ $QEMU_IMG amend -o "data_file=foo" "$TEST_IMG"
+ echo
+ _make_test_img -o "compat=1.1,data_file=$TEST_IMG.data" 64M
+ $QEMU_IMG amend -o "data_file=foo" "$TEST_IMG"
+-_img_info --format-specific
++$QEMU_IO -c "read 0 4k" "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
++$QEMU_IO -c "open -o data-file.filename=$TEST_IMG.data,file.filename=$TEST_IMG" -c "read 0 4k" | _filter_qemu_io
+ TEST_IMG="data-file.filename=$TEST_IMG.data,file.filename=$TEST_IMG" _img_info --format-specific --image-opts
+ 
+ echo
+ $QEMU_IMG amend -o "data_file=" --image-opts "data-file.filename=$TEST_IMG.data,file.filename=$TEST_IMG"
+-_img_info --format-specific
++$QEMU_IO -c "read 0 4k" "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
++$QEMU_IO -c "open -o data-file.filename=$TEST_IMG.data,file.filename=$TEST_IMG" -c "read 0 4k" | _filter_qemu_io
+ TEST_IMG="data-file.filename=$TEST_IMG.data,file.filename=$TEST_IMG" _img_info --format-specific --image-opts
+ 
+ echo
+diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
+index 7ecbd4dea8..99b2307a23 100644
+--- a/tests/qemu-iotests/061.out
++++ b/tests/qemu-iotests/061.out
+@@ -545,7 +545,9 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+ qemu-img: data-file can only be set for images that use an external data file
+ 
+ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 data_file=TEST_DIR/t.IMGFMT.data
+-qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Could not open 'foo': No such file or directory
++qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 'foo': No such file or directory
++read 4096/4096 bytes at offset 0
++4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+ image: TEST_DIR/t.IMGFMT
+ file format: IMGFMT
+ virtual size: 64 MiB (67108864 bytes)
+@@ -560,7 +562,9 @@ Format specific information:
+     corrupt: false
+     extended l2: false
+ 
+-qemu-img: Could not open 'TEST_DIR/t.IMGFMT': 'data-file' is required for this image
++qemu-io: can't open device TEST_DIR/t.IMGFMT: 'data-file' is required for this image
++read 4096/4096 bytes at offset 0
++4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+ image: TEST_DIR/t.IMGFMT
+ file format: IMGFMT
+ virtual size: 64 MiB (67108864 bytes)
+-- 
+2.39.3
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
new file mode 100644
index 0000000000..901ca7036d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
@@ -0,0 +1,73 @@
+From 3cb587f460ec432f329fb83df034bbb7e79e17aa Mon Sep 17 00:00:00 2001
+From: Jon Maloy <jmaloy@redhat.com>
+Date: Wed, 5 Jun 2024 19:56:51 -0400
+Subject: [PATCH 2/5] iotests/244: Don't store data-file with protocol in image
+
+RH-Author: Jon Maloy <jmaloy@redhat.com>
+RH-MergeRequest: 5: EMBARGOED CVE-2024-4467 for rhel-8.10.z (PRDSC)
+RH-Jira: RHEL-35616
+RH-CVE: CVE-2024-4467
+RH-Acked-by: Kevin Wolf <kwolf@redhat.com>
+RH-Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+RH-Commit: [2/5] a422cfdba938e1bd857008ccbbddc695011ae0ff
+
+commit 92e00dab8be1570b13172353d77d2af44cb4e22b
+Author: Kevin Wolf <kwolf@redhat.com>
+Date:   Thu Apr 25 14:49:40 2024 +0200
+
+    iotests/244: Don't store data-file with protocol in image
+
+    We want to disable filename parsing for data files because it's too easy
+    to abuse in malicious image files. Make the test ready for the change by
+    passing the data file explicitly in command line options.
+
+    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+    Reviewed-by: Eric Blake <eblake@redhat.com>
+    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+    Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+    Upstream: N/A, embargoed
+    Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
+
+Signed-off-by: Jon Maloy <jmaloy@redhat.com>
+
+Upstream-Status: Backport [import from rhel8 qemu-kvm-6.2.0-50.module+el8.10.0+22027+db0a70a4.src.rpm
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/2eb42a728d27a43fdcad5f37d3f65706ce6deba5]
+CVE: CVE-2024-4467
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/qemu-iotests/244 | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
+index 3e61fa25bb..bb9cc6512f 100755
+--- a/tests/qemu-iotests/244
++++ b/tests/qemu-iotests/244
+@@ -215,9 +215,22 @@ $QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TEST_IMG.src" "$TEST_IMG"
+ $QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$TEST_IMG"
+ 
+ # blkdebug doesn't support copy offloading, so this tests the error path
+-$QEMU_IMG amend -f $IMGFMT -o "data_file=blkdebug::$TEST_IMG.data" "$TEST_IMG"
+-$QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TEST_IMG.src" "$TEST_IMG"
+-$QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$TEST_IMG"
++test_img_with_blkdebug="json:{
++    'driver': 'qcow2',
++    'file': {
++        'driver': 'file',
++        'filename': '$TEST_IMG'
++    },
++    'data-file': {
++        'driver': 'blkdebug',
++        'image': {
++            'driver': 'file',
++            'filename': '$TEST_IMG.data'
++        }
++    }
++}"
++$QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TEST_IMG.src" "$test_img_with_blkdebug"
++$QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$test_img_with_blkdebug"
+ 
+ echo
+ echo "=== Flushing should flush the data file ==="
+-- 
+2.39.3
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
new file mode 100644
index 0000000000..89b4bbea5b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
@@ -0,0 +1,76 @@
+From 59a84673079f9763e9507733e308442397aba703 Mon Sep 17 00:00:00 2001
+From: Jon Maloy <jmaloy@redhat.com>
+Date: Wed, 5 Jun 2024 19:56:51 -0400
+Subject: [PATCH 3/5] iotests/270: Don't store data-file with json: prefix in
+ image
+
+RH-Author: Jon Maloy <jmaloy@redhat.com>
+RH-MergeRequest: 5: EMBARGOED CVE-2024-4467 for rhel-8.10.z (PRDSC)
+RH-Jira: RHEL-35616
+RH-CVE: CVE-2024-4467
+RH-Acked-by: Kevin Wolf <kwolf@redhat.com>
+RH-Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+RH-Commit: [3/5] ac08690fd3ea3af6e24b2f6a8beedcfe469917a8
+
+commit 705bcc2819ce8e0f8b9d660a93bc48de26413aec
+Author: Kevin Wolf <kwolf@redhat.com>
+Date:   Thu Apr 25 14:49:40 2024 +0200
+
+    iotests/270: Don't store data-file with json: prefix in image
+
+    We want to disable filename parsing for data files because it's too easy
+    to abuse in malicious image files. Make the test ready for the change by
+    passing the data file explicitly in command line options.
+
+    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+    Reviewed-by: Eric Blake <eblake@redhat.com>
+    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+    Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+    Upstream: N/A, embargoed
+    Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
+
+Signed-off-by: Jon Maloy <jmaloy@redhat.com>
+
+Upstream-Status: Backport [import from rhel8 qemu-kvm-6.2.0-50.module+el8.10.0+22027+db0a70a4.src.rpm
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/7e1110664ecbc4826f3c978ccb06b6c1bce823e6]
+CVE: CVE-2024-4467
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/qemu-iotests/270 | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/tests/qemu-iotests/270 b/tests/qemu-iotests/270
+index 74352342db..c37b674aa2 100755
+--- a/tests/qemu-iotests/270
++++ b/tests/qemu-iotests/270
+@@ -60,8 +60,16 @@ _make_test_img -o cluster_size=2M,data_file="$TEST_IMG.orig" \
+ # "write" 2G of data without using any space.
+ # (qemu-img create does not like it, though, because null-co does not
+ # support image creation.)
+-$QEMU_IMG amend -o data_file="json:{'driver':'null-co',,'size':'4294967296'}" \
+-    "$TEST_IMG"
++test_img_with_null_data="json:{
++    'driver': '$IMGFMT',
++    'file': {
++        'filename': '$TEST_IMG'
++    },
++    'data-file': {
++        'driver': 'null-co',
++        'size':'4294967296'
++    }
++}"
+ 
+ # This gives us a range of:
+ #   2^31 - 512 + 768 - 1 = 2^31 + 255 > 2^31
+@@ -74,7 +82,7 @@ $QEMU_IMG amend -o data_file="json:{'driver':'null-co',,'size':'4294967296'}" \
+ # on L2 boundaries, we need large L2 tables; hence the cluster size of
+ # 2 MB.  (Anything from 256 kB should work, though, because then one L2
+ # table covers 8 GB.)
+-$QEMU_IO -c "write 768 $((2 ** 31 - 512))" "$TEST_IMG" | _filter_qemu_io
++$QEMU_IO -c "write 768 $((2 ** 31 - 512))" "$test_img_with_null_data" | _filter_qemu_io
+ 
+ _check_test_img
+ 
+-- 
+2.39.3
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
new file mode 100644
index 0000000000..9fc653cbcb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
@@ -0,0 +1,571 @@
+From 996680dd6d5afd51918e600126dbfed4dfe89e05 Mon Sep 17 00:00:00 2001
+From: Jon Maloy <jmaloy@redhat.com>
+Date: Sun, 9 Jun 2024 23:08:39 -0400
+Subject: [PATCH 4/5] block: introduce bdrv_open_file_child() helper
+
+RH-Author: Jon Maloy <jmaloy@redhat.com>
+RH-MergeRequest: 5: EMBARGOED CVE-2024-4467 for rhel-8.10.z (PRDSC)
+RH-Jira: RHEL-35616
+RH-CVE: CVE-2024-4467
+RH-Acked-by: Kevin Wolf <kwolf@redhat.com>
+RH-Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+RH-Commit: [4/5] 9f582a9aff740eb9ec6f64bfec94854038d8545f
+
+Conflicts: - copy-before-write.c::cbw_copy() is an older version than
+             upstream, but introduction of the new function is
+	     straight-forward.
+           - include/block/block-global-state.h doesn't exist in this
+             code version. Adding the prototype to
+             include/block/block.h instead.
+           - struct BlockDriver has no field 'filtered_child_is_backing'
+             We remove the corresponding assert() in the new function.
+
+commit 83930780325b144a5908c45b3957b9b6457b3831
+Author: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
+Date:   Tue Jul 26 23:11:21 2022 +0300
+
+    block: introduce bdrv_open_file_child() helper
+
+    Almost all drivers call bdrv_open_child() similarly. Let's create a
+    helper for this.
+
+    The only not updated drivers that call bdrv_open_child() to set
+    bs->file are raw-format and snapshot-access:
+        raw-format sometimes want to have filtered child but
+            don't set drv->is_filter to true.
+        snapshot-access wants only DATA | PRIMARY
+
+    Possibly we should implement drv->is_filter_func() handler, to consider
+    raw-format as filter when it works as filter.. But it's another story.
+
+    Note also, that we decrease assignments to bs->file in code: it helps
+    us restrict modifying this field in further commit.
+
+    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
+    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+    Message-Id: <20220726201134.924743-3-vsementsov@yandex-team.ru>
+    Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Signed-off-by: Jon Maloy <jmaloy@redhat.com>
+
+Upstream-Status: Backport [import from rhel8 qemu-kvm-6.2.0-50.module+el8.10.0+22027+db0a70a4.src.rpm
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/83930780325b144a5908c45b3957b9b6457b3831]
+CVE: CVE-2024-4467
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ block.c                   | 18 ++++++++++++++++++
+ block/blkdebug.c          |  9 +++------
+ block/blklogwrites.c      |  7 ++-----
+ block/blkreplay.c         |  7 ++-----
+ block/blkverify.c         |  9 +++------
+ block/bochs.c             |  7 +++----
+ block/cloop.c             |  7 +++----
+ block/copy-before-write.c |  9 ++++-----
+ block/copy-on-read.c      |  9 ++++-----
+ block/crypto.c            | 11 ++++++-----
+ block/dmg.c               |  7 +++----
+ block/filter-compress.c   |  8 +++-----
+ block/parallels.c         |  7 +++----
+ block/preallocate.c       |  9 ++++-----
+ block/qcow.c              |  6 ++----
+ block/qcow2.c             |  8 ++++----
+ block/qed.c               |  8 ++++----
+ block/replication.c       |  8 +++-----
+ block/throttle.c          |  8 +++-----
+ block/vdi.c               |  7 +++----
+ block/vhdx.c              |  7 +++----
+ block/vmdk.c              |  7 +++----
+ block/vpc.c               |  7 +++----
+ include/block/block.h     |  3 +++
+ 24 files changed, 92 insertions(+), 101 deletions(-)
+
+diff --git a/block.c b/block.c
+index 0ac5b163d2..889f878565 100644
+--- a/block.c
++++ b/block.c
+@@ -3546,6 +3546,24 @@ BdrvChild *bdrv_open_child(const char *filename,
+                              errp);
+ }
+ 
++/*
++ * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
++ */
++int bdrv_open_file_child(const char *filename,
++                         QDict *options, const char *bdref_key,
++                         BlockDriverState *parent, Error **errp)
++{
++    BdrvChildRole role;
++
++    role = parent->drv->is_filter ?
++        (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
++
++    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
++                                   &child_of_bds, role, false, errp);
++
++    return parent->file ? 0 : -EINVAL;
++}
++
+ /*
+  * TODO Future callers may need to specify parent/child_class in order for
+  * option inheritance to work. Existing callers use it for the root node.
+diff --git a/block/blkdebug.c b/block/blkdebug.c
+index bbf2948703..5fcfc8ac6f 100644
+--- a/block/blkdebug.c
++++ b/block/blkdebug.c
+@@ -503,12 +503,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
+     }
+ 
+     /* Open the image file */
+-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "image",
+-                               bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        ret = -EINVAL;
++    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-image"), options, "image",
++                               bs, errp);
++    if (ret < 0) {
+         goto out;
+     }
+ 
+diff --git a/block/blklogwrites.c b/block/blklogwrites.c
+index f7a251e91f..f66a617eb3 100644
+--- a/block/blklogwrites.c
++++ b/block/blklogwrites.c
+@@ -155,11 +155,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
+     }
+ 
+     /* Open the file */
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, false,
+-                               errp);
+-    if (!bs->file) {
+-        ret = -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
+         goto fail;
+     }
+ 
+diff --git a/block/blkreplay.c b/block/blkreplay.c
+index dcbe780ddb..76a0b8d12a 100644
+--- a/block/blkreplay.c
++++ b/block/blkreplay.c
+@@ -26,11 +26,8 @@ static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
+     int ret;
+ 
+     /* Open the image file */
+-    bs->file = bdrv_open_child(NULL, options, "image", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        ret = -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "image", bs, errp);
++    if (ret < 0) {
+         goto fail;
+     }
+ 
+diff --git a/block/blkverify.c b/block/blkverify.c
+index d1facf5ba9..920e891684 100644
+--- a/block/blkverify.c
++++ b/block/blkverify.c
+@@ -121,12 +121,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
+     }
+ 
+     /* Open the raw file */
+-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "raw",
+-                               bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        ret = -EINVAL;
++    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-raw"), options, "raw",
++                               bs, errp);
++    if (ret < 0) {
+         goto fail;
+     }
+ 
+diff --git a/block/bochs.c b/block/bochs.c
+index 4d68658087..b2dc06bbfd 100644
+--- a/block/bochs.c
++++ b/block/bochs.c
+@@ -110,10 +110,9 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
+         return ret;
+     }
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     ret = bdrv_pread(bs->file, 0, &bochs, sizeof(bochs));
+diff --git a/block/cloop.c b/block/cloop.c
+index b8c6d0eccd..bee87da173 100644
+--- a/block/cloop.c
++++ b/block/cloop.c
+@@ -71,10 +71,9 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
+         return ret;
+     }
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     /* read header */
+diff --git a/block/copy-before-write.c b/block/copy-before-write.c
+index c30a5ff8de..8aa2cb6a85 100644
+--- a/block/copy-before-write.c
++++ b/block/copy-before-write.c
+@@ -150,12 +150,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
+ {
+     BDRVCopyBeforeWriteState *s = bs->opaque;
+     BdrvDirtyBitmap *copy_bitmap;
++    int ret;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+diff --git a/block/copy-on-read.c b/block/copy-on-read.c
+index 1fc7fb3333..815ac1d835 100644
+--- a/block/copy-on-read.c
++++ b/block/copy-on-read.c
+@@ -41,12 +41,11 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
+     BDRVStateCOR *state = bs->opaque;
+     /* Find a bottom node name, if any */
+     const char *bottom_node = qdict_get_try_str(options, "bottom");
++    int ret;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     bs->supported_read_flags = BDRV_REQ_PREFETCH;
+diff --git a/block/crypto.c b/block/crypto.c
+index c8ba4681e2..abfce39230 100644
+--- a/block/crypto.c
++++ b/block/crypto.c
+@@ -260,15 +260,14 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
+ {
+     BlockCrypto *crypto = bs->opaque;
+     QemuOpts *opts = NULL;
+-    int ret = -EINVAL;
++    int ret;
+     QCryptoBlockOpenOptions *open_opts = NULL;
+     unsigned int cflags = 0;
+     QDict *cryptoopts = NULL;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     bs->supported_write_flags = BDRV_REQ_FUA &
+@@ -276,6 +275,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
+ 
+     opts = qemu_opts_create(opts_spec, NULL, 0, &error_abort);
+     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
++        ret = -EINVAL;
+         goto cleanup;
+     }
+ 
+@@ -284,6 +284,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
+ 
+     open_opts = block_crypto_open_opts_init(cryptoopts, errp);
+     if (!open_opts) {
++        ret = -EINVAL;
+         goto cleanup;
+     }
+ 
+diff --git a/block/dmg.c b/block/dmg.c
+index 447901fbb8..38c363dd39 100644
+--- a/block/dmg.c
++++ b/block/dmg.c
+@@ -439,10 +439,9 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
+         return ret;
+     }
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     block_module_load_one("dmg-bz2");
+diff --git a/block/filter-compress.c b/block/filter-compress.c
+index d5be538619..305716c86c 100644
+--- a/block/filter-compress.c
++++ b/block/filter-compress.c
+@@ -30,11 +30,9 @@
+ static int compress_open(BlockDriverState *bs, QDict *options, int flags,
+                          Error **errp)
+ {
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    int ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     if (!bs->file->bs->drv || !block_driver_can_compress(bs->file->bs->drv)) {
+diff --git a/block/parallels.c b/block/parallels.c
+index 6ebad2a2bb..ed4debd899 100644
+--- a/block/parallels.c
++++ b/block/parallels.c
+@@ -735,10 +735,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
+     Error *local_err = NULL;
+     char *buf;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
+diff --git a/block/preallocate.c b/block/preallocate.c
+index 1d4233f730..332408bdc9 100644
+--- a/block/preallocate.c
++++ b/block/preallocate.c
+@@ -134,6 +134,7 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
+                             Error **errp)
+ {
+     BDRVPreallocateState *s = bs->opaque;
++    int ret;
+ 
+     /*
+      * s->data_end and friends should be initialized on permission update.
+@@ -141,11 +142,9 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
+      */
+     s->file_end = s->zero_start = s->data_end = -EINVAL;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     if (!preallocate_absorb_opts(&s->opts, options, bs->file->bs, errp)) {
+diff --git a/block/qcow.c b/block/qcow.c
+index c39940f33e..544a17261f 100644
+--- a/block/qcow.c
++++ b/block/qcow.c
+@@ -120,10 +120,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
+     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
+     encryptfmt = qdict_get_try_str(encryptopts, "format");
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        ret = -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
+         goto fail;
+     }
+ 
+diff --git a/block/qcow2.c b/block/qcow2.c
+index 6ee1919612..29ea157e6b 100644
+--- a/block/qcow2.c
++++ b/block/qcow2.c
+@@ -1907,11 +1907,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
+         .errp = errp,
+         .ret = -EINPROGRESS
+     };
++    int ret;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     /* Initialise locks */
+diff --git a/block/qed.c b/block/qed.c
+index 558d3646c4..e3b06a3d00 100644
+--- a/block/qed.c
++++ b/block/qed.c
+@@ -558,11 +558,11 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
+         .errp = errp,
+         .ret = -EINPROGRESS
+     };
++    int ret;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     bdrv_qed_init_state(bs);
+diff --git a/block/replication.c b/block/replication.c
+index 55c8f894aa..2f17397764 100644
+--- a/block/replication.c
++++ b/block/replication.c
+@@ -88,11 +88,9 @@ static int replication_open(BlockDriverState *bs, QDict *options,
+     const char *mode;
+     const char *top_id;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     ret = -EINVAL;
+diff --git a/block/throttle.c b/block/throttle.c
+index 6e8d52fa24..4fb5798c27 100644
+--- a/block/throttle.c
++++ b/block/throttle.c
+@@ -78,11 +78,9 @@ static int throttle_open(BlockDriverState *bs, QDict *options,
+     char *group;
+     int ret;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+-                               false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+     bs->supported_write_flags = bs->file->bs->supported_write_flags |
+                                 BDRV_REQ_WRITE_UNCHANGED;
+diff --git a/block/vdi.c b/block/vdi.c
+index bdc58d726e..c50c0ed61f 100644
+--- a/block/vdi.c
++++ b/block/vdi.c
+@@ -376,10 +376,9 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
+     int ret;
+     QemuUUID uuid_link, uuid_parent;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     logout("\n");
+diff --git a/block/vhdx.c b/block/vhdx.c
+index 356ec4c455..e7d6d7509a 100644
+--- a/block/vhdx.c
++++ b/block/vhdx.c
+@@ -996,10 +996,9 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
+     uint64_t signature;
+     Error *local_err = NULL;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     s->bat = NULL;
+diff --git a/block/vmdk.c b/block/vmdk.c
+index 0dfab6e941..7d7e56b36c 100644
+--- a/block/vmdk.c
++++ b/block/vmdk.c
+@@ -1262,10 +1262,9 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
+     BDRVVmdkState *s = bs->opaque;
+     uint32_t magic;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     buf = vmdk_read_desc(bs->file, 0, errp);
+diff --git a/block/vpc.c b/block/vpc.c
+index 297a26262a..430cab1cbb 100644
+--- a/block/vpc.c
++++ b/block/vpc.c
+@@ -232,10 +232,9 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
+     int ret;
+     int64_t bs_size;
+ 
+-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+-                               BDRV_CHILD_IMAGE, false, errp);
+-    if (!bs->file) {
+-        return -EINVAL;
++    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
++    if (ret < 0) {
++        return ret;
+     }
+ 
+     opts = qemu_opts_create(&vpc_runtime_opts, NULL, 0, &error_abort);
+diff --git a/include/block/block.h b/include/block/block.h
+index e5dd22b034..f885f113ef 100644
+--- a/include/block/block.h
++++ b/include/block/block.h
+@@ -376,6 +376,9 @@ BdrvChild *bdrv_open_child(const char *filename,
+                            const BdrvChildClass *child_class,
+                            BdrvChildRole child_role,
+                            bool allow_none, Error **errp);
++int bdrv_open_file_child(const char *filename,
++                         QDict *options, const char *bdref_key,
++                         BlockDriverState *parent, Error **errp);
+ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
+ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                         Error **errp);
+-- 
+2.39.3
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
new file mode 100644
index 0000000000..94e03d8646
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
@@ -0,0 +1,265 @@
+From c4ba1f1755031a0ac2f600ed8c17e7dcb6b2b857 Mon Sep 17 00:00:00 2001
+From: Jon Maloy <jmaloy@redhat.com>
+Date: Wed, 5 Jun 2024 19:56:51 -0400
+Subject: [PATCH 5/5] block: Parse filenames only when explicitly requested
+
+RH-Author: Jon Maloy <jmaloy@redhat.com>
+RH-MergeRequest: 5: EMBARGOED CVE-2024-4467 for rhel-8.10.z (PRDSC)
+RH-Jira: RHEL-35616
+RH-CVE: CVE-2024-4467
+RH-Acked-by: Kevin Wolf <kwolf@redhat.com>
+RH-Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+RH-Commit: [5/5] a3e197add64fc6950c4ac576e34d833dfae7ee34
+
+Conflicts: - brdv_open_child_common(): bdrv_graph_wrlock/unlock()
+             don't exist in this code version. We ignore them.
+	     bdrv_open_inherit(): no_coroutine_fn/GRAPH_UNLOCKED
+             doesn't exist. We ignore it.
+           - Changes to bdrv_open_file_child() didn't apply cleanly,
+             but fixing it is straight-forward.
+           - GLOBAL_STATE_CODE() not present in this code. Ignoring it.
+           - bdrv_open_file_child(): Need to continue setting of
+	     parent->file.
+
+commit f44c2941d4419e60f16dea3e9adca164e75aa78d
+Author: Kevin Wolf <kwolf@redhat.com>
+Date:   Thu Apr 25 14:56:02 2024 +0200
+
+    block: Parse filenames only when explicitly requested
+
+    When handling image filenames from legacy options such as -drive or from
+    tools, these filenames are parsed for protocol prefixes, including for
+    the json:{} pseudo-protocol.
+
+    This behaviour is intended for filenames that come directly from the
+    command line and for backing files, which may come from the image file
+    itself. Higher level management tools generally take care to verify that
+    untrusted images don't contain a bad (or any) backing file reference;
+    'qemu-img info' is a suitable tool for this.
+
+    However, for other files that can be referenced in images, such as
+    qcow2 data files or VMDK extents, the string from the image file is
+    usually not verified by management tools - and 'qemu-img info' wouldn't
+    be suitable because in contrast to backing files, it already opens these
+    other referenced files. So here the string should be interpreted as a
+    literal local filename. More complex configurations need to be specified
+    explicitly on the command line or in QMP.
+
+    This patch changes bdrv_open_inherit() so that it only parses filenames
+    if a new parameter parse_filename is true. It is set for the top level
+    in bdrv_open(), for the file child and for the backing file child. All
+    other callers pass false and disable filename parsing this way.
+
+    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+    Reviewed-by: Eric Blake <eblake@redhat.com>
+    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+    Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+    Upstream: N/A, embargoed
+    Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
+
+Signed-off-by: Jon Maloy <jmaloy@redhat.com>
+
+Upstream-Status: Backport [import from rhel8 qemu-kvm-6.2.0-50.module+el8.10.0+22027+db0a70a4.src.rpm
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/7ead946998610657d38d1a505d5f25300d4ca613]
+CVE: CVE-2024-4467
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ block.c | 81 +++++++++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 56 insertions(+), 25 deletions(-)
+
+diff --git a/block.c b/block.c
+index 889f878565..ddebf50efa 100644
+--- a/block.c
++++ b/block.c
+@@ -82,6 +82,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
+                                            BlockDriverState *parent,
+                                            const BdrvChildClass *child_class,
+                                            BdrvChildRole child_role,
++                                           bool parse_filename,
+                                            Error **errp);
+ 
+ static bool bdrv_recurse_has_child(BlockDriverState *bs,
+@@ -1926,7 +1927,8 @@ static void parse_json_protocol(QDict *options, const char **pfilename,
+  * block driver has been specified explicitly.
+  */
+ static int bdrv_fill_options(QDict **options, const char *filename,
+-                             int *flags, Error **errp)
++                             int *flags, bool allow_parse_filename,
++                             Error **errp)
+ {
+     const char *drvname;
+     bool protocol = *flags & BDRV_O_PROTOCOL;
+@@ -1966,7 +1968,7 @@ static int bdrv_fill_options(QDict **options, const char *filename,
+     if (protocol && filename) {
+         if (!qdict_haskey(*options, "filename")) {
+             qdict_put_str(*options, "filename", filename);
+-            parse_filename = true;
++            parse_filename = allow_parse_filename;
+         } else {
+             error_setg(errp, "Can't specify 'file' and 'filename' options at "
+                              "the same time");
+@@ -3439,7 +3441,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
+     }
+ 
+     backing_hd = bdrv_open_inherit(backing_filename, reference, options, 0, bs,
+-                                   &child_of_bds, bdrv_backing_role(bs), errp);
++                                   &child_of_bds, bdrv_backing_role(bs), true,
++                                   errp);
+     if (!backing_hd) {
+         bs->open_flags |= BDRV_O_NO_BACKING;
+         error_prepend(errp, "Could not open backing file: ");
+@@ -3472,7 +3475,8 @@ free_exit:
+ static BlockDriverState *
+ bdrv_open_child_bs(const char *filename, QDict *options, const char *bdref_key,
+                    BlockDriverState *parent, const BdrvChildClass *child_class,
+-                   BdrvChildRole child_role, bool allow_none, Error **errp)
++                   BdrvChildRole child_role, bool allow_none,
++                   bool parse_filename, Error **errp)
+ {
+     BlockDriverState *bs = NULL;
+     QDict *image_options;
+@@ -3503,7 +3507,8 @@ bdrv_open_child_bs(const char *filename, QDict *options, const char *bdref_key,
+     }
+ 
+     bs = bdrv_open_inherit(filename, reference, image_options, 0,
+-                           parent, child_class, child_role, errp);
++                           parent, child_class, child_role, parse_filename,
++                           errp);
+     if (!bs) {
+         goto done;
+     }
+@@ -3513,6 +3518,29 @@ done:
+     return bs;
+ }
+ 
++static BdrvChild *bdrv_open_child_common(const char *filename,
++                                         QDict *options, const char *bdref_key,
++                                         BlockDriverState *parent,
++                                         const BdrvChildClass *child_class,
++                                         BdrvChildRole child_role,
++                                         bool allow_none, bool parse_filename,
++                                         Error **errp)
++{
++    BlockDriverState *bs;
++    BdrvChild *child;
++
++    bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
++                            child_role, allow_none, parse_filename, errp);
++    if (bs == NULL) {
++        return NULL;
++    }
++
++    child = bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
++                              errp);
++
++    return child;
++}
++
+ /*
+  * Opens a disk image whose options are given as BlockdevRef in another block
+  * device's options.
+@@ -3534,20 +3562,17 @@ BdrvChild *bdrv_open_child(const char *filename,
+                            BdrvChildRole child_role,
+                            bool allow_none, Error **errp)
+ {
+-    BlockDriverState *bs;
+-
+-    bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
+-                            child_role, allow_none, errp);
+-    if (bs == NULL) {
+-        return NULL;
+-    }
+-
+-    return bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
+-                             errp);
++    return bdrv_open_child_common(filename, options, bdref_key, parent,
++                                  child_class, child_role, allow_none, false,
++                                  errp);
+ }
+ 
+ /*
+- * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
++ * This does mostly the same as bdrv_open_child(), but for opening the primary
++ * child of a node. A notable difference from bdrv_open_child() is that it
++ * enables filename parsing for protocol names (including json:).
++ *
++ * @parent can move to a different AioContext in this function.
+  */
+ int bdrv_open_file_child(const char *filename,
+                          QDict *options, const char *bdref_key,
+@@ -3558,8 +3583,9 @@ int bdrv_open_file_child(const char *filename,
+     role = parent->drv->is_filter ?
+         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
+ 
+-    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
+-                                   &child_of_bds, role, false, errp);
++    parent->file = bdrv_open_child_common(filename, options, bdref_key, parent,
++                                          &child_of_bds, role, false, true,
++                                          errp);
+ 
+     return parent->file ? 0 : -EINVAL;
+ }
+@@ -3599,7 +3625,8 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp)
+ 
+     }
+ 
+-    bs = bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, errp);
++    bs = bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, false,
++                           errp);
+     obj = NULL;
+     qobject_unref(obj);
+     visit_free(v);
+@@ -3690,6 +3717,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
+                                            BlockDriverState *parent,
+                                            const BdrvChildClass *child_class,
+                                            BdrvChildRole child_role,
++                                           bool parse_filename,
+                                            Error **errp)
+ {
+     int ret;
+@@ -3733,9 +3761,11 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
+     }
+ 
+     /* json: syntax counts as explicit options, as if in the QDict */
+-    parse_json_protocol(options, &filename, &local_err);
+-    if (local_err) {
+-        goto fail;
++    if (parse_filename) {
++        parse_json_protocol(options, &filename, &local_err);
++        if (local_err) {
++            goto fail;
++        }
+     }
+ 
+     bs->explicit_options = qdict_clone_shallow(options);
+@@ -3760,7 +3790,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
+                                      parent->open_flags, parent->options);
+     }
+ 
+-    ret = bdrv_fill_options(&options, filename, &flags, &local_err);
++    ret = bdrv_fill_options(&options, filename, &flags, parse_filename,
++                            &local_err);
+     if (ret < 0) {
+         goto fail;
+     }
+@@ -3829,7 +3860,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
+ 
+         file_bs = bdrv_open_child_bs(filename, options, "file", bs,
+                                      &child_of_bds, BDRV_CHILD_IMAGE,
+-                                     true, &local_err);
++                                     true, true, &local_err);
+         if (local_err) {
+             goto fail;
+         }
+@@ -3974,7 +4005,7 @@ BlockDriverState *bdrv_open(const char *filename, const char *reference,
+                             QDict *options, int flags, Error **errp)
+ {
+     return bdrv_open_inherit(filename, reference, options, flags, NULL,
+-                             NULL, 0, errp);
++                             NULL, 0, true, errp);
+ }
+ 
+ /* Return true if the NULL-terminated @list contains @str */
+-- 
+2.39.3
+
-- 
2.34.1


