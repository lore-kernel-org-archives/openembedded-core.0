Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 001F877CA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 15:44:41 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l7so45412661ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 08:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aYW7ZhbKjgaykEAkQKzw5UMQHuo6qffx815Xs4VWP8w=;
	b=rW/xyHYzJ68v6fqZtLZeBJaXylB3VHuo2+ePVXqzq1gDzDvjyPlVTyWoc4r9CHtZBw
	qCPXxPhT2ONuY4ssx8PR1l5tmtsJqzx0gOE1JtMfZ9crBazJPEqggZFtgjze5aPHLgEU
	3alV67dG1C/LPOeptSGn152XMytosp8r7p1qyEHtzyaUkPvI5M4SFBHcnn5Yg6sOIAHT
	eojyG1ECB8WFJCxUPZpDF+DwPNvluBRW0NqBcYewBo6WCDgc174fAaqCHz0Q275ZV8hZ
	BE/LCkiEevxOJJFl2cG6UJRnISdXMLyq68T9FA1eZYZckLkrbNe4EO0IJbdlvTSw9Kae
	Pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aYW7ZhbKjgaykEAkQKzw5UMQHuo6qffx815Xs4VWP8w=;
	b=ASJ2SZGdPgoMaWYGfrupDwMfqavyY1SYCjie/eKqJ50/TD4PxGlbCxLKewYNW8t/Fv
	XpQArR92YbUijEj9/94ecjZbNK7/mu/6EfysNkuhZJUiWbh2rMDYcBzmtnAEgMGz36Zu
	KKbtht6zTpGEXfAqy6K2NGwlThCyIdAFRFVLAimNSIAnQluioRt/5+k2oCCZjzeK07ma
	AdS3wZkE25u6FGJL847t7uoS6oZFs8E2pj5ohWglMXZlxyHct3B3i/WiGv6z7Ybr/Li9
	Sx2DaN+7QoUtQ4FZKbDvHethsB0oI9zc/Nuu7WDEj1SjAuKT1ZK2NlffKL6MOM5CzXgE
	x6Ow==
X-Gm-Message-State: AFeK/H01NeG6jxasVmov7p+j2ttrsGNKo9FCo/CeYuJsy7Pnx8wCbsHjrc0H4ZyTWaBxamuu
X-Received: by 10.107.12.40 with SMTP id w40mr62875954ioi.209.1492011883038;
	Wed, 12 Apr 2017 08:44:43 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D306.dip0.t-ipconnect.de.
	[93.232.211.6]) by smtp.gmail.com with ESMTPSA id
	b126sm9618243ioa.55.2017.04.12.08.44.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 08:44:42 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 17:44:26 +0200
Message-Id: <c8ce3be9e0da39f6d30e15855fba4d7417ab09c8.1492011846.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.7122c18ef0bab2b3b9f6f6b36f28f806943eab82.1492011846.git-series.patrick.ohly@intel.com>
References: <cover.7122c18ef0bab2b3b9f6f6b36f28f806943eab82.1492011846.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 2/2] yocto-compat-layer: better handling of per-machine world build breakage
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
X-List-Received-Date: Wed, 12 Apr 2017 15:44:42 -0000

It is fairly common that BSP layers enable recipes when choosing
machines from that layer without checking whether the recipe actually
builds in the current distro. That breaks "bitbake world", retrieving
signatures and thus the test_machine_signatures test.

It's better to let that test continue with the signatures that can be
retrieved and report the broken world build separately. Right now, the
new test_machine_world iterates over all machines. More elegant and
useful in combination with a (currently missing) selection of which
tests to run would be to generate one test instance per machine. But that
is not straightforward and has to wait.

The "-k" argument alone was not enough to proceed despite failures,
because bitbake then still returns a non-zero exit code. The existance
of the output file is taken as sign that the bitbake execution managed
was not fatally broken.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py  | 16 ++++++++++++++--
 scripts/lib/compatlayer/cases/bsp.py | 26 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 0d6f4e9..e35f8c0 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -233,9 +233,21 @@ def get_signatures(builddir, failsafe=False, machine=None):
     if failsafe:
         cmd += '-k '
     cmd += '-S none world'
-    check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
-                  cmd)
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
+    if os.path.exists(sigs_file):
+        os.unlink(sigs_file)
+    try:
+        check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
+                      cmd)
+    except RuntimeError as ex:
+        if failsafe and os.path.exists(sigs_file):
+            # Ignore the error here. Most likely some recipes active
+            # in a world build lack some dependencies. There is a
+            # separate test_machine_world_build which exposes the
+            # failure.
+            pass
+        else:
+            raise
 
     sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
     tune_regex = re.compile("(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
diff --git a/scripts/lib/compatlayer/cases/bsp.py b/scripts/lib/compatlayer/cases/bsp.py
index 9025675..43efae4 100644
--- a/scripts/lib/compatlayer/cases/bsp.py
+++ b/scripts/lib/compatlayer/cases/bsp.py
@@ -25,6 +25,32 @@ class BSPCompatLayer(OECompatLayerTestCase):
                 msg="Layer %s modified machine %s -> %s" % \
                     (self.tc.layer['name'], self.td['bbvars']['MACHINE'], machine))
 
+
+    def test_machine_world(self):
+        '''
+        "bitbake world" is expected to work regardless which machine is selected.
+        BSP layers sometimes break that by enabling a recipe for a certain machine
+        without checking whether that recipe actually can be built in the current
+        distro configuration (for example, OpenGL might not enabled).
+
+        This test iterates over all machines. It would be nicer to instantiate
+        it once per machine. It merely checks for errors during parse
+        time. It does not actually attempt to build anything.
+        '''
+
+        if not self.td['machines']:
+            self.skipTest('No machines set with --machines.')
+        msg = []
+        for machine in self.td['machines']:
+            # In contrast to test_machine_signatures() below, errors are fatal here.
+            try:
+                get_signatures(self.td['builddir'], failsafe=False, machine=machine)
+            except RuntimeError as ex:
+                msg.append(str(ex))
+        if msg:
+            msg.insert(0, 'The following machines broke a world build:')
+            self.fail('\n'.join(msg))
+
     def test_machine_signatures(self):
         '''
         Selecting a machine may only affect the signature of tasks that are specific
-- 
git-series 0.9.1

