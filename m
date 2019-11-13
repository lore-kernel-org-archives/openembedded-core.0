Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D37797F68E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:07 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 193so1845931pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XO4XBSYf5Eta+0Mi9Bt4K2thNmOOqWCYvmdMR6KGTYc=;
	b=Okr1u/KD1/bwutHANutNrl3VctpIO/VJQzaBex9bQwrmpvTcNuVTOagrDq7NOlg5cL
	x5L4YLTsGyrVIGgj7jA/dlwIjvPvkn7AvoRhQljBH42ruGOgGqSfR+cd32v051W3AfEy
	hKLSqcK3zEu7fl4YQ8hiUv+O+PqzMLtp/iOIvW37f2t9dV5boiH2lpN06t+nxGIPASRj
	njWK6zfL3EX0gUSMs+x4xF6c7bdrN7SN6re4wTa3MvtjWJtmYew8xQtqACtLCrkJan9u
	MaKzpGWFWqVxFeJl8e0XhWKGaGH9US+ft2CW5Yu4nRKhCZB87DdDvwcgRDLoaEbsd4/n
	tjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XO4XBSYf5Eta+0Mi9Bt4K2thNmOOqWCYvmdMR6KGTYc=;
	b=SrZdgM62hQ2XWtEGTF6B3Vc1sbad+dY/TbXtjha4uOfzGWo0Sgc0P0ZXjAS4KPRdie
	D2Xw6nAB8nkrms9Bgp2rdJ5j58yzXxTE74YZB9jL2WJZuxzeqxX+iE6S+tmmUlW9yUQK
	2HgvNZW74mKwnS95pcGzIbLhrXlinSea1nJ/ED+gMCxNoHn2LQ+wAAKqNVDf0TbDGYSU
	RUIEk5sGRZcAi4BfKasLQ8LNk35D/LjXAFEtWhNy70e7uAyDLm8MxAaAR6uCtzp43PSx
	6OLFZzB8/woPZRQ6JKxRSIiPDpzjmBuWOhE7fcYUkJeaIOCeMjCiQibHHk53zwezy+/0
	9R/Q==
X-Gm-Message-State: APjAAAWXIS/KDwZfzS0VyoSJkhDYEnkE0K8LLb5uga0o0OLymeIZA5LS
	SyFbpjfIOHOLJiAequ+vlYSmg0BJ
X-Google-Smtp-Source: APXvYqwvuQGcp146qjuVLW9duJhIQdLP1y7ZTYtBxt+1IpEA2tFhyc/8u+0f/d9NxUA6v4m1SNkRVg==
X-Received: by 2002:a17:90a:cb8f:: with SMTP id
	a15mr5556141pju.111.1573658408201; 
	Wed, 13 Nov 2019 07:20:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:25 -0800
Message-Id: <c8c13ceafa3b12d2676b86182cb422681d465004.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 22/25] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:08 -0000

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
index 712d858..cabca7e 100644
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


