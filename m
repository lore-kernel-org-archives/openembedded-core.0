Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2D57D7809E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:32:52 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id o5so28586142ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qnz0GNoSF9xaFC3NF4NAmTWsY5UTFcHtfBO/P4qPCW0=;
	b=rrCbjOBLg5pz10WIyCkza5cVtxWFK4d8KqqzQjiOWQk1JDqCXTNVil+KWMOCJ2oOWO
	LdVlNIjy6PyAJmEi8jCzbjJL8qHGL9Oybni4+FwQBYiDrlAva/HpeMVxyJZhZjLPLG3W
	oClhhUIXYwlM78a7HLE+9mIYxB0k2OywoZ94vQ9RSJH0L+o0nSpPg/7Tup1x2GJJ8SoF
	m7Xt3XN8JmaPPyu7F78GBSab8aJrFqd/cgPXI4fjjJCt/VSk8ApFqRqN/rl+pG0MSVpz
	y/dQCsfLOE56iauDGHgxXH1ju4nc55r8YcyrQS4ETrqZnELRZ/MOlz10I+eTACZJcQCr
	PqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qnz0GNoSF9xaFC3NF4NAmTWsY5UTFcHtfBO/P4qPCW0=;
	b=Hw7+nYpK6iYZeIcMgGoHRzdAO4T3dczkGXIvJTfQ8mcTtuOhsYvrCvsu04CFf1NcDs
	EBQ+o25GMOQdsRLEyfOMilwagypdNG2q+7qZc2MMnjfn1Xsu5vDC2lThi6Rv+kOs5bbr
	mJ+IXhmsbrSPcoDLXNMAU/aaPCSQNsKNnbLShwsEqDA8Sodsn2Id9ioK8FzJ+WK34qNj
	Sc/npGV70uHzEpXiD/Vz7wvR5My9k7vNBsHVsTiKfoQaWfLvBqv/AuPxc79m+pOkg9ZC
	4HaxZiPIMc/M0D8RhV2VtXWamPCtvhXfgO0qdAvGesg8cpAFjEGtzkB5pzl4J6O3W1Oi
	XuuA==
X-Gm-Message-State: AODbwcCFSpM/Eq/2ejvpUAXF/8IpV/xYWacdZsiDFjANWJIqmt0BnZFD
	xXS33r8LD4CByttkJ54=
X-Received: by 10.36.246.136 with SMTP id u130mr14250990ith.54.1496071973908; 
	Mon, 29 May 2017 08:32:53 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.32.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:32:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:36 +0200
Message-Id: <5637e0beb1ebc8a8d4706de5d1cd6a472803b279.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/6] yocto-compat-layer.py: tolerate broken world builds during signature diff
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
X-List-Received-Date: Mon, 29 May 2017 15:32:53 -0000

The "test_signatures" test ignored a broken world build when getting
signatures, but the code which then tried to analyze a difference
found by the test didn't, which prevented printing the difference.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py     | 7 ++++++-
 scripts/lib/compatlayer/cases/common.py | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index eaae4e5..451e1de 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -290,7 +290,7 @@ def get_signatures(builddir, failsafe=False, machine=None):
 
     return (sigs, tune2tasks)
 
-def get_depgraph(targets=['world']):
+def get_depgraph(targets=['world'], failsafe=False):
     '''
     Returns the dependency graph for the given target(s).
     The dependency graph is taken directly from DepTreeEvent.
@@ -309,6 +309,11 @@ def get_depgraph(targets=['world']):
                 elif isinstance(event, bb.command.CommandCompleted):
                     break
                 elif isinstance(event, bb.event.NoProvider):
+                    if failsafe:
+                        # The event is informational, we will get information about the
+                        # remaining dependencies eventually and thus can ignore this
+                        # here like we do in get_signatures(), if desired.
+                        continue
                     if event._reasons:
                         raise RuntimeError('Nothing provides %s: %s' % (event._item, event._reasons))
                     else:
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index 8eeada9..2dfcbb1 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -50,7 +50,7 @@ class CommonCompatLayer(OECompatLayerTestCase):
             def graph2sig(task):
                 pn, taskname = task.rsplit('.', 1)
                 return pn + ':' + taskname
-            depgraph = get_depgraph()
+            depgraph = get_depgraph(failsafe=True)
             depends = depgraph['tdepends']
 
             # If a task A has a changed signature, but none of its
-- 
git-series 0.9.1

