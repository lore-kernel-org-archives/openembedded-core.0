Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14998C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 03:38:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.5552.1651808291958532922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 20:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a0Q7UqfI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651808290; i=@fujitsu.com;
	bh=DfL9zffIt7vCFyzCiAA6Von7OjCUXlEo2sflOENnNB8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a0Q7UqfI64vskpCSV8B9uwxNNdOE9BUcs/bjCOrj2RrWJNLCIr5u6lJz2lwPpX+hh
	 esEgxQntfCBrJdFiaFRSj6uAxhIzOvmmY22bSXw7yIUxTAH9rTHAw202yVqTj++SP+
	 MkbqxzARpPu48uDWANNPVF2NbZVMwqfiWcX2c26evDWsTFucrAoqQrIYQqn7FhWvqX
	 7rGjZWiUlQRkgbvrF6W0y69Crd2pKN2dMEPrKtoiuJKqsjAweeVdxQIZLtRudpx0ko
	 7pUxp0EAxemW3KPERFJlMvjSHqpInTHWK0XaUD1q+G0NTV1Mx6pvvhwSMnh+Mq39Ao
	 7m2gc7Q+nIixQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRVdhRkm
  SwZXrNhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bcVSdZCzbKVzy408XewLhXuouRi0NIYCaT
  RN+urcwQzh5GiSePrzF1MXJysAloSOyeehkowcEhIqAncfWfKEiYWUBN4ujLn8wgtrCAg8SLQ
  ycYQWwWARWJFU3zWEFsXgEXiS23f4LZEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqlCTeXt
  rDCGFXSMya1cY0gZF3FpKWWUhaFjAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01TXRNTK21Eus0k3
  USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAyxlGKW9zsYm/p+6h1ilORgUhLlPSBb
  kiTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgpejHSgnWJSanlqRlpkDDHeYtAQHj5IIr+MkoDRvc
  UFibnFmOkTqFKOilDgvyzSghABIIqM0D64NFmOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKg
  nzyk0HmsKTmVcCN/0V0GImoMXH4gtBFpckIqSkGpiY+v0+9zFJMpswq4dpxRwyV/+rmCfYkOk
  8Z8E8CaZpvwzSXKbs2Kapo/i7UaiX6+fpE0vC8o3CeR6K/d1QUV1Ra3Gq7ZfhgtlvG3x3egXN
  EVp0JqBSKPPG38z9X1jPTqyYkz3hJ2MNz7mLx4ta8iUdz2yao2/5rU7zfPjEiPSFM98xeIvOs
  1RsUHTWuHWtw6AxiWl3tlOD27mL/yO3+7997XKEs4atyH7rwokrlTeEr1xmLO384mncZgeH2S
  LHBU+GBR56vr/l0AKBpOPOTMf/6of8iNs284hRCWue45qeAHET9bSJiV2aS3JmeN6XN+z7ILj
  hTyuDfb+y99wn238FPudZd3Les8hgntInGkosxRmJhlrMRcWJAHHm0uMsAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1651808288!36731!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28102 invoked from network); 6 May 2022 03:38:08 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 May 2022 03:38:08 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2463c248020995
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 6 May 2022 04:38:08 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 6 May 2022 04:38:00 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2] gnutls: Added fips support option.
Date: Fri, 6 May 2022 11:37:49 +0800
Message-ID: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 03:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165316

- Added fips option.
- Fixed a cross compile bug when enable fips.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...r-cross-compile-when-enable-fips.Usi.patch | 28 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   | 18 ++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Fix-build-bug-for-cross-compile-when-enable-fips.Usi.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Fix-build-bug-for-cross-compile-when-enable-fips.Usi.patch b/meta/recipes-support/gnutls/gnutls/0001-Fix-build-bug-for-cross-compile-when-enable-fips.Usi.patch
new file mode 100644
index 0000000000..0eeebb9b5e
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Fix-build-bug-for-cross-compile-when-enable-fips.Usi.patch
@@ -0,0 +1,28 @@
+From 755494234d71063ef1db6470d780a558ddfd1c56 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 6 May 2022 10:51:39 +0900
+Subject: [PATCH] Fix build bug for cross-compile when enable fips.Using binary
+ from gnutls-native instead of target.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ lib/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index c3d7b6e..0f099f4 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -207,7 +207,7 @@ hmac_files = .libs/.$(gnutls_so).hmac
+ all-local: $(hmac_files)
+ 
+ .libs/.$(gnutls_so).hmac: libgnutls.la fipshmac
+-	$(AM_V_GEN) $(builddir)/fipshmac .libs/$(gnutls_so) > $@-t && mv $@-t $@
++	$(AM_V_GEN) fipshmac .libs/$(gnutls_so) > $@-t && mv $@-t $@
+ 
+ CLEANFILES = $(hmac_files)
+ endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index b34eb7f5f0..5882e980e7 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
+DEPENDS:append:class-target = " gnutls-native"
+DEPENDS:append:class-nativesdk = " gnutls-native"
 DEPENDS:append:libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
@@ -22,6 +24,12 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            "
+SRC_URI:append:class-target = "\
+           file://0001-Fix-build-bug-for-cross-compile-when-enable-fips.Usi.patch \
+           "
+SRC_URI:append:class-nativesdk = "\
+           file://0001-Fix-build-bug-for-cross-compile-when-enable-fips.Usi.patch \
+           "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
 
@@ -36,6 +44,7 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode"
 
 EXTRA_OECONF = " \
     --enable-doc \
@@ -59,6 +68,15 @@ do_configure:prepend() {
 	done
 }
 
+do_install:append:class-native() {
+        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+          install -d ${D}${base_prefix}/bin
+          install -d ${D}${base_prefix}/bin/.libs
+          install -m 0755 ${B}/lib/fipshmac ${D}${base_prefix}/bin/
+          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${base_prefix}/bin/.libs/
+        fi
+}
+
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
-- 
2.25.1


