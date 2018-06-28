Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB8374813
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 17:53:53 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id p4-v6so6587496itf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y5Ho5rkPpIcVzTCcDDZJbR3cZZwJw5iyVyeW6AyypJk=;
	b=HTdPgG1bFscK5ORrqXhEonp3BmdDko1TjbnYkQ5Q69VkO6HBs+BAtlrlRzLtpNfKyj
	xXSiVi1oLK4QnqkqTkmSht5RF+q0lww2Qy7+NyZ10KYgLV9nKF2l10Aar0f0yObQm2Up
	3MYkQHtf/DqVu7k2TWolyv+Rn9u5BAvFh9a3IgWwlawyQ53juYRX/2iSmCAGyNFOkBxM
	XIRFsqN+BJPC78OCRIEXffCHAKj4qHM1qo4R2Y+8gYHGCNq62IRAxC31D94y3INkyl7b
	Cw3JppxOIqTR7TTNAgU2CMcRGlJIQvYVx4kdogaN8uxSmIEnOlgHUJXO3kgJdJD/gQ/f
	0ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y5Ho5rkPpIcVzTCcDDZJbR3cZZwJw5iyVyeW6AyypJk=;
	b=Eruc3ik3NRXlyOW+dMN/WViDtsH5JGgsQvzh9GZEV1Nxoovv29boE6crg84Mk2qr/V
	SlIhbp2AovLzeV7KKEgmpCIDO0PZg6mTMw3gHcF9KFsLX4ITMCBnmNx4wdSJgmtNnWeF
	6j4bhPf/Xk6BUfxXJZ8HKxSEd3Bnw4i7HoC/K3B7zKvuEU0jMdnCO5OwXAa2KErlevij
	RXuDLAbCzcbYUxEvEltQOBLqYiGAbgsbJkqHaf8gaiU8k1ATNCVv/Z2vTlFFXN3oUxZs
	OzztF9jKmOC03Db8mGoULtDZmgou9HZ5C8cFZkeYvU8BKQ96q+sLaPGDBsEcTS/jAQt9
	nAsg==
X-Gm-Message-State: APt69E2ggT2Z//NC/L9f5Y3TU+Fl6GHoz/U8l8TdsHlGBKEjC4XAqCov
	WY0tHhmZuchLp4zgBbI6nK00/Mb9
X-Google-Smtp-Source: AAOMgpeianGkFhd9IJ73CLf27/2leO13DKt4SlCoNtYzhIE3Ag07QMxXTS7gq+hQ41RwON6Xdr0WjQ==
X-Received: by 2002:a24:d3cf:: with SMTP id
	n198-v6mr2477358itg.152.1530208434330; 
	Thu, 28 Jun 2018 10:53:54 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	d202-v6sm4350945itc.30.2018.06.28.10.53.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Jun 2018 10:53:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 12:53:41 -0500
Message-Id: <20180628175342.16560-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] bitbake-bblayers/create: Fix layer name generation
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
X-List-Received-Date: Thu, 28 Jun 2018 17:53:53 -0000

The path to where the layer was being created was taken verbatim as the
name of the layer when generating the layer.conf and README files from
templates. This causes problems in the layer.conf file because it would
result in strangely named variables like

 BBFILE_PATTERN_../my-layer = "..."

Instead of blindly taking the path, use the name of the last component
of the path as the layer name.

Additionally, rework the template files to use python format strings
with named parameters so that the same argument doesn't have to be
repeated multiple times.

