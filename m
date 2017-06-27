Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 30A0377F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:33:57 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id h64so19718792iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qnz0GNoSF9xaFC3NF4NAmTWsY5UTFcHtfBO/P4qPCW0=;
	b=uakRt9tQmEMiLMRYm0fsxBbcWATNHyyTiHdXdv+rhX+dNg1aNWBzbDbZfq4KdiDcoN
	ogjZnOMn5yxdOf99R3Sh9BmI7K/n0NyDV/JWkIv/X+3UQFsC1LwT+fZaAYQFmAl9vhd3
	t2IdBt3RuUNVaeV5iAdov6GjKIgE5eIZM0+5ooCtA/7Lk2cghEkaHZpdpuyotTEzB89d
	BeMfTFDZjQbFZzXlodQa775GFstrF8K5A6uol6aYHZMI4PjJsNTv+94dl7am+xy18gSv
	lOvBDBuVbpE4bzRjgB3rqU2s/mKu7UFznMgX1gIJ2LEaLT/HTWwUT3DF1C+0+DHAor23
	UgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qnz0GNoSF9xaFC3NF4NAmTWsY5UTFcHtfBO/P4qPCW0=;
	b=LGL0zT2FXgWxM0sllmdj3/3/JLEH2ZPGPB3nMi5zXTF8jgLlsDlKeevfQttH9DXNcq
	E1VeUCV+xR7OLUNmmx1TDUN0higltrpSWe6DlLxJ2sPp/vBuo6eIAzT8sdTLOMK1qDeJ
	WbmWP2EVlIGtP5peHTb1jS9PI1NJOMBntmJ+sUX8INSbVcCL5TUVRlR1x81aTJn8cqhs
	7CPPSMQFmh0lRJMYgZ2jpezrmTm8HQ8+DIxaRmIgKj+PlnVanKeteRqq9NRzwqSxclvL
	wz1cEqsVFRAjP7CUXTP9UMU1B4biLJFCfiMTtpHh2BN9Tbi43APC81jB5MMoGyRuvRg5
	fe4Q==
X-Gm-Message-State: AKS2vOzrEBWT9vp/pJiYFKnnwtFccQeYKYjUBKtVTn4A44LHphEe+XHe
	ZK6PFxWM2SAmWz/FdaA=
X-Received: by 10.107.174.42 with SMTP id x42mr6651624ioe.202.1498577638853;
	Tue, 27 Jun 2017 08:33:58 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.33.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:33:57 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:39 +0200
Message-Id: <131b28b809e513e5a07abd9bc2ffd34957b4cc4e.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 2/6] yocto-compat-layer.py: tolerate broken world builds during signature diff
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
X-List-Received-Date: Tue, 27 Jun 2017 15:33:58 -0000

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

