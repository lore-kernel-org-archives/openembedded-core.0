Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1D1C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 06:12:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.80013.1673590365177224640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 22:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VNQk6EuT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=037745cc5a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D6Cecu018735
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 22:12:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=FwWq8rWmgoXE4xFNDSZa2Ho3LwL4+F6Pmwyuc7vPUQI=;
 b=VNQk6EuTowNwaMv+3s5uzfAqzAEwXSGoV8LO6wiYsbQP+rl/LsveujM9QIF92Lrmaaqv
 bXdIcRc7oqez5gsLNAdmAAErQK4r4SG8NgyBXFiAhbcPkal3AZK7ok/TcF1c79zWGYXC
 3FI3Q1IGtsetaknM17xlSECU1W1YoU+u2fs4MfXBrQKl2EDuaTpYcDinpc/hlhv3yMz0
 XWxJdOKWavzU63l62LfEbaGGxh2tR1kKlnlrlbfRRg4CUJHbgB/L9Fqx2mIvIZGfADkH
 to2Yjk/f/V+osv45B6xmsuPR3mdMJsxfUUAqEbaiY+CBBUCy1WwQX+aZTpFZfIOo0GUZ LQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tja61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 22:12:44 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 12 Jan 2023 22:12:43 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 12 Jan 2023 22:12:42 -0800
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, Yogita Urade <yogita.urade@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] libksba: fix CVE-2022-47629
Date: Fri, 13 Jan 2023 06:12:25 +0000
Message-ID: <20230113061225.1082315-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3pH3ZG_XieqdX4Vj3RlixdmHZRfscHLa
X-Proofpoint-ORIG-GUID: 3pH3ZG_XieqdX4Vj3RlixdmHZRfscHLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_14,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175810

Libksba before 1.6.3 is prone to an integer overflow vulnerability in the CRL signature parser.

CVE: CVE-2022-47926

References: https://nvd.nist.gov/vuln/detail/CVE-2022-47629

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...overflow-in-the-CRL-signature-parser.patch | 72 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch b/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
new file mode 100644
index 0000000000..8c0080d56b
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
@@ -0,0 +1,72 @@
+From f61a5ea4e0f6a80fd4b28ef0174bee77793cf070 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Tue, 22 Nov 2022 16:36:46 +0100
+Subject: [PATCH] Fix an integer overflow in the CRL signature parser.
+
+* src/crl.c (parse_signature): N+N2 now checked for overflow.
+
+* src/ocsp.c (parse_response_extensions): Do not accept too large
+values.
+(parse_single_extensions): Ditto.
+--
+
+The second patch is an extra safegourd not related to the reported
+bug.
+
+CVE: CVE-2022-47629
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=f61a5ea4e0f6a80fd4b28ef0174bee77793cf070]
+
+GnuPG-bug-id: 6284
+Reported-by: Joseph Surin, elttam
+---
+ src/crl.c  |  2 +-
+ src/ocsp.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/crl.c b/src/crl.c
+index 9f71c85..2e6ca29 100644
+--- a/src/crl.c
++++ b/src/crl.c
+@@ -1349,7 +1349,7 @@ parse_signature (ksba_crl_t crl)
+          && !ti.is_constructed) )
+     return gpg_error (GPG_ERR_INV_CRL_OBJ);
+   n2 = ti.nhdr + ti.length;
+-  if (n + n2 >= DIM(tmpbuf))
++  if (n + n2 >= DIM(tmpbuf) || (n + n2) < n)
+     return gpg_error (GPG_ERR_TOO_LARGE);
+   memcpy (tmpbuf+n, ti.buf, ti.nhdr);
+   err = read_buffer (crl->reader, tmpbuf+n+ti.nhdr, ti.length);
+diff --git a/src/ocsp.c b/src/ocsp.c
+index d4cba04..657d15f 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -721,6 +721,12 @@ parse_response_extensions (ksba_ocsp_t ocsp,
+               || memcmp (ocsp->nonce, data, ti.length))
+             ocsp->bad_nonce = 1;
+         }
++      if (ti.length > (1<<24))
++        {
++          /* Bail out on much too large objects.  */
++          err = gpg_error (GPG_ERR_BAD_BER);
++          goto leave;
++        }
+       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
+       if (!ex)
+         {
+@@ -788,6 +794,12 @@ parse_single_extensions (struct ocsp_reqitem_s *ri,
+       err = parse_octet_string (&data, &datalen, &ti);
+       if (err)
+         goto leave;
++      if (ti.length > (1<<24))
++        {
++          /* Bail out on much too large objects.  */
++          err = gpg_error (GPG_ERR_BAD_BER);
++          goto leave;
++        }
+       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
+       if (!ex)
+         {
+-- 
+2.32.0
+
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
index f6ecb9aec4..d0ee8475f8 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch"
 
 SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
-- 
2.34.1


