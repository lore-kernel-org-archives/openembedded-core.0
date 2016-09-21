Return-Path: <sujith.h@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B20E4605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:42:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l132so7551905wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=He2lstHCD0fOdOjB41tJ9vUVsG99DsAAih+ksrzkyWk=;
	b=qCsnbVrbT/6XB2bDXYMy+kBShe5JkgycbdjLMCuS+DOk7ECSVa2OXysRPxppgL1CSW
	ganAE2noddlTxzZH5koppeIIGHnTN4y+WjW/x1Tbqw7zdiRHVVVD61UqIpoakhk8Loxt
	WdRt/6j7RyvAbWnBxw4KFpBFF81waEYVX50qzVLosGwT4zpGZDG+Ic8wm3Fv+8pqRZXU
	eJe9iq3HFiJdgq8wB/+Gj7Cr8w9SEcL1o3HOrm90Y8WuE+uxoevbow0o8XaSFoG4Y1fN
	EztwvGgl/SIwdOaBriV2q8vM+IGTRwZmxpw7oy4ACxFD7xHgTUDZe/bCsuin0E+gIcjA
	WZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=He2lstHCD0fOdOjB41tJ9vUVsG99DsAAih+ksrzkyWk=;
	b=IhqtWYRiaMiXl5hJhXj+AWozFazOFm77AicuSTvZxFA6w19ja0lqu4DXpMJalmxioY
	JJklG6/XO6nuJF3/8hqBcgYD4nzL/3nyH+AGwWT21tbvQw1okvXpFjlDb6x7MtwfKHPG
	8Tjro4uTkv1qiAoy/IIsx1RykPvRYhvoPvVNPnRuTYsREnVk8XuO1B0wNx+RjWWDK4fT
	RADaWMP/9x06uMf1HjU1Ib5UV4+CQrLDNwdU8rAlFfH9e+ZToonKHcu4k3mmOlOhmVQX
	t+LSdpTJNasm2f3Fv5YEZY+/APMI231vllz3uuStWD+mbJJib5XsbNf9k2hgnK0BU7bE
	o/CA==
X-Gm-Message-State: AE9vXwNsTDDtLN1BMWd+tLsjWsxwEWkmaPaHjE40+Fe+dJGBLy7jEyCiH3pcYq19FkLqYA==
X-Received: by 10.194.85.45 with SMTP id e13mr31785557wjz.5.1474450970400;
	Wed, 21 Sep 2016 02:42:50 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	au10sm32651593wjc.12.2016.09.21.02.42.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Sep 2016 02:42:49 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 15:12:43 +0530
Message-Id: <1474450963-4114-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>
Subject: [PATCH] x264: add textrel to INSANE_SKIP
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
X-List-Received-Date: Wed, 21 Sep 2016 09:42:50 -0000

From: Fahad Usman <fahad_usman@mentor.com>

Tried by adding CFLAGS_append = " -fpic " to
the recipe. But that couldn't help resolve the
warning message:

x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-split/x264/usr/lib/libx264.so.144' has relocations in .text [textrel]

It was found that this warning is emitted because of the
assembly files in the source code. And it is not easy to
get rid of TEXTREL's which are coming from the assembly
source files.

Adding textrel to INSANE_SKIP resolves this issue.
This issue was observed in cyclone5 and imx6qsabresd BSP's.
So generalizing the patch.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index fa44f9c..393310f 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -48,6 +48,6 @@ do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-# PIC can't be enabled for 32-bit x86
-INSANE_SKIP_${PN}_append_x86 = " textrel"
+# PIC can't be enabled for few BSP's
+INSANE_SKIP_${PN}_append = " textrel"
 
-- 
1.9.1


