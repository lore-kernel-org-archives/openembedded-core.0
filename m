Return-Path: <yuanxiaofeng@eswincomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433F1C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:42:19 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
 by mx.groups.io with SMTP id smtpd.web10.5579.1739428937427506277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=fail (domain: eswincomputing.com, ip: 52.175.55.52, mailfrom: yuanxiaofeng@eswincomputing.com)
Received: from jackchen-HP-288-Pro-G6-Microtower-PC.eswin.cn (unknown [10.12.192.41])
	by app1 (Coremail) with SMTP id TAJkCgC32xFClK1ny3YLAA--.17880S2;
	Thu, 13 Feb 2025 14:42:10 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: openembedded-core@lists.openembedded.org
Cc: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>,
	Jason Wessel <jason.wessel@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cross-localedef-native : fixup filesystem check error
Date: Thu, 13 Feb 2025 14:42:07 +0800
Message-Id: <20250213064207.2663813-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgC32xFClK1ny3YLAA--.17880S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy8GFyUuw4rWry5KrWDtwb_yoWrKFW5pF
	18Za45WrWxWFn2grsFkFW3Zr1aga9Yy34UWr9Fvw43AF4agrnrKF1fKryY9F15AwsY9a1F
	qF4DKrZ8Wr17uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk214x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211300

compile glibc-locale triger error, the error info
is "cross-localedef-native: /xxx/glibc-locale/2.40+git/
locale-tree/Makefile is on different filesystem than rest
(use -f option to override)." But check the file, find it's
filesystem is same as the rest. Now use the f_type instead of
dev_t to check the filesystem.

Change-Id: I62d840dd74467e8e1afd6e322b05ce012d35458c

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>

CC: Jason Wessel <jason.wessel@windriver.com>
CC: Khem Raj <raj.khem@gmail.com>
Change-Id: I0cf8f143dc4a38fc1835439f4d5e7641832b7a81
---
 .../glibc/cross-localedef-native_2.40.bb      |  1 +
 ...ixup-hardlink-filesystem-check-error.patch | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-localedef-fixup-hardlink-filesystem-check-error.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.40.bb b/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
index fed6e4ea97..15204f3744 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
            file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0001-localedef-fixup-hardlink-filesystem-check-error.patch \
            "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-fixup-hardlink-filesystem-check-error.patch b/meta/recipes-core/glibc/glibc/0001-localedef-fixup-hardlink-filesystem-check-error.patch
new file mode 100644
index 0000000000..a7b3e01259
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-fixup-hardlink-filesystem-check-error.patch
@@ -0,0 +1,78 @@
+From af6fa1c52d1f83f7a16adf6fa6241269e0034b0b Mon Sep 17 00:00:00 2001
+From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
+Date: Thu, 13 Feb 2025 11:46:59 +0800
+Subject: [PATCH] cross-localedef-native : fixup filesystem check error
+
+Since ordinary files and directories within the same
+directory but on the same filesystem may have different dev_t,
+using dev_t to determine whether files (including directories)
+belong to the same file system is unreliable and may lead to
+incorrect results. To address this issue, statfs is used to
+retrieve the filesystem information, allowing the determination
+of whether files belong to the same file system.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
+---
+ locale/programs/cross-localedef-hardlink.c | 32 +++++++++++++---------
+ 1 file changed, 19 insertions(+), 13 deletions(-)
+
+diff --git a/locale/programs/cross-localedef-hardlink.c b/locale/programs/cross-localedef-hardlink.c
+index 726e6dd948..a51f076923 100644
+--- a/locale/programs/cross-localedef-hardlink.c
++++ b/locale/programs/cross-localedef-hardlink.c
+@@ -42,6 +42,7 @@
+ #include "xalloc.h"
+ //#include "nls.h"
+ //#include "closestream.h"
++#include <sys/statfs.h>
+ 
+ #define NHASH   (1<<17)  /* Must be a power of 2! */
+ #define NBUF    64
+@@ -93,6 +94,7 @@ struct hardlink_ctl {
+ 		no_link:1,
+ 		content_only:1,
+ 		force:1;
++	long f_type;
+ };
+ /* ctl is in global scope due use in atexit() */
+ struct hardlink_ctl global_ctl;
+@@ -185,20 +187,24 @@ static void growstr(struct hardlink_dynstr *str, size_t newlen)
+ 
+ static void process_path(struct hardlink_ctl *ctl, const char *name)
+ {
+-	struct stat st, st2, st3;
+-	const size_t namelen = strlen(name);
++        struct stat st, st2, st3;
++        struct statfs stfs;
++        const size_t namelen = strlen(name);
++
++        ctl->nobjects++;
++        if (lstat(name, &st))
++                return;
++        if (statfs(name, &stfs))
++                return;
++
++        if (stfs.f_type != ctl->f_type && !ctl->force) {
++                if (ctl->f_type)
++                        errx(EXIT_FAILURE,
++                             ("%s is on different filesystem than the rest "
++                               "(use -f option to override)."), name);
++                ctl->f_type = stfs.f_type;
++        }
+ 
+-	ctl->nobjects++;
+-	if (lstat(name, &st))
+-		return;
+-
+-	if (st.st_dev != ctl->dev && !ctl->force) {
+-		if (ctl->dev)
+-			errx(EXIT_FAILURE,
+-			     ("%s is on different filesystem than the rest "
+-			       "(use -f option to override)."), name);
+-		ctl->dev = st.st_dev;
+-	}
+ 	if (S_ISDIR(st.st_mode)) {
+ 		struct hardlink_dir *dp = xmalloc(add3(sizeof(*dp), namelen, 1));
+ 		memcpy(dp->name, name, namelen + 1);


