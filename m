Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 52A607FBDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjt2n0Bz6m
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281282;
	bh=efXC+8QLdDE8bP0Qi4Au5dGKyq4R//3u3OncyFq0Wd8=;
	h=From:To:Subject:Date:From;
	b=V8m20Mq/qWnD6zwcV+UYQwWPtfZvtuFwrdjm37DS1Zyj8XpcWhAyrQeDaZ0qAAW81
	He5biTXGfLpW+OZg59sObT/SU7qLOM2x5M+HiHW1P0XkwYvZZKx0aotoMzVTONZF1y
	0EE4sM5NF2dvWsTjZDAUdwxSERShumWNHx2RQsrhQkQKZQFisVOIVKgI2iN938qXrs
	JENMceq6ufcQ5q0Feu6Fx+f4P/zgl8ZHbcMOqA70v30+RS1a8OrKIOcvPa+8uNf9Qr
	k2SFIIdzIeZDOVJithgMNksraaOCCMnIxx+OzaRYaJfo05eTVhdmW4rZSF9tLywzaJ
	ljuVQwoHSA6JOecdlfTRCrAaxXoXN7DJz3AUKg2lpL6pmRY44cxPJ3nnDH7yNjJF2N
	h8llUADKF/wNq7fgbpU8n7WtQNDYNyH9FtlxJZtdEpiDtMrSPUc7W8dcWjDuVIICW0
	qceEC4AQaadD2FFTumfm9q1p3u0gjnC53AqSTQ/XFJJINkC9tzeR30eXb0VGQAKhY3
	BbFl3oRjvCQj3u2VzeGWBl9Jkkx96bU1sDbZr6X40Fg9zi5seEfiGoKI23rUpcLJV1
	YPMnpIBsUHEVguc05m+XpQ6Y2mke3QSqkTz+PUbj8gLXfkFSoNNjNAKglLEgfXBuhz
	hxZj58wqAW7O3jzV30G50D38=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:34 +0200
Message-Id: <20200117171436.17131-14-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] sysstat: fix CVE-2019-19725
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:41 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../sysstat/sysstat/CVE-2019-19725.patch      | 28 +++++++++++++++++++
 .../sysstat/sysstat_12.1.3.bb                 |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
new file mode 100644
index 0000000000..2aa12724f8
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
@@ -0,0 +1,28 @@
+From a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed Mon Sep 17 00:00:00 2001
+From: Sebastien GODARD <sysstat@users.noreply.github.com>
+Date: Mon, 9 Dec 2019 17:54:07 +0100
+Subject: [PATCH] Fix #242: Double free in check_file_actlst()
+
+Avoid freeing buffer() twice.
+
+Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed]
+CVE: CVE-2019-19725
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ sa_common.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sa_common.c b/sa_common.c
+index cf52aefe..856a3715 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -2153,6 +2153,7 @@ void check_file_actlst(int *ifd, char *dfile, struct activity *act[], uint64_t f
+ 	}
+ 
+ 	free(buffer);
++	buffer = NULL;
+ 
+ 	/* Check that at least one activity selected by the user is available in file */
+ 	for (i = 0; i < NR_ACT; i++) {
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb b/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
index 5daf3f45f5..1b552166b0 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
@@ -2,7 +2,9 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
+            file://CVE-2019-19725.patch \
+"
 
 SRC_URI[md5sum] = "0f9b73f60aba6fd49de346bc384902c3"
 SRC_URI[sha256sum] = "55498bf82755ba9fed3e7df61fd26f8f50dd3e7b3b229c731029a4c8ab51a1aa"
-- 
2.17.1


