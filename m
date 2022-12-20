Return-Path: <manojsingh.saun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599C4C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 06:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44521.1671517801389017963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 22:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XymNpl+3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9353455008=manojsingh.saun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK5xMXQ011674
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 22:30:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Wpu3Pv6V9EgXMfg48OsqsLRUbq26m9f6eYHalJ8RzAc=;
 b=XymNpl+3GUzVeQCXdJ+qS7GDoJvO2hHublHe3kh8HxPfZ6zsrR0mJAkpMe34agrl0efj
 hbXq8ziK61q698S6KB95tpgjcqsxssGEqpGxBQJfLnYHrkJfxdU+YUr23MvMVy3HQzdi
 J7mk2c3hiQHkrZH/Z2uZD7zukr/wBX54Tl9t/AE/PO5fW+/ms6hHNea/gZUss8DlHy4V
 ckLdtriE4cUIHRbkFBRzR+4cQ1p1c4Kz724swX2rkG3mdJoe2GMgy+eBqLfcZQ4iYvAr
 8QR5XC2QqgTrFbKritQv+VwPut0DyWiJtlC0WQUv/Yq6EDLaPAw/4A+k4vxhwIzap+M8 Ew== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q9sfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 22:30:00 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 19 Dec 2022 22:30:00 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 19 Dec 2022 22:29:58 -0800
From: Manoj Saun <manojsingh.saun@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <narpat.mali@windriver.com>, <hari.gpillai@windriver.com>,
        <kai.kang@windriver.com>, Manoj Saun <manojsingh.saun@windriver.com>
Subject: [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515
Date: Tue, 20 Dec 2022 06:29:56 +0000
Message-ID: <20221220062956.609061-1-manojsingh.saun@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4-Q-xGiEPOpUEyk_JVYluMboQRqP-O24
X-Proofpoint-GUID: 4-Q-xGiEPOpUEyk_JVYluMboQRqP-O24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174842

libksba: integer overflow may lead to remote code execution.

Reference:
https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html

Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b]

CVE: CVE-2022-3515

Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
---
 ...e-overflow-directly-in-the-TLV-parse.patch | 42 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
new file mode 100644
index 0000000000..e2cb842a4d
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
@@ -0,0 +1,42 @@
+From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Wed, 5 Oct 2022 14:19:06 +0200
+Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b]
+
+CVE: CVE-2022-3515
+
+Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
+
+* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
+used sum.
+--
+
+It is quite common to have checks like
+
+    if (ti.nhdr + ti.length >= DIM(tmpbuf))
+       return gpg_error (GPG_ERR_TOO_LARGE);
+
+This patch detects possible integer overflows immmediately when
+creating the TI object.
+
+Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
+---
+ src/ber-help.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/ber-help.c b/src/ber-help.c
+index 81c31ed..56efb6a 100644
+--- a/src/ber-help.c
++++ b/src/ber-help.c
+@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag_info *ti)
+       ti->length = len;
+     }
+ 
++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
++    {
++      ti->err_string = "header+length would overflow";
++      return gpg_error (GPG_ERR_EOVERFLOW);
++    }
++
+   /* Without this kludge some example certs can't be parsed */
+   if (ti->class == CLASS_UNIVERSAL && !ti->tag)
+     ti->length = 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
index f6ecb9aec4..c25c23ef0f 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch"
 
 SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
-- 
2.34.1


