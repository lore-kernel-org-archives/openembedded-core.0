Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC5DEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:05:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6699.1686917133639012578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LRp1PBVm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GBECrE015115
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:05:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Dyxgn4rtSpCWqpV1p2li6MHconp5rsyir/UvZ7eGSqQ=;
 b=LRp1PBVmVOl6iWQOREkShQQP52iOLZ+xLKtDHbUrSb+MCj5ylRFt10jfSJGg8XDry2Vw
 pEFrjAMxdwV2ad3/NwRi/bLOHkLnmpJujC6LnCmu3K+8uukGTf3HN+95Yy7eGTZeHmEY
 GyGEIliUud25rrKT+b7VKBHHJPmoAkGbNU3DhDTGSGI1GVlaumci9kuuREE1BtHsmnSK
 U+noQdixT2w1nia9f58GM7La77Hpu3CX2o7V5XrJ/ZXRRoqIf20q4+C1diEu2amlFV3h
 11V0oVOkRjYJJSrUwHBRL3ncbD8p2QB6JvU9LZDj09iLGyjxHWxdxhcdUpnHdnCEHj5I NQ== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphnsm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:05:33 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 05:05:31 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [PATCH] samba: fix CVE-2022-41916
Date: Fri, 16 Jun 2023 12:05:18 +0000
Message-ID: <20230616120518.2691391-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: k2bsY22ChY01ISVjgfQG54jcDF_N2qun
X-Proofpoint-GUID: k2bsY22ChY01ISVjgfQG54jcDF_N2qun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=694
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183011

Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
Versions prior to 7.7.1 are vulnerable to a denial of service
vulnerability in Heimdal's PKI certificate validation library,
affecting the KDC (via PKINIT) and kinit (via PKINIT), as well as
any third-party applications using Heimdal's libhx509. Users
should upgrade to Heimdal 7.7.1 or 7.8. There are no known
workarounds for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41916

Upstream patches:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-41916.patch          | 38 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
new file mode 100644
index 000000000..07f4a18a2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
@@ -0,0 +1,38 @@
+From eb87af0c2d189c25294c7daf483a47b03af80c2c Mon Sep 17 00:00:00 2001
+From: Jeffrey Altman <jaltman@secure-endpoints.com>
+Date: Wed, 17 Nov 2021 20:00:29 -0500
+Subject: [PATCH] lib/wind: find_normalize read past end of array
+
+find_normalize() can under some circumstances read one element
+beyond the input array.  The contents are discarded immediately
+without further use.
+
+This change prevents the unintended read.
+
+(cherry picked from commit 357a38fc7fb582ae73f4b7f4a90a4b0b871b149e)
+
+Change-Id: Ia2759a5632d64f7fa6553f879b5bbbf43ba3513e
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c]
+CVE: CVE-2022-41916
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/wind/normalize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/wind/normalize.c b/lib/wind/normalize.c
+index 20e8a4a04b..8f3991d10e 100644
+--- a/lib/wind/normalize.c
++++ b/lib/wind/normalize.c
+@@ -227,9 +227,9 @@ find_composition(const uint32_t *in, unsigned in_len)
+	unsigned i;
+
+	if (n % 5 == 0) {
+-	    cur = *in++;
+	    if (in_len-- == 0)
+		return c->val;
++	    cur = *in++;
+	}
+
+	i = cur >> 16;
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index cc07d51dc..fcec63752 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-3437-0007.patch;patchdir=source4/heimdal \
            file://CVE-2022-3437-0008.patch;patchdir=source4/heimdal \
            file://CVE-2022-45142.patch;patchdir=source4/heimdal \
+           file://CVE-2022-41916.patch;patchdir=source4/heimdal \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


