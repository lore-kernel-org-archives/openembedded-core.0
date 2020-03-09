Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB0F61138
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 04:48:26 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a18so3794408pjs.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2020 21:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M5es7RV4SzA9D6vvwoCGDS57d1AImp9FswRJGin4VSM=;
	b=dRIz9bgqvj9slFKW/tRxfnqPx2S4FZ/PI3i/rwVqqVRXWJViOCZXhvo96tALHBUilL
	yWDQQm4Euj+jXkb2JOeSBBkUc9qdzh/L6rHYVQlTpLHgluergcoLJMleiD5eA3bi27iG
	x4ZUAuBvEGujDu/KWDmF8mnTpFjbflBi1cbwlwjYNZlqz2BZNh4wI2qGGJbwgnQ8YkVc
	NK4Lb75NrPmek0QY6SGIqi6ISxY9S6flDFUEp6uDQHvT7LxvyfCy3zm39IRzCGQo2cqo
	BPCMUQTv646zSLjqZvtrK1l0mqv+g5t04c54ZOnvHYlzF76JtAOrJxx02qNzvRzpw/nu
	eQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M5es7RV4SzA9D6vvwoCGDS57d1AImp9FswRJGin4VSM=;
	b=m/AOXj4J7T7WtrxcyQjBw0Euq/Cxo8e0liewOjKwbv6ZKAZN/hBeCnUtIzHhcwZqaO
	JsBaSUH6HUcD5KnaDZnDQOvAo1XBXRjwZGJmhr7CjnY6E7XblRdlANUyM9OFfON6lQht
	Yw4sKwkPR31q3hzvSDSOxoEvTMUOcwtuOxJYvcH/N8izr0GZrG3yt5tctyxb8JMhQnBq
	DhilzdK/C5MhiooHPIl8KCb6HVh0w1e1gIsM4fi3Eq3J6LjuN6/qn8k36MAJ9Cc88Cjr
	E/Yvv+JwUHEoC23oMNl+diZ8739CJ5of2fV77TDSyFjG9kmlT94CQz0CBrzlSXmYe4OK
	jh0Q==
X-Gm-Message-State: ANhLgQ3biuwD+FqTUjvD9DXf8+iQLathh99SBRtZ8TaGc83wV9Hb8xgH
	KPbx9ogb0FjMuRGPGuApTSJ50FPv
X-Google-Smtp-Source: ADFU+vuNPSUMuYgq2wGJfWyKs5S8V/MszYfCb237ZQIMgv2dCPiRRttB4uGxEQ6lyEw7HwNyDv3EFg==
X-Received: by 2002:a17:90b:d83:: with SMTP id
	bg3mr15870132pjb.174.1583729306963; 
	Sun, 08 Mar 2020 21:48:26 -0700 (PDT)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	w76sm25710798pfc.154.2020.03.08.21.48.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 21:48:26 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Mar 2020 21:48:13 -0700
Message-Id: <20200309044813.16015-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] kernel.bbclass: fix SOURCE_DATE_EPOCH for non-git kernel builds
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
X-List-Received-Date: Mon, 09 Mar 2020 04:48:26 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

The source directory is not always a git repository, so when querying
git for data to set SOURCE_DATE_EPOCH, specify ${S}/.git as the git
directory to prevent retrieving incorrect data from any parent directory.

Fixes the following errors with the prior logic when building a kernel
that is not obtained from a git repository:

1. With TMPDIR set to a directory outside any git repository on a
mounted filesystem, reproducible builds fail in do_compile with this git
error:

  fatal: not a git repository (or any parent up to mount point <abspath>)
  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

aborting before the error handling logic.

2. With TMPDIR located within a subdirectory of a git repository, the
SOURCE_DATE_EPOCH timestamp would be that of said repository rather than
that of the kernel.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 meta/classes/kernel.bbclass | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0eadd3efb8..a724645466 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -294,14 +294,10 @@ kernel_do_compile() {
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
 		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			olddir=`pwd`
-			cd ${S}
-			SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
-			# git repo not guaranteed, so fall back to REPRODUCIBLE_TIMESTAMP_ROOTFS
-			if [ $? -ne 0 ]; then
-				SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
-			fi
-			cd $olddir
+			# The source directory is not necessarily a git repository, so we
+			# specify the git-dir to ensure that git does not query a
+			# repository in any parent directory.
+			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
 		fi
 
 		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-- 
2.17.1


