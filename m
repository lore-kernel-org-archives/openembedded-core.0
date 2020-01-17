Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 25A547FBFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjs1mcjz3w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281281;
	bh=qThq+kRtoE43qZGBiOn6EGUQW56xtLCDoNwKkeuqYS4=;
	h=From:To:Subject:Date:From;
	b=o32XUce7+0kgrmxXqk6fTgrbIfGNd9tQ4c6o8dAkrztjPC31RYmziPUSocNsrHcVv
	4H7tCgpTXJFIOsV2+mnME4CS6TL+bCwQpnlUwmRQk6DJB2G3HM7zvYz70I0i4476sd
	3I91oFfXb+2/mBLfREafuGxYYsvFveVpwbfs4ykWbWjxYTZyF+g8+D6pl2lX6ZQM37
	mqmRMFLehyutquEiC8pozEOENtX/XHmEMMq/1aapIspSJ6CseydIrgk3LIuL1fVKcp
	PRMhyk5w4VznHbZHt6eDpXxNd1OmAKuhGpZiJzk8Kl+Ql8hKNBJFa60c2t+lrf7i7z
	9rEcv1genWI16Q4Fyo7c0S7b0Xlu29z1Q2ahyQWHzaatbaUw1RiNxR+hWHJmYA2KOC
	8jwSbRncnR310XpBhDok+1qara1gkWLjX80lN5ZL6pp55aUTl/6XmTxECigDV0M/1Q
	mJHxVsl1kGROjfqTfL0T67zNMVZQrBfG458woZ7TYd+tb3dWVsSteMEuLqUZ1UbCC5
	HLjsUKVSESYx+wbZTH8qNA01q03Uuylj2J+AdkYgftifG+vFsV8p6m+HSL95s8M+Li
	1N5iyS+zyD4Xso2WBX4kb4TesFhzUcK6sjSjhG5FkFyAiHz90wqySGn/OZMvaSz1Uk
	djkIGELqg/M+HXypdEMRRNhg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:31 +0200
Message-Id: <20200117171436.17131-11-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] nasm: fix CVE-2019-14248
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:40 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:
https://bugzilla.nasm.us/show_bug.cgi?id=3392576

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../nasm/nasm/CVE-2019-14248.patch            | 43 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
new file mode 100644
index 0000000000..d45d2cb465
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
@@ -0,0 +1,43 @@
+From 93d41d82963b2cfd0b24c906f5a8daf53281b559 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 16 Aug 2019 01:12:54 -0700
+Subject: [PATCH] BR 3392576: don't segfault on a bad %pragma limit
+
+Don't segfault on a bad %pragma limit. Instead treat a NULL pointer as
+an empty string.
+
+Reported-by: Ren Kimura <rkx1209dev@gmail.com>
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+
+CVE: CVE-2019-14248
+Upstream-Status: Backport [https://repo.or.cz/nasm.git/commit/93d41d82963b2cfd0b24c906f5a8daf53281b559]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ asm/nasm.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index c84d675..65116ab 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -212,6 +212,11 @@ nasm_set_limit(const char *limit, const char *valstr)
+     bool rn_error;
+     int errlevel;
+ 
++    if (!limit)
++        limit = "";
++    if (!valstr)
++        valstr = "";
++
+     for (i = 0; i <= LIMIT_MAX; i++) {
+         if (!nasm_stricmp(limit, limit_info[i].name))
+             break;
+@@ -204,7 +209,7 @@ nasm_set_limit(const char *limit, const char *valstr)
+             errlevel = ERR_WARNING|ERR_NOFILE|ERR_USAGE;
+         else
+             errlevel = ERR_WARNING|ERR_PASS1|WARN_UNKNOWN_PRAGMA;
+-        nasm_error(errlevel, "unknown limit: `%s'", limit);
++        nasm_error(errlevel, "invalid limit value: `%s'", valstr);
+         return DIRR_ERROR;
+     }
+ 
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index e4f964ce93..bd4ecea8b6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2018-19755.patch \
+           file://CVE-2019-14248.patch \
            "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-- 
2.17.1


