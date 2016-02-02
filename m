Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 25EB477300
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:12:49 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id wg8so135300obc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 14:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Eya7JNW8dStlYPMGoswY6vzHOrhQHhpPSAY8WWiVf78=;
	b=A9NpnvA73FOP+CPgUajdSuaIdeLKg4BrZTRuYzAyU3iQ6Iq5KlU2aOnn8tNj8kXtcG
	2keOFk1SLt7gt/0N03RNeOAdDBKo1PWpuhksPlB5VLhFZDy/bjijqMnivIknP3oh4JGS
	kCZ9uTUUOlt19WK6BCZIwdheZ3d/MxneqsEqIOIA4fwEKPVJvcxcJR+ApSVl8gfhcWjt
	ntc4LkGBFsDL1TsF90rgfphR4Wnj5J/vKfirhPYR+Dch4Cujef8w1+emVxXbxyVvEadk
	iI+DuWdYiOm4yHcKKpb/q+uvy4sIHe6mM5t7GB5V2YtakDVaAJb48Stgj1jIABtl325b
	YV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Eya7JNW8dStlYPMGoswY6vzHOrhQHhpPSAY8WWiVf78=;
	b=OFPX/7XfrWpoJmaxXlgJAzdY44dtHZrNx+DuErIDGiXNwRKropZZpb3lG7Xq/vy1gA
	JZoHVzTgGW4VL6hKIXczhhg91tafDkcKaTIid1j7kDuVBaw2tmsvekBWpprG5Fdggnpa
	0uBVcRqpFz/KJMtKAJkrzKqbzBrq55+FDrBDD8wfqpvUIycV+rE5LhqMZQZJ3ovNtrHm
	kSTgovEFLqVpsAI+qi/VXdQBJt7MO/2zbQXggkBGMeLw1fwYaW80FhGQIyrie65/Vtny
	2og1W6JuWW60t/6S6uHPVL5rAOByEI21roZal3WPyWxY10A9LBMen5w1qF1vqqermfs0
	THuQ==
X-Gm-Message-State: AG10YOTRn+fZ/pkN/Ldmk6cSoyvOPYpxcJFSj3Ihz295SkjutRuKFHKplpNAudU/zO++uA==
X-Received: by 10.182.117.225 with SMTP id kh1mr27446457obb.29.1454451170746; 
	Tue, 02 Feb 2016 14:12:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm1726245obg.1.2016.02.02.14.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 14:12:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:12:33 -0800
Message-Id: <1454451153-19783-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
References: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] gnutls.inc: allow libidn support to be controlled via PACKAGECONFIG
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
X-List-Received-Date: Tue, 02 Feb 2016 22:12:50 -0000

libidn (Internationalized Domain Name support library) may not be
desired in all cases, so add a PACKAGECONFIG option to control it.

Allow --enable-doc, libtasn1 internal -vs- external (still internal
by default) and p11-kit support to be controlled via PACKAGECONFIG
too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 2c6a8da..e7c91eb 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -11,7 +11,7 @@ LICENSE_${PN}-openssl = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-DEPENDS = "nettle gmp libidn virtual/libiconv"
+DEPENDS = "nettle gmp virtual/libiconv"
 DEPENDS_append_libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
@@ -20,20 +20,23 @@ SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "libidn zlib"
 
+PACKAGECONFIG[docs] = "--enable-doc,--disable-doc"
+PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
+PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
+PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
     --disable-crywrap \
+    --disable-libdane \
     --disable-guile \
     --disable-rpath \
     --enable-local-libopts \
     --enable-openssl-compatibility \
-    --with-included-libtasn1 \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-    --without-p11-kit \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
1.9.1


