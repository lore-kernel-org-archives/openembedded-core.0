Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 065E77FA15
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 15:36:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so1408456wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2019 07:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fUPVNJkr4HKMZhweuFh2S9cHFSgE99rKWRB3eyA4RcE=;
	b=QD0wKnGmus7LJzzh6xejwt+7HysENt4nTCvZdrnMrLISYISgOHN3F91BD3VQxD2vQ8
	w/TnTVTQGWIimCJPFYKyZ/FUYqKO1MaYHIeW8GZIBB1Vv4N73qVIL+lgXaEVF3MF2QFD
	sdD+LTmRKNNr4QRof4HbdJAuKgvu821lUu77A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fUPVNJkr4HKMZhweuFh2S9cHFSgE99rKWRB3eyA4RcE=;
	b=k+1ezmwXS5PG2uq6rv+xUQJyfMiItubGUCqTjoJFlDs7Q5OlwZ80qF6N9osebm7RXQ
	z7hIFfLXHsnN/r0DH1pIqqhVhCen+jHTzZv+iXoksFnqLqCv/SgQ89H4u33JalaVYtmU
	hjoI3O6Ir0pfGqw1oeC4l0mLLw08u5WqSxdvSjx6beNNi+K6CNm+CoWnx6X9SbILZw6s
	/OO0Cor21AVBt8kYrcehKuyLTso/zuCuNOfL7K27H7D5TsHAxRPy75vC34XskWQw1dMY
	Ag6ihmUKLWDExwaeTUZdYaUNJpwEsEFKahjrXVD08AfMmevItn0B+n6ObIgnrTFlVHed
	BJBg==
X-Gm-Message-State: APjAAAU863ewfYHKgDIpzNLYPC7Qc3eFBSSzLeHHHfcWp7jmxAW27khu
	AQxvVCfiqhCaGr8gxw9vJTTD05aiIWQ=
X-Google-Smtp-Source: APXvYqzI9mSHw+oLT9Osw8ogrTIDt2ohhSTmQBvQ7xJGyqgc4voKhvFb57NNmNhlpqgU+3cW9Uv2Jg==
X-Received: by 2002:a1c:6885:: with SMTP id d127mr12614887wmc.64.1573313761068;
	Sat, 09 Nov 2019 07:36:01 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a5sm9605647wrv.56.2019.11.09.07.35.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 09 Nov 2019 07:36:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Nov 2019 15:35:59 +0000
Message-Id: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Sat, 09 Nov 2019 15:36:01 -0000
Content-Transfer-Encoding: 8bit

Back in 2010[1] we made pseudo statically link against sqlite3. Since then
the world has changed, pseudo now has separate processes for the database
in the server and the client and they have separate linking commands.

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
---
 meta/conf/distro/include/no-static-libs.inc |  4 ----
 meta/recipes-devtools/pseudo/pseudo.inc     | 17 ++---------------
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 4141ecb7654..a3a865cac45 100644
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
index 8b349097263..7ff8e449e9a 100644
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
2.20.1


