Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E54CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 07:51:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10429.1760514652682127453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 00:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xlm3cbIi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23831ac5e3=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F50D4r1858371
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 07:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9M/PYGZ9qjvprOAGJbdY
	j4oXehG5F20Tbevum0pJt/Q=; b=Xlm3cbIi7UJkPH5ifMP6grUsKeupfuBzFNo5
	WJ7fC3/qrXzW4XiaQ6zzqIIDHwve5MtWIaBzPI8mQd+EzPuayHVYazPE+mXUOP+G
	rzrZM+8VZtKoHdtU+Xgs13AR5BlL28WVGjD+VNvsV1QkjJoCza2mrcmC2ipseE98
	G2QL5yJI2f5+Qal7C6qWHQMQCJBzZYGJ8Hi4379cMg+Ptvv5QPIvjBk7A0uyBeW5
	okaozbbpAjZSySAhu6da1HpWbPLXS3b11pzMfm4Zle7Q1T9N8HL2kzhrHXhJPrPX
	FvPqYfWFtfXTS0XZr+Z5TsvUlJ7GFokqkZaQLIxCH0EKG2jnJw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmmg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 07:50:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 15 Oct 2025 00:50:48 -0700
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  1/1] glib-networking: fix CVE-2025-60018
Date: Wed, 15 Oct 2025 13:20:32 +0530
Message-ID: <20251015075032.3673770-1-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: aeRzcq7frX2_TtEmGlOmLtreK68aKsUQ
X-Proofpoint-ORIG-GUID: aeRzcq7frX2_TtEmGlOmLtreK68aKsUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA1OCBTYWx0ZWRfXx6rBQE01EArf
 W+0NfgIq2UO+h38XNb/v2tJWSGWYBmizYXYBTd8SnGJkjnhyB7VEqTLtFscrsfxsS8g6/d9J+Bg
 TYRnqGTZlNzr80+4g+5Vu+bxrv5TF/6sbGPk4yEFvv//iXFo392Aw2kylHfWJUJ/tJn3c8caTnB
 5zXCNlix1sudh1o5ddYyGyGrmFaNYGy6Mn6K71YA7kGU24wT1fTeTUoRj6ZG+hxcTWnxtWJwxga
 eJfc36434GfSmDTTZBBD8not2Nt5Up+sG2udObIZp4anxO63+6YIH1ji1XXl+BVwOiI9eZXOrXU
 yJYGoo13YNK7nOhxuPUb84qmYG0Ss5BOkv8IYXX0q4A1MMdjqcQ3Ewz2PpwUSNF/cxpX7Lx6mAY
 uizUNeOs3GGiSgFYoBixfbiL0LvHjw==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef525b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=7RsXeqVNe4DAsZv-J4YA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=yULaImgL6KKpOYXvFmjq:22
 a=CTwFTDRtctY-zZ8oRDn3:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 07:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224879

glib-networking's OpenSSL backend fails to properly check the return
value of a call to BIO_write(), resulting in an out of bounds read.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-60018

Upstream-patch:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/4dd540505d40babe488404f3174ec39f49a84485

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
---
 .../glib-networking/CVE-2025-60018.patch      | 83 +++++++++++++++++++
 .../glib-networking/glib-networking_2.78.1.bb |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch
new file mode 100644
index 0000000000..4ccf1cd43b
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch
@@ -0,0 +1,83 @@
+From 4dd540505d40babe488404f3174ec39f49a84485 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 4 Aug 2025 15:10:21 -0500
+Subject: [PATCH] openssl: properly check return value when writing to BIO
+ objects
+
+In particular, we will read out of bounds, and then write the invalid
+memory, if BIO_write() fails when getting the PROP_CERTIFICATE_PEM
+property. Here we attempt to check the return value, but the check is
+not correct.
+
+This also fixes a leak of the BIO in the same place.
+
+Also add error checking to PROP_SUBJECT_NAME and PROP_ISSUER_NAME, for
+good measure.
+
+Fixes #226
+
+CVE: CVE-2025-60018
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib-networking/-/commit/4dd540505d40babe488404f3174ec39f49a84485]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ tls/openssl/gtlscertificate-openssl.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscertificate-openssl.c
+index 648f3e8..b536559 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -362,15 +362,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_CERTIFICATE_PEM:
+       bio = BIO_new (BIO_s_mem ());
+
+-      if (!PEM_write_bio_X509 (bio, openssl->cert) || !BIO_write (bio, "\0", 1))
+-        certificate_pem = NULL;
+-      else
++      if (PEM_write_bio_X509 (bio, openssl->cert) == 1 && BIO_write (bio, "\0", 1) == 1)
+         {
+           BIO_get_mem_data (bio, &certificate_pem);
+           g_value_set_string (value, certificate_pem);
+-
+-          BIO_free_all (bio);
+         }
++      BIO_free_all (bio);
+       break;
+
+     case PROP_PRIVATE_KEY:
+@@ -411,8 +408,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_SUBJECT_NAME:
+       bio = BIO_new (BIO_s_mem ());
+       name = X509_get_subject_name (openssl->cert);
+-      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
+-      BIO_write (bio, "\0", 1);
++      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
++          BIO_write (bio, "\0", 1) != 1)
++        {
++          BIO_free_all (bio);
++          break;
++        }
+       BIO_get_mem_data (bio, (char **)&name_string);
+       g_value_set_string (value, name_string);
+       BIO_free_all (bio);
+@@ -421,9 +422,13 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_ISSUER_NAME:
+       bio = BIO_new (BIO_s_mem ());
+       name = X509_get_issuer_name (openssl->cert);
+-      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
+-      BIO_write (bio, "\0", 1);
+-      BIO_get_mem_data (bio, &name_string);
++      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
++          BIO_write (bio, "\0", 1) != 1)
++        {
++          BIO_free_all (bio);
++          break;
++        }
++      BIO_get_mem_data (bio, (char **)&name_string);
+       g_value_set_string (value, name_string);
+       BIO_free_all (bio);
+       break;
+--
+2.48.1
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
index 5060d9fd7a..22ca90724f 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
@@ -31,6 +31,7 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://eagain.patch"
+SRC_URI += "file://CVE-2025-60018.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.48.1


