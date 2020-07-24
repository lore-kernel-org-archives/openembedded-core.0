Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.445.1595610747789682915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 10:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=lU9ewdfU;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.221.68, mailfrom: andrei@gherzan.ro)
Received: by mail-wr1-f68.google.com with SMTP id b6so8950769wrs.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C22TucuD2OhdZReT3Dh00Ppc3DdJNC/6lcj9z19rEfU=;
        b=lU9ewdfU0zWSAyj2whar35EIR4Jzl5E6Mu1ZSAcRctSDj2jwFUQ4+Jn++9gCHDKbx4
         0ukGO4IYDGujvE5gd3T41CHOXCLpOJNPpR6FpDLFNyt7UnTH0Ca3gv0DsoNgAsWtJR9p
         A3tDiRQLe9snFerrfS3NYJTe555calOSmsVN1zjDZGkb+Fw222sDR6Lh7gGxGTf5dfh3
         pdP1Z0iOlkyJEFqo7WHlZfGuROV5qfQOy8pSmhODXqsr82nlhFNkT0/IdkbNZq1f/TKO
         Zx90/E+DbpbX6iJ84Mf3cSehecgb1XkpMKs6ri4WTbzBYmzvHB+NYqcsuElFwI+fwi6M
         kvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C22TucuD2OhdZReT3Dh00Ppc3DdJNC/6lcj9z19rEfU=;
        b=TNYteV+hcmnZOy3kSbUI/XoESj1g0SfS4j3JvnWGYDNjnOobvHtL+M2dDpbpWoUKvu
         Qahe/AObOoD3fW6YTNAVpJFOgOXMcNc5ZJoxUeOceJMp/YGOIoMYcJtyaRWxGwO26qwj
         K6KJJyT7z9s3j6ge2qFcjlhmc1MNCa3eNMB0n90Xv2V5PHOufcd215shcsXQm11PLrmu
         r73Pv6fc3EAvqCvelhqp7ff+IClndksDOKz2t7gZHc1ipZRIPxrnKkO3WcfAbp0UGm+2
         t2G4628TcOh+5plYrMICnzgweMK6jH3c1BKrHHCiCQ7U+vdusCKO2Gxk8l6Vs3G64IC4
         eCqg==
X-Gm-Message-State: AOAM532VVCoiSfwIqRGdJONvzLLtL5C/D6K+TDM0e77Lni/jQicc6GMV
	INHZwRJZMzHiW+wKZi2RY0j75ysDV+M=
X-Google-Smtp-Source: ABdhPJwfqxLeeBFghfErDXwv8j+bnr4/euPwCNSMt5nnY3KIlVPLoWdAyj0R9nocjkFR/Tf+wA6uhw==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr9038863wrr.234.1595610745960;
        Fri, 24 Jul 2020 10:12:25 -0700 (PDT)
Return-Path: <andrei@gherzan.ro>
Received: from agherzan-lnxU.hanoverdisplays.com (host109-149-215-13.range109-149.btcentralplus.com. [109.149.215.13])
        by smtp.gmail.com with ESMTPSA id v15sm2016290wrm.23.2020.07.24.10.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 10:12:25 -0700 (PDT)
From: "Andrei Gherzan" <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: [PATCH 2/2] initscripts: Fix populate-volatile.sh bug when file/dir exists
Date: Fri, 24 Jul 2020 18:12:05 +0100
Message-Id: <20200724171205.9871-2-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724171205.9871-1-andrei@gherzan.ro>
References: <20200724171205.9871-1-andrei@gherzan.ro>

The blocks which test for entry exitence (file or directory) use a
`A && B || C` syntax. This form is not behaving as a if-then-else block
even the code logic assumes that. C may run when A is true which breaks
the case where VERBOSE is 'no' but the file/directory exists.

Along with fixing these specific issues, this patch fixes the other
instances where blocks of form `A && B || C` are used as if-then-else.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
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

