Return-Path: <sstncr@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6EC7882D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 14:39:38 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y26so5386884pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 06:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PsIhrO2IQfSnfUPFGzvlhWQKTLhLKitrnojZISQZ3CE=;
	b=WICKEfAEEY4VI7dw9064gnQz5fbQEPxubTbv4Cc5F8wJc155RnbEYAfJDHe/1zwB33
	6JqxIlDG49SGSYrRCvdllrPVaQymxiofOmceshKO+0x+yauHzwt2LGaY4Ewu9XTuUAiV
	zkfJDGRFNqtfMxLiOBJ6WWhRjr2Z2+ILq1tuo7ewG02eAeEwq+xxCQvrCObY4j7PXFCt
	TtacTEu/B/cObeVyyQxHfr8fz61qw1Zq8OP8TBp8XGPIcrKK0LVLHALZKtFIE/TcQmNY
	yAVjJM4SxGHd1Q+cjmnrtos1+DWag+LsSmI4OaTqfj4CQI8n+aSEBSFWWp+spMPwowW6
	7DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PsIhrO2IQfSnfUPFGzvlhWQKTLhLKitrnojZISQZ3CE=;
	b=copEtyUf8iZkpYItUGlvPwk3Kc+vRj7zgq2C/kTbFGaNM26FCDBZkSgpgxlais5+Cp
	YCikQwRK7AC8cBmRYgTBMa6Z1K53tMk2RP/8bbS17tC/iBcbGM1aHItlZi5vopA6PDYx
	mLJkc8Y1GnzAdIbCJMy9Rsv4fpLWjcwR7+l+WhMe+sZ3pmpj9z9+4XMka4/bIIC4HsSv
	g9fDOvvy/NZdzruLxZ/u/yTh+Rs8YfD4+Jv35Qht8sI7GHM0wn3OcMzSOli+uiKuaC3B
	qV7EnbUDHDRutSUatJNNiB8WUT/DdwIu5WJDJIUAqg23gWKruM3x7K9rMtuSG36BZqAm
	L2KA==
X-Gm-Message-State: AKwxytdkQf6EufIY3WP5Gcuu2S0TYSVOkCa36MI1eQT9quLbQbIfrCxr
	BWRZcGYhr405fEVnMyscXOyb4CLK
X-Google-Smtp-Source: AH8x2258isNSLMH/BGFVZEmaNS+tM43exlStZBK19NNjRQGS1DMC9rDHa0Ne7VmWCzUSaaWcL0zKZA==
X-Received: by 10.98.87.2 with SMTP id l2mr26654454pfb.46.1517236779466;
	Mon, 29 Jan 2018 06:39:39 -0800 (PST)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	v9sm33072726pfj.88.2018.01.29.06.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 06:39:39 -0800 (PST)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:39:28 +0000
Message-Id: <1517236768-28816-1-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Mon, 29 Jan 2018 14:39:38 -0000

do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run, since
do_unpack gets removed by when externalsrc is enabled.

This was hidden because externalsrc does actually run do_fetch and do_unpack if
there are type=kmeta or file:// entries in the SRC_URI value of the kernel recipe.
(which is the case for linux-yocto).

Make this a separate task so that it actually gets run for kernel recipes with
no file:// or type=kmeta in SRC_URI.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f8318b8..3f2d796 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -102,7 +102,7 @@ inherit ${KERNEL_CLASSES}
 # the symlink.
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
-base_do_unpack_append () {
+python do_symlink_staging_dir () {
     s = d.getVar("S", True)
     if s[-1] == '/':
         # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
@@ -119,6 +119,7 @@ base_do_unpack_append () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
+addtask do_symlink_staging_dir after do_unpack before do_patch do_configure
 
 inherit kernel-arch deploy
 
-- 
2.7.4


