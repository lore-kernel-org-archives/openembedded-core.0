Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 374BA7809E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:32:58 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id k91so42856217ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ec6WO5bitqtjj9WoOp1FerRUir0qIJlMvAcv0BnUWWI=;
	b=vsk9AyCFFiEiE3lH9EzZxnS7NoQ7k36E4BzZay6v9L0BHDI4B2BaMAmloqWGHAg2CL
	tctNS4dNFXMXw896Qs/3HtzYJ16VLz/RG+44N01fWIVgTBCjvqs50/QCeITmKcxNKLUX
	7idBBcDPAckWAfNBz7AfYjHpIWCWOM6dVU+mw7+tkBSczPiZw5ma31z1Vw9saX5UNUig
	7u/xMyB/Yf+O3gXYq1QGCanicROpgMeoU7wLNXNwKxcky/Y7VOQ17kaMy4Fozx1cAcp/
	9CSPEbs71GnvHFNeH8tfWNcKQQLFOGbrckBodRiMBGGpyFpvvT66w3pDsKzlfcxf9FJk
	xbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ec6WO5bitqtjj9WoOp1FerRUir0qIJlMvAcv0BnUWWI=;
	b=JWZJILP+MG6ZZ5kNwSGoyBM8NHy05oOJgN9NccXRuZY7xBuhkj6s4hDRVU2sOZN8om
	V/YvyokQuIqYkxDelaEK3Quxg52uvvu9kjVVDU0XGxEqJZZeRJCOFNa1yQ1Q23voAMWK
	GFed8d4uTD1C3RidunNSuInqexpkBjfk+bTzNpHYzBFORoAW0k4ox0UtoUm/Pt7b0/Fy
	cOgqQ+NFLws5SdAR2D8ad50FR9SLKkDTKMLNPXYFwMenna7raGqszxVuAUUWRSgWb6/W
	FpWC4PaChyhy5PZK9Cxbv0MQGavJon2nm2/4D23XPjPO+s9/C1Ino5CCyTUOuC30UJuZ
	d+Ug==
X-Gm-Message-State: AODbwcCDqhuwG3LVjQt1g+f9PFibw3qOLewgoW8LclT0tyJFDPQfpXC6
	purFh/HacsDRhv/ki3Y=
X-Received: by 10.107.20.134 with SMTP id 128mr12807617iou.132.1496071979609; 
	Mon, 29 May 2017 08:32:59 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:32:58 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:38 +0200
Message-Id: <6fb76ec32e7e4e786320a351362d3fe8034b8f1b.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH 4/6] yocto-compat-layer.py: add test_world
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
X-List-Received-Date: Mon, 29 May 2017 15:32:59 -0000

"test_signatures" ignores wold build breakage for the sake of
reporting differences also when a world build is broken. Therefore we
need a dedicated test that a world build at least theoretically can
proceed without obvious parse time problems (dependencies, parse
errors, dangling .bbappends, etc.).

This is similar to the BSP test_machine_world. The difference is
that test_world doesn't change the MACHINE.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/cases/common.py |  9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index fe4936e..b9cd656 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -26,6 +26,15 @@ class CommonCompatLayer(OECompatLayerTestCase):
         check_command('Layer %s failed to show environment.' % self.tc.layer['name'],
                       'bitbake -e')
 
+    def test_world(self):
+        '''
+        "bitbake world" is expected to work. test_signatures does not cover that
+        because it is more lenient and ignores recipes in a world build that
+        are not actually buildable, so here we fail when "bitbake -S none world"
+        fails.
+        '''
+        get_signatures(self.td['builddir'], failsafe=False)
+
     def test_signatures(self):
         # task -> (old signature, new signature)
         sig_diff = {}
-- 
git-series 0.9.1

