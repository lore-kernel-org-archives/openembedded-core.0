Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1957FFA3742
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:50 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.2184.1666901799678684685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cnuqSDj+;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y12so4764279edc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38/+OQlQ6F5+oA1kjlknng8t6r6wgvXGEx+X7k8VOaM=;
        b=cnuqSDj+IWzSaZBSUVeiCmkE90tOBrld2KDJ3IDB0dcLvczFhnQVtiA34xmmEmnViZ
         PMQi0kNtNfSIcQBkuO04eIruVM2HjEQsvvRPTbc6kOWaqRBA07M8QJ1zhBaIKKyt8zoG
         M3hzZ+Mkuuct6SNUXbk4gJlSqa/LDvMPhoZraJTawCGmPg5LV7i2oshTLLfKZQ7K3AB+
         H5d3vEqFB1Dn83ncH6GDbmXlsTM23MEU3WOdKfM06x2+sjRysytqR1lcV/8xMiJGsnJe
         P9pRZzoZfW3w2IJqAulPXV/mBbhN+acQcQuNbseDq0UlgamCaEeYdfhbshVORpe0vczb
         XkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38/+OQlQ6F5+oA1kjlknng8t6r6wgvXGEx+X7k8VOaM=;
        b=XIUqRJ0FpqQ7YPCH82giOTJUY2M9jzadio3gRKSU8r7o45AS/x8G++YVL/mNiIZZ5a
         5Z1PfmNvfU8mhedQsuaZ4rsmPMIgrOT6sXh5hqIw6oXoH6v3XY+JFkXlMtT/4mp7RVDC
         RKBBVR868YgslwpA1Gs5/hwzbxbGq+8KzEnsiywIbM2H0Odhkl0otFWiFvby8hkM8cdC
         1Ih2u8KzOL+VfYrL/YVdb38eJhqXiXfKXpmy+h8aJYi2zOL3xj8kt5J3Mdcomkc3oSLB
         dnI09ZWdKDjHd5b6H9OGjfQTzIPPW2S0vU+eXS0ighClX5pJtiq66TeG/YDvaE9vu8GG
         xhKw==
X-Gm-Message-State: ACrzQf3XCxzGsDyVDbAowM4MvjSuS7m15jv3HVscV6mLwV8r5SsIVa76
	CJtv73F9W9dYZENGAVjW5qkoLMFJN2dcNQ==
X-Google-Smtp-Source: AMsMyM5TJ/UV0LAwHFMMFevZTTNSybCwX3tXi8yy9EmayjR7hQqDbk/AdCTFkIIBRSmHscKs5LetTg==
X-Received: by 2002:a50:eb83:0:b0:462:a2ac:8623 with SMTP id y3-20020a50eb83000000b00462a2ac8623mr3700908edr.360.1666901798099;
        Thu, 27 Oct 2022 13:16:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/23] quilt: backport a patch to address grep 3.8 failures
Date: Thu, 27 Oct 2022 22:16:10 +0200
Message-Id: <20221027201611.3644334-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172225

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 07611e6d85..ec69705093 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -12,6 +12,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://Makefile \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
+        file://fix-grep-3.8.patch \
 "
 
 SRC_URI:append:class-target = " file://gnu_patch_test_fix_target.patch"
