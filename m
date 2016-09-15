Return-Path: <sujith.h@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D187736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 06:52:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b187so5581100wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7EecVgSQXcW3NoSy3KLfYRiCvvFZpAld9xbAHP9WLKg=;
	b=xSqdelfC9hgq4mLIyr7QQcIQVM1gJhkpjS842gtsARkUhN0EiSreNCp6KCX/vKqgRC
	jvq50Afk0XR1NGKLDAnso47XKUvptz1+9pSeYIgZmzqRYOrbT+pddqfDN97MMya7uDOp
	L8++B4gxQ5T0MdjZv3TU/FGh1XwV32igqvHDnesoaAiqzHvINj+iVlXFvb+rKoh3abU0
	Z63bb21VtBSe1EIQ3AyN9BljQkkkTpAlhpyGCHDb0MqPIZ36iql4sKl8LqkTEiLPyEDp
	At7u2d1hDD7XeIvXS3ZeyUlq3mwedbM0KvWmMTGHk++IuLJLXZEZ9rTLmMVhP47sr957
	pcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7EecVgSQXcW3NoSy3KLfYRiCvvFZpAld9xbAHP9WLKg=;
	b=gradtbxVTiEIcjBUMp+rhXhijz5f4vUAzA9/pqijkW50HB7rb7F/gGXXEn7rD7GBlB
	QvC3hE2OmAQ7HiuLHV4YVak+IiTkGRwG4eog7/ASGMwLfltsc1WH+qrv8EoU3WBhuaS5
	s9oqe1sSaQw+Dz37ObnT6rd37wqNypiIvkpyoanCpeQlgvBz+YjNPWO6NrrykQY8dhPn
	LW2IdUtoNbfFN3+qqf1tcDS3fEldtGxs2D2CB4Fy8rRGVuDkFKK99HWsPr+B08yeYfXY
	urD6OHaPeMqGstR3NMmO5CycKX/1XNQLP512DlgxLJ0a45PjvCpFmYF7YCl76RF6+TPh
	wFpQ==
X-Gm-Message-State: AE9vXwOdilTSgFHVHbuQylbdxPosDuK4KOfmRifq4APdgOwymNv4CXdsi3ksMB5BzHiXEQ==
X-Received: by 10.194.243.10 with SMTP id wu10mr6265812wjc.130.1473922377560; 
	Wed, 14 Sep 2016 23:52:57 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	v189sm929136wmv.12.2016.09.14.23.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 23:52:56 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 12:22:50 +0530
Message-Id: <1473922370-4325-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>
Subject: [PATCH] x264: add textrel to INSANE_SKIP to skip the warning
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
X-List-Received-Date: Thu, 15 Sep 2016 06:53:00 -0000

From: Fahad Usman <fahad_usman@mentor.com>

This change help fix the warning message:

x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-split/x264/usr/lib/libx264.so.144' has relocations in .text [textrel]

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


