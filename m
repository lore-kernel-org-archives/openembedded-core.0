Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 33E9E77F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:34:02 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v202so15582880itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fTIUUmXTyolrasC+tpty9gLwR8PPOhgjXJH0/8UqUQY=;
	b=rc2K4fFTMP1H0eq3udhJGthqno5a3NBML+gkLcmCKlbjHLmbNNGWNeET9UYNFOJnII
	74/JyxBejWvB/Kvjf7A79ueBsqFfL5IpNi2Hnsb2gJnExSWEHkxPNuCnBvmSWHX91952
	jNFyJM7WRVUCEWhVhjBJ1m7Rf9Eur6FJcLZpgucsNJ3DHd5Lv19uwBywX+rqng8W23FJ
	ZMq5XGTLQyG7WLgGW+nPGHFPT10Y5e8YfPfAK8RySQUzTVJffK2mgYILA2OAhxqmhVOz
	0tHulp1eL9ynS/F74KrBD8hNW4thMeCl6RwYKDH/SuX49mgrAj8PdvIIeEFzhSaB5Gn1
	e8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fTIUUmXTyolrasC+tpty9gLwR8PPOhgjXJH0/8UqUQY=;
	b=ZM8W+50KKm+71+6GKeVprt7nFBCBFcQR4+XWKD3ihh7MLLFbbt1k99l73tOiXilAQN
	7/KjnKzsggjH4JV7CfN+PokO3bPhzkQC1HYP7+HvCFs1H6/1N5tLBa2Bo4XPX1jUJB2M
	rMMaHBnJ3LfMULVU9yClSHJ2VDkT/2uy9GbsID5njX6RuXfLzk+eKBEKTv08XA9+wXae
	3MRGXxWBdFdwFa6LXLxS/9Lo6TOUIEYPIsRelsVy/wUaBv8gGFNJt6yOrfaPDNOCISlu
	DCNaV1gw3jnyTzjJZgvdscIAhJp8V2XTVj652A9tnpNT32yEVvX0yZFW+mR0Rgv85cVg
	9+Ww==
X-Gm-Message-State: AKS2vOyFxw8+/gBvPFpMebVehYs4++f5Q8QLgKe2uecuEvDoIxJCkleM
	yP4z7im8LtnHAsM/qXA=
X-Received: by 10.36.243.1 with SMTP id t1mr3062877ith.34.1498577644128;
	Tue, 27 Jun 2017 08:34:04 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:34:03 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:41 +0200
Message-Id: <b7ee078b5ea526c9d3f43dc33af840da91b4cc0a.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 4/6] yocto-compat-layer.py: add test_world
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
X-List-Received-Date: Tue, 27 Jun 2017 15:34:03 -0000

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
index a1cdbab..ede002d 100644
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
         if self.tc.layer['type'] == LayerType.SOFTWARE and \
            not self.tc.test_software_layer_signatures:
-- 
git-series 0.9.1

