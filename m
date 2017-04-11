Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4476A77BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:20 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id t68so6266686iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fv8j0TK1z4QTu+eJR4uvJwPCnuahMCkjFwfilzNig/0=;
	b=GtTl38OWQxkHOulWgRDtdOzeTmkZPkIHAhHUq7JkF89JR/ha9OPqM6omRYQeknxldD
	KSH385dd9H5L3o+yjDIF+52oU+ijxhxh6VY7MB2rE+Y4CeTWMdENEdu7tohVX4m3zUy2
	3UGtwerXMoqCXsKqDSzEmzLlBXWQrMybKz6p8PlFfO4Yu/aL/BhO8f7naz/y3H+5uF2X
	pDLcJoAWYuxFOvbMKRbt1wleaRV55958LnDHnKteHj8YhgWy/YUJ7+cUhRnM6fPnQkiP
	wHPsmP4rA2yYlBphYaV4UHVrIaHKsM7dcMZTZKR1QZ2aRz0P8kpFo3YCaPAnzM+bQ3kZ
	zotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Fv8j0TK1z4QTu+eJR4uvJwPCnuahMCkjFwfilzNig/0=;
	b=PBG0LUO76Kgip/nM/9WLXPODes7VrnLAO3yk1FWaiB0RdmajdW9EJwmPzj4S2dZGIH
	UzwieMvISAdZ3ydK744Y4fRvh8LGTi8ioqPOErcb3R2pMKGppo83av2oz6Kto5Cdyqk9
	/FjmfnPVsFut5qRo69/fIJu0kBUwcooXS0kqAyxdBipARaVUH671W96Uvsdej8jjpe/j
	ty3p0+/2gy1aFc+bv7TOBNt3ligi6oXNgqbAEX7O6kcBnKL0EHEBxrHvHwVT6TqfR3Qj
	GxsUSL9UstSlFVf9SJIx2hnk9rZP6mi2LNeJxlVwrOSApJ9Dg8LqoHXCWkSmObe33hVa
	7dVQ==
X-Gm-Message-State: AFeK/H3QFR99NL9Uslb81ki8N6FX3iwCebrxLLij/rVyme9v6YdnBErtdg82OyI9k5ocWxRu
X-Received: by 10.107.21.193 with SMTP id 184mr54146022iov.116.1491922642000; 
	Tue, 11 Apr 2017 07:57:22 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:21 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:58 +0200
Message-Id: <755903b6567497871a7f796a1e753f2270687d72.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 5/8] yocto-compat-layer: also determine tune flags for each task
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:21 -0000

locked-sigs.inc groups tasks according to their tune flags (allarch,
i586, etc.). Also retrieve that information while getting signatures,
it will be needed to determine when setting a machine changes tasks
that aren't machine-specific.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py     |  9 ++++++++-
 scripts/lib/compatlayer/cases/common.py |  2 +-
 scripts/yocto-compat-layer.py           |  2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index b46527a..6130b85 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -224,6 +224,7 @@ def get_signatures(builddir, failsafe=False):
     exclude_recipes = ('meta-world-pkgdata',)
 
     sigs = {}
+    tune2tasks = {}
 
     cmd = 'bitbake '
     if failsafe:
@@ -234,9 +235,14 @@ def get_signatures(builddir, failsafe=False):
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
 
     sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
+    tune_regex = re.compile("(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
+    current_tune = None
     with open(sigs_file, 'r') as f:
         for line in f.readlines():
             line = line.strip()
+            t = tune_regex.search(line)
+            if t:
+                current_tune = t.group('tune')
             s = sig_regex.match(line)
             if s:
                 exclude = False
@@ -249,11 +255,12 @@ def get_signatures(builddir, failsafe=False):
                     continue
 
                 sigs[s.group('task')] = s.group('hash')
+                tune2tasks.setdefault(current_tune, []).append(s.group('task'))
 
     if not sigs:
         raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
 
-    return sigs
+    return (sigs, tune2tasks)
 
 def get_depgraph(targets=['world']):
     '''
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index a4c2a51..8eeada9 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -33,7 +33,7 @@ class CommonCompatLayer(OECompatLayerTestCase):
 
         # task -> (old signature, new signature)
         sig_diff = {}
-        curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
+        curr_sigs, _ = get_signatures(self.td['builddir'], failsafe=True)
         for task in self.td['sigs']:
             if task in curr_sigs and \
                self.td['sigs'][task] != curr_sigs[task]:
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 22c0c2d..2ebddb6 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -139,7 +139,7 @@ def main():
         td['bbvars'] = get_bb_vars()
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
-        td['sigs'] = get_signatures(td['builddir'])
+        td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
 
         if not add_layer(bblayersconf, layer, dep_layers, logger):
             logger.info('Skipping %s ???.' % layer['name'])
-- 
git-series 0.9.1

