Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id F2B0560167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:53:01 +0000 (UTC)
Received: by widdi4 with SMTP id di4so16760277wid.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ff3ycoxfUQKq6aOHTohZamJqqwh8FKZDookR2radELg=;
	b=lOjZUu9WlOYskZh87sH+OYf6JeQrAz2n3FYdnSGxNy1qA1g+M6uj1mmVRNaTdTy7If
	DzfSt6qQBZltOp7KQ+RhV0em5x2Nhmz33NS9VtlGA0op+DOvtFFuVBUCeSStDJAKkuhw
	VidX5T1+Nvp2Fjw7oU1jsiOCh4OXLbSMyfdY9eqMJ2uVygB9t1w4llcwMhXJNuCdYALk
	kW096IhDcksrCWWWXAIEoW5UrU0K6EgptQHanYqeGRXEDfde2eYyLETn59z7zYrcdwtD
	tRE3dil420pcRevBe3juOkePJ7s6QA8U1HaZsYdSWTwmZOFLhGrumFaP1PdNnhx5gKNJ
	rZUA==
X-Received: by 10.194.79.9 with SMTP id f9mr40310124wjx.20.1429613582306;
	Tue, 21 Apr 2015 03:53:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id g14sm2051965wjs.47.2015.04.21.03.53.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 03:53:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 12:53:01 +0200
Message-Id: <1429613583-15734-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [dizzy][PATCH 1/3] pulseaudio: use stricter PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 21 Apr 2015 10:53:04 -0000

* I don't see any usage for libpulse-* packages
* adding '-' resolves the issue when we have separate recipe for
  pulseaudio-modules-droid which isn't built to satisfy RDEPENDS
  with the same name, because generic pulseaudio recipe seems to
  RPROVIDE it through PACKAGES_DYNAMIC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index db144a9..99cad76 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -79,7 +79,7 @@ PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainl
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
 
-PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
+PACKAGES_DYNAMIC += "^pulseaudio-lib-.* ^pulseaudio-module-.*"
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
-- 
2.3.5


