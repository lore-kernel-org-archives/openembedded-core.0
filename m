Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BFFC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 09:01:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15746.1724230886671046454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 02:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8963eb4839=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L5sRWs009929
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 09:01:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xkxh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 09:01:25 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 02:01:21 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] qemu: fix CVE-2024-4467
Date: Wed, 21 Aug 2024 09:01:03 +0000
Message-ID: <20240821090103.1690448-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c5ace5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8 a=20KFwNOVAAAA:8
 a=69wJf7TsAAAA:8 a=HEKAvhB61vN8tQp0pssA:9 a=6AQ0kHVwfe6azG6Z:21 a=FdTzh2GWekK77mhwV6Dw:22 a=96-UuAdfYG6OSYlHWuPe:22 a=AkheI1RvQwOzcTXhi5f4:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: S_zhYbKzRnQFQM5hPESe6QBEXHegw0M4
X-Proofpoint-GUID: S_zhYbKzRnQFQM5hPESe6QBEXHegw0M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_07,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408210065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 09:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203578

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the QEMU disk image utility (qemu-img) 'info'
command. A specially crafted image file containing a `json:{}`
value describing block devices in QMP could cause the qemu-img
process on the host to consume large amounts of memory or CPU time,
leading to denial of service or read/write to an existing external file

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-4467

Upstream Patches:
https://gitlab.com/qemu-project/qemu/-/commit/bd385a5298d7062668e804d73944d52aec9549f1
https://gitlab.com/qemu-project/qemu/-/commit/2eb42a728d27a43fdcad5f37d3f65706ce6deba5
https://gitlab.com/qemu-project/qemu/-/commit/7e1110664ecbc4826f3c978ccb06b6c1bce823e6
https://gitlab.com/qemu-project/qemu/-/commit/6bc30f19498547fac9cef98316a65cf6c1f14205
https://gitlab.com/qemu-project/qemu/-/commit/7ead946998610657d38d1a505d5f25300d4ca613

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |    5 +
 .../qemu/qemu/CVE-2024-4467-0001.patch        |  112 ++
 .../qemu/qemu/CVE-2024-4467-0002.patch        |   55 +
 .../qemu/qemu/CVE-2024-4467-0003.patch        |   57 +
 .../qemu/qemu/CVE-2024-4467-0004.patch        | 1187 +++++++++++++++++
 .../qemu/qemu/CVE-2024-4467-0005.patch        |  239 ++++
 6 files changed, 1655 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3643b9a544..50d92b04bd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-4467-0001.patch \