diff --git a/meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch b/meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
new file mode 100644
index 0000000000..68a4b4c195
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
@@ -0,0 +1,144 @@
+From f73f8d7f71de2878d3f92881a5fcb8eafd78cb5f Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Fri, 9 Sep 2022 10:10:37 +0200
+Subject: Avoid warnings with grep 3.8
+
+GNU grep version 3.8 became more strict about needless quoting in
+patterns. We have one occurrence of that in quilt, where "/"
+characters are being quoted by default. There are cases where they
+indeed need to be quoted (typically when used in a sed s/// command)
+but most of the time they do not, and this results in the following
+warning:
+
+grep: warning: stray \ before /
+
+So rename quote_bre() to quote_sed_re(), and introduce
+quote_grep_re() which does not quote "/".
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/quilt.git/commit/?id=f73f8d7f71de2878d3f92881a5fcb8eafd78cb5f]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ quilt/diff.in             |  2 +-
+ quilt/patches.in          |  2 +-
+ quilt/scripts/patchfns.in | 20 +++++++++++++-------
+ quilt/upgrade.in          |  4 ++--
+ 4 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/quilt/diff.in b/quilt/diff.in
+index e90dc33..07788ff 100644
+--- a/quilt/diff.in
++++ b/quilt/diff.in
+@@ -255,7 +255,7 @@ then
+ 	# Add all files in the snapshot into the file list (they may all
+ 	# have changed).
+ 	files=( $(find $QUILT_PC/$snap_subdir -type f \
+-		  | sed -e "s/^$(quote_bre $QUILT_PC/$snap_subdir/)//" \
++		  | sed -e "s/^$(quote_sed_re $QUILT_PC/$snap_subdir/)//" \
+ 		  | sort) )
+ 	printf "%s\n" "${files[@]}" >&4
+ 	unset files
+diff --git a/quilt/patches.in b/quilt/patches.in
+index bb17a46..eac45a9 100644
+--- a/quilt/patches.in
++++ b/quilt/patches.in
+@@ -60,7 +60,7 @@ scan_unapplied()
+ 	# Quote each file name only once
+ 	for file in "${opt_files[@]}"
+ 	do
+-		files_bre[${#files_bre[@]}]=$(quote_bre "$file")
++		files_bre[${#files_bre[@]}]=$(quote_grep_re "$file")
+ 	done
+ 
+ 	# "Or" all files in a single pattern
+diff --git a/quilt/scripts/patchfns.in b/quilt/scripts/patchfns.in
+index c2d5f9d..1bd7233 100644
+--- a/quilt/scripts/patchfns.in
++++ b/quilt/scripts/patchfns.in
+@@ -78,8 +78,14 @@ array_join()
+ 	done
+ }
+ 
+-# Quote a string for use in a basic regular expression.
+-quote_bre()
++# Quote a string for use in a regular expression for a grep pattern.
++quote_grep_re()
++{
++	echo "$1" | sed -e 's:\([][^$.*\\]\):\\\1:g'
++}
++
++# Quote a string for use in a regular expression for a sed s/// command.
++quote_sed_re()
+ {
+ 	echo "$1" | sed -e 's:\([][^$/.*\\]\):\\\1:g'
+ }
+@@ -215,7 +221,7 @@ patch_in_series()
+ 
+ 	if [ -e "$SERIES" ]
+ 	then
+-		grep -q "^$(quote_bre $patch)\([ \t]\|$\)" "$SERIES"
++		grep -q "^$(quote_grep_re $patch)\([ \t]\|$\)" "$SERIES"
+ 	else
+ 		return 1
+ 	fi
+@@ -365,7 +371,7 @@ is_applied()
+ {
+ 	local patch=$1
+ 	[ -e $DB ] || return 1
+-	grep -q "^$(quote_bre $patch)\$" $DB
++	grep -q "^$(quote_grep_re $patch)\$" $DB
+ }
+ 
+ applied_patches()
+@@ -465,7 +471,7 @@ remove_from_db()
+ 	local tmpfile
+ 	if tmpfile=$(gen_tempfile)
+ 	then
+-		grep -v "^$(quote_bre $patch)\$" $DB > $tmpfile
++		grep -v "^$(quote_grep_re $patch)\$" $DB > $tmpfile
+ 		cat $tmpfile > $DB
+ 		rm -f $tmpfile
+ 		[ -s $DB ] || rm -f $DB
+@@ -520,7 +526,7 @@ find_patch()
+ 		fi
+ 
+ 		local patch=${1#$SUBDIR_DOWN$QUILT_PATCHES/}
+-		local bre=$(quote_bre "$patch")
++		local bre=$(quote_sed_re "$patch")
+ 		set -- $(sed -e "/^$bre\(\|\.patch\|\.diff\?\)\(\|\.gz\|\.bz2\|\.xz\|\.lzma\|\.lz\)\([ "$'\t'"]\|$\)/!d" \
+ 			       -e 's/[ '$'\t''].*//' "$SERIES")
+ 		if [ $# -eq 1 ]
+@@ -631,7 +637,7 @@ files_in_patch()
+ 	then
+ 		find "$path" -type f \
+ 			       -a ! -path "$(quote_glob "$path")/.timestamp" |
+-		sed -e "s/$(quote_bre "$path")\///"
++		sed -e "s/$(quote_sed_re "$path")\///"
+ 	fi
+ }
+ 
+diff --git a/quilt/upgrade.in b/quilt/upgrade.in
+index dbf7d05..866aa33 100644
+--- a/quilt/upgrade.in
++++ b/quilt/upgrade.in
+@@ -74,7 +74,7 @@ printf $"Converting meta-data to version %s\n" "$DB_VERSION"
+ 
+ for patch in $(applied_patches)
+ do
+-	proper_name="$(grep "^$(quote_bre $patch)"'\(\|\.patch\|\.diff?\)\(\|\.gz\|\.bz2\)\([ \t]\|$\)' $SERIES)"
++	proper_name="$(grep "^$(quote_grep_re $patch)"'\(\|\.patch\|\.diff?\)\(\|\.gz\|\.bz2\)\([ \t]\|$\)' $SERIES)"
+ 	proper_name=${proper_name#$QUILT_PATCHES/}
+ 	proper_name=${proper_name%% *}
+ 	if [ -z "$proper_name" ]
+@@ -84,7 +84,7 @@ do
+ 	fi
+ 
+ 	if [ "$patch" != "$proper_name" -a -d $QUILT_PC/$patch ] \
+-	   && grep -q "^$(quote_bre $patch)\$" \
++	   && grep -q "^$(quote_grep_re $patch)\$" \
+ 		   $QUILT_PC/applied-patches
+ 	then
+ 		mv $QUILT_PC/$patch $QUILT_PC/$proper_name \
+-- 
+cgit v1.1
+
-- 
2.30.2


