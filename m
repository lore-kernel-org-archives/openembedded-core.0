Return-Path: <viacheslav.volkov.1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DB6C5472C
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 08:55:41 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.73218.1724748937227789475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 01:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I7ppkKg+;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: viacheslav.volkov.1@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f50966c469so25870031fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724748935; x=1725353735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBqsXlpH5VkL99DDpbo/1XUJrbcgpDGVhL9hYbV2Qsc=;
        b=I7ppkKg+I0zrJe2kVhIFyQ7ynPJEslnu7RAwwp0ijZh5A28H/fW0m/bdvPnLBkio6i
         VQUyN3aK5kx67j/yYSs7/TAlzSzN54qdVnC0N+h/piWY6W2JkQ7S1oUMpoxgtdZX0Z+A
         k62QVssEAQJXDZRf7OOVp6+iGSS10xp3HXj5ST5zglyTaIcTJsfc6aAfs8KB4cC4Vr3s
         M/weX3bT6wBFRyX1uEqMhYhngpSxJ4QOAd/YAWMpuW8I8ZdGS4AqQs2k4SfFAqT2Pa0d
         oqM//tVizLWeIt1Jx+e+qeRIo/Pw7eVAY2eVm2Y+8yAI/LGVZLKU/2jgA1dzKpWohE7D
         6NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748935; x=1725353735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBqsXlpH5VkL99DDpbo/1XUJrbcgpDGVhL9hYbV2Qsc=;
        b=DaxABR7kDp490tFe30w0LxdtfBUzNz1fedSKMmMGfCD5r5I5TuQ3uFyowdSapuD8UD
         4FzvOQ0FpTTJT837M7iCpYp+BP+DDBHhmKQ4X2FkR8Fz+5x0UWfqUEwU0Hu2YUC9KUGb
         ktNuLyDb2XvEM5KU3pwAnibLKE86aTemOe1W9SxDcckAqireOfRDF0E4i9JA0Ypagl82
         evVkjUTZnvmrx+QtD7dLgzFNbBs2SQnXLaf0ko6IB/clc+0EGXjEc89J3SDHzTQslJX8
         XoRBXDNHB8OyBkYkMC8B9JBzBqN0coA5xbGJE7KuCuS/I5hjImMVpYWfXlpOB9m8ZW4t
         403g==
X-Gm-Message-State: AOJu0YwfTsqZLzMBq9hrDc3BOMfSD/vv2+UCO3hASlCw/pFfpDGxAfxZ
	roV/Uy94tmvwMzQS4so6hFl+WL2kc/j+kViGZkCHSnSrV+4WKow/wfrS6A==
X-Google-Smtp-Source: AGHT+IH9LRBEXZRW9bP+gwmoK+D+J4LYLC7RWa06ireT8JyHpfc0jDnKeTO6V5qStgyvUC8bw5eh9Q==
X-Received: by 2002:a2e:4a12:0:b0:2f3:f170:8ec3 with SMTP id 38308e7fff4ca-2f4f5765854mr65927311fa.21.1724748934487;
        Tue, 27 Aug 2024 01:55:34 -0700 (PDT)
Received: from localhost.localdomain ([178.134.179.97])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4815f8sm751865a12.82.2024.08.27.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:55:34 -0700 (PDT)
From: Viacheslav Volkov <viacheslav.volkov.1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Viacheslav Volkov <viacheslav.volkov.1@gmail.com>
Subject: [PATCH] initscripts: make populate-volatile.sh power-cut-save
Date: Tue, 27 Aug 2024 12:55:28 +0400
Message-ID: <20240827085528.53810-1-viacheslav.volkov.1@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 08:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203817

Atomically create files/folders with proper ownership and permissions
in a way that unclean reboots could not lead to any corruption or
inconsistency. See also:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change

This guarantees that in case of a sudden power-cut we either don't have
a destination file/folder at all (in this case it will be handled by
next populate-volatile.sh execution) or have it with correct ownership
and permissions.

Note: we can't use ${TMPROOT} for storing temporary files/folders
because final mv command is guaranteed to be atomic only if both source
and destination are located within the same filesystem.

Other changes:

- Change owner:group for symlinks as requested.

- Wrap in double quotes all values which could have spaces.

- Propagate proper exit code from eval script. This might be useful in
  future e.g. to print a nice error message or propagate an error code
  further down to script caller.
  clean_temp() is executed all the time (on both success and failure)
  but doesn't affect exit code of the eval script (in case of
  chown/chmod failure the exit code will be propagated).

