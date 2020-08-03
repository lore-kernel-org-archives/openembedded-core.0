Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.12598.1596464844837863357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bC+c9JVq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id j21so1161288pgi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pGB0j65X/AefxL8ybpfswhcAJ7T6oaHyXa39WiYpPCM=;
        b=bC+c9JVqoc4uentWIbijP/6NcHjNLhoGiBNPkhYiWZmKi9vc+Ty3BL0H/Me3i8ss6r
         f1Nls+E6UGmBQBhrq2L7XAYfNkETehoIqLgC8xvz85gl5t4jEqVX7JqQwEx7e77naLKX
         uUY1ftCEeK1GJv/MrualqcJO/zt7KzBFzAjfM1LS2rHf7ITIb35jfJfnOwGSXFrBPymn
         ysuVIEKctXzV43evD9DF16zZRLEQixkcp48FpvwJpPLyDrg5wl11Mcjwe6SBKQxSqACw
         Lwm8ag7HecLwWpNrKVvstJDH/jy61lJH1wvLh3uT0FBL3WAG/V+pUYEytWFsT5oYkzSK
         1eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pGB0j65X/AefxL8ybpfswhcAJ7T6oaHyXa39WiYpPCM=;
        b=Ail/7CYvud2vINzImQxbdcWypVJU8wuusAu21KPTlizTds6aF9cunOw7lK/ivRJRg/
         vgXYMuDuJcakAShf7KUGDUqXmW+TccNSMqdRATjvj1WCuBiN8bYh6NCww2dokma5WHf3
         ZAf9/e8UgYHjDuuQ746uoiKXWyfVU41hyCvoIoRLp7B+gPrlpV0wXQdvIgk3pweNuHAt
         JKBcxbOB5NCAeH1imA8FFIZNixEMKEmeA10mScbRVLGLT+aVtFJpwn0P0Up61zliftup
         g9ulbhvYRqIxnEc3X+fx+B09ckoBC5a8HMCx+nKbnrsjtxO2uLUpwzN7Unkz+r22uaDR
         jbFw==
X-Gm-Message-State: AOAM533FX7a5lumBFQj8LmHiHZUpM99jj1pIOEhOGPCUpju62HbFRKAd
	BqGI422yVeC4hJqN72dYYoBXmua1vVA=
X-Google-Smtp-Source: ABdhPJyradcPcUea9NdNyJIm+etmEn6uDExCwBZtYDlavvQ2q6KpZ6IViauSfKP5TJC+F9lZeEt1Yw==
X-Received: by 2002:a63:e017:: with SMTP id e23mr15029077pgh.125.1596464843882;
        Mon, 03 Aug 2020 07:27:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] initscripts: Fix populate-volatile.sh bug when file/dir exists
Date: Mon,  3 Aug 2020 04:26:54 -1000
Message-Id: <471094f8afa57548e9ff3fd7a99306f58b87d478.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

From: Andrei Gherzan <andrei@gherzan.ro>

The blocks which test for entry exitence (file or directory) use a
`A && B || C` syntax. This form is not behaving as a if-then-else block
even the code logic assumes that. C may run when A is true which breaks
the case where VERBOSE is 'no' but the file/directory exists.

Along with fixing these specific issues, this patch fixes the other
instances where blocks of form `A && B || C` are used as if-then-else.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b9ea22acb66554925720e04cf24100664234574)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initscripts-1.0/populate-volatile.sh      | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 3a265329f0..f21f48dd30 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -26,15 +26,15 @@ COREDEF="00_core"
 
 create_file() {
 	EXEC=""
-	[ -z "$2" ] && {
+	if [ -z "$2" ]; then
 		EXEC="
 		touch \"$1\";
 		"
-	} || {
+	else
 		EXEC="
 		cp \"$2\" \"$1\";
 		"
-	}
+	fi
 	EXEC="
 	${EXEC}
 	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
@@ -42,9 +42,9 @@ create_file() {
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 
-	[ -e "$1" ] && {
+	if [ -e "$1" ]; then
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
-	} || {
+	else
 		if [ -z "$ROOT_DIR" ]; then
 			eval "$EXEC"
 		else
@@ -54,7 +54,7 @@ create_file() {
 			# run on target to set up the correct files and directories.
 			eval "$EXEC" > /dev/null 2>&1
 		fi
-	}
+	fi
 }
 
 mk_dir() {
@@ -64,9 +64,9 @@ mk_dir() {
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
-	[ -e "$1" ] && {
+	if [ -e "$1" ]; then
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
-	} || {
+	else
 		if [ -z "$ROOT_DIR" ]; then
 			eval "$EXEC"
 		else
@@ -74,7 +74,7 @@ mk_dir() {
 			# not be logged.
 			eval "$EXEC" > /dev/null 2>&1
 		fi
-	}
+	fi
 }
 
 link_file() {
@@ -188,13 +188,13 @@ apply_cfgfile() {
 		[ -L "${TNAME}" ] && {
 			[ "${VERBOSE}" != "no" ] && echo "Found link."
 			NEWNAME=$(ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/')
-			echo "${NEWNAME}" | grep -v "^/" >/dev/null && {
+			if echo "${NEWNAME}" | grep -v "^/" >/dev/null; then
 				TNAME="$(echo "${TNAME}" | sed -e 's@\(.*\)/.*@\1@')/${NEWNAME}"
 				[ "${VERBOSE}" != "no" ] && echo "Converted relative linktarget to absolute path -${TNAME}-."
-			} || {
+			else
 				TNAME="${NEWNAME}"
 				[ "${VERBOSE}" != "no" ] && echo "Using absolute link target -${TNAME}-."
-			}
+			fi
 		}
 
 		case "${TTYPE}" in
-- 
2.17.1