+           file://CVE-2024-4467-0002.patch \
+           file://CVE-2024-4467-0003.patch \
+           file://CVE-2024-4467-0004.patch \
+           file://CVE-2024-4467-0005.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
new file mode 100644
index 0000000000..dbcc71bb4e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
@@ -0,0 +1,112 @@
+From bd385a5298d7062668e804d73944d52aec9549f1 Mon Sep 17 00:00:00 2001
+From: Kevin Wolf <kwolf@redhat.com>
+Date: Fri, 16 Aug 2024 08:29:04 +0000
+Subject: [PATCH] qcow2: Don't open data_file with BDRV_O_NO_IO
+
+One use case for 'qemu-img info' is verifying that untrusted images
+don't reference an unwanted external file, be it as a backing file or an
+external data file. To make sure that calling 'qemu-img info' can't
+already have undesired side effects with a malicious image, just don't
+open the data file at all with BDRV_O_NO_IO. If nothing ever tries to do
+I/O, we don't need to have it open.
+
+This changes the output of iotests case 061, which used 'qemu-img info'
+to show that opening an image with an invalid data file fails. After
+this patch, it succeeds. Replace this part of the test with a qemu-io
+call, but keep the final 'qemu-img info' to show that the invalid data
+file is correctly displayed in the output.
+
+Fixes: CVE-2024-4467
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+
+CVE: CVE-2024-4667
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/bd385a5298d7062668e804d73944d52aec9549f1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ block/qcow2.c              | 17 ++++++++++++++++-
+ tests/qemu-iotests/061     |  6 ++++--
+ tests/qemu-iotests/061.out |  8 ++++++--
+ 3 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/block/qcow2.c b/block/qcow2.c
+index 13e032bd5..7af7c0bee 100644
+--- a/block/qcow2.c
++++ b/block/qcow2.c
+@@ -1636,7 +1636,22 @@ qcow2_do_open(BlockDriverState *bs, QDict *options, int flags,
+         goto fail;
+     }
+
+-    if (open_data_file) {
++    if (open_data_file && (flags & BDRV_O_NO_IO)) {
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
++    } else if (open_data_file) {
+         /* Open external data file */
+         bdrv_graph_co_rdunlock();
+         s->data_file = bdrv_co_open_child(NULL, options, "data-file", bs,
+diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
+index 53c7d428e..b71ac097d 100755
+--- a/tests/qemu-iotests/061
++++ b/tests/qemu-iotests/061
+@@ -326,12 +326,14 @@ $QEMU_IMG amend -o "data_file=foo" "$TEST_IMG"
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
+index 139fc6817..24c33add7 100644
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
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
new file mode 100644
index 0000000000..686176189c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
@@ -0,0 +1,55 @@
+From 2eb42a728d27a43fdcad5f37d3f65706ce6deba5 Mon Sep 17 00:00:00 2001
+From: Kevin Wolf <kwolf@redhat.com>
+Date: Fri, 16 Aug 2024 09:35:24 +0000
+Subject: [PATCH] iotests/244: Don't store data-file with protocol in image
+
+We want to disable filename parsing for data files because it's too easy
+to abuse in malicious image files. Make the test ready for the change by
+passing the data file explicitly in command line options.
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+
+CVE: CVE-2024-4467
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/2eb42a728d27a43fdcad5f37d3f65706ce6deba5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tests/qemu-iotests/244 | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
+index 3e61fa25b..bb9cc6512 100755
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
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
new file mode 100644
index 0000000000..02611d6732
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
@@ -0,0 +1,57 @@
+From 7e1110664ecbc4826f3c978ccb06b6c1bce823e6 Mon Sep 17 00:00:00 2001
+From: Kevin Wolf <kwolf@redhat.com>
+Date: Fri, 16 Aug 2024 10:24:58 +0000
+Subject: [PATCH] iotests/270: Don't store data-file with json: prefix in image
+
+We want to disable filename parsing for data files because it's too easy
+to abuse in malicious image files. Make the test ready for the change by
+passing the data file explicitly in command line options.
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
+
+CVE: CVE-2024-4467
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7e1110664ecbc4826f3c978ccb06b6c1bce823e6]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tests/qemu-iotests/270 | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/tests/qemu-iotests/270 b/tests/qemu-iotests/270
+index 74352342d..c37b674aa 100755
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
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
new file mode 100644
index 0000000000..7568a453c4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
@@ -0,0 +1,1187 @@
+From 6bc30f19498547fac9cef98316a65cf6c1f14205 Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Tue, 5 Dec 2023 13:20:02 -0500
+Subject: [PATCH] graph-lock: remove AioContext locking
+
+Stop acquiring/releasing the AioContext lock in
+bdrv_graph_wrlock()/bdrv_graph_unlock() since the lock no longer has any
+effect.
+
+The distinction between bdrv_graph_wrunlock() and
+bdrv_graph_wrunlock_ctx() becomes meaningless and they can be collapsed
+into one function.
+
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Message-ID: <20231205182011.1976568-6-stefanha@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+CVE: CVE-2024-4467
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/6bc30f19498547fac9cef98316a65cf6c1f14205]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ block.c                            | 50 +++++++++++++++---------------
+ block/backup.c                     |  4 +--
+ block/blklogwrites.c               |  8 ++---
+ block/blkverify.c                  |  4 +--
+ block/block-backend.c              | 11 +++----
+ block/commit.c                     | 16 +++++-----
+ block/graph-lock.c                 | 44 ++------------------------
+ block/mirror.c                     | 22 ++++++-------
+ block/qcow2.c                      |  4 +--
+ block/quorum.c                     |  8 ++---
+ block/replication.c                | 14 ++++-----
+ block/snapshot.c                   |  4 +--
+ block/stream.c                     | 12 +++----
+ block/vmdk.c                       | 20 ++++++------
+ blockdev.c                         |  8 ++---
+ blockjob.c                         | 12 +++----
+ include/block/graph-lock.h         | 21 ++-----------
+ scripts/block-coroutine-wrapper.py |  4 +--
+ tests/unit/test-bdrv-drain.c       | 40 ++++++++++++------------
+ tests/unit/test-bdrv-graph-mod.c   | 20 ++++++------
+ 20 files changed, 133 insertions(+), 193 deletions(-)
+
+diff --git a/block.c b/block.c
+index bfb0861ec..25e1ebc60 100644
+--- a/block.c
++++ b/block.c
+@@ -1708,12 +1708,12 @@ bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
+ open_failed:
+     bs->drv = NULL;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     if (bs->file != NULL) {
+         bdrv_unref_child(bs, bs->file);
+         assert(!bs->file);
+     }
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     g_free(bs->opaque);
+     bs->opaque = NULL;
+@@ -3575,9 +3575,9 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+
+     bdrv_ref(drain_bs);
+     bdrv_drained_begin(drain_bs);
+-    bdrv_graph_wrlock(backing_hd);
++    bdrv_graph_wrlock();
+     ret = bdrv_set_backing_hd_drained(bs, backing_hd, errp);
+-    bdrv_graph_wrunlock(backing_hd);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(drain_bs);
+     bdrv_unref(drain_bs);
+
+@@ -3790,13 +3790,13 @@ BdrvChild *bdrv_open_child(const char *filename,
+         return NULL;
+     }
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     ctx = bdrv_get_aio_context(bs);
+     aio_context_acquire(ctx);
+     child = bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
+                               errp);
+     aio_context_release(ctx);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     return child;
+ }
+@@ -4650,9 +4650,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
+         aio_context_release(ctx);
+     }
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     tran_commit(tran);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
+         BlockDriverState *bs = bs_entry->state.bs;
+@@ -4669,9 +4669,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
+     goto cleanup;
+
+ abort:
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     tran_abort(tran);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+         if (bs_entry->prepared) {
+@@ -4852,12 +4852,12 @@ bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
+     }
+
+     bdrv_graph_rdunlock_main_loop();
+-    bdrv_graph_wrlock(new_child_bs);
++    bdrv_graph_wrlock();
+
+     ret = bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
+                                           tran, errp);
+
+-    bdrv_graph_wrunlock_ctx(ctx);
++    bdrv_graph_wrunlock();
+
+     if (old_ctx != ctx) {
+         aio_context_release(ctx);
+@@ -5209,14 +5209,14 @@ static void bdrv_close(BlockDriverState *bs)
+         bs->drv = NULL;
+     }
+
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+     QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
+         bdrv_unref_child(bs, child);
+     }
+
+     assert(!bs->backing);
+     assert(!bs->file);
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+
+     g_free(bs->opaque);
+     bs->opaque = NULL;
+@@ -5509,9 +5509,9 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
+     bdrv_graph_rdunlock_main_loop();
+
+     bdrv_drained_begin(child_bs);
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+     ret = bdrv_replace_node_common(bs, child_bs, true, true, errp);
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(child_bs);
+
+     return ret;
+@@ -5561,7 +5561,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+     aio_context_acquire(old_context);
+     new_context = NULL;
+
+-    bdrv_graph_wrlock(bs_top);
++    bdrv_graph_wrlock();
+
+     child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                      &child_of_bds, bdrv_backing_role(bs_new),
+@@ -5593,7 +5593,7 @@ out:
+     tran_finalize(tran, ret);
+
+     bdrv_refresh_limits(bs_top, NULL, NULL);
+-    bdrv_graph_wrunlock(bs_top);
++    bdrv_graph_wrunlock();
+
+     bdrv_drained_end(bs_top);
+     bdrv_drained_end(bs_new);
+@@ -5620,7 +5620,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+     bdrv_ref(old_bs);
+     bdrv_drained_begin(old_bs);
+     bdrv_drained_begin(new_bs);
+-    bdrv_graph_wrlock(new_bs);
++    bdrv_graph_wrlock();
+
+     bdrv_replace_child_tran(child, new_bs, tran);
+
+@@ -5631,7 +5631,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+
+     tran_finalize(tran, ret);
+
+-    bdrv_graph_wrunlock(new_bs);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(old_bs);
+     bdrv_drained_end(new_bs);
+     bdrv_unref(old_bs);
+@@ -5718,9 +5718,9 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
+     bdrv_ref(bs);
+     bdrv_drained_begin(bs);
+     bdrv_drained_begin(new_node_bs);
+-    bdrv_graph_wrlock(new_node_bs);
++    bdrv_graph_wrlock();
+     ret = bdrv_replace_node(bs, new_node_bs, errp);
+-    bdrv_graph_wrunlock(new_node_bs);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(new_node_bs);
+     bdrv_drained_end(bs);
+     bdrv_unref(bs);
+@@ -5975,7 +5975,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
+
+     bdrv_ref(top);
+     bdrv_drained_begin(base);
+-    bdrv_graph_wrlock(base);
++    bdrv_graph_wrlock();
+
+     if (!top->drv || !base->drv) {
+         goto exit_wrlock;
+@@ -6015,7 +6015,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
+      * That's a FIXME.
+      */
+     bdrv_replace_node_common(top, base, false, false, &local_err);
+-    bdrv_graph_wrunlock(base);
++    bdrv_graph_wrunlock();
+
+     if (local_err) {
+         error_report_err(local_err);
+@@ -6052,7 +6052,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
+     goto exit;
+
+ exit_wrlock:
+-    bdrv_graph_wrunlock(base);
++    bdrv_graph_wrunlock();
+ exit:
+     bdrv_drained_end(base);
+     bdrv_unref(top);
+diff --git a/block/backup.c b/block/backup.c
+index 8aae5836d..ec29d6b81 100644
+--- a/block/backup.c
++++ b/block/backup.c
+@@ -496,10 +496,10 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
+     block_copy_set_speed(bcs, speed);
+
+     /* Required permissions are taken by copy-before-write filter target */
+-    bdrv_graph_wrlock(target);
++    bdrv_graph_wrlock();
+     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
+                        &error_abort);
+-    bdrv_graph_wrunlock(target);
++    bdrv_graph_wrunlock();
+
+     return &job->common;
+
+diff --git a/block/blklogwrites.c b/block/blklogwrites.c
+index 84e03f309..ba717dab4 100644
+--- a/block/blklogwrites.c
++++ b/block/blklogwrites.c
+@@ -251,9 +251,9 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
+     ret = 0;
+ fail_log:
+     if (ret < 0) {
+-        bdrv_graph_wrlock(NULL);
++        bdrv_graph_wrlock();
+         bdrv_unref_child(bs, s->log_file);
+-        bdrv_graph_wrunlock(NULL);
++        bdrv_graph_wrunlock();
+         s->log_file = NULL;
+     }
+ fail:
+@@ -265,10 +265,10 @@ static void blk_log_writes_close(BlockDriverState *bs)
+ {
+     BDRVBlkLogWritesState *s = bs->opaque;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_unref_child(bs, s->log_file);
+     s->log_file = NULL;
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+ }
+
+ static int64_t coroutine_fn GRAPH_RDLOCK
+diff --git a/block/blkverify.c b/block/blkverify.c
+index 9b17c4664..ec45d8335 100644
+--- a/block/blkverify.c
++++ b/block/blkverify.c
+@@ -151,10 +151,10 @@ static void blkverify_close(BlockDriverState *bs)
+ {
+     BDRVBlkverifyState *s = bs->opaque;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_unref_child(bs, s->test_file);
+     s->test_file = NULL;
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+ }
+
+ static int64_t coroutine_fn GRAPH_RDLOCK
+diff --git a/block/block-backend.c b/block/block-backend.c
+index 86315d62c..a2348b31e 100644
+--- a/block/block-backend.c
++++ b/block/block-backend.c
+@@ -885,7 +885,6 @@ void blk_remove_bs(BlockBackend *blk)
+ {
+     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
+     BdrvChild *root;
+-    AioContext *ctx;
+
+     GLOBAL_STATE_CODE();
+
+@@ -915,10 +914,9 @@ void blk_remove_bs(BlockBackend *blk)
+     root = blk->root;
+     blk->root = NULL;
+
+-    ctx = bdrv_get_aio_context(root->bs);
+-    bdrv_graph_wrlock(root->bs);
++    bdrv_graph_wrlock();
+     bdrv_root_unref_child(root);
+-    bdrv_graph_wrunlock_ctx(ctx);
++    bdrv_graph_wrunlock();
+ }
+
+ /*
+@@ -929,16 +927,15 @@ void blk_remove_bs(BlockBackend *blk)
+ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
+ {
+     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
+-    AioContext *ctx = bdrv_get_aio_context(bs);
+
+     GLOBAL_STATE_CODE();
+     bdrv_ref(bs);
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
+                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                        blk->perm, blk->shared_perm,
+                                        blk, errp);
+-    bdrv_graph_wrunlock_ctx(ctx);
++    bdrv_graph_wrunlock();
+     if (blk->root == NULL) {
+         return -EPERM;
+     }
+diff --git a/block/commit.c b/block/commit.c
+index 69cc75be0..1dd7a65ff 100644
+--- a/block/commit.c
++++ b/block/commit.c
+@@ -100,9 +100,9 @@ static void commit_abort(Job *job)
+     bdrv_graph_rdunlock_main_loop();
+
+     bdrv_drained_begin(commit_top_backing_bs);
+-    bdrv_graph_wrlock(commit_top_backing_bs);
++    bdrv_graph_wrlock();
+     bdrv_replace_node(s->commit_top_bs, commit_top_backing_bs, &error_abort);
+-    bdrv_graph_wrunlock(commit_top_backing_bs);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(commit_top_backing_bs);
+
+     bdrv_unref(s->commit_top_bs);
+@@ -339,7 +339,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
+      * this is the responsibility of the interface (i.e. whoever calls
+      * commit_start()).
+      */
+-    bdrv_graph_wrlock(top);
++    bdrv_graph_wrlock();
+     s->base_overlay = bdrv_find_overlay(top, base);
+     assert(s->base_overlay);
+
+@@ -370,19 +370,19 @@ void commit_start(const char *job_id, BlockDriverState *bs,
+         ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
+                                  iter_shared_perms, errp);
+         if (ret < 0) {
+-            bdrv_graph_wrunlock(top);
++            bdrv_graph_wrunlock();
+             goto fail;
+         }
+     }
+
+     if (bdrv_freeze_backing_chain(commit_top_bs, base, errp) < 0) {
+-        bdrv_graph_wrunlock(top);
++        bdrv_graph_wrunlock();
+         goto fail;
+     }
+     s->chain_frozen = true;
+
+     ret = block_job_add_bdrv(&s->common, "base", base, 0, BLK_PERM_ALL, errp);
+-    bdrv_graph_wrunlock(top);
++    bdrv_graph_wrunlock();
+
+     if (ret < 0) {
+         goto fail;
+@@ -434,9 +434,9 @@ fail:
+      * otherwise this would fail because of lack of permissions. */
+     if (commit_top_bs) {
+         bdrv_drained_begin(top);
+-        bdrv_graph_wrlock(top);
++        bdrv_graph_wrlock();
+         bdrv_replace_node(commit_top_bs, top, &error_abort);
+-        bdrv_graph_wrunlock(top);
++        bdrv_graph_wrunlock();
+         bdrv_drained_end(top);
+     }
+ }
+diff --git a/block/graph-lock.c b/block/graph-lock.c
+index 079e878d9..c81162b14 100644
+--- a/block/graph-lock.c
++++ b/block/graph-lock.c
+@@ -106,27 +106,12 @@ static uint32_t reader_count(void)
+     return rd;
+ }
+
+-void no_coroutine_fn bdrv_graph_wrlock(BlockDriverState *bs)
++void no_coroutine_fn bdrv_graph_wrlock(void)
+ {
+-    AioContext *ctx = NULL;
+-
+     GLOBAL_STATE_CODE();
+     assert(!qatomic_read(&has_writer));
+     assert(!qemu_in_coroutine());
+
+-    /*
+-     * Release only non-mainloop AioContext. The mainloop often relies on the
+-     * BQL and doesn't lock the main AioContext before doing things.
+-     */
+-    if (bs) {
+-        ctx = bdrv_get_aio_context(bs);
+-        if (ctx != qemu_get_aio_context()) {
+-            aio_context_release(ctx);
+-        } else {
+-            ctx = NULL;
+-        }
+-    }
+-
+     /* Make sure that constantly arriving new I/O doesn't cause starvation */
+     bdrv_drain_all_begin_nopoll();
+
+@@ -155,27 +140,13 @@ void no_coroutine_fn bdrv_graph_wrlock(BlockDriverState *bs)
+     } while (reader_count() >= 1);
+
+     bdrv_drain_all_end();
+-
+-    if (ctx) {
+-        aio_context_acquire(bdrv_get_aio_context(bs));
+-    }
+ }
+
+-void no_coroutine_fn bdrv_graph_wrunlock_ctx(AioContext *ctx)
++void no_coroutine_fn bdrv_graph_wrunlock(void)
+ {
+     GLOBAL_STATE_CODE();
+     assert(qatomic_read(&has_writer));
+
+-    /*
+-     * Release only non-mainloop AioContext. The mainloop often relies on the
+-     * BQL and doesn't lock the main AioContext before doing things.
+-     */
+-    if (ctx && ctx != qemu_get_aio_context()) {
+-        aio_context_release(ctx);
+-    } else {
+-        ctx = NULL;
+-    }
+-
+     WITH_QEMU_LOCK_GUARD(&aio_context_list_lock) {
+         /*
+          * No need for memory barriers, this works in pair with
+@@ -197,17 +168,6 @@ void no_coroutine_fn bdrv_graph_wrunlock_ctx(AioContext *ctx)
+      * progress.
+      */
+     aio_bh_poll(qemu_get_aio_context());
+-
+-    if (ctx) {
+-        aio_context_acquire(ctx);
+-    }
+-}
+-
+-void no_coroutine_fn bdrv_graph_wrunlock(BlockDriverState *bs)
+-{
+-    AioContext *ctx = bs ? bdrv_get_aio_context(bs) : NULL;
+-
+-    bdrv_graph_wrunlock_ctx(ctx);
+ }
+
+ void coroutine_fn bdrv_graph_co_rdlock(void)
+diff --git a/block/mirror.c b/block/mirror.c
+index abbddb39e..f9db6f0f7 100644
+--- a/block/mirror.c
++++ b/block/mirror.c
+@@ -768,7 +768,7 @@ static int mirror_exit_common(Job *job)
+          * check for an op blocker on @to_replace, and we have our own
+          * there.
+          */
+-        bdrv_graph_wrlock(target_bs);
++        bdrv_graph_wrlock();
+         if (bdrv_recurse_can_replace(src, to_replace)) {
+             bdrv_replace_node(to_replace, target_bs, &local_err);
+         } else {
+@@ -777,7 +777,7 @@ static int mirror_exit_common(Job *job)
+                        "would not lead to an abrupt change of visible data",
+                        to_replace->node_name, target_bs->node_name);
+         }
+-        bdrv_graph_wrunlock(target_bs);
++        bdrv_graph_wrunlock();
+         bdrv_drained_end(to_replace);
+         if (local_err) {
+             error_report_err(local_err);
+@@ -800,9 +800,9 @@ static int mirror_exit_common(Job *job)
+      * valid.
+      */
+     block_job_remove_all_bdrv(bjob);
+-    bdrv_graph_wrlock(mirror_top_bs);
++    bdrv_graph_wrlock();
+     bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error_abort);
+-    bdrv_graph_wrunlock(mirror_top_bs);
++    bdrv_graph_wrunlock();
+
+     bdrv_drained_end(target_bs);
+     bdrv_unref(target_bs);
+@@ -1916,13 +1916,13 @@ static BlockJob *mirror_start_job(
+      */
+     bdrv_disable_dirty_bitmap(s->dirty_bitmap);
+
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+     ret = block_job_add_bdrv(&s->common, "source", bs, 0,
+                              BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRITE |
+                              BLK_PERM_CONSISTENT_READ,
+                              errp);
+     if (ret < 0) {
+-        bdrv_graph_wrunlock(bs);
++        bdrv_graph_wrunlock();
+         goto fail;
+     }
+
+@@ -1967,17 +1967,17 @@ static BlockJob *mirror_start_job(
+             ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
+                                      iter_shared_perms, errp);
+             if (ret < 0) {
+-                bdrv_graph_wrunlock(bs);
++                bdrv_graph_wrunlock();
+                 goto fail;
+             }
+         }
+
+         if (bdrv_freeze_backing_chain(mirror_top_bs, target, errp) < 0) {
+-            bdrv_graph_wrunlock(bs);
++            bdrv_graph_wrunlock();
+             goto fail;
+         }
+     }
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+
+     QTAILQ_INIT(&s->ops_in_flight);
+
+@@ -2003,12 +2003,12 @@ fail:
+
+     bs_opaque->stop = true;
+     bdrv_drained_begin(bs);
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+     assert(mirror_top_bs->backing->bs == bs);
+     bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
+                              &error_abort);
+     bdrv_replace_node(mirror_top_bs, bs, &error_abort);
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(bs);
+
+     bdrv_unref(mirror_top_bs);
+diff --git a/block/qcow2.c b/block/qcow2.c
+index 7af7c0bee..77dd49d4f 100644
+--- a/block/qcow2.c
++++ b/block/qcow2.c
+@@ -2822,9 +2822,9 @@ qcow2_do_close(BlockDriverState *bs, bool close_data_file)
+     if (close_data_file && has_data_file(bs)) {
+         GLOBAL_STATE_CODE();
+         bdrv_graph_rdunlock_main_loop();
+-        bdrv_graph_wrlock(NULL);
++        bdrv_graph_wrlock();
+         bdrv_unref_child(bs, s->data_file);
+-        bdrv_graph_wrunlock(NULL);
++        bdrv_graph_wrunlock();
+         s->data_file = NULL;
+         bdrv_graph_rdlock_main_loop();
+     }
+diff --git a/block/quorum.c b/block/quorum.c
+index 505b8b3e1..db8fe891c 100644
+--- a/block/quorum.c
++++ b/block/quorum.c
+@@ -1037,14 +1037,14 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
+
+ close_exit:
+     /* cleanup on error */
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     for (i = 0; i < s->num_children; i++) {
+         if (!opened[i]) {
+             continue;
+         }
+         bdrv_unref_child(bs, s->children[i]);
+     }
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+     g_free(s->children);
+     g_free(opened);
+ exit:
+@@ -1057,11 +1057,11 @@ static void quorum_close(BlockDriverState *bs)
+     BDRVQuorumState *s = bs->opaque;
+     int i;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     for (i = 0; i < s->num_children; i++) {
+         bdrv_unref_child(bs, s->children[i]);
+     }
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     g_free(s->children);
+ }
+diff --git a/block/replication.c b/block/replication.c
+index 5ded5f1ca..424b537ff 100644
+--- a/block/replication.c
++++ b/block/replication.c
+@@ -560,7 +560,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
+             return;
+         }
+
+-        bdrv_graph_wrlock(bs);
++        bdrv_graph_wrlock();
+
+         bdrv_ref(hidden_disk->bs);
+         s->hidden_disk = bdrv_attach_child(bs, hidden_disk->bs, "hidden disk",
+@@ -568,7 +568,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
+                                            &local_err);
+         if (local_err) {
+             error_propagate(errp, local_err);
+-            bdrv_graph_wrunlock(bs);
++            bdrv_graph_wrunlock();
+             aio_context_release(aio_context);
+             return;
+         }
+@@ -579,7 +579,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
+                                               BDRV_CHILD_DATA, &local_err);
+         if (local_err) {
+             error_propagate(errp, local_err);
+-            bdrv_graph_wrunlock(bs);
++            bdrv_graph_wrunlock();
+             aio_context_release(aio_context);
+             return;
+         }
+@@ -592,7 +592,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
+         if (!top_bs || !bdrv_is_root_node(top_bs) ||
+             !check_top_bs(top_bs, bs)) {
+             error_setg(errp, "No top_bs or it is invalid");
+-            bdrv_graph_wrunlock(bs);
++            bdrv_graph_wrunlock();
+             reopen_backing_file(bs, false, NULL);
+             aio_context_release(aio_context);
+             return;
+@@ -600,7 +600,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
+         bdrv_op_block_all(top_bs, s->blocker);
+         bdrv_op_unblock(top_bs, BLOCK_OP_TYPE_DATAPLANE, s->blocker);
+
+-        bdrv_graph_wrunlock(bs);
++        bdrv_graph_wrunlock();
+
+         s->backup_job = backup_job_create(
+                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
+@@ -691,12 +691,12 @@ static void replication_done(void *opaque, int ret)
+     if (ret == 0) {
+         s->stage = BLOCK_REPLICATION_DONE;
+
+-        bdrv_graph_wrlock(NULL);
++        bdrv_graph_wrlock();
+         bdrv_unref_child(bs, s->secondary_disk);
+         s->secondary_disk = NULL;
+         bdrv_unref_child(bs, s->hidden_disk);
+         s->hidden_disk = NULL;
+-        bdrv_graph_wrunlock(NULL);
++        bdrv_graph_wrunlock();
+
+         s->error = 0;
+     } else {
+diff --git a/block/snapshot.c b/block/snapshot.c
+index c4d40e80d..6fd720aef 100644
+--- a/block/snapshot.c
++++ b/block/snapshot.c
+@@ -292,9 +292,9 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
+         }
+
+         /* .bdrv_open() will re-attach it */
+-        bdrv_graph_wrlock(NULL);
++        bdrv_graph_wrlock();
+         bdrv_unref_child(bs, fallback);
+-        bdrv_graph_wrunlock(NULL);
++        bdrv_graph_wrunlock();
+
+         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
+         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
+diff --git a/block/stream.c b/block/stream.c
+index 01fe7c0f1..048c2d282 100644
+--- a/block/stream.c
++++ b/block/stream.c
+@@ -99,9 +99,9 @@ static int stream_prepare(Job *job)
+             }
+         }
+
+-        bdrv_graph_wrlock(s->target_bs);
++        bdrv_graph_wrlock();
+         bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
+-        bdrv_graph_wrunlock(s->target_bs);
++        bdrv_graph_wrunlock();
+
+         /*
+          * This call will do I/O, so the graph can change again from here on.
+@@ -366,10 +366,10 @@ void stream_start(const char *job_id, BlockDriverState *bs,
+      * already have our own plans. Also don't allow resize as the image size is
+      * queried only at the job start and then cached.
+      */
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+     if (block_job_add_bdrv(&s->common, "active node", bs, 0,
+                            basic_flags | BLK_PERM_WRITE, errp)) {
+-        bdrv_graph_wrunlock(bs);
++        bdrv_graph_wrunlock();
+         goto fail;
+     }
+
+@@ -389,11 +389,11 @@ void stream_start(const char *job_id, BlockDriverState *bs,
+         ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
+                                  basic_flags, errp);
+         if (ret < 0) {
+-            bdrv_graph_wrunlock(bs);
++            bdrv_graph_wrunlock();
+             goto fail;
+         }
+     }
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+
+     s->base_overlay = base_overlay;
+     s->above_base = above_base;
+diff --git a/block/vmdk.c b/block/vmdk.c
+index d6971c706..bf78e1238 100644
+--- a/block/vmdk.c
++++ b/block/vmdk.c
+@@ -272,7 +272,7 @@ static void vmdk_free_extents(BlockDriverState *bs)
+     BDRVVmdkState *s = bs->opaque;
+     VmdkExtent *e;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     for (i = 0; i < s->num_extents; i++) {
+         e = &s->extents[i];
+         g_free(e->l1_table);
+@@ -283,7 +283,7 @@ static void vmdk_free_extents(BlockDriverState *bs)
+             bdrv_unref_child(bs, e->file);
+         }
+     }
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     g_free(s->extents);
+ }
+@@ -1247,9 +1247,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
+                             0, 0, 0, 0, 0, &extent, errp);
+             if (ret < 0) {
+                 bdrv_graph_rdunlock_main_loop();
+-                bdrv_graph_wrlock(NULL);
++                bdrv_graph_wrlock();
+                 bdrv_unref_child(bs, extent_file);
+-                bdrv_graph_wrunlock(NULL);
++                bdrv_graph_wrunlock();
+                 bdrv_graph_rdlock_main_loop();
+                 goto out;
+             }
+@@ -1266,9 +1266,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
+             g_free(buf);
+             if (ret) {
+                 bdrv_graph_rdunlock_main_loop();
+-                bdrv_graph_wrlock(NULL);
++                bdrv_graph_wrlock();
+                 bdrv_unref_child(bs, extent_file);
+-                bdrv_graph_wrunlock(NULL);
++                bdrv_graph_wrunlock();
+                 bdrv_graph_rdlock_main_loop();
+                 goto out;
+             }
+@@ -1277,9 +1277,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
+             ret = vmdk_open_se_sparse(bs, extent_file, bs->open_flags, errp);
+             if (ret) {
+                 bdrv_graph_rdunlock_main_loop();
+-                bdrv_graph_wrlock(NULL);
++                bdrv_graph_wrlock();
+                 bdrv_unref_child(bs, extent_file);
+-                bdrv_graph_wrunlock(NULL);
++                bdrv_graph_wrunlock();
+                 bdrv_graph_rdlock_main_loop();
+                 goto out;
+             }
+@@ -1287,9 +1287,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
+         } else {
+             error_setg(errp, "Unsupported extent type '%s'", type);
+             bdrv_graph_rdunlock_main_loop();
+-            bdrv_graph_wrlock(NULL);
++            bdrv_graph_wrlock();
+             bdrv_unref_child(bs, extent_file);
+-            bdrv_graph_wrunlock(NULL);
++            bdrv_graph_wrunlock();
+             bdrv_graph_rdlock_main_loop();
+             ret = -ENOTSUP;
+             goto out;
+diff --git a/blockdev.c b/blockdev.c
+index c91f49e7b..9e1381169 100644
+--- a/blockdev.c
++++ b/blockdev.c
+@@ -1611,9 +1611,9 @@ static void external_snapshot_abort(void *opaque)
+             }
+
+             bdrv_drained_begin(state->new_bs);
+-            bdrv_graph_wrlock(state->old_bs);
++            bdrv_graph_wrlock();
+             bdrv_replace_node(state->new_bs, state->old_bs, &error_abort);
+-            bdrv_graph_wrunlock(state->old_bs);
++            bdrv_graph_wrunlock();
+             bdrv_drained_end(state->new_bs);
+
+             bdrv_unref(state->old_bs); /* bdrv_replace_node() ref'ed old_bs */
+@@ -3657,7 +3657,7 @@ void qmp_x_blockdev_change(const char *parent, const char *child,
+     BlockDriverState *parent_bs, *new_bs = NULL;
+     BdrvChild *p_child;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+
+     parent_bs = bdrv_lookup_bs(parent, parent, errp);
+     if (!parent_bs) {
+@@ -3693,7 +3693,7 @@ void qmp_x_blockdev_change(const char *parent, const char *child,
+     }
+
+ out:
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+ }
+
+ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
+diff --git a/blockjob.c b/blockjob.c
+index b7a29052b..731041231 100644
+--- a/blockjob.c
++++ b/blockjob.c
+@@ -199,7 +199,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
+      * to process an already freed BdrvChild.
+      */
+     aio_context_release(job->job.aio_context);
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     aio_context_acquire(job->job.aio_context);
+     while (job->nodes) {
+         GSList *l = job->nodes;
+@@ -212,7 +212,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
+
+         g_slist_free_1(l);
+     }
+-    bdrv_graph_wrunlock_ctx(job->job.aio_context);
++    bdrv_graph_wrunlock();
+ }
+
+ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
+@@ -514,7 +514,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
+     int ret;
+     GLOBAL_STATE_CODE();
+
+-    bdrv_graph_wrlock(bs);
++    bdrv_graph_wrlock();
+
+     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
+         job_id = bdrv_get_device_name(bs);
+@@ -523,7 +523,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
+     job = job_create(job_id, &driver->job_driver, txn, bdrv_get_aio_context(bs),
+                      flags, cb, opaque, errp);
+     if (job == NULL) {
+-        bdrv_graph_wrunlock(bs);
++        bdrv_graph_wrunlock();
+         return NULL;
+     }
+
+@@ -563,11 +563,11 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
+         goto fail;
+     }
+
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+     return job;
+
+ fail:
+-    bdrv_graph_wrunlock(bs);
++    bdrv_graph_wrunlock();
+     job_early_fail(&job->job);
+     return NULL;
+ }
+diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
+index 22b5db1ed..d7545e82d 100644
+--- a/include/block/graph-lock.h
++++ b/include/block/graph-lock.h
+@@ -110,34 +110,17 @@ void unregister_aiocontext(AioContext *ctx);
+  *
+  * The wrlock can only be taken from the main loop, with BQL held, as only the
+  * main loop is allowed to modify the graph.
+- *
+- * If @bs is non-NULL, its AioContext is temporarily released.
+- *
+- * This function polls. Callers must not hold the lock of any AioContext other
+- * than the current one and the one of @bs.
+  */
+ void no_coroutine_fn TSA_ACQUIRE(graph_lock) TSA_NO_TSA
+-bdrv_graph_wrlock(BlockDriverState *bs);
++bdrv_graph_wrlock(void);
+
+ /*
+  * bdrv_graph_wrunlock:
+  * Write finished, reset global has_writer to 0 and restart
+  * all readers that are waiting.
+- *
+- * If @bs is non-NULL, its AioContext is temporarily released.
+- */
+-void no_coroutine_fn TSA_RELEASE(graph_lock) TSA_NO_TSA
+-bdrv_graph_wrunlock(BlockDriverState *bs);
+-
+-/*
+- * bdrv_graph_wrunlock_ctx:
+- * Write finished, reset global has_writer to 0 and restart
+- * all readers that are waiting.
+- *
+- * If @ctx is non-NULL, its lock is temporarily released.
+  */
+ void no_coroutine_fn TSA_RELEASE(graph_lock) TSA_NO_TSA
+-bdrv_graph_wrunlock_ctx(AioContext *ctx);
++bdrv_graph_wrunlock(void);
+
+ /*
+  * bdrv_graph_co_rdlock:
+diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
+index a38e5833f..38364fa55 100644
+--- a/scripts/block-coroutine-wrapper.py
++++ b/scripts/block-coroutine-wrapper.py
+@@ -261,8 +261,8 @@ def gen_no_co_wrapper(func: FuncDecl) -> str:
+         graph_lock='    bdrv_graph_rdlock_main_loop();'
+         graph_unlock='    bdrv_graph_rdunlock_main_loop();'
+     elif func.graph_wrlock:
+-        graph_lock='    bdrv_graph_wrlock(NULL);'
+-        graph_unlock='    bdrv_graph_wrunlock(NULL);'
++        graph_lock='    bdrv_graph_wrlock();'
++        graph_unlock='    bdrv_graph_wrunlock();'
+
+     return f"""\
+ /*
+diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
+index 704d1a3f3..d9754dfeb 100644
+--- a/tests/unit/test-bdrv-drain.c
++++ b/tests/unit/test-bdrv-drain.c
+@@ -807,9 +807,9 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
+     tjob->bs = src;
+     job = &tjob->common;
+
+-    bdrv_graph_wrlock(target);
++    bdrv_graph_wrlock();
+     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
+-    bdrv_graph_wrunlock(target);
++    bdrv_graph_wrunlock();
+
+     switch (result) {
+     case TEST_JOB_SUCCESS:
+@@ -991,11 +991,11 @@ static void bdrv_test_top_close(BlockDriverState *bs)
+ {
+     BdrvChild *c, *next_c;
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     QLIST_FOREACH_SAFE(c, &bs->children, next, next_c) {
+         bdrv_unref_child(bs, c);
+     }
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+ }
+
+ static int coroutine_fn GRAPH_RDLOCK
+@@ -1085,10 +1085,10 @@ static void do_test_delete_by_drain(bool detach_instead_of_delete,
+
+     null_bs = bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_PROTOCOL,
+                         &error_abort);
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds,
+                       BDRV_CHILD_DATA, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     /* This child will be the one to pass to requests through to, and
+      * it will stall until a drain occurs */
+@@ -1096,21 +1096,21 @@ static void do_test_delete_by_drain(bool detach_instead_of_delete,
+                                     &error_abort);
+     child_bs->total_sectors = 65536 >> BDRV_SECTOR_BITS;
+     /* Takes our reference to child_bs */
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     tts->wait_child = bdrv_attach_child(bs, child_bs, "wait-child",
+                                         &child_of_bds,
+                                         BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                                         &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     /* This child is just there to be deleted
+      * (for detach_instead_of_delete == true) */
+     null_bs = bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_PROTOCOL,
+                         &error_abort);
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds, BDRV_CHILD_DATA,
+                       &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+     blk_insert_bs(blk, bs, &error_abort);
+@@ -1193,14 +1193,14 @@ static void no_coroutine_fn detach_indirect_bh(void *opaque)
+
+     bdrv_dec_in_flight(data->child_b->bs);
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_unref_child(data->parent_b, data->child_b);
+
+     bdrv_ref(data->c);
+     data->child_c = bdrv_attach_child(data->parent_b, data->c, "PB-C",
+                                       &child_of_bds, BDRV_CHILD_DATA,
+                                       &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+ }
+
+ static void coroutine_mixed_fn detach_by_parent_aio_cb(void *opaque, int ret)
+@@ -1298,7 +1298,7 @@ static void TSA_NO_TSA test_detach_indirect(bool by_parent_cb)
+     /* Set child relationships */
+     bdrv_ref(b);
+     bdrv_ref(a);
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     child_b = bdrv_attach_child(parent_b, b, "PB-B", &child_of_bds,
+                                 BDRV_CHILD_DATA, &error_abort);
+     child_a = bdrv_attach_child(parent_b, a, "PB-A", &child_of_bds,
+@@ -1308,7 +1308,7 @@ static void TSA_NO_TSA test_detach_indirect(bool by_parent_cb)
+     bdrv_attach_child(parent_a, a, "PA-A",
+                       by_parent_cb ? &child_of_bds : &detach_by_driver_cb_class,
+                       BDRV_CHILD_DATA, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     g_assert_cmpint(parent_a->refcnt, ==, 1);
+     g_assert_cmpint(parent_b->refcnt, ==, 1);
+@@ -1727,7 +1727,7 @@ static void test_drop_intermediate_poll(void)
+      * Establish the chain last, so the chain links are the first
+      * elements in the BDS.parents lists
+      */
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     for (i = 0; i < 3; i++) {
+         if (i) {
+             /* Takes the reference to chain[i - 1] */
+@@ -1735,7 +1735,7 @@ static void test_drop_intermediate_poll(void)
+                               &chain_child_class, BDRV_CHILD_COW, &error_abort);
+         }
+     }
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     job = block_job_create("job", &test_simple_job_driver, NULL, job_node,
+                            0, BLK_PERM_ALL, 0, 0, NULL, NULL, &error_abort);
+@@ -1982,10 +1982,10 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
+     new_child_bs->total_sectors = 1;
+
+     bdrv_ref(old_child_bs);
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
+                       BDRV_CHILD_COW, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+     parent_s->setup_completed = true;
+
+     for (i = 0; i < old_drain_count; i++) {
+@@ -2016,9 +2016,9 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
+     g_assert(parent_bs->quiesce_counter == old_drain_count);
+     bdrv_drained_begin(old_child_bs);
+     bdrv_drained_begin(new_child_bs);
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_replace_node(old_child_bs, new_child_bs, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+     bdrv_drained_end(new_child_bs);
+     bdrv_drained_end(old_child_bs);
+     g_assert(parent_bs->quiesce_counter == new_drain_count);
+diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
+index 074adcbb9..8ee6ef38d 100644
+--- a/tests/unit/test-bdrv-graph-mod.c
++++ b/tests/unit/test-bdrv-graph-mod.c
+@@ -137,10 +137,10 @@ static void test_update_perm_tree(void)
+
+     blk_insert_bs(root, bs, &error_abort);
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(filter, bs, "child", &child_of_bds,
+                       BDRV_CHILD_DATA, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     aio_context_acquire(qemu_get_aio_context());
+     ret = bdrv_append(filter, bs, NULL);
+@@ -206,11 +206,11 @@ static void test_should_update_child(void)
+
+     bdrv_set_backing_hd(target, bs, &error_abort);
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     g_assert(target->backing->bs == bs);
+     bdrv_attach_child(filter, target, "target", &child_of_bds,
+                       BDRV_CHILD_DATA, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+     aio_context_acquire(qemu_get_aio_context());
+     bdrv_append(filter, bs, &error_abort);
+     aio_context_release(qemu_get_aio_context());
+@@ -248,7 +248,7 @@ static void test_parallel_exclusive_write(void)
+     bdrv_ref(base);
+     bdrv_ref(fl1);
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(top, fl1, "backing", &child_of_bds,
+                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                       &error_abort);
+@@ -260,7 +260,7 @@ static void test_parallel_exclusive_write(void)
+                       &error_abort);
+
+     bdrv_replace_node(fl1, fl2, &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     bdrv_drained_end(fl2);
+     bdrv_drained_end(fl1);
+@@ -367,7 +367,7 @@ static void test_parallel_perm_update(void)
+      */
+     bdrv_ref(base);
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(top, ws, "file", &child_of_bds, BDRV_CHILD_DATA,
+                       &error_abort);
+     c_fl1 = bdrv_attach_child(ws, fl1, "first", &child_of_bds,
+@@ -380,7 +380,7 @@ static void test_parallel_perm_update(void)
+     bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                       &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     /* Select fl1 as first child to be active */
+     s->selected = c_fl1;
+@@ -434,11 +434,11 @@ static void test_append_greedy_filter(void)
+     BlockDriverState *base = no_perm_node("base");
+     BlockDriverState *fl = exclusive_writer_node("fl1");
+
+-    bdrv_graph_wrlock(NULL);
++    bdrv_graph_wrlock();
+     bdrv_attach_child(top, base, "backing", &child_of_bds,
+                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                       &error_abort);
+-    bdrv_graph_wrunlock(NULL);
++    bdrv_graph_wrunlock();
+
+     aio_context_acquire(qemu_get_aio_context());
+     bdrv_append(fl, base, &error_abort);
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
new file mode 100644
index 0000000000..bcdd0fbed8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
@@ -0,0 +1,239 @@
+From 7ead946998610657d38d1a505d5f25300d4ca613 Mon Sep 17 00:00:00 2001
+From: Kevin Wolf <kwolf@redhat.com>
+Date: Thu, 25 Apr 2024 14:56:02 +0000
+Subject: [PATCH] block: Parse filenames only when explicitly requested
+
+When handling image filenames from legacy options such as -drive or from
+tools, these filenames are parsed for protocol prefixes, including for
+the json:{} pseudo-protocol.
+
+This behaviour is intended for filenames that come directly from the
+command line and for backing files, which may come from the image file
+itself. Higher level management tools generally take care to verify that
+untrusted images don't contain a bad (or any) backing file reference;
+'qemu-img info' is a suitable tool for this.
+
+However, for other files that can be referenced in images, such as
+qcow2 data files or VMDK extents, the string from the image file is
+usually not verified by management tools - and 'qemu-img info' wouldn't
+be suitable because in contrast to backing files, it already opens these
+other referenced files. So here the string should be interpreted as a
+literal local filename. More complex configurations need to be specified
+explicitly on the command line or in QMP...
+
+CVE: CVE-2024-4467
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7ead946998610657d38d1a505d5f25300d4ca613]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ block.c | 94 ++++++++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 57 insertions(+), 37 deletions(-)
+
+diff --git a/block.c b/block.c
+index 25e1ebc60..f3cb32cd7 100644
+--- a/block.c
++++ b/block.c
+@@ -86,6 +86,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
+                                            BlockDriverState *parent,
+                                            const BdrvChildClass *child_class,
+                                            BdrvChildRole child_role,
++                                           bool parse_filename,
+                                            Error **errp);
+
+ static bool bdrv_recurse_has_child(BlockDriverState *bs,
+@@ -2047,7 +2048,8 @@ static void parse_json_protocol(QDict *options, const char **pfilename,
+  * block driver has been specified explicitly.
+  */
+ static int bdrv_fill_options(QDict **options, const char *filename,
+-                             int *flags, Error **errp)
++                             int *flags, bool allow_parse_filename,
++                             Error **errp)
+ {
+     const char *drvname;
+     bool protocol = *flags & BDRV_O_PROTOCOL;
+@@ -2089,7 +2091,7 @@ static int bdrv_fill_options(QDict **options, const char *filename,
+     if (protocol && filename) {
+         if (!qdict_haskey(*options, "filename")) {
+             qdict_put_str(*options, "filename", filename);
+-            parse_filename = true;
++            parse_filename = allow_parse_filename;
+         } else {
+             error_setg(errp, "Can't specify 'file' and 'filename' options at "
+                              "the same time");
+@@ -3675,7 +3677,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
+     }
+
+     backing_hd = bdrv_open_inherit(backing_filename, reference, options, 0, bs,
+-                                   &child_of_bds, bdrv_backing_role(bs), errp);
++                                   &child_of_bds, bdrv_backing_role(bs), true,
++                                   errp);
+     if (!backing_hd) {
+         bs->open_flags |= BDRV_O_NO_BACKING;
+         error_prepend(errp, "Could not open backing file: ");
+@@ -3712,7 +3715,8 @@ free_exit:
+ static BlockDriverState *
+ bdrv_open_child_bs(const char *filename, QDict *options, const char *bdref_key,
+                    BlockDriverState *parent, const BdrvChildClass *child_class,
+-                   BdrvChildRole child_role, bool allow_none, Error **errp)
++                   BdrvChildRole child_role, bool allow_none,
++                   bool parse_filename, Error **errp)
+ {
+     BlockDriverState *bs = NULL;
+     QDict *image_options;
+@@ -3743,7 +3747,8 @@ bdrv_open_child_bs(const char *filename, QDict *options, const char *bdref_key,
+     }
+
+     bs = bdrv_open_inherit(filename, reference, image_options, 0,
+-                           parent, child_class, child_role, errp);
++                           parent, child_class, child_role, parse_filename,
++                           errp);
+     if (!bs) {
+         goto done;
+     }
+@@ -3753,6 +3758,33 @@ done:
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
++    GLOBAL_STATE_CODE();
++
++    bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
++                            child_role, allow_none, parse_filename, errp);
++    if (bs == NULL) {
++        return NULL;
++    }
++
++    bdrv_graph_wrlock();
++    child = bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
++                              errp);
++    bdrv_graph_wrunlock();
++
++    return child;
++}
++
+ /*
+  * Opens a disk image whose options are given as BlockdevRef in another block
+  * device's options.
+@@ -3778,31 +3810,15 @@ BdrvChild *bdrv_open_child(const char *filename,
+                            BdrvChildRole child_role,
+                            bool allow_none, Error **errp)
+ {
+-    BlockDriverState *bs;
+-    BdrvChild *child;
+-    AioContext *ctx;
+-
+-    GLOBAL_STATE_CODE();
+-
+-    bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
+-                            child_role, allow_none, errp);
+-    if (bs == NULL) {
+-        return NULL;
+-    }
+-
+-    bdrv_graph_wrlock();
+-    ctx = bdrv_get_aio_context(bs);
+-    aio_context_acquire(ctx);
+-    child = bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
+-                              errp);
+-    aio_context_release(ctx);
+-    bdrv_graph_wrunlock();
+-
+-    return child;
++   return bdrv_open_child_common(filename, options, bdref_key, parent,
++                                  child_class, child_role, allow_none, false,
++                                  errp);
+ }
+
+ /*
+- * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
++ * This does mostly the same as bdrv_open_child(), but for opening the primary
++ * child of a node. A notable difference from bdrv_open_child() is that it
++ * enables filename parsing for protocol names (including json:).
+  *
+  * The caller must hold the lock of the main AioContext and no other AioContext.
+  * @parent can move to a different AioContext in this function. Callers must
+@@ -3819,8 +3835,8 @@ int bdrv_open_file_child(const char *filename,
+     role = parent->drv->is_filter ?
+         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
+
+-    if (!bdrv_open_child(filename, options, bdref_key, parent,
+-                         &child_of_bds, role, false, errp))
++    if (!bdrv_open_child_common(filename, options, bdref_key, parent,
++                                &child_of_bds, role, false, true, errp))
+     {
+         return -EINVAL;
+     }
+@@ -3865,7 +3881,8 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp)
+
+     }
+
+-    bs = bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, errp);
++    bs = bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, false,
++                           errp);
+     obj = NULL;
+     qobject_unref(obj);
+     visit_free(v);
+@@ -3962,7 +3979,7 @@ static BlockDriverState * no_coroutine_fn
+ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
+                   int flags, BlockDriverState *parent,
+                   const BdrvChildClass *child_class, BdrvChildRole child_role,
+-                  Error **errp)
++                  bool parse_filename, Error **errp)
+ {
+     int ret;
+     BlockBackend *file = NULL;
+@@ -4011,9 +4028,11 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
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
+@@ -4038,7 +4057,8 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
+                                      parent->open_flags, parent->options);
+     }
+
+-    ret = bdrv_fill_options(&options, filename, &flags, &local_err);
++    ret = bdrv_fill_options(&options, filename, &flags, parse_filename,
++                            &local_err);
+     if (ret < 0) {
+         goto fail;
+     }
+@@ -4107,7 +4127,7 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
+
+         file_bs = bdrv_open_child_bs(filename, options, "file", bs,
+                                      &child_of_bds, BDRV_CHILD_IMAGE,
+-                                     true, &local_err);
++                                     true, true, &local_err);
+         if (local_err) {
+             goto fail;
+         }
+@@ -4270,7 +4290,7 @@ BlockDriverState *bdrv_open(const char *filename, const char *reference,
+     GLOBAL_STATE_CODE();
+
+     return bdrv_open_inherit(filename, reference, options, flags, NULL,
+-                             NULL, 0, errp);
++                             NULL, 0, true, errp);
+ }
+
+ /* Return true if the NULL-terminated @list contains @str */
+--
+2.40.0
-- 
2.40.0


