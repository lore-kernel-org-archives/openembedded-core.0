Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19209C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 06:54:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.24621.1653288834667386097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 23:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wjlf59CN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653288832; i=@fujitsu.com;
	bh=QTOsiKxwqt6YrxgpO2oXuAwKbhwUPNI7Q69+E+bnmyg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wjlf59CNDYDJF5d4fRT6uMIHffZw/GIab/DMAe8IKWIu7/J2aMpOnaL4zK/1yIxJ6
	 3S4I0cH1eFdyo8zQF/01dJ/Djn6cpNir3YPvpWR/1Pqcn4VyXd6GxjarH6dP9cOQ/k
	 dCoUKVadwDHPwzV3uVLUlFpSjloJ2UYpfSstJt4z6Ys/Ap3dZnmbIGVifnmU7Q2Xba
	 L0WGJC7otN1Z+7Xsyl40JmEHj5EMumxapqm5FyEg6sDP9boR8jyG8MxKtz4yjwcx0m
	 w+pBU67mOpxHXQzc4oZrScEViFNZ98NXPDD52Tb2NEPpx++bCYV5DDukfQjM8koQg+
	 usuTUwJVU5uqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxSbdBvzv
  JYMNLCYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPPi9ssBVfkKw5+3sDcwPhcuouRi0NI4DGj
  xKJVO1ggnPNMEvva/jF1MXICOXsZJR5NlAGx2QQ0JHZPvczcxcjBISKgJ3H1nyhImFlATeLoy
  5/MILawgIXE+sM72EFsFgFViaW9a8HG8Aq4SLzoOwFmSwgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZJ4e2kPI4RdIfH68CWouJrE1XObmCcw8s9C0j4LSfsCRqZVjFZJRZnpGSW5iZk5uoY
  GBrqGhqa6xua6hpZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBIZlSrCq8
  g7Fj5U+9Q4ySHExKoryJEt1JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4vXSBcoJFqempFWmZO
  cD4gElLcPAoifCq6QGleYsLEnOLM9MhUqcYdTmuXrmyl1mIJS8/L1VKnHePMlCRAEhRRmke3A
  hYrF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7DeQSnsy8ErhNr4COYAI6oleiE+SIkkS
  ElFQDU2HilHep1+4c/3SJd0PRgld/7uXmHbph+v9C127paWL7b/dr6z6sEPUsFK0J6jsimz9B
  K2fXop7HPf57Sna/2nm3Pzd2m8zOjodeO7nn9f+XbDuy/XzMmd8sdyJaVKpeXzdxZK2KiTZLq
  1yVsNWr+PqLPXczfb9/k+dY8/CL872FKgbL3HYUHn2h7Xvz/uu+GbcseqImxLMEVU1MZIgKOH
  fSwK9VyWllregkjiM3Hj8T5+Stj52b/z+uwXCXJxv7sgnMbI5HJmzXnSYceyVRas251n73STw
  2Jae3t8790nCnJa7l5GVjUc9yc3G+VzMZJm6dmVGytcpd2SlmSeW0o/4fjx5c/034TaBDOMsb
  ViWW4oxEQy3mouJEAAYlqlRQAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1653288832!207046!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17500 invoked from network); 23 May 2022 06:53:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 06:53:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0E94110034F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:53:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EC088100331
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:53:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 07:53:47 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v3] gnutls: Added fips option.
Date: Mon, 23 May 2022 14:53:33 +0800
Message-ID: <1653288813-3748-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 06:54:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165996

- Added a patch to avoid excute fipshmac command. Because *.hmac
file should be created on target instead of on build environment.
- Added pkg_postinst_ontarget to make sure necessary files are
created on target.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...ile-should-be-excuted-in-target-envi.patch | 28 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.5.bb   | 24 +++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
new file mode 100644
index 0000000000..7a0e2fd474
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -0,0 +1,28 @@
+From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Mon, 23 May 2022 10:44:43 +0900
+Subject: [PATCH] Creating .hmac file should be excuted in target environment,
+ so deleted it from build process.
+
+Upstream-Status: Inappropriate [Embedded]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ lib/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 0b43ef9..cf263f0 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -206,8 +206,7 @@ hmac_files = .libs/.gnutls.hmac
+
+ all-local: $(hmac_files)
+
+-.libs/.gnutls.hmac: libgnutls.la fipshmac
+-	$(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
++.libs/.gnutls.hmac:
+
+ CLEANFILES = $(hmac_files)
+ endif
+--
+2.25.1
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
index 5feedb7fdc..b796494b8d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
@@ -21,6 +21,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
 SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
@@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR}"
 
 EXTRA_OECONF = " \
     --enable-doc \
@@ -59,10 +61,30 @@ do_configure:prepend() {
 	done
 }
 
-PACKAGES =+ "${PN}-openssl ${PN}-xx"
+do_install:append:class-target() {
+        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+          install -d ${D}${bindir}/bin
+          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
+        fi
+}
+
+PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
 
 FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
 FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
+FILES:${PN}-fips = "${bindir}/fipshmac"
 
 BBCLASSEXTEND = "native nativesdk"
+
+pkg_postinst_ontarget:${PN}-fips () {
+    if test -x ${bindir}/fipshmac
+    then
+        mkdir ${sysconfdir}/gnutls
+        touch ${sysconfdir}/gnutls/config
+        ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
+        ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac
+        ${bindir}/fipshmac ${libdir}/libgmp.so.10.*.* > ${libdir}/.libgmp.so.10.hmac
+        ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
+    fi
+}
-- 
2.25.1


