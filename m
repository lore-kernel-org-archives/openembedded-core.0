Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE04CC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:16:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.15396.1664306181627304629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=JklkAm1b;
 spf=pass (domain: qtec.com, ip: 209.85.167.54, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f54.google.com with SMTP id j16so17182109lfg.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RSSdFwNTwRMID74ezWsGLFF/wj9ohnAohWrLC6TzlJo=;
        b=JklkAm1bkKPx2yhQTTiE3f3BeqLQWUcMocAJbNJ3RbREZxW4Ubbz+dzZ1Zd/fRgEEM
         4PW4+bUDiu/FqMGZur0BQhp7Z7uPsKoNZ04GzYbQKlcXK1M7BCLS9If45dkqtxS12irC
         IgeJeU0oB3xzfOf1lYBLFGQ2HwgwcQNCE7zHO1NPewwj2LH1SlmMF6HFKBB/9k1Lqfn2
         W6GbBm5dl32rIQ0RMIQc3PkaazXHUoRb71UWJXjFTXDfiQgj1tplvi2SJmgFd5t2acPl
         NeNnSLs/dIZq4EPvYaPofS2X/jHDFLRLtMGPKQlYZMRn15l0igXT9uf/fUPDfFMp+zBk
         YZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RSSdFwNTwRMID74ezWsGLFF/wj9ohnAohWrLC6TzlJo=;
        b=MxZ+DWYbAl/n1+AcuzzWpK5Mr8elxpNmag/Iqc/OCGfkYs93WIJZkYC1EmqfAeXGy4
         j/K+MxRFsnw1e3tXr4NqxbMxC7NK0EBwaskQ9YGdbfyBM16GjznD+23Qp/Yy4fJNifWa
         ujcNIuLTtg4U265GiqEBtxeI5R6ecUvSzSKd4IWxF5i40ifNJR5+hy52Bh44Q9+rilYn
         OPJfPPohIqahvApGKCS58Z5won3zH6COCqCypOaXW+UMiyyAGC06mlIaw8mDD7Ny4BS6
         y6S9B3POZs7TzGPrZcjpg2IkZs7JzGgSKBDrVoJ/jGwLtbWMvoBLqDbWpDbxS1r6Qgal
         8Lfg==
X-Gm-Message-State: ACrzQf3QOKU06nwPSFO/DhHmOQxdZ4zaHm8rXebmM9OFSHvSab5+ke5S
	rCzEoSydc8naDanYamhvHr0ZL07bYsnGcqbZbu47/ipCsMPZhNuJPxhV5gnkMVd3NPk72wZr09x
	cESgZp73DCykgOqhkocfAg/yZ7xlINSwuHrzJceWMSior0bErrek9zJv4TFvYxOAh+Ew3oyJ2IJ
	iq7Vo1IWHG9MA/
X-Google-Smtp-Source: 
 AMsMyM6YH6qwIUFDh2bFcTsOFqgLkcmIjaa6dgzI2W9Epv4qF6laz3FUIrzY2v6jnkn1SlbAdUkoFg==
X-Received: by 2002:a05:6512:1102:b0:49f:cf25:df93 with SMTP id
 l2-20020a056512110200b0049fcf25df93mr12506828lfg.318.1664306178614;
        Tue, 27 Sep 2022 12:16:18 -0700 (PDT)
Received: from localhost.localdomain (188-177-43-54-cable.dk.customer.tdc.net.
 [188.177.43.54])
        by smtp.gmail.com with ESMTPSA id
 w14-20020a05651234ce00b0049d3614463dsm244211lfr.77.2022.09.27.12.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:16:18 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [RFC][OE-core][PATCH] bbfileconfig: Add class support
Date: Tue, 27 Sep 2022 21:16:06 +0200
Message-Id: <20220927191606.748540-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:16:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171126

Add support for the class 'BBFILECONFIG' which allows to select
the recipes for a given layer.

Example: 'Enable' python3-colorlog recipe from meta-python.

INHERIT += "bbfileconfig"
BBFILECONFIG_meta-python += "python3-colorlog"

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

Hi,

We have developed the 'BBFILECONFIG' class in order to be able to select
the recipes we want to parse in an allow list manner. Its meant to
control whether a recipe (bb) file from a specic layer is picked to be
parsed or not. Similar to the PACKAGECONFIG for packages inside recipes
(hence the BBFILECONFIG name).

When handling multiple metadata sources it easily becomes huge to build a
full distro ('world'). Current methods (AFAIK) only allows to
block/disallow recipe files with BBMASK.

Note: BBFILES_DYNAMIC does part of the job but different use-case.

Could this make sense to upstream? Perhaps there is a better/cleaner way
of doing this?

We are currently using this with a reduction of 40k -> 20k packages (per
machine). Of course, the class only parses the bb files (and therfore the number
of packages to be created) for the recipes we don't want them to be part of
our custom distro. This helps us to reduce build times while using directly
upstream layers without the need of copying/forking the recipes files
in internal layers.

Few extra notes:

1. The class does not handle depencencies. If a recipe is added to the
list, the developer should also add manually its depencencies in
their respective BBFILECONFIG_<layer>.

2. When multiple recipe files share a common name, some 'unclaimed' recipes
will be added too. Example: In meta-openembedded/meta-python we have:
python3-pybind11_2.10.0.bb and python3-pybind11-json_0.2.11.bb. If one
wants to add only the first one, the recipe name should be suffixed with
'_': BBFILECONFIG_meta-python = "python3-pybind11_"

Unfortunately, if the recipe does not follow <recipe>_<version/git>.bb
filename pattern but instead uses <recipe>.bb there would be no way to
filter out a second recipe sharing the same recipe name. However, this
is perhaps not the recommended way to name a recipe. Is it correct?

3. This class would require the following bitbake patch. Embedding
it here as part of the RFC for reference.

diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index 32a529f0..645c59f7 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -1796,6 +1796,15 @@ class CookerExit(bb.event.Event):
         bb.event.Event.__init__(self)


+class CookerStarted(bb.event.Event):
+    """
+    Notify clients of the Cooker started
+    """
+
+    def __init__(self):
+        bb.event.Event.__init__(self)
+
+
 class CookerCollectFiles(object):
     def __init__(self, priorities, mc=''):
         self.mc = mc
@@ -1834,6 +1843,7 @@ class CookerCollectFiles(object):

     def collect_bbfiles(self, config, eventdata):
         """Collect all available .bb build files"""
+        bb.event.fire(CookerStarted(), eventdata)
         masked = 0

         collectlog.debug("collecting .bb files")


 meta/classes/bbfileconfig.bbclass | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 meta/classes/bbfileconfig.bbclass

diff --git a/meta/classes/bbfileconfig.bbclass b/meta/classes/bbfileconfig.bbclass
new file mode 100644
index 0000000000..4582fd6eb8
--- /dev/null
+++ b/meta/classes/bbfileconfig.bbclass
@@ -0,0 +1,73 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Author: Daniel Gomez <daniel@qtec.com>
+#
+# This class allows to select recipe files on a per-layer basis for global
+# parsing and world target.
+#
+# It adds the ability to parse individual recipes from a specific layer from the
+# a configuration file.
+#
+# Usage: add INHERIT += "bbfileconfig" to the local.conf configuration file
+# and add BBFILECONFIG variable to a configuration file (e.g. conf/layer.conf)
+# to be able to perform individual recipe file selection. Must be suffixed with
+# the name of the layer (e.g. BBFILECONFIG_core).
+#
+# Example: Assuming meta-skeleton is part of the BBLAYERS, enable the bbfileconfig
+# to parse only the libxpm recipe
+# (meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb).
+#
+# INHERIT += "bbfileconfig"
+# BBFILECONFIG_skeleton = "libxpm"
+
+# Default space-separated list of recipe files to be removed from BBFILES
+BBFILECONFIG_REMOVE_DIRS ?= "\
+    recipes*/*/*.bb \
+    recipes*/*/*.bbappend \
+    recipes-*/*/*.bb \
+    recipes-*/*/*.bbappend \
+"
+
+# Default space-separated list of recipe files dirnames prefixes to be appended
+# to the selected layer
+BBFILECONFIG_BBFILES_DIRS ?= "recipes-*/*"
+
+# BBFILE selector handler executed at CookerStarted event:
+# 1. Get layer collections from BBFILE_COLLECTIONS.
+# 2. For each active collection (BBFILECONFIG_<layer> is initialized), removed
+#    dirs listed in BBFILECONFIG_REMOVE_DIRS from the BBFILES variable.
+# 3. For each collection, get the recipe name files from BBFILECONFIG and
+#    append them to the BBFILES as bb and bbappend files.
+python bbsel_handler () {
+    import bb.cooker
+    if isinstance(e, bb.cooker.CookerStarted):
+        collections = d.getVar('BBFILE_COLLECTIONS').split()
+        # For each collection layer with BBFILECONFIG enabled, remove the
+        # BBFILES layer directory and add only the selected recipes.
+        for c in collections:
+            cdir = d.getVar('BBFILE_PATTERN_%s' % c).replace("^/", "/")
+            cbb = d.getVar('BBFILECONFIG_%s' % c)
+            # If BBFILECONFIG_<layer> is initialized but empty, LAYERDIR
+            # will be removed from BBFILES and no recipe will be added.
+            rdirs = None
+            if cbb is not None:
+                rdirs = d.getVar('BBFILECONFIG_REMOVE_DIRS_%s' % c)
+                if not rdirs:
+                  rdirs = d.getVar('BBFILECONFIG_REMOVE_DIRS')
+                adirs = d.getVar('BBFILECONFIG_REMOVE_BBFILES_%s' % c)
+                if not adirs:
+                  adirs = d.getVar('BBFILECONFIG_BBFILES_DIRS')
+                for r in rdirs.split():
+                    rbbdir = cdir + r
+                    d.setVar('BBFILES:remove', "%s" % (rbbdir))
+                    bb.debug(1, "Layer %s directory '%s' added to the BBFILES removal list." % (c, rbbdir))
+                for s in cbb.split():
+                    for adir in adirs.split():
+                        bbdir = cdir + adir + "/" + s
+                        d.appendVar('BBFILES', " %s*.bb %s*.bbappend " % (bbdir, bbdir))
+                        bb.debug(1, "Recipe file '%s' directories '%s*.bb' and '%s*.bbappend' added to the BBFILES list." % (s, bbdir, bbdir))
+}
+
+addhandler bbsel_handler
+bbsel_handler[eventmask] = "bb.cooker.CookerStarted"
--
2.35.1


