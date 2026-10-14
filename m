Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF02CCC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:37:25 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15962.1791990214367937526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 08:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=VazUPJf5;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=zhTTFsDW;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791990211; x=1792595011;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=rlwLem26qODiNcL/FRCCbw9nbHT5W5LKrf9YW8pPB0s=;
	b=VazUPJf5omTuEh8DTPGr54J4XuEuJR7sis3lu7gj8WSG+8CiVYoGIqDyiWMPay0bIeqdxau61OVWN
	 A7fcLPsp4SyzvXkgoH1+Oxr1W8tPskUB/gqRsgp1Lg3BIWg8hmvledRy9+6InHpxcS+qb117nsSBUz
	 bHJALN1t1Xux3vamz4sFhdUW2YiA3qRRU4ComAREz0jAKfK5WVfi2oFcgiAfIs10gSad//hVNMq/U/
	 TjlL0C3GPBvlTOIUKxiqG/t4poheRvNyb3qnrfRapMD29f6wJL+OS9DGQzc0Nta9y7PH0EocEOFnaa
	 hLkJnz/WwJZiERHyjQvQafNaMyxtPHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791990211; x=1792595011;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=rlwLem26qODiNcL/FRCCbw9nbHT5W5LKrf9YW8pPB0s=;
	b=zhTTFsDW4YLYspC9yrVE5dvzcXks/UBpGwdTx4DnC/jqLuwDbcXrm60PBsFC4gwatwA/eshK/umAx
	 7eCkIzfAg==
X-HalOne-ID: 6a09193b-c7e0-11f1-9c5e-4dc7813a5380
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-daaa-7498-2de4-66eb.310.pool.telefonica.de [2a02:3102:8c10:1ae0:daaa:7498:2de4:66eb])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 6a09193b-c7e0-11f1-9c5e-4dc7813a5380;
	Wed, 14 Oct 2026 15:03:31 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [RFC PATCH] pkcs11-provider: add version 1.3.0
Date: Wed, 14 Oct 2026 17:03:29 +0200
Message-ID: <20261014150329.157754-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247788

Add a generic PKCS#11 provider alongside OpenSSL and p11-kit in OE-Core
to support token-backed keys for target applications and native signing
tools. OpenSSL 4.x removed the legacy ENGINE API so this provides the
provider-based integration without requiring meta-oe layer.

Import the recipe from meta-openembedded and update it to 1.3.0 which
already includes the existing i686 fix.
The recipe will be removed from meta-openembedded once this addition
is merged into OE-Core.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 .../pkcs11-provider/pkcs11-provider_1.3.0.bb   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 94ab0ccace..a691e6697a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -604,6 +604,7 @@ RECIPE_MAINTAINER:pn-piglit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pigz = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-pinentry = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pixman = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-pkcs11-provider = "Ayoub Zaki <ayoub.zaki@embetrix.com>"
 RECIPE_MAINTAINER:pn-pkgconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pm-utils = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pointercal-xinput = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb b/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
new file mode 100644
index 0000000000..a4d5343c47
--- /dev/null
+++ b/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "An OpenSSL provider for accessing PKCS#11 tokens"
+DESCRIPTION = "An OpenSSL provider to access hardware or software tokens through \
+the PKCS#11 Cryptographic Token Interface."
+HOMEPAGE = "https://github.com/openssl-projects/pkcs11-provider"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b53b787444a60266932bd270d1cf2d45"
+
+DEPENDS = "openssl p11-kit"
+
+SRC_URI = "git://github.com/openssl-projects/${BPN}.git;branch=main;protocol=https;tag=v${PV}"
+SRCREV = "b55b94344af87a058fd84d6e15390760a5585b1d"
+
+inherit meson pkgconfig
+
+FILES:${PN} += "${libdir}/ossl-modules/pkcs11.so"
+
+BBCLASSEXTEND = "native"
-- 
2.53.0


