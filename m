Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B41127895B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 19:24:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y31-v6so2601435qty.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 12:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=gWANGvzTEfyURVlyyamCuDQmICGN6kfYf8Hmat+HPsk=;
	b=o+aqKI+fojO/+iFfWoZYwEduzSOEapeNMLBv+LTxeHDXItv4DpeiqxUVwvBTvR27Vr
	G3z9Arkg2s2G/xPLWoxbqye6LvPhUnXUYXToTY5fbEuZhXR+ryMTXKdZ3knV4WKpfR0W
	ISQCKDj4E28uBQtER6Ex0QvLp+XLo3ijitdB3xPxyap6htuNJ3vw8GurNXX1gt0ntka7
	rvl2Gl9j5NYdadIvbMg/RlvJdWmVy0iWHMnX6HxiI24uLLAVCjxZSa6StydVNvQjPDm8
	Qt7zMVCiOGcHupjS/8W/Ifo0ScTHmcRpLoI2UN3rc0NUG12ZkAG9a1GZR34A9rh6s4lX
	DDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=gWANGvzTEfyURVlyyamCuDQmICGN6kfYf8Hmat+HPsk=;
	b=mKSXVOY2gAqJXr66NRqkM2tW+jhbixq/c1t5m0EOyDtCcTqyl3gkBB0XUJW3PCg52x
	KiIycNy1M7YrwX+AJZhTyrRxFRhFVct28dY6bv4SNTWs2tj7cHwlZRWAeqASDVN9FHn7
	MHKpcrB/1NwH10J3DYzhuBhXe6bK10Ts5IwLdVs7XyRPNoj/xbZPG94EFgpkfPaNYDoK
	/4gygzMLatuJkZpGq7W2rNKPm6SSYXPnKfeN8HEeu2vdykkZg9ZXs/JzvVlT1JvPuXiS
	/LgI1IYaLfTfqN6CB4L47ApQXip0Iz2hF5M9xsDXkL0rYbMrUgtIhm4M/3SwpTZRb0q4
	iJ/w==
X-Gm-Message-State: APt69E2wc5ZSaVoZuF22UO/acdUxL/wnnkA6cgzZ68GP1LhvvzlRKI2v
	jH3LzM40SkB6LzhDrz268OiotRyc
X-Google-Smtp-Source: AAOMgpdYRlY5wqCXpmbGRJkA4HcdcY0ISOHzAcXvDHikhlnXtxtVOaKw9pkCfvvHqzH8rxZTgtbOdA==
X-Received: by 2002:a0c:e94e:: with SMTP id
	n14-v6mr16991996qvo.84.1530645897422; 
	Tue, 03 Jul 2018 12:24:57 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm1389730qtf.61.2018.07.03.12.24.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 12:24:56 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 16:24:43 -0300
Message-Id: <20180703192443.1922-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Subject: [rocko][PATCH] busybox: Add patch to ignore -c on umount command
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
X-List-Received-Date: Tue, 03 Jul 2018 19:24:57 -0000

Fix error when umounting filesystem on shutdown with a systemd distro.

See more datails here: [https://github.com/systemd/systemd/issues/7786]

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../busybox/busybox/umount-ignore-c.patch     | 47 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/umount-ignore-c.patch

diff --git a/meta/recipes-core/busybox/busybox/umount-ignore-c.patch b/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
new file mode 100644
index 0000000000..563532bf52
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
@@ -0,0 +1,47 @@
+From d222d23433116088f15b6f9510e42d02744a0de2 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Tue, 3 Jul 2018 14:20:52 -0300
+Subject: [PATCH] umount: ignore -c
+Organization: O.S. Systems Software LTDA.
+
+"-c, --no-canonicalize: Do not canonicalize paths."
+
+As busybox doesn't canonicalize paths in the first place it is safe to ignore
+this option.
+
+See https://github.com/systemd/systemd/issues/7786
+
+Signed-off-by: Shawn Landden <slandden@gmail.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=426134128112738c97a665170b21153ef0764b7d]
+---
+ util-linux/umount.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/util-linux/umount.c b/util-linux/umount.c
+index c6c7441b8..e80266677 100644
+--- a/util-linux/umount.c
++++ b/util-linux/umount.c
+@@ -44,7 +44,7 @@ static struct mntent *getmntent_r(FILE* stream, struct mntent* result,
+ }
+ #endif
+ 
+-/* Ignored: -v -t -i
++/* Ignored: -c -v -t -i
+  * bbox always acts as if -d is present.
+  * -D can be used to suppress it (bbox extension).
+  * Rationale:
+@@ -52,7 +52,7 @@ static struct mntent *getmntent_r(FILE* stream, struct mntent* result,
+  * thus, on many systems, bare umount _does_ drop loop devices.
+  * (2) many users request this feature.
+  */
+-#define OPTION_STRING           "fldDnra" "vt:i"
++#define OPTION_STRING           "fldDnra" "cvt:i"
+ #define OPT_FORCE               (1 << 0) // Same as MNT_FORCE
+ #define OPT_LAZY                (1 << 1) // Same as MNT_DETACH
+ //#define OPT_FREE_LOOP           (1 << 2) // -d is assumed always present
+-- 
+2.18.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 1c8580876a..c5540bf4f0 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -61,6 +61,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-tar-add-IF_FEATURE_-checks.patch \
            file://0001-iproute-support-scope-.-Closes-8561.patch \
            file://0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch \
+           file://umount-ignore-c.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.18.0


