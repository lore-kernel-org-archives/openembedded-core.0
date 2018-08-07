Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 717E878CA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 13:40:37 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z19-v6so14015840ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OuciqMF6nTZxjaxg7aRdwEVTy8lNbwTtIBoQ0nUIG5g=;
	b=fmbBXHIIjq2seF+r3HUoYmC8RbJwKoWgVXCdAKFFERXqINhL89IaG7fvPjHlw5xXRY
	A442I4OMgbHfDRadgrX1ElQtYw3UhwfgRW+C+X3Q6W14etm99TLSYhLEG/xpmWzEfL1S
	+BiOWx9RayoLd34myjYePxqj9uKQmXhnjVnq4OBU+Z3u/WkSBJKVYbYIaOMf+eM7vM+J
	c1UgMZJ4y3VsgXvxuM5wyyhaqCJj9b0I+kH/efQOvQelhGf0ENdEjoHKGs96i/uBm4Re
	7Vr+3VmQCscSw1dtjOc3H4BmPTjnLU4CaoaXxDVSwf0EId9NHdS1g7GvyQD6zHzaMQap
	kC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OuciqMF6nTZxjaxg7aRdwEVTy8lNbwTtIBoQ0nUIG5g=;
	b=XWhRzam57e/OVvbXqWV68iWkARfrxACuUfCvOtuSDNjdwZjfWhvThumlon+TYz0+KG
	UdhZS60go8Uh5B3I4tigzUL3BASEZH6/8iPTK5z3Nq09CS7Gr2mVU2y9EairIkn5y+zI
	b1bGI9/myx8QbDVQfjB4epgEx/2tuK+E1dZrdKHOOpuAIsZ1FLi91w40+X96nejXTwhy
	gDwP0hFbqSzzElQm2lBzuvLDSn5nlt+l5Z46HiOJo/zS4OY8talkyWplQ08ge691r4O2
	7hmGTME9peq5COSLYS7kLrDShpTqGY9pzaDkyvIemLFkfMuK5rMsZ3nvUongNyZqlYv4
	DofA==
X-Gm-Message-State: AOUpUlHMroU4A1gYIIGdUcGxQMVh+mijI34EAvPy6rbMDePF9MTNc8dR
	oyNG0uzfRzIEdtnvrK3KJs9ij6cd
X-Google-Smtp-Source: AA+uWPxFkuFq50mkiJaChK4Q9Alrwvzt3Qr5uwy42ZHuVBQXG15Y86qBYdZ7sxRWgzwAXoDo9/ccVA==
X-Received: by 2002:a6b:e816:: with SMTP id
	f22-v6mr17417831ioh.4.1533649238198; 
	Tue, 07 Aug 2018 06:40:38 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	c3-v6sm868158itd.8.2018.08.07.06.40.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 06:40:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  7 Aug 2018 08:40:04 -0500
Message-Id: <20180807134004.27653-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [sumo][PATCH] alsa-lib: Cleanup packaging
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
X-List-Received-Date: Tue, 07 Aug 2018 13:40:37 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Cleans up the packaging by moving libasound.so.2 back into the alsa-lib
package which was previously empty.

Previously, it was difficult to create an image that had libasound.so.2,
then create an SDK from that image that had the proper development
files, because the only way to get libasound.so.2 was to do:

 IMAGE_INSTALL += "libasound"

This however caused a problem because all of the development files that
would be desired in the SDK were located in alsa-lib-dev, which wouldn't
be included because alsa-lib wasn't included, and it was impossible to
include alsa-lib because it was an empty package that was culled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30352f3d84344bff8c06625f9674947417f6e8e1)

Change-Id: I2fb065b7e00569ba3a6aac631ac863999455bfb2
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
index c5bf107e5ee..0f1e2db8d7a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
@@ -19,18 +19,17 @@ EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
 
 EXTRA_OECONF += "--disable-python"
 
-PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
-FILES_libasound = "${libdir}/libasound.so.*"
+PACKAGES =+ "alsa-server alsa-conf alsa-doc"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
 
-RDEPENDS_libasound = "alsa-conf"
-
-# alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
-# alsa-lib package doesn't exist. libasound is the real library package.
-RDEPENDS_${PN}-dev = "libasound"
+RDEPENDS_${PN}_class-target = "alsa-conf"
 
 # upgrade path
+RPROVIDES_${PN} = "libasound"
+RREPLACES_${PN} = "libasound"
+RCONFLICTS_${PN} = "libasound"
+
 RPROVIDES_${PN}-dev = "alsa-dev"
 RREPLACES_${PN}-dev = "alsa-dev"
 RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
2.17.1