- mk_dir(): never silently create a parent folder if it doesn't exist
  because parent folders in this case might have undesired
  ownership/permissions. For malformed configs like:

        d root root 0750 /grand_parent/parent/me/child none
        d user1 group1 0700 /grand_parent/parent none
        d user2 group2 0777 /grand_parent none

  while processing a first line we'd better not create
  /grand_parent, /grand_parent/parent, /grand_parent/parent/me with
  wrong (default) ownership and permissions. Instead we'd better fail
  to create them at all (it will likely be noticed and fixed).

Signed-off-by: Viacheslav Volkov <viacheslav.volkov.1@gmail.com>
---
 .../initscripts-1.0/populate-volatile.sh      | 76 +++++++++++++++----
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index bc630e871c..c7b95e0540 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -25,24 +25,45 @@ ROOT_DIR="$(echo "$DIRNAME" | sed -ne 's:/etc/.*::p')"
 CFGDIR="${ROOT_DIR}/etc/default/volatiles"
 TMPROOT="${ROOT_DIR}/var/volatile/tmp"
 COREDEF="00_core"
+SUFFIX=".populate-volatile.tmp"
+if [ -z "$ROOT_DIR" ]; then
+	SYNC_CMD="sync" # on target run sync
+else
+	# At rootfs time sync is not required. Moreover sync symlink is not
+	# present in ${TMPDIR}/hosttools directory while building rootfs, hence
+	# attempting to execute sync would cause a silent error (further
+	# commands won't be executed).
+	SYNC_CMD="true"
+fi
 
 [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
 
 create_file() {
-	EXEC=""
+	EXEC="(
+	clean_temp()
+	{
+		rm -rf \"${1}${SUFFIX}\"
+	}
+	trap clean_temp EXIT
+	clean_temp&&
+	"
 	if [ -z "$2" ]; then
 		EXEC="
-		touch \"$1\";
+		${EXEC}
+		touch \"${1}${SUFFIX}\"&&
 		"
 	else
 		EXEC="
-		cp \"$2\" \"$1\";
+		${EXEC}
+		cp \"$2\" \"${1}${SUFFIX}\"&&
 		"
 	fi
 	EXEC="
 	${EXEC}
-	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\";
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" "
+	chown \"${TUSER}:${TGROUP}\" \"${1}${SUFFIX}\"&&
+	chmod \"${TMODE}\" \"${1}${SUFFIX}\"&&
+	$SYNC_CMD \"${1}${SUFFIX}\"&&
+	mv \"${1}${SUFFIX}\" \"$1\")"
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 
@@ -62,10 +83,18 @@ create_file() {
 }
 
 mk_dir() {
-	EXEC="
-	mkdir -p \"$1\";
-	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\";
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" "
+	EXEC="(
+	clean_temp()
+	{
+		rm -rf \"${1}${SUFFIX}\"
+	}
+	trap clean_temp EXIT
+	clean_temp&&
+	mkdir \"${1}${SUFFIX}\"&&
+	chown \"${TUSER}:${TGROUP}\" \"${1}${SUFFIX}\"&&
+	chmod \"${TMODE}\" \"${1}${SUFFIX}\"&&
+	$SYNC_CMD \"${1}${SUFFIX}\"&&
+	mv \"${1}${SUFFIX}\" \"$1\")"
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 	if [ -e "$1" ]; then
@@ -82,20 +111,37 @@ mk_dir() {
 }
 
 link_file() {
-	EXEC="
+	EXEC="(
+	clean_temp()
+	{
+		rm -rf \"${2}${SUFFIX}\"
+	}
+	create_symlink()
+	{
+		ln -sf \"$1\" \"${2}${SUFFIX}\"&&
+		chown -h \"${TUSER}:${TGROUP}\" \"${2}${SUFFIX}\"&&
+		$SYNC_CMD \"${2}${SUFFIX}\"&&
+		mv \"${2}${SUFFIX}\" \"$2\"
+	}
+	trap clean_temp EXIT
+	clean_temp&&
 	if [ -L \"$2\" ]; then
-		[ \"\$(readlink \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
+		if [ \"\$(readlink \"$2\")\" != \"$1\" ]; then
+			rm -f \"$2\"&&
+			create_symlink
+		fi
 	elif [ -d \"$2\" ]; then
 		if awk '\$2 == \"$2\" {exit 1}' /proc/mounts; then
 			cp -a $2/* $1 2>/dev/null;
 			cp -a $2/.[!.]* $1 2>/dev/null;
-			rm -rf \"$2\";
-			ln -sf \"$1\" \"$2\";
+			$SYNC_CMD&&
+			rm -rf \"$2\"&&
+			create_symlink
 		fi
 	else
-		ln -sf \"$1\" \"$2\";
+		create_symlink
 	fi
-        "
+	)"
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
 
-- 
2.45.2


