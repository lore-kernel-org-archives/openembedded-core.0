Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5BD6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 09:42:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l19so5892142wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 02:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jqYfUgU1Hvl0zBhRFQlqlP0/6lTV9mCj0s1bvoJu0Vo=;
	b=ZKmXTYRYadEeQeSR9o6OjUhuX2UBtV+p4jwfBts5dL70bMy56wzS4OsRxhVqht3o/O
	ic7/6Oh91CtxxmZxcvgIC7yizp1ks72iHe/9WhcicKG4AxLYgTlSfjCGhhtL05jrw1yF
	/wPKIomF7wOSbgxeR2b6KXz9SWR7gzCeYUlndE+P90mpOgHS+3d9U9SmRXwN++JV3paD
	oQyhKKrOTi2KsVRgr6OgAuHFyd4EQ2tLbCFbNyrpuIxK4kcewl5I8vkS2Ft1sifSyWES
	T2aAVg1roNjbisnFraPTB6FCu9pyU9M9IpqUkAbJjRuuvnH0FE+QtYJU3XSo/ekrWu9y
	qqLA==
X-Gm-Message-State: AHPjjUiBFk5XNZIrCPHQiosklcpt64LUddjfhjL3V24uWDonBH6aAmOg
	eDnT/Cweoe/LIHOOKGo=
X-Google-Smtp-Source: ADKCNb6vw2GM9j70HvccypCxOBq6lHnPs3Vu5pSol+r6E+xev11DkCi/CZRoyWo0lC1K7yBV7Y8isQ==
X-Received: by 10.28.143.200 with SMTP id r191mr3492354wmd.156.1504518167073; 
	Mon, 04 Sep 2017 02:42:47 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id s126sm75030wmd.43.2017.09.04.02.42.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 02:42:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 10:42:44 +0100
Message-Id: <20170904094244.12478-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904075716.6361-1-git@andred.net>
References: <20170904075716.6361-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] curl: enable threaded resolver
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
X-List-Received-Date: Mon, 04 Sep 2017 09:42:46 -0000
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
v2: rename PACKAGECONFIG option from thres to threaded-resolver
---
 meta/recipes-support/curl/curl_7.54.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index f42582a9f0..5c8072fc65 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -20,9 +20,9 @@ SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy zlib"
-PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
-PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver zlib"
+PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver zlib"
 
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
@@ -42,6 +42,7 @@ PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
 PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
+PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
 
-- 
2.14.1


