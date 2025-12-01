Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50FFCFD376
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 02:33:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11413.1764556431015445797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 18:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rNp52rK0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B11MquN827287
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Nov 2025 18:33:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Y0Z4DPh+rp0Pb0DX5y97Ay54LOhqLjk4S3VxpIuXUjY=; b=rNp52rK0yqQz
	jjl0dFWqKu6nTN+nQ4UG7wiPT98kkkaQyQP09/q2RF6DgnXNLUCwMyDUkM1SIJiG
	nv9WdMaumaAwsrgpr85TSXwOgQyMCDpIXMJU9nTRUqMOGGGCKM+DM1MqRgIppvtp
	dYz18Oktx0086tEHBe6V4GO5m8Tlf83AanD4RQYCon6wVGyi78BOSFa5oyc3TWaS
	lMeQtsZG+VblKtu0OCwXuAEVkRlTCx9reX30Y44xZUocYm6EiKzl7vg0CuAYlPdT
	iiIfneOx6mLxsFX0iwYeslFkm54dClocRZzWJeiClDrWaVrHXoU09y3VL40yR6G7
	iusbIRhZKQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05h34e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Nov 2025 18:33:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 18:33:49 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 18:33:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
Date: Sun, 30 Nov 2025 18:33:49 -0800
Message-ID: <73248f263051ab1192ad64a26f40d2d1730f37cc.1764513013.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1764513013.git.liezhi.yang@windriver.com>
References: <cover.1764513013.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -ueSyrJ3YfreDBaZw3u0D_VgGCSf1_CV
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692cfe8e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=ItjLbzZfIdWzv1OQp6MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -ueSyrJ3YfreDBaZw3u0D_VgGCSf1_CV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDAxOSBTYWx0ZWRfX/OwgZ/wFyMqI
 Ld6Wvn5S1AKK/ZoErvm5sv1nCf1LOshruPG/rjSo+K+ZdM4HYFwwFO751heqhZlnEOSXT1CnTqZ
 g7fWdb9jumGwaKnbYsaN3POywV8/30qKMrZ8wlNawMXvgA2bKEFH6AZgTBRH0aFvryizbWypXQG
 1vOvnVL8dydcOocFKEUulaji6uxePitzUIC3K0OuZxEu8KIUMqGaxy1tyj8Ki6ZFnvT4SbfoD+m
 30o0fx1nn8I7z1xn+vy9qcaeLXwdRYHB7hG2X/+AWvaMuwLtOqswjjGirKRny/Kjz1FSL2bvD6k
 vVDkWtM1+xWwY9vx4UzClYeU073xWwJ/R9Zvp4dAGuXXBAovOwtwljYJcXRFDkJuI0Ju18FFvZN
 QiyNek4SB36dkCYvrh73aoTXkm9UMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226953

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
__populate_fs: Ext2 file too big while writing file "largefile"
mke2fs: Ext2 file too big while populating file system

This was because the offset is overflow, use __u64 to fix the problem.

Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
the metadata, so it should be enough large for it, just leave it there.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.3.bb             |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
new file mode 100644
index 0000000000..1c578022fb
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
@@ -0,0 +1,40 @@
+From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 30 Nov 2025 21:47:50 +0800
+Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
+
+Fixed:
+$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
+$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
+$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
+__populate_fs: Ext2 file too big while writing file "largefile"
+mke2fs: Ext2 file too big while populating file system
+
+This was because the offset is overflow, use __u64 to fix the problem.
+
+Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
+the metadata, so it should be enough large for it, just leave it there.
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/create_inode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 624efc03..14273534 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
+ }
+ #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
+ 
+-static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const char *buf, unsigned int n_bytes) {
++static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *buf, unsigned int n_bytes) {
+ 	errcode_t err = ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
+ 	if (err)
+ 		return err;
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
index 9b5c4dfde5..40658399d9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.49.0


