Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3940E606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 15:38:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y69so3488400pfb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pqo8crvBXmIcNI9q1aCohBCm1GcfAordr6lBogglrF8=;
	b=XFTTDMEYWDAq3QY96gYffuvKPW0FHab+lI80af0FsA2y1tf3oKBeVpXCeltw3jpa2z
	4m38W42XFqugREyduq/QB/uP3/NAj+0qD97P9QbaB3U3xm2Rc9pdyHbIjMLi/naauv15
	ZAHrZsjaSSZf/UkwHNnv73mVO6NE99EI2C7AtYfzK9bJNURFi7Q8OT3vOtRBhd0QJWpq
	OgQ5Xb7rDyqD5mDQCUrbpf0XX2rjGAkZjvsRAgGartyPVbN3peyYXGzOaKu48EP2eqTA
	htUITdPySotkrqrSqJoCEX55roKPxvIIuBt0ZdI3Px4ktqkjtnn5IAm+0y4HgQqsn8GS
	ecAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pqo8crvBXmIcNI9q1aCohBCm1GcfAordr6lBogglrF8=;
	b=flQs07fbiVU8Vea/k/fJ7dK8XDEGzWFLnTJUOtxDKqD404417viS7oh9ldmUH+YV/D
	TlOnKkS7Tf+9CiyXeO1tiC2ZP7vdDoUKQUr7g3h3FdRg9pFyceiy+ZoiVvdzsKvDwyR6
	8w1nP4N5rW7V6q6G7P7A/RHthHgJd+iYKfnwdW4ZUp/tNEfGP8f6PsI5w5RH1aetkwtP
	ICxJ0kWwPJc5B72TDEPwT01bjzI3KfTmmuRiLwiCiwrD8cRxhxFHcdk80uvylBVqCAdO
	H+Y0jVDH8BpOxDbXhVUq/eV1sdXR8H81DVen4TZLuOBdfMVJm3OTLBPv3ECO476cuB59
	qLZQ==
X-Gm-Message-State: AElRT7FlkfKEiZzgl/4CyZ1cIm4oxSY8Kf03jSeKyVBMqMh4ODTh1dGU
	Pj3qBUugCpVk/2AIuosjS8BesA==
X-Google-Smtp-Source: AIpwx49aKJ7hBZlGs44cpL/LpnNZTynQgyoZpanTxArTJKsImXtheUrfWGC+ew2gVny2XhSRL/L+BA==
X-Received: by 10.101.74.82 with SMTP id a18mr5906910pgu.312.1522337916123;
	Thu, 29 Mar 2018 08:38:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	j83sm3276370pfe.178.2018.03.29.08.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Mar 2018 08:38:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 08:38:28 -0700
Message-Id: <20180329153828.6523-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH V2] mmc-utils: Fix string overflow error
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
X-List-Received-Date: Thu, 29 Mar 2018 15:38:35 -0000

The SRCREV change bring another patch from upstream

b4fe0c8 fix ENH_START_ADDR overflow

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1->v2:
- Add missing patch

 ...ce-strncpy-with-memmove-on-overlapping-me.patch | 36 ++++++++++++++++++++++
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |  6 ++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
new file mode 100644
index 0000000000..62e25fde9b
--- /dev/null
+++ b/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
@@ -0,0 +1,36 @@
+From 175ac0f362bf6121c3537e2f1760ad41c8f81367 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Mar 2018 01:04:57 -0700
+Subject: [PATCH] lsmmc: replace strncpy with memmove on overlapping memory
+ copy
+
+here source and destination addresses are overlapping so using memmove is
+going to be more efficient.
+
+Additionally, the bounded size for copy is overflowing for first copy
+
+In function 'strncpy',
+    inlined from 'read_file' at lsmmc.c:356:3:
+/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/mmc-utils/0.1-r0/recipe-sysroot/usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
+   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
+          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10314723/]
+ lsmmc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsmmc.c b/lsmmc.c
+index c4faa00..bcb854d 100644
+--- a/lsmmc.c
++++ b/lsmmc.c
+@@ -353,7 +353,7 @@ char *read_file(char *name)
+ 		line[strlen(line) - 1] = '\0';
+ 
+ 	while (isspace(line[0]))
+-		strncpy(&line[0], &line[1], sizeof(line));
++		memmove(&line[0], &line[1], sizeof(line)-1);
+ 
+ 	return strdup(line);
+ }
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 8977a87962..37a4755234 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,11 +4,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "7bcad171173fd9a9401e7ce81906605bd6f4eddc"
+SRCREV = "b4fe0c8c0e57a74c01755fa9362703b60d7ee49d"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
+           file://0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch \
+           "
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.16.3


