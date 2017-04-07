Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4E82A77DA9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:38:37 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id a140so45646659ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PflfzQTQndchAgUW4VBIhamlr6mPHRhbcf25qFp84Og=;
	b=h3Grgm8ME2VMU3hlYPHRU1dCRJAVoJxs9eZIH7BQb91xsWl+KMmDp7Pk+A7tdydFk8
	sYTM1fsEAzPyMtECjXektkt4GA62B3vVufAzPH9UtbNDZz+wUojv0KIz3srBgnqFNnpR
	dtCbNf3Gep2/ohgEOQFh7wFfu/TED68OqP7N3FySz0mWIxTRZ3NfinVVDBswdVftMIzW
	H9DOD1GhqkpM6nrwbChVwduXOaM3dinrsKMyXyUfFduxAz6R2AX/3YgiN5Jq6uGQadjG
	/TEaYLtOlYeyq/G3R3wyyUhr5hd0RUNbvOpbK0JVazgPUrrWtNP7qCEc9eGPdblSYKZu
	Ae8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PflfzQTQndchAgUW4VBIhamlr6mPHRhbcf25qFp84Og=;
	b=fNkoGS+TxmTd/9X4CLrDZZt0My6ufGFm5Xz0aiy1DVq5+kgh0jcomYfL1KXLHhwipA
	Q64T9mj2U76hSL08fbpE8Poci45Dg0A0YLSW0ikVc6FikOXGA4x42OPzricMfSYp/5Ty
	QLb+hJz44mXpdK2/MUWOZx1WD2eSqwjYyskE+G6jF9Vw2ErmZ/paxQoH9FZU8tHcXaOI
	dgwCurpDR8LSSXuMuzNvdOYxhvEJPHjP1z9ai10QqbD+e0cUcwLs5ZsT+BNJZl6j06iQ
	qB7wlF9GlpVaQeX4C9XFRWLnYzcBGrU7natSKKJl4HML5XpDcf4abhUIaWuUnnizbj34
	2uQg==
X-Gm-Message-State: AN3rC/79GSDJtSKTtHVOEL7wYIKL4zmTT2+v/XutToEvbLPVXwSq8igaXwnL568/HDypMMXP
X-Received: by 10.36.13.149 with SMTP id 143mr285678itx.21.1491583119300;
	Fri, 07 Apr 2017 09:38:39 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EAD9.dip0.t-ipconnect.de.
	[93.232.234.217]) by smtp.gmail.com with ESMTPSA id
	n10sm11907916itg.8.2017.04.07.09.38.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 09:38:38 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 18:38:19 +0200
Message-Id: <df2c825cc9da36560b8dc92439119e0a09be42bb.1491583077.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
References: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 4/5] yocto-compat-layer: also determine tune flags for each task
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
X-List-Received-Date: Fri, 07 Apr 2017 16:38:38 -0000

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
index 6eb29c1..aa46984 100644
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

