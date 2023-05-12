Return-Path: <m.otto@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDA4C77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 10:09:11 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.20395.1683886143011449535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 03:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=Xr3TR2bd;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.otto@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1683886140; x=1686478140;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TKGjFp5ek9X1mM02xRG/KwnC4pTucsi/LMK6yMWGrl8=;
	b=Xr3TR2bd6kbbbeUM1JHY41Td9ZvwufiM4vbRn8UAAbuvsfsJKGAKsS5Rs8ouygp0
	EY4wIKbaM5LLDDoTiHe6CnWHmMrxoZEPJzpOlK1xOofsG9qoQS48+Xd1C3nHGaid
	D3S6PQUO5dSmIDzCWwHiZwNP2tIeuXRASXP+XCThD5U=;
X-AuditID: ac14000a-923ff70000007ecb-57-645e103ca9b8
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 30.FE.32459.C301E546; Fri, 12 May 2023 12:09:00 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 12 May
 2023 12:08:59 +0200
From: Maik Otto <m.otto@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone 2/2] BACKPORT: openssl: Fix reproducibility issue
Date: Fri, 12 May 2023 12:08:45 +0200
Message-ID: <20230512100845.1243349-3-m.otto@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512100845.1243349-1-m.otto@phytec.de>
References: <20230512100845.1243349-1-m.otto@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWyRpKBR9dGIC7F4OZmLos7P9+xOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoEr49SvbawFV0Uq7jdbNzAeEexi5OSQEDCRWP38DGsXIxeHkMAS
	JokfB3ewQzhPGCVOTr3PBFLFJqAk8XDuauYuRg4OEQE9iav/REFMYQFXifWLPEAqWARUJT7P
	+MoIYvMKmEssvXSEFWK+vMTMS9/ZQWxOAQuJ0+famUBahYBqjvxUhygXlDg58wkLiM0MVN68
	dTYzhC0hcfDFCzBbSEBWovFBG9zIaedeM0PYoRJbv2xnmsAoOAvJqFlIRs1CMmoBI/MqRqHc
	zOTs1KLMbL2CjMqS1GS9lNRNjKBwFGHg2sHYN8fjECMTB+MhRgkOZiUR3rdLolOEeFMSK6tS
	i/Lji0pzUosPMUpzsCiJ897vYUoUEkhPLEnNTk0tSC2CyTJxcEo1MCrvyv/37sR61XeXXOcI
	r/Z0/3YlVz6va/00Rjfhry96CqQsRE25crXNP9ffX/64kL9rrsjzTq6WpM1tEvGz8xe4bMr6
	u+VN5MbC2yfv7e9U/BLLsr2jIn5u6pEJW+fP2+7xbcbB5XllVe9yfP/93HLFgPNYbPmzfc92
	B1R1v62utNbI7TRTVVBiKc5INNRiLipOBABGDTiSNQIAAA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 10:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181176

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix an issue introduced in the new openssl version where an assembler file
isn't generated in a reproducible way by seeding the perl random number
generator consistently. It has no crypto impact, it is just used to
avoid function name clashes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(backported from 448df3e1c02fe224d62f59a236fdcd47ea7e695f
http://cgit.openembedded.org/openembedded-core master)

Signed-off-by: Maik Otto <m.otto@phytec.de>
---
 .../openssl/openssl/fix_random_labels.patch   | 22 +++++++++++++++++++
 .../openssl/openssl_3.1.0.bb                  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
new file mode 100644
index 0000000000..78dcd81685
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
@@ -0,0 +1,22 @@
+The perl script adds random suffixes to the local function names to ensure
+it doesn't clash with other parts of openssl. Set the random number seed
+to something predictable so the assembler files are generated consistently
+and our own reproducible builds tests pass.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
+===================================================================
+--- openssl-3.1.0.orig/crypto/modes/asm/aes-gcm-avx512.pl
++++ openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
+@@ -191,6 +191,9 @@ my $CTX_OFFSET_HTable    = (16 * 6);
+ # ;;; Helper functions
+ # ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+ 
++# Ensure the local labels are reproduicble
++srand(10000);
++
+ # ; Generates "random" local labels
+ sub random_string() {
+   my @chars  = ('a' .. 'z', 'A' .. 'Z', '0' .. '9', '_');
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.0.bb b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
index b7251cb68e..dd58597773 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://CVE-2023-0464.patch \
            file://CVE-2023-0465.patch \
            file://CVE-2023-0466.patch \
+           file://fix_random_labels.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


