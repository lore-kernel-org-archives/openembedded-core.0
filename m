Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 92F2277CF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:39:07 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id a103so13847726ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fv8j0TK1z4QTu+eJR4uvJwPCnuahMCkjFwfilzNig/0=;
	b=MvNR1gQx0f9nAlMFm9YS+ncQ5thtOO8TjnK2yUbsTZt9+pNwCw5VlnIUam9b0ulncX
	ghId/rB4GE/aGixoIhn+UvW8fWqVMVQ0gKxWRUOS4cO0+56Df0L6gQnVjrbIQnuGP+qw
	+hj/S1ELLlg//pxN1zoJ/PqYLAnbuRZD/gj8scc3Qmb1lwTgifD5WiRe2k+X/R54DUmy
	7Kc4szz1xxVDt7urjS+ug4gY03eADgO4dM7FyVwXFU/+yKJcCoVntZsLzijOHR9x6osQ
	fGa+3KIzyZsnSdUFmCGPlic6acP2FBYQ037DD81hW0GBarW61fOlliCVwPwfd+7nwh5S
	HlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Fv8j0TK1z4QTu+eJR4uvJwPCnuahMCkjFwfilzNig/0=;
	b=fv+HqNFzzwafCCSUfGYmi964I2O9iVYGAe0Xv6tz959hPxHZYbuVKhVgA8r7RvAlJi
	zgT6M6hxi13cKZqmHaTS7LHormewDoKEcMLS9SBR7K18sncKRhOwRyxZfO/gSSrrXaNa
	cgm8mCwtAR4Bvk8qr4graEDXkLrSCrpg3YlhC4AY5UVfbisoW0BvhvLbjla1xLLJlgDe
	EX6JSXeSeeP7nuQa96/YczibFP2X5HbVwTMwUkfL+wgnBY3mGsiQ06UmD6H79oTQ0C/O
	fAkQA5MO51+U/jwpRSCVgdwsPazuM3i+YkItTFunbm2PbHhTc45LLpIaWEZr4aIsDkLZ
	jN4g==
X-Gm-Message-State: AFeK/H04zXDMD1ZXuvzFOo9jRT3T523tDRu1tTY4yy799DTqoJQWzcofic5M2Dgyl6un5SVn
X-Received: by 10.107.197.129 with SMTP id v123mr66765591iof.175.1491935948258;
	Tue, 11 Apr 2017 11:39:08 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.39.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:39:07 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:40 +0200
Message-Id: <94510fc4f998a173b8a81da62a3168b92db55a1b.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 5/8] yocto-compat-layer: also determine tune flags for each task
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
X-List-Received-Date: Tue, 11 Apr 2017 18:39:07 -0000

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

