Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 76DDF7D7A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PQ1G55z63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234714;
	bh=rc8CGgj0WKRmpv20PRAR1Q4+ILAEpleH38cB+duuzBg=;
	h=From:To:Subject:Date:From;
	b=cQGeufecB1hPty6ykMmDSUEfj0GBdI458m0ddZgxQ4Gnmo6YF7UrZXP65mPbdCeH9
	sZqei2pUmlxXLOwDG5lhEhfeH6KhhTrcyGdmCSY+Ud2Vq5VVta0q+/+K9oP42t++pc
	fGTphEY2tn/P5WM83jnNwwhyQKh/6zIHZJ1t+R4Dd5k8Ic2e2dbGQpHPk6uqkmwrZX
	2k+fdaU9TQJwAJ+9AqPGvezcnhmqa5MTHSYynyBbAI1dfNYmTrwGceFN9//AFO7ABO
	M3Suyy7YnDf3+CJGpbxFD2Km8Nib0Mq+tUfNfERsE/zUR/k2MWbqk+8Pgs3KJK8O5d
	Gx3WfvIcIS6TjdjtdRbeT6TmlD1Io+Aa0xKWwwcY1dQdVNeU459YrwMxdugRD3RIWA
	FuVaZnrAWuoLhz9AjWgppxhqK/n9PZN+rNwbgOzhOqinU02j1Bek03Sv+EpYlt153H
	THSx+nqOCDIlNi3KmfMQoWBVSrDQ4PCykE4thleUJGYmFBCPMQOdAUaswJxOlx0D1F
	epe2I442N8VWmHN2KN5Eu97kwqb6j7xHZ0Lg34SGTBe8TJ050hoAQ1pbrMn+3Hmp27
	anOr3dh0Wp7tn/3ocMcO7cLfKWSiZaFJ/PDh0TO5ALXsaNxw+fz/F+nkzMfyUDHx/1
	8u0AWRyPodgOf3/gUQUBfuNQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:46 +0300
Message-Id: <20190507131151.31070-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mmc-utils: update to the latest upstream code
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
X-List-Received-Date: Tue, 07 May 2019 13:11:54 -0000

mmc-utils doesn't do releases, add the git revision to PV.
Remove patch for an issue now fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...rncpy-with-memmove-on-overlapping-me.patch | 36 -------------------
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
deleted file mode 100644
index 62e25fde9b..0000000000
--- a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 175ac0f362bf6121c3537e2f1760ad41c8f81367 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Mar 2018 01:04:57 -0700
-Subject: [PATCH] lsmmc: replace strncpy with memmove on overlapping memory
- copy
-
-here source and destination addresses are overlapping so using memmove is
-going to be more efficient.
-
-Additionally, the bounded size for copy is overflowing for first copy
-
-In function 'strncpy',
-    inlined from 'read_file' at lsmmc.c:356:3:
-/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/mmc-utils/0.1-r0/recipe-sysroot/usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
-   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
-          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10314723/]
- lsmmc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lsmmc.c b/lsmmc.c
-index c4faa00..bcb854d 100644
---- a/lsmmc.c
-+++ b/lsmmc.c
-@@ -353,7 +353,7 @@ char *read_file(char *name)
- 		line[strlen(line) - 1] = '\0';
- 
- 	while (isspace(line[0]))
--		strncpy(&line[0], &line[1], sizeof(line));
-+		memmove(&line[0], &line[1], sizeof(line)-1);
- 
- 	return strdup(line);
- }
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 37a4755234..f3a7234670 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,12 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b4fe0c8c0e57a74c01755fa9362703b60d7ee49d"
+SRCREV = "aef913e31b659462fe6b9320d241676cba97f67b"
 
-PV = "0.1"
+PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
-           file://0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.17.1


