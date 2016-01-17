Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id BE74176102
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:25 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id ho8so157838747pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rGCqPg+Rp76kQsia0bIMSO83K4ZIeYA/i41tsRi74wY=;
	b=e2zjCQcEKYFjLGVxl4IX6HKO2ACpNFHXjwZwfGVRpsYszvH8WuK8V797FpDy/KBUS2
	HXMfciczIHAjz9bjK0bEeN5/22wsz2boqvMhA5NDZaJrdpZjXJteSFC9f1lExgoAF+/N
	LPzJ5UKbwMBbtCd+YQALMJ+TrO8kakbZOco2SsopQPrJ6JKsF5FLKszhCalnHczefGMK
	gDYb7kByPNEF3dT3xrs4hgrCSGyQ36k2sFjMoLMEo7HNu7c1EpLPhvHl9k6jQ7Xd1dk+
	2E1296g0fIg7+vIpBQ2lpLNniXVSjGv7EOOobUWUMGDZehK26S0rPVlS4EhdQv+Vuuh8
	sv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rGCqPg+Rp76kQsia0bIMSO83K4ZIeYA/i41tsRi74wY=;
	b=D+vF8Lh0tlQ9kuwmJo98kYksSm1wlUijmUk8iQXP47bQjPWYy+rU/8ybOAH/6KBiVS
	6SASOm0wwDwSThTctMsZRNSdFGj/6140gUhVlN+9EC2UEpXKiv6xN4X21D+W6TZzbmMi
	rrCA1Lcdh8WmsD/J3MGv33bZQFl6fOF2cDygAr6jQz2JVrwHUyMSdoV6N+HEgOry22S6
	1oqYHy0XEYXeX785TPchK5sOVok0ky5R76rGGheXlhwWiU7fTNmZOOPdBWOtYty7LNux
	Khhh+IU617yKrK7lQuQWCLvp8/WaOwj1E88m2Sq9kkvt0+8Fcjv1Znf39MFzNsVsUi6j
	6mjg==
X-Gm-Message-State: ALoCoQkq/o6tUUIhc4l3L6yynDl2YNkP3kOd26WqvKFEfjgR7BjwhVJQZNeAX7hOzmwDE2nxJoy5blAAkMQJ8BIZTlSolJUL6Q==
X-Received: by 10.66.235.36 with SMTP id uj4mr28906876pac.85.1453030646154;
	Sun, 17 Jan 2016 03:37:26 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:01 -0800
Message-Id: <5277dc97feef037ef9fcb0859577494c5f817bb4.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 28/73] puzzles: Zero'ise structs before use
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:26 -0000

Fixes build failures with musl where gcc5 flags it used before
initialized.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpiler-errors-about-uninitialized-use-of-.patch | 32 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch b/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
new file mode 100644
index 0000000..0b971c4
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
@@ -0,0 +1,32 @@
+From 78d6d1706c21ad467520075ff7a8bf15cfbd68b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 22:13:16 +0000
+Subject: [PATCH] rect: Fix compiler errors about uninitialized use of
+ variables
+
+error: 'r2.x' may be used uninitialized in this function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ rect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/rect.c b/rect.c
+index 55667c0..fa3a786 100644
+--- a/rect.c
++++ b/rect.c
+@@ -1317,7 +1317,8 @@ static char *new_game_desc(const game_params *params_in, random_state *rs,
+                     if (ndirs > 0) {
+                         int which, dir;
+                         struct rect r1, r2;
+-
++                        memset(&r1, 0, sizeof(struct rect));
++                        memset(&r2, 0, sizeof(struct rect));
+                         which = random_upto(rs, ndirs);
+                         dir = dirs[which];
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 1e3bac7..9c8170c 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
+           file://0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch \
 "
 SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
 PE = "1"
-- 
2.7.0


