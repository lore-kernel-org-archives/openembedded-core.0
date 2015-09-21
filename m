Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3CA65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 11:22:34 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so114484604pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zPrO4c0PswLQME3q2xewZkmcrivkuUThIBgS/m3PRT4=;
	b=qbNYQeCEdHVesVgX4RI3jRR770vPKhqXbhte08AzbTKRDUB0S2wOvKwAoTSGS827pz
	FL/RSHPdZC/Q6bSQhaP5CHJbbXsA7fE6VS2CRcFikf73VvAgcj564aGPE5UfVczapmrQ
	IQVw7B+44kXU+hU46GsGEXQrJhA8sGTmyNsXGrJGKAXI/EFv3K/YbZJz/MLfNRaxDcmo
	KyHgDgUtBllrOiC/JtDO/fQjtRrSe68suJIVpoX+mPBTV9b2OjIRmzXe8+qnK3B3vYTz
	5PVIhp9b92aKERM8rGIxrlXdN6YNwdEhNUdJ0YH0OXKdjYSqv6UNWEBDj2iuYKxvtt6R
	kEuQ==
X-Received: by 10.68.69.79 with SMTP id c15mr24329662pbu.90.1442834554555;
	Mon, 21 Sep 2015 04:22:34 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	g5sm24090191pat.21.2015.09.21.04.22.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 04:22:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 21:23:44 +1000
Message-Id: <1442834624-25775-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 11:22:34 -0000

This fixes systemd failing to start on Raspberry Pi 2 if it is compiled
with GCC 5.2.

It would try to start "Journal Service" and "udev Kernel Device Manager"
but fail repeatedly.

[YOCTO #8291]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index f7d4c7d..4a19ff4 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -123,6 +123,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
+# disable problematic GCC 5.2 optimizations [YOCTO #8291]
+FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
+
 do_configure_prepend() {
 	export NM="${HOST_PREFIX}gcc-nm"
 	export AR="${HOST_PREFIX}gcc-ar"
-- 
2.5.0


