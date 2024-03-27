Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54E1C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 17:14:40 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.1498.1711559675894282469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 10:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=W3h7HPrv;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1130; q=dns/txt; s=iport;
  t=1711559675; x=1712769275;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xVQlK8zYidoVmzxNZV92gc1MGsiGrrZItavnRYiM5oA=;
  b=W3h7HPrvPDub1BAFwurkZ48Ai+c7YaD4abAP+9PNt8BopkbwuztshQUJ
   1fOnNjKeGfna5sxSJAO+UYHJsckPzQIkf2Kv2sbtDpEPVIF8nTyIb24ud
   +4G+rxNV/kz+IXI4jGLje9VM2t4hSXG697etT49mU9BW+OG8ICZE2HCiO
   0=;
X-CSE-ConnectionGUID: /3BL6CbkTz+01g7novw0jA==
X-CSE-MsgGUID: vgzNXZkjQQWKg0SbIo0qQw==
X-IPAS-Result: =?us-ascii?q?A0C1AQCrUgRmmJBdJa1agliDNVZBSJQagiKLc5IXgSUDV?=
 =?us-ascii?q?g8BAQEPMRMEAQGNDQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBBgEBBQEBAQIBB?=
 =?us-ascii?q?wUUAQEBAQEBAQEeGQUOECeFeocSARgBgX2DAAGCXwIBsFCCLIEBgyYBgVGuO?=
 =?us-ascii?q?oFqgUiMe4VfJxuBSUSEB3aECoEGhXYEghKDN6AiSoEkA4EFaxsQHjcREBMNA?=
 =?us-ascii?q?whuHQIxOgMFAwQyChIMCx8FEkIDQwZICwMCGgUDAwSBLAULGgIQLCYDAxJJA?=
 =?us-ascii?q?hAUAzgDAwYDCjEuT0EMUANnHxkYCTwPDBoCGxQNJCMCLD4DCQoQAhYDHRYEM?=
 =?us-ascii?q?BEJCyYDKgY2AhIMBgYGXCAWCQQjAwgEA1ADIHARAwQaBAsHdoM9BBNEAxCBM?=
 =?us-ascii?q?ooXgz+CIIERgydONAMJAwcFSUADCxgNSBEsNRQbBiIfbwejcAGCZoEOAYFGY?=
 =?us-ascii?q?kDFboQdjAyVHRozqi+YYqQghGOBZDqBW00jFYMiCUkZD445mVdDNQI5AgcLA?=
 =?us-ascii?q?QEDCYhugXoBAQ?=
IronPort-Data: A9a23:elDlba5+mpxHltOuqdXHsQxRtDfHchMFZxGqfqrLsTDasY5as4F+v
 mpOXD3VMvzca2P8LdFza97j8xxUvZKEm95gGgFsr3hgZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa/lH1dOG58RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq/KUzBHf/g2QoajlOtPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95eAelKb7+eZzHHUMCO1zKpoC18pZY8xr7Mf7WFmr
 ZT0KRgXZRyFwumx2r/+Gq9nh98oK4/gO4Z3VnNIlG6CS615B8GYBfyWube03x9o7ixKNfHbb
 tYYdCFvRB/BeBZIfFwQDfrSmc/y3SmhKWED9QL9Sawf/WfB6jxD07rUCeX2dYSxT+RSxl+hu
 TeTl4j+KkpHbIPEk2XtHmiXrujXkCX2XYgfGLG1+rthh0ee7mgSEwENE1yjrP+0j0SzV95SJ
 woT4CVGkEQp3FagQt+4VBqirTvU+BUdQNFXVeY97Wlh15Y4/S7eXUIgEBVLa+A095dvSmMs0
 UGWx9HAUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscefjy4e5yG3UpkyVJuuPAJKIYsvJ9SYcK
 g1mQQAkjLkVyMUMzaj+rRbMgimnod7CSQtdCuTrsoCNsF4RiG2NPtDABb3nARBod9nxor6p5
 yZspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiH6JNwPv2Egeh00bK7onAMFh
 meO6Gu9A7cObROXgVNfPOpd9uxzlPewS465PhwqRoMUO8YZmPC7ENFGPhPIgDu3zyDAYIk0O
 IyQdo63HG0GBKF8hDuwTKF17FPY7n5W+I8nfriil07P+ePHPBa9EO5ZWHPQNbpRxP3f/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcqm+5UPKLLbe1IO9aNII6a5/I7NsrdNx8x9/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:i6lYHqD5tmNikQ/lHem/55DYdb4zR+YMi2TDsHoBKiC9Hfb2qy
 nDpp4mPHzP6Ar5JktPpTnoAsDpKk80nqQY3WB+B9qftXHd2VdB6OpZnO7fK/qKIVydytJg
X-Talos-CUID: =?us-ascii?q?9a23=3A1oz0w2qLW1PSFeVLswnBisfmUYd+WFmD533TH13?=
 =?us-ascii?q?7UT9mF7uSV0DI+ooxxg=3D=3D?=
X-Talos-MUID: 9a23:i1j4zAgn46nPrmn9tRH/ocMpKsh6xZScC0I0qKoltJG/Pw13Yy6kk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,159,1708387200"; 
   d="scan'208";a="238624358"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by alln-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 17:14:34 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 42RHEYGL008862
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 17:14:34 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] curl: improve reproducibility
Date: Wed, 27 Mar 2024 17:14:34 +0000
Message-Id: <20240327171434.949887-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 17:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197564

nativesdk-curl package contains host references in output files.
remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
v2
 - moved common code to separate function 
---
---
 meta/recipes-support/curl/curl_8.6.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-support/curl/curl_8.6.0.bb
index ea69164d76..49ba0cb4a7 100644
--- a/meta/recipes-support/curl/curl_8.6.0.bb
+++ b/meta/recipes-support/curl/curl_8.6.0.bb
@@ -79,7 +79,7 @@ EXTRA_OECONF = " \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
 "
 
-do_install:append:class-target() {
+fix_absolute_paths () {
 	# cleanup buildpaths from curl-config
 	sed -i \
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
@@ -89,6 +89,14 @@ do_install:append:class-target() {
 	    ${D}${bindir}/curl-config
 }
 
+do_install:append:class-target() {
+	fix_absolute_paths
+}
+
+do_install:append:class-nativesdk() {
+	fix_absolute_paths
+}
+
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
 }
-- 
2.33.0


