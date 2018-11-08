Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 916F27BD60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 16:15:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u13-v6so1745124wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 08:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8jEL3iBLolVABb4TevmNfIiD1RGRYyR7/1lvUy/5JOI=;
	b=SV83XACD/amxpSJYWKspefctpyObIP8YcLOgC23oVV9FX0E2hvMwaS7F9dG8c033nr
	9XpXZJbhdYwCHmvyhTbhAsh5euPnczBV1bgu2s9uz4yX237YHVnDzQt6Fipy8aL/eax/
	brErmQPVJ/ZZTyOrljJPoARc2DDiF930VNsCK9uDYNrLh9bEbPZZzcJemZfsBhyHE1JL
	RABvQr+pwT4l6JAt4U18y67AznUkvrSWXzCHA70R5pOmqknkOFYmzaO0rpXg7TU9F5SG
	I5OG+d8unkKh4CwGcJWygWEjjgYwKHXJLRELdwNerI9U4q2N3onbr7TS+NaicTr9cyfc
	I92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=8jEL3iBLolVABb4TevmNfIiD1RGRYyR7/1lvUy/5JOI=;
	b=rcT8JJe6WOzLcyGPnU2ai2oUJu59guutnLxxX9mi3oYk6CPMplsqNgoLFwUoIQa0BZ
	i1gTaDu7x703wbuJyYkoW/bfvQKaHPKQraClV4jQAXao4IIT0pDOvCQAw6LCAeUEzvn0
	uRvBFrisJOV+V4eQ/aeSSfNoF7/KF2Ry4Pcnq0NnthSexnveHOi/1VxpEBKjoHCUwof6
	ekeserJHhWMY6YIba1DnN9iQ3lnIANxHnJlrZgnNcsbZxii0Ih1MYzzmYP4qWXdZbcJx
	3aEMTeBnrUefTUS7bIBXbCRh/qX9NaTYYxXYJtZvGnrN0a2h3I+wnMufUErEmCZTjwEd
	FLMQ==
X-Gm-Message-State: AGRZ1gJ4lSZedAZxS0wsmx1MSFwu5DhH2w/KqfrpIMXVDtTmWHZpj2XY
	gp7PssuicpezCFFiZZpIdksjn9rH
X-Google-Smtp-Source: AJdET5c80C1AbA68imIe9xLYNewWopaEj5CGE590qf90Rt5lrLaX5jZv9pU1sTpGpPMpxDKD+Q9vHQ==
X-Received: by 2002:a1c:970e:: with SMTP id
	z14-v6mr1767787wmd.100.1541693729209; 
	Thu, 08 Nov 2018 08:15:29 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	t129-v6sm6685747wmd.14.2018.11.08.08.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 08:15:27 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 17:14:52 +0100
Message-Id: <20181108161452.11592-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181108161452.11592-1-sno@netbsd.org>
References: <20181108161452.11592-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH 2/2] pseudo: fix link with new sqlite3
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
X-List-Received-Date: Thu, 08 Nov 2018 16:15:29 -0000

If sqlite3 is built with FTS5 it uses log() from libm, it sqlite3 is built
with READLINE it uses tgetent from a curses lib and readline from libreadline,
if it is built using deflate from libz ... , but all that linkage is lost
if we manually statically link so explicitely extract extra static linking
options from pkg-config and force them into pseudo as well.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index cdc2a5823f..8b05735bb1 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -17,7 +17,7 @@ PROVIDES += "virtual/fakeroot"
 
 MAKEOPTS = ""
 
-inherit siteinfo
+inherit siteinfo pkgconfig
 
 do_configure () {
 	:
@@ -30,10 +30,23 @@ PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-ep
 
 # Compile for the local machine arch...
 do_compile () {
+        SQLITE_LDADD='$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a'
+	for sqlite_link_opt in $(pkg-config sqlite3 --libs --static)
+	do
+	    case "$sqlite_link_opt" in
+	    -lsqlite3)
+		;;
+	    -l*)
+		SQLITE_LDADD="${SQLITE_LDADD} ${sqlite_link_opt}"
+		;;
+	    *)
+		;;
+	    esac
+	done
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
 	else
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
-- 
2.17.1


