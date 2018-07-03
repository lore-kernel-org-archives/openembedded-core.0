Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8543B76070
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 19:26:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l10-v6so2624214qtj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=v57+RPG/EVPwAbxK+jIM41BSK1hlxTzJS+Je8ERkbrE=;
	b=rRD1iLtvO7KgA60tEzaJhW1hyF2xySwB+AszuOugm+N/DPRMmlsGerLc4tJ83eJ7fH
	G/0U7CVMjF7LnQr7HRc7LpHpgIDJvoLQy0C/6td8xDPWs451QjuWsiv8y76nczamxJMg
	tid6c8jFbkjLHJULFYyTnttjtaBx+cezjvC0wK5zbcnWMZAYP/3QTvAddsbEPQYg+eeZ
	Sj631YSNeJ2v1SFCt3FReCxAIhi5iXc7I1nXdYQbhCdzY0OxJ+OQftRb6VjOfPtRf6W1
	sY0/gT40DM2vUr/YGCM8H+vOph33kjz51D+72O8Lq4VPBMgc6zxWfchda0AdSEMq+Hvr
	Va6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=v57+RPG/EVPwAbxK+jIM41BSK1hlxTzJS+Je8ERkbrE=;
	b=NEIHxFk0s0M2hl5AbvioOrnOymkA2Ce18RLFGAI9dssOsGPClm6lt2oqOF98I+9KXX
	ExYXkJcv4OZx6uMG1NigemW6LKpPsRyq99N3OfGTf5Dx5rQB8cLLl+aGVAgi2xd8S0+e
	7vUfS2PVS3OCCDzThapdTVUEMniVQZnlFjucPt35kczAvI8HNkyMl2lwxG9B3TiKx8d8
	7tdgDCdYFYOcUuWuwulbAwlDJ5f9D+aOCKL7rD1Rknk5kecchJNBKXl0zMXIXE+qfJ4J
	VW5NAsMW7PaJVacxYMGB78k+QCoI3GbzrxCbmghVFajvKehTs6PoIZbx3PRpjUIY3VGM
	00/Q==
X-Gm-Message-State: APt69E2EBdDAeOS/rKAKnrbKpc48TWfWVngm6ThnKXn/SXecC05EKjWj
	kWX86eddynUeIcPF7oXwKh1juAro
X-Google-Smtp-Source: AAOMgpdCAIgKs3Z1AP822Fu5vZdnIewc2cih34x4+ewLIBEcPEKTfAVyrelXpxG5hvgk5uP75bwrPA==
X-Received: by 2002:ac8:37c8:: with SMTP id
	e8-v6mr27380028qtc.364.1530645970387; 
	Tue, 03 Jul 2018 12:26:10 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	g67-v6sm1727932qka.21.2018.07.03.12.26.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 12:26:09 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 16:26:00 -0300
Message-Id: <20180703192600.2218-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Subject: [sumo, master][PATCH] busybox: Add patch to ignore -c on umount command
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
X-List-Received-Date: Tue, 03 Jul 2018 19:26:09 -0000

Fix error when umounting filesystem on shutdown with a systemd distro.

See more datails here: [https://github.com/systemd/systemd/issues/7786]

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../busybox/busybox/umount-ignore-c.patch     | 37 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/umount-ignore-c.patch

diff --git a/meta/recipes-core/busybox/busybox/umount-ignore-c.patch b/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
new file mode 100644
index 0000000000..16514200ee
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
@@ -0,0 +1,37 @@
+From 95ea12791c8623bf825bc711ac7790306e7e1adb Mon Sep 17 00:00:00 2001
+From: Shawn Landden <slandden@gmail.com>
+Date: Mon, 8 Jan 2018 13:31:58 +0100
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
+---
+ util-linux/umount.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/util-linux/umount.c b/util-linux/umount.c
+index 0c50dc9ee..0425c5b76 100644
+--- a/util-linux/umount.c
++++ b/util-linux/umount.c
+@@ -68,8 +68,8 @@ static struct mntent *getmntent_r(FILE* stream, struct mntent* result,
+ }
+ #endif
+ 
+-/* ignored: -v -t -i */
+-#define OPTION_STRING           "fldnra" "vt:i"
++/* ignored: -c -v -t -i */
++#define OPTION_STRING           "fldnra" "cvt:i"
+ #define OPT_FORCE               (1 << 0) // Same as MNT_FORCE
+ #define OPT_LAZY                (1 << 1) // Same as MNT_DETACH
+ #define OPT_FREELOOP            (1 << 2)
+-- 
+2.18.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 92678701fc..1ce4823d47 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
            file://busybox-fix-lzma-segfaults.patch \
+           file://umount-ignore-c.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.18.0


