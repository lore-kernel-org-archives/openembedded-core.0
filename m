Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 64AF26B076
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 15so9955962pgh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9f3OA5SKlEkJ1qM1OTghRZWcKpAMEMOD/ZtYk/DpPrI=;
	b=skzU+aPuzdziLkgONcrV+c+FZYT2orTyvS1QXCc0bnvbRygKTWxtlldAX2jT5dpOom
	07q+T6/Gr3/k2VknAsaiBG4TRD5gxQgsS2zzSiEP6qb5KA/p0p5BaL+v0aEhUI9OME38
	+57AOloUitbmRZH0KFExCeFB7Y6cDFyddbk4KQYSY4pvA4AMMheArP58eo4C68DZCOIo
	aC5dLZw0zJel5FXHBSiOEaUE8Nm/TjXV5oOmECDooY7vXBGtcOniR9RYtN7KYofV2knP
	72HyLnm/x2kSBrsx2dyGQEHTek+PXiKFZvtKwcnvuSuBvVZfx3iK1dBydcRLQPS7A9VH
	7Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9f3OA5SKlEkJ1qM1OTghRZWcKpAMEMOD/ZtYk/DpPrI=;
	b=goePL2TsYcH+J9hdPadet98bwp1RRgedHb6pqbU2RerGuBTgEHVV+gV2XETaTUAfiO
	bBeUy80gh8iOvfok7/o5RROEmK3qo3/3wMrugesOcW+Bl/N9VyxIsHTJmsEBKSwQlUyH
	3l40oubxb/ZIAuwRcx/PcryIadsjTyknw2PUUAw1zQ1DaKC5+S06HgUIHIUx+s22j3ad
	ZR6Oh0Dej6n8ITrz1G0mv2qmmRNQrcEfwiM6dtyKKkt/HRDiYvS2hFt6RHVylPD60kbS
	pwikGhMj6t4boOISM7P6qqqOS7j4bg5KE79jfcVtBuh0Vgw90ykXLBnkIYcq5wuVU5ke
	QmAw==
X-Gm-Message-State: APjAAAWQgqDM2geIXefizdMo33Uodf3xUEe+jU0mULEsAIA+6ZLGIorU
	tFWdpcGsZEZBb1rRPwkqrlQw9XXn
X-Google-Smtp-Source: APXvYqxAKTVEY10pJdZVG94VfmjqpUqDkjQlPAWX0W9SAJJaNmn3DTvpKaaS6w5csuOPcMPq6l5xdQ==
X-Received: by 2002:aa7:930c:: with SMTP id 12mr31754962pfj.33.1573497009851; 
	Mon, 11 Nov 2019 10:30:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:43 -0800
Message-Id: <664c8f9837db7b20ff540d5f6373e4ae0f2b4b02.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 01/21] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Back in 2010[1] we made pseudo statically link against sqlite3. Since then
the world has changed, pseudo now has separate processes for the database
in the server and the client and they have separate linking commands.

Also, whilst there were concerns about needing specific versions of sqlite3,
in the OE environment, this is always the case.

[1] http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ad0ac0ecd38fc77daf42485489fccc10a5e1e3e7

The static sqlite3-native is causing us problems, in particular:

tmp/work/x86_64-linux/pseudo-native/1.9.0+gitAUTOINC+060058bb29-r0/recipe-sysroot-native/usr/lib/libsqlite3.a(sqlite3.o):(.data.rel+0xb0): undefined reference to `fcntl64'

which occurs if sqlite3-native was built on a machine with glibc 2.28 or later
and pseudo-native is being built on glibc before that. With dyanmical linking,
libc is backwards compatible and works but with static linking it does not.

There appears to be no easy way to avoid this other than adding a copy of
sqlite3 into the pseudo recipe. Given the static linking doesn't seem to
be required any longer due to the separate processes, drop that to fix
those issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/no-static-libs.inc |  4 ----
 meta/recipes-devtools/pseudo/pseudo.inc     | 17 ++---------------
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 4141ecb..a3a865c 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -15,10 +15,6 @@ DISABLE_STATIC_pn-nativesdk-libcap = ""
 DISABLE_STATIC_pn-libpcap = ""
 # needed by gdb
 DISABLE_STATIC_pn-readline = ""
-# needed by pseudo
-DISABLE_STATIC_pn-sqlite3 = ""
-DISABLE_STATIC_pn-sqlite3-native = ""
-DISABLE_STATIC_pn-nativesdk-sqlite3 = ""
 # openjade/sgml-common have build issues without static libs
 DISABLE_STATIC_pn-sgml-common-native = ""
 DISABLE_STATIC_pn-openjade-native = ""
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 8b34909..7ff8e44 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -30,23 +30,10 @@ PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-ep
 
 # Compile for the local machine arch...
 do_compile () {
-        SQLITE_LDADD='$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a'
-	for sqlite_link_opt in $(pkg-config sqlite3 --libs --static)
-	do
-	    case "$sqlite_link_opt" in
-	    -lsqlite3)
-		;;
-	    -l*)
-		SQLITE_LDADD="${SQLITE_LDADD} ${sqlite_link_opt}"
-		;;
-	    *)
-		;;
-	    esac
-	done
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
 	else
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
-- 
2.7.4


