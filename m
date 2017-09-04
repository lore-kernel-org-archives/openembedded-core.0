Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 50F5C781A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 07:57:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e204so5650168wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 00:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=51vYQg4DmphDl8Pst8g37QbA1I+SpIdvwpmj+FhhiQQ=;
	b=gw0KzrF2l/m22PJc1s5as9elX4QNErco/FiBXMg2l1YQEn5H4cvSXF32d8Exa/IFLi
	MAh7gAhG0F/WWkPzq/EnG2Ho3y5IocWknqkCowCkM2W8pJik/xpZ2uX/ceqoVsj7Y/do
	dWOTZ/99HtpjAaCIyhIFmO8pBXW0uQlPbGOzOIFh8OavsQL37Ij9w1X1tFXq4z+6jben
	Q7wMBXDcWRmPR1AN+YiuFCBM1B/7FyzFuJdkn2dHxuYX8STKYfJ224hSl0EoFlj3ssuB
	rqtNXC620MHgld0JBLJCR9GSy6sGeHstFDb9LE+UavuFj1Mw6iSo/VwyixXuly1Zscpj
	LEhQ==
X-Gm-Message-State: AHPjjUi9v7hDQ3PeikjnvvTVlkrGRT6uIxOURkt+gp4EXLM23IFT8CPm
	lX7ijjmMpb2NJZj4iSc=
X-Google-Smtp-Source: ADKCNb4Y8qP0WZ+QhThY7oYdraM3f7Xukqpbuj3gfyHpVxYt+Fqc3QKj0z58p9YeR3nbdfKa2+hY6g==
X-Received: by 10.28.30.73 with SMTP id e70mr3989701wme.5.1504511837712;
	Mon, 04 Sep 2017 00:57:17 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k195sm7265575wmg.43.2017.09.04.00.57.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 00:57:17 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 08:57:16 +0100
Message-Id: <20170904075716.6361-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] curl: enable threaded resolver
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2017 07:57:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Multi-threaded applications using libcurl crash
on DNS timeouts when built using OE.

The reason is as follows:
By default, libcurl implements DNS timeouts using a
timer (alarm()) and a pair of setjmp()/longjmp().
This approach is unsafe in multi-threaded applications
for various reasons, as e.g. explained in the relevant
man-pages.

To avoid this, libcurl can be compiled with a built-in
threaded resolver, or against the c-ares asynchronous
resolver library.

To keep extra dependencies to a minimum, and to mimic
other distributions (debian at least), and because
c-ares is not available in OE-core, add a PACKAGECONFIG
to be able to enable use of of the built-in threaded
resolver and enable it by default.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-support/curl/curl_7.54.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index f42582a9f0..4cd5d09fef 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -20,9 +20,9 @@ SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy zlib"
-PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
-PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy thres zlib"
+PACKAGECONFIG_class-native = "ipv6 proxy ssl thres zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl thres zlib"
 
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
@@ -42,6 +42,7 @@ PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
 PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
+PACKAGECONFIG[thres] = "--enable-threaded-resolver, --disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
 
-- 
2.14.1


