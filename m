Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEC578238
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:27 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v38so8199081wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vc0XCuUNeYzpc7BGjrjvDtX4bvwfXJXVCm4CrLitkfk=;
	b=lEvkxsqntVg91ReeLJsqeFprnbJHE4vGDdMTaV+eNP8VCCWW6C56SosTX4wFG6FV6G
	YpJv4Wdn8m65HJUBUhV6WNGP10NZsESgQvuw2OIpuAs26kYMbUS31tjUPT8sf/K03AVf
	10yjEwoI7nrj5joCsmTbmTfUYGmuoBV/lx3hJa3NZpaUJGyYz81OCbYopsX/w000JQFq
	pbVKqRI3FAuwsZoA1+GkQ2BbYlNj1ZoIbXofDeD1q0R0viCUl8UCnT5K745J8ucsmUnQ
	NEGolJF40qsIQp9vFz0WEETd0gc3ybtoMPHhqVIEyrZ8Jcjv/77CXXgdD0mDw0ER7hxw
	Rs3Q==
X-Gm-Message-State: AMCzsaUgRyhfiEZJXIsixju7U1uoKyNK3sT/CFhnS+rARPz8HGIpnuL4
	TvHALjkXl8Jtl39vTeFDNF6R6XsC
X-Google-Smtp-Source: AOwi7QDFNARdq1RfSkjaggbc0BszpWvivieCVIQpSQJ4GLdq4sY5ybe1iuKFsi6qlRHf21mhWdtnaA==
X-Received: by 10.223.139.145 with SMTP id o17mr1833510wra.107.1507292008121; 
	Fri, 06 Oct 2017 05:13:28 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:27 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:58 +0100
Message-Id: <20171006121259.5817-17-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 16/17] curl: enable threaded resolver
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:28 -0000
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 41f1e44fce976c4140cda62a41349e91e69d04ef)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-support/curl/curl_7.53.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.53.1.bb b/meta/recipes-support/curl/curl_7.53.1.bb
index bc78ffb07e..a3d7cb949d 100644
--- a/meta/recipes-support/curl/curl_7.53.1.bb
+++ b/meta/recipes-support/curl/curl_7.53.1.bb
@@ -20,9 +20,9 @@ SRC_URI[sha256sum] = "1c7207c06d75e9136a944a2e0528337ce76f15b9ec9ae4bb30d703b59b
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
2.14.2


