Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 22E0877F38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:32:55 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id a10so7843372itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=smbXe3zMnLyDn3fjuLC96D3mH7xPeF1zNYDMfDC57QE=;
	b=NoAdcXT/R3rer32QgKRR/Vt46M8i5lxr0A5wWFk+4a9EIt+57XrvR431qSMK3kRoZ/
	KoKTj6qeL8nur/tNIxfBD+HNOfVjjgSuD929zeiEbxHzB+uhvAzTBv5RVQDNnBpWfFVX
	efWYJgTubN7hcLThZjlGGOQ1h7STohWhpp+szf6vDxPPiw0KDdklX7qtMzdxveM+ptDG
	yYYwJ+dEEUp1weDQs28TzCDb00Fx1Sc563Hc6gOrwRmaR1xBCFg5nfV0T/3vSAdU7UVF
	zFDPjMZai4s2ZK3yyTQewNOCxqI7MN3VsxLTcbDUaIUAqqDVA6zu7h8+ZpKZiGEVDRjg
	TmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=smbXe3zMnLyDn3fjuLC96D3mH7xPeF1zNYDMfDC57QE=;
	b=qLyyxNYLxDxs1+USNorpoKVY7tigRPOWCs89Gdef0ZT2diJsvQQAWGsb5rpVx3DBQk
	O9MxzrspACwSbMqWe2kg7JxWChGeWAZlWXSSPJGvWk47XIa4UBHZHz5vxIxW7DI5bVuh
	3lgYaLIE5f3/6N7MKHtaxTOKK60mq3c4U7SiiDRMHnDPhG/oevqTA6UR+230RRuP15BQ
	ox5NbN0pKiyyTmv8WHiZjYEeLkNlhkJ7jcV/bkcdhd/lI1+sawsdWq5iknJlMAtxEKKB
	NR8053AkSbE6ijHKadIT7Arw2tK0ahaxyxyc2Znmb2S6l1pxbjndD5wJTWty80Vn8dcO
	u9oA==
X-Gm-Message-State: AODbwcCgMGksNdBgsyoP5KelgLa2VhfE/+MEhG6zE++v5nKx+d2eTq+3
	Gk1oBPQMSBNNYXeYr70=
X-Received: by 10.36.214.200 with SMTP id o191mr30464824itg.48.1496071976743; 
	Mon, 29 May 2017 08:32:56 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.32.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:32:55 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:37 +0200
Message-Id: <c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Mon, 29 May 2017 15:32:56 -0000

Software layers were previously allowed to change signatures, but
that's not desired for those layers either. The rule that a layer
which is "Yocto Compatible 2.0" must not change signatures unless
explicitly requested holds for all kinds of layers.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/cases/common.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index 2dfcbb1..fe4936e 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -27,10 +27,6 @@ class CommonCompatLayer(OECompatLayerTestCase):
                       'bitbake -e')
 
     def test_signatures(self):
-        if self.tc.layer['type'] == LayerType.SOFTWARE:
-            raise unittest.SkipTest("Layer %s isn't BSP or DISTRO one." \
-                     % self.tc.layer['name'])
-
         # task -> (old signature, new signature)
         sig_diff = {}
         curr_sigs, _ = get_signatures(self.td['builddir'], failsafe=True)
-- 
git-series 0.9.1

