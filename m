Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D197CCD184
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 04:38:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8502.1760675878100000941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 21:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=syNKl6u6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2385bb36fb=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59H2UoWO1792410
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 21:37:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jl4pRhlt5fbAuYytiPlK
	RipDxLrVK3yibexcUpXhE8k=; b=syNKl6u60BP18ubpknnmgUp9gCI2pVy3y4rr
	alZbDN8Ufeb7XU6qgGk5W3zMb4EXDE3XzyqzgelCdLSHxo1qm/O5Ni6OP8r+wbz2
	Ygw1BXx1Stz99bnATCKFOyBt7Onfb22X9uF7SPqyJmCa3ZU4eGZgTmWZhd7jM8Mi
	AWq36OMViW8LU89WZO2hfMaw59wLGoN1XiCiX4RsxEOb5Q89K4/iQi4YPvonmytm
	yR/PsCiHkN5sUzMFiFJijdKNX7StF5PWjhK9ENZFfWbjeih2sFMp8qFmuX1Tzcjh
	exAjUhxEhPgiU5sF63oBza+ZiXuezbymlYPqJ1Jhh5RgnbUrOA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1pytq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 21:37:57 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 16 Oct 2025 21:37:55 -0700
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] glib-networking: fix CVE-2025-60019
Date: Fri, 17 Oct 2025 10:07:37 +0530
Message-ID: <20251017043737.3283552-1-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDAzMiBTYWx0ZWRfX6sOTaaSj3kKA
 O+qiy3llS5Wf10aMlEWPDfT6MFIblLB7Cy0Wis5DxjGUMiofFPWAkGh+MpDck2XpKhKft9NRrG3
 sfb1PJkg16D2pp9wOLnAJTGxUiDt5dddSVlGq5T2VsC09OscZDwWUm3EbMxlT+sUYy8AxdJgsQM
 nigwEo3OHIk1KBhKL1lEUh73dwh2cFNHxMlfot5Q0CS+aYa6cNwZGmItgfCZFKPRAr6fNr2F2nj
 Y6AwNMEvQLnaqzhZsfQmLsT8cxlc2vrU1b/hI4QtXvBRXSQZn/eTja6eKku/GHoZot6TvONSbHM
 5oClPap8PxCzgYTo17zL0QK/WxbSbLvQ3LlpWzE9WCmZF/kP1FYOv7HMMiXUAtcz3UOm72XPSTO
 VWAOgruFG3Jsz1c4lSI1EDfe1aQQyw==
X-Proofpoint-GUID: -PYq8wmehVhON1Y2aq9Et3czBZbAiIxz
X-Proofpoint-ORIG-GUID: -PYq8wmehVhON1Y2aq9Et3czBZbAiIxz
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68f1c825 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=_OnXw8q4LQH9S9y3qmQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=CTwFTDRtctY-zZ8oRDn3:22
 a=yULaImgL6KKpOYXvFmjq:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510170032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 04:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224991

glib-networking's OpenSSL backend fails to properly check the return
value of memory allocation routines. An out of memory condition could
potentially result in writing to an invalid memory location.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-60019

Upstream-patch:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/70df675dd4f5e4a593b2f95406c1aac031aa8bc7

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
---
 .../glib-networking/CVE-2025-60019.patch      | 137 ++++++++++++++++++
 .../glib-networking/glib-networking_2.72.2.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
new file mode 100644
index 0000000000..cc0a8f1edc
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
@@ -0,0 +1,137 @@
+From 70df675dd4f5e4a593b2f95406c1aac031aa8bc7 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 21 Aug 2025 17:21:01 -0500
+Subject: [PATCH] openssl: check return values of BIO_new()
+
+We probably need to check even more return values of even more OpenSSL
+functions, but these ones allocate memory and that's particularly
+important to get right.
+
+CVE: CVE-2025-60019
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib-networking/-/commit/70df675dd4f5e4a593b2f95406c1aac031aa8bc7]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ tls/openssl/gtlscertificate-openssl.c | 39 ++++++++++++++++++++-------
+ 1 file changed, 29 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscertificate-openssl.c
+index 8f828a7..f7fde51 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -156,6 +156,9 @@ export_privkey_to_der (GTlsCertificateOpenssl  *openssl,
+     goto err;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto err;
++
+   if (i2d_PKCS8_PRIV_KEY_INFO_bio (bio, pkcs8) == 0)
+     goto err;
+
+@@ -189,6 +192,9 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl)
+     return NULL;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto out;
++
+   ret = PEM_write_bio_PKCS8PrivateKey (bio, openssl->key, NULL, NULL, 0, NULL, NULL);
+   if (ret == 0)
+     goto out;
+@@ -201,7 +207,7 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl)
+   result = g_strdup (data);
+
+ out:
+-  BIO_free_all (bio);
++  g_clear_pointer (&bio, BIO_free_all);
+   return result;
+ }
+
+@@ -216,7 +222,7 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+   guint8 *data;
+   BIO *bio;
+   GByteArray *byte_array;
+-  char *certificate_pem;
++  const char *certificate_pem;
+   long size;
+
+   const ASN1_TIME *time_asn1;
+@@ -251,12 +257,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_CERTIFICATE_PEM:
+       bio = BIO_new (BIO_s_mem ());
+
+-      if (PEM_write_bio_X509 (bio, openssl->cert) == 1 && BIO_write (bio, "\0", 1) == 1)
++      if (bio && PEM_write_bio_X509 (bio, openssl->cert) == 1 && BIO_write (bio, "\0", 1) == 1)
+         {
+           BIO_get_mem_data (bio, &certificate_pem);
+           g_value_set_string (value, certificate_pem);
+         }
+-      BIO_free_all (bio);
++      g_clear_pointer (&bio, BIO_free_all);
+       break;
+
+     case PROP_PRIVATE_KEY:
+@@ -296,6 +302,8 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+
+     case PROP_SUBJECT_NAME:
+       bio = BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name = X509_get_subject_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
+           BIO_write (bio, "\0", 1) != 1)
+@@ -310,6 +318,8 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+
+     case PROP_ISSUER_NAME:
+       bio = BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name = X509_get_issuer_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
+           BIO_write (bio, "\0", 1) != 1)
+@@ -377,8 +387,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       g_return_if_fail (openssl->have_cert == FALSE);
+       bio = BIO_new_mem_buf ((gpointer)string, -1);
+-      openssl->cert = PEM_read_bio_X509 (bio, NULL, NULL, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->cert = PEM_read_bio_X509 (bio, NULL, NULL, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->cert)
+         openssl->have_cert = TRUE;
+       else if (!openssl->construct_error)
+@@ -397,8 +410,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       g_return_if_fail (openssl->have_key == FALSE);
+       bio = BIO_new_mem_buf (bytes->data, bytes->len);
+-      openssl->key = d2i_PrivateKey_bio (bio, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->key = d2i_PrivateKey_bio (bio, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->key)
+         openssl->have_key = TRUE;
+       else if (!openssl->construct_error)
+@@ -417,8 +433,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       g_return_if_fail (openssl->have_key == FALSE);
+       bio = BIO_new_mem_buf ((gpointer)string, -1);
+-      openssl->key = PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->key = PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->key)
+         openssl->have_key = TRUE;
+       else if (!openssl->construct_error)
+--
+2.48.1
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
index 32d50135bb..65a4a3a22f 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
@@ -25,6 +25,7 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://CVE-2025-60018.patch"
+SRC_URI += "file://CVE-2025-60019.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.48.1


