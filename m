Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82FEC43219
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:10 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.3866.1668003664081068602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C+u8MAsB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id b21so17216595plc.9
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERXAnz2QpNpSVSB/oMF0se4GfG3/Q8TlLcnTdX3OqZA=;
        b=C+u8MAsBZ3SdK5dcoXgdqKznpw4pOqDdAqInuRAH02NEhCPjyYokmbc2WtV+AiZtAC
         lEfwGBDkhZf5NelHZt5KgYq8lwU2aSijJ9GsPk2IdiSKlPTym2v5zG2YbmI5OOz9eZ3j
         1ni/5SALvUjp0mgUs8RIM9Iy/SwWfIQqoynMucoXU2K812guWK8kzbGfuf/Ii/eG4ens
         h9tpJIL0lfvk0x5dv7GyZ3J85YiDCXbcd7v5GdR4/6dOM/MpYzzE0C9u/5Rj/UohIMgG
         LwpEQJukEIENp4vhHG3084C0XyayndapmHJHoKL/0OzUZhZ9/ZczIRO1A8pAbxECwwq6
         VgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERXAnz2QpNpSVSB/oMF0se4GfG3/Q8TlLcnTdX3OqZA=;
        b=K8ps6BBSVn3ozgJ6HnYHJDdeIlap4oyg0WWadlGdLu1JSfHvI1SsAbOnoDqimNnOxE
         czF9GqLAgmAz7oIZqEMG4wkv4sP/O/AZntGIgrwo0khxVX3FcsCVz0VooN9N/AsXD6Aa
         5ZYrrmJr0DOU1hQbJ5gXFR86fV1wdeKjVnwWRGROWZPId6Meq2tZuyDCER+txxEe62EI
         ZObIo/estBBUUM1rHMfndldSB+5LsM3BB6yUIfFx6cq1+/CcqkmFnx0/rontS1RzaJWa
         yLSSymuMuq5s5Lonxf55uGO0bqDgSOKO5EM4YHf2+uh5dE1pZqyX8QWVHk73nJuIW2VF
         7iYA==
X-Gm-Message-State: ACrzQf22BQsd8TjT11wrU+gntDL+xBZtDEuDauctlVzR3kItd4+BUTDz
	VrcbB+su85ZA+Ctk4uO6qotbl1oe3aTDzZdS
X-Google-Smtp-Source: AMsMyM7cZu8WGYNqnfQbaK8qwwB4PIaVCz7//42h57FPBGbIP6zafB9zW7+qazSC+WLP9pqiZdaR0Q==
X-Received: by 2002:a17:90b:1c8c:b0:203:89fb:ba79 with SMTP id oo12-20020a17090b1c8c00b0020389fbba79mr79957537pjb.92.1668003662994;
        Wed, 09 Nov 2022 06:21:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:21:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/10] quilt: backport a patch to address grep 3.8 failures
Date: Wed,  9 Nov 2022 04:20:37 -1000
Message-Id: <a46aad035d800193b740bad2431ce30fae736a23.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173026

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b5001af5c711a373bd2f1ea108c8b597dd40faca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


