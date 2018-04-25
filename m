Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 256FA72ED9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:06:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o78so7080991wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ylH3UqrIIAbq6LilnGTKetVDGQcEPoQG3L6VEqz9aWE=;
	b=aVa3LQl00DalxnwnrZ5zrrsbBK++/wVj3xd8PCmTR/gEjWkQQsF46W/RD9WI/OZ9MZ
	5qs50Aozd7ZlUJly3yOWID56hrnjQFw8EVgMSFHSangh5meF50hc2k5mQeg1lAycINDb
	jRkl2iCAFHRsdM7ivUzXbKIJ3E/Spx8yNfoFOikCW9WZrAWTYYKk3PXVqz1qRcb4QHXj
	hR1Aj4VDkrInHl4AcWCXJqBvdzB6Ky27tWU73l6zt2WFDwfO97z/A0cujk+6nU3QTUlU
	3lDaCtufdmtt9qrVj+9arynAnwRoXKP9yn39hOKZ3m14uh/W36/YSSKsoI/AgfNF2mQU
	0gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ylH3UqrIIAbq6LilnGTKetVDGQcEPoQG3L6VEqz9aWE=;
	b=chMs33q4aWA3AY5NRpp5n6QYQEFAFvpoA3IUt20pNse79T75hurFoQFLlPBagO9nZY
	91Rd8tlUtu33ybMk0LMmKbwP1gTnXFTsIeUDB28G6AWwPrL2z6GhlYPmsMcEMlyvdWgV
	eTO2H7FIkGxVj9UQKS/s4WezcSdWg8QXQrIg5s9WIyCJiA/AiEUlVTw1B8JDnnvMXdqz
	BZGMJk/MjSzOb3097i+3nTmCf9mcNRCL2phj80qNR8W5dbQMzVxCcxsbjn0UbMYIzHxb
	3DGW0484P9VhkB4FunSOh0zDtiNgA7om+wNUCb7AC+UyEVKCKhxLKwXD1Vtw4S9D0xys
	I3iQ==
X-Gm-Message-State: ALQs6tBTB+KGi1+m/33j6VwDshY+Skra8BI5CqxSRh4dJl2pCfIaOHDB
	G0DyNwwz97xj3wfInSYdJNM=
X-Google-Smtp-Source: AIpwx49BGSNOblfvpfHgCO2vuzxob9EPv0NAx02XaOUHgXd2reVk2Z5c44CtqFnZl8CTRQqWAYbqag==
X-Received: by 10.28.125.66 with SMTP id y63mr13040996wmc.121.1524665220497;
	Wed, 25 Apr 2018 07:07:00 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y9-v6sm15818612wrh.63.2018.04.25.07.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:06:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:06:48 +0000
Message-Id: <e0015cecbf59a896292a98e724acb82925c122b7.1524665112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1524665112.git.Martin.Jansa@gmail.com>
References: <cover.1524665112.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 3/3] test-dependencies.sh: remove /sysroots* between component builds
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
X-List-Received-Date: Wed, 25 Apr 2018 14:07:00 -0000

* glibc is now the only component in morty release which is using TMPDIR/sysroots-components (normally used only after RSS):
  oe-core$ git grep "\${STAGING_DIR}-components"
  meta/recipes-core/glibc/glibc-locale.inc:LOCALETREESRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
  meta/recipes-core/glibc/glibc-mtrace.inc:SRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
  meta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
  meta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
  meta/recipes-core/glibc/glibc-scripts.inc:SRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"

  test-dependencies selective pruning of TMPDIR, deletes sysroots, but not sysroots-components

  which leaves TMPDIR/sysroots-components files from qlibc.do_stash_locale behind and when next build started in the same workspace it failed, because it was trying to overwrite files already there.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index 0b94de8608..3fb74e1762 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -163,7 +163,7 @@ build_every_recipe() {
   fi
   if [ "${TYPE}" != "2" ] ; then
     echo "!!!Removing tmpdir \"$tmpdir\"!!!"
-    rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/dev/null
+    rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots* $tmpdir/work $tmpdir/work-shared 2>/dev/null
   fi
   i=1
   count=`cat $recipes ${OUTPUT1}/failed-recipes.log | sort -u | wc -l`
@@ -185,7 +185,7 @@ build_every_recipe() {
       mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/ok/
     fi
     if [ "${TYPE}" != "2" ] ; then
-      rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/dev/null
+      rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots* $tmpdir/work $tmpdir/work-shared 2>/dev/null
     fi
     i=`expr $i + 1`
   done
-- 
2.17.0


