Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.6598.1610441758215168923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 00:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=Dx3Gye7e;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=63925506f=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610441758; x=1641977758;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=SSjHsKOlbb93H+R7WjioY/o16HGPZBPTbSe++3cUTDE=;
  b=Dx3Gye7eb0l3dyAcNlhtxtsJXOrPASNCxM5j4LmEQAaivbbP2mU3/Ce/
   mjyQy6w4V/4H5rH+Lw6MUFoEc/vofvYQhr2c1Y1ZGXyiJvOP6ufaZucrS
   CoX26EaTQhFXi17IjkCS5ga02FxLkq/hHn7ERtfFEGRkf+iOREwoOWwT7
   Q=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 12 Jan 2021 09:55:55 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
 12 Jan 2021 09:55:55 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb2.muc with ESMTP/TLS; 12 Jan 2021 09:55:54 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.43) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Tue, 12 Jan 2021 09:55:47 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] license_image.bbclass: fix missing recipeinfo on self
Date: Tue, 12 Jan 2021 09:55:33 +0100
Message-ID: <1610441733-384771-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm08j.europe.bmw.corp (160.48.96.38) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Resolve a build bug where image recipes with a do_deploy task will fail.

If the image recipe inheriting license_image.bbclass has a deploy task, then
the function get_deployed_dependencies will add itself to the list of recipes
to get license information for.

However, image recipes don't generally deploy license info so this results in
an error.

File: '/nvme/poky/meta/classes/license_image.bbclass', lineno: 192, function: license_deployed_manifest
...
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/nvme/poky/build/tmp/deploy/licenses/core-image-minimal/recipeinfo'

Add a corner case to exclude the originating image recipe from the list of
dependencies to check.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 119c8df..8fd88cf 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -220,9 +220,10 @@ def get_deployed_dependencies(d):
     deploy = {}
     # Get all the dependencies for the current task (rootfs).
     taskdata = d.getVar("BB_TASKDEPDATA", False)
+    pn = d.getVar("PN", True)
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
-                    if not dep[0].endswith("-native")]))
+                    if not dep[0].endswith("-native") and not dep[0] == pn]))
 
     # To verify what was deployed it checks the rootfs dependencies against
     # the SSTATE_MANIFESTS for "deploy" task.
-- 
2.7.4