[YOCTO #12808]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/bblayers/create.py            |  7 +++++--
 meta/lib/bblayers/templates/README     | 12 ++++++------
 meta/lib/bblayers/templates/layer.conf | 16 ++++++++--------
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index e06949c92b7..2ebf151ad18 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -30,8 +30,10 @@ class CreatePlugin(LayerPlugin):
         conf = os.path.join(layerdir, 'conf')
         bb.utils.mkdirhier(conf)
 
+        layername = os.path.basename(os.path.normpath(args.layerdir))
+
         # Create the README from templates/README
-        readme_template =  read_template('README') % (args.layerdir, args.layerdir, args.layerdir, args.layerdir, args.layerdir, args.layerdir)
+        readme_template =  read_template('README').format(layername=layername)
         readme = os.path.join(layerdir, 'README')
         with open(readme, 'w') as fd:
             fd.write(readme_template)
@@ -47,7 +49,8 @@ class CreatePlugin(LayerPlugin):
         compat = self.tinfoil.config_data.getVar('LAYERSERIES_COMPAT_core') or ""
 
         # Create the layer.conf from templates/layer.conf
-        layerconf_template = read_template('layer.conf') % (args.layerdir, args.layerdir, args.layerdir, args.priority, args.layerdir, args.layerdir, compat)
+        layerconf_template = read_template('layer.conf').format(
+                layername=layername, priority=args.priority, compat=compat)
         layerconf = os.path.join(conf, 'layer.conf')
         with open(layerconf, 'w') as fd:
             fd.write(layerconf_template)
diff --git a/meta/lib/bblayers/templates/README b/meta/lib/bblayers/templates/README
index 5a77f8d3478..fb2d28e1771 100644
--- a/meta/lib/bblayers/templates/README
+++ b/meta/lib/bblayers/templates/README
@@ -1,4 +1,4 @@
-This README file contains information on the contents of the %s layer.
+This README file contains information on the contents of the {layername} layer.
 
 Please see the corresponding sections below for details.
 
@@ -18,7 +18,7 @@ Dependencies
 Patches
 =======
 
-Please submit any patches against the %s layer to the xxxx mailing list (xxxx@zzzz.org)
+Please submit any patches against the {layername} layer to the xxxx mailing list (xxxx@zzzz.org)
 and cc: the maintainer:
 
 Maintainer: XXX YYYYYY <xxx.yyyyyy@zzzzz.com>
@@ -26,16 +26,16 @@ Maintainer: XXX YYYYYY <xxx.yyyyyy@zzzzz.com>
 Table of Contents
 =================
 
-  I. Adding the %s layer to your build
+  I. Adding the {layername} layer to your build
  II. Misc
 
 
-I. Adding the %s layer to your build
+I. Adding the {layername} layer to your build
 =================================================
 
-Run 'bitbake-layers add-layer %s'
+Run 'bitbake-layers add-layer {layername}'
 
 II. Misc
 ========
 
---- replace with specific information about the %s layer ---
+--- replace with specific information about the {layername} layer ---
diff --git a/meta/lib/bblayers/templates/layer.conf b/meta/lib/bblayers/templates/layer.conf
index 49f95cafc82..e2eaff43469 100644
--- a/meta/lib/bblayers/templates/layer.conf
+++ b/meta/lib/bblayers/templates/layer.conf
@@ -1,13 +1,13 @@
 # We have a conf and classes directory, add to BBPATH
-BBPATH .= ":${LAYERDIR}"
+BBPATH .= ":${{LAYERDIR}}"
 
 # We have recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-            ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${{LAYERDIR}}/recipes-*/*/*.bb \
+            ${{LAYERDIR}}/recipes-*/*/*.bbappend"
 
-BBFILE_COLLECTIONS += "%s"
-BBFILE_PATTERN_%s = "^${LAYERDIR}/"
-BBFILE_PRIORITY_%s = "%s"
+BBFILE_COLLECTIONS += "{layername}"
+BBFILE_PATTERN_{layername} = "^${{LAYERDIR}}/"
+BBFILE_PRIORITY_{layername} = "{priority}"
 
-LAYERDEPENDS_%s = "core"
-LAYERSERIES_COMPAT_%s = "%s"
+LAYERDEPENDS_{layername} = "core"
+LAYERSERIES_COMPAT_{layername} = "{compat}"
-- 
2.17.1


