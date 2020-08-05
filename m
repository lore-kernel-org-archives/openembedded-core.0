Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.8687.1596639007742756678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d3W5nfeX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id mt12so4639693pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pGB0j65X/AefxL8ybpfswhcAJ7T6oaHyXa39WiYpPCM=;
        b=d3W5nfeXnVsQNXN2u9EgRECsWinEFxB/teyIIqXnaOAbO0ZNyrSgvVZC64cQ1v695x
         UwtQRD9JOoFbz5H+EsgdGzh8ZIFBqWDMw/ehbV/MexXcapUSycl4mZEEfckrIA+NuLds
         BS95XUWl0W/GNc2oeYnDqkm234LAW41TVzOvaQEE7UtnLOze/aT6hmiWdrCv4hLCtAON
         ASivDHAL1B2gmKXxuHPi02wgJVmce3GUc6Wb7o2HjazR4TokSoMHFrrXrd9FZgsmhaxF
         +OX99JDVtRLI68Y9loGvrRKbq7J527Ec5oPIUG6oPDHForu/qfPWBNc7OWLZLSxjx6OJ
         SqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pGB0j65X/AefxL8ybpfswhcAJ7T6oaHyXa39WiYpPCM=;
        b=QSNSAAfF+48LjAuUEAfNI9bCehOz+3DrnFrt/E0G2uFQPdf4bZVr70kDEmUQk+3qws
         W0iWUWINw95i/LMFz33EbLagJwWrrXULiDMU+iNz/ORdli1h+ghL/lpkH7LtbudrXobk
         vNfz9iCqQ8QybS7B7G1O/7XNxZ+hZAxmSG7Akfps7qRObXEq/A7Ir12lE9Qm4YV11guU
         5k5WqRXoUol1J63wJX6poZOxUMgYEcgmDiPv6d4jgS7lHh4xJmNgT7EYw+vwuZ73CyC3
         XKw+y2kt+ZeV1JfxTs9hux3LNh8svKJJ12gNnpYKjBItWGhy67uJPwnh08vt1JHiK9od
         Eq1Q==
X-Gm-Message-State: AOAM531zV8/vY6sSPIL+vsvwvehs274bBCqZ6LTc+Zcd1rlW6RfaG1YM
	AfvH6Qze4+KIFN4s88Ueij2Z4GCNxJw=
X-Google-Smtp-Source: ABdhPJxCDFYVqJsT8yoECNLLsBiLlsfY4ZJ/aodL7/Y9CYc0si5EZ+FwUICJvYSVkG3L6nwI3j0s5A==
X-Received: by 2002:a17:90a:f2d7:: with SMTP id gt23mr3773523pjb.0.1596639006799;
        Wed, 05 Aug 2020 07:50:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 02/11] initscripts: Fix populate-volatile.sh bug when file/dir exists
Date: Wed,  5 Aug 2020 04:49:25 -1000
Message-Id: <471094f8afa57548e9ff3fd7a99306f58b87d478.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

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

