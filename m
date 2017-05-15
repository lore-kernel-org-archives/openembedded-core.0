Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6EA272F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:23 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id o12so73196064iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fcRgpfKLaNfpI2v5Jzr71K0dhThpIOSRjWaTSOUJajI=;
	b=q0C5+GBfYBy+ts3aS5UMe5d5qQcBh4Pw65awE7Yn44dgfCaEyTiVfqgscq+V3nDdKN
	dhXikvVEfRjK93yJiVU6q9PZUg8UJFOESTtOOjTyiSi2cPR2vBFqtJ/JV9fpFzfrcoCC
	7G/5W7BJwc1gEziNfEVJBVb7f2siIlVtUc0YfjcH0wHyA+Spv8crVG44nyT6f+7/eTa2
	L+AfuHcHEGUtdUptDLr5OyVM2eJSD/EHWE5QMCOjLNa4B/sj5jQv+Vlr/Nkx03GZcNO7
	2OINO4mnK36G4g7rU59skPBqWbGeFI3TiYpETO+DiEbGV5LvHqnPy42+ICLpNckUF2dN
	54PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fcRgpfKLaNfpI2v5Jzr71K0dhThpIOSRjWaTSOUJajI=;
	b=HZxcqimB13gix2sxpVDmFeE4WEKw2WevcQHlBpoutMCbaMDCApLn1sAPsW97SbGYRu
	PGyz11QZYpVLpzIE6QtMrc8zmPNas2XzZIPTvVFWanIGnbtRBU/I2/qErTriXKdiS8P2
	9P/FI7ETTOFcT0Uxl/lcZVSMVL70fT7p9zPL1zB07+Sp0JUZ02kt67wqOzwh0L9/bw/X
	PbPCQIv3HOYdSK+mB/P8F8q2tZskMNpCYLVOzDEPsRsw6ejMas8CORnkTJeJ50yBGxAt
	3lmCXlB4F9usURyYXrW+J/zyhwg1pHIia5whvoDBJclFGfYuxLJOpdY2s1JGM3MBDcPo
	Q5ig==
X-Gm-Message-State: AODbwcCK78t27lDeslm0m1Z+SBpxcBugDuPIvwdDIEyCnkCsWIl7GhHO
	2uRiI1OnHFEDAZoG
X-Received: by 10.107.202.70 with SMTP id a67mr5814533iog.141.1494854844799;
	Mon, 15 May 2017 06:27:24 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:23 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:27:02 +0200
Message-Id: <d9e25945983b2d876e44712d0e1845066544ee7f.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
Subject: [RFC][PATCH 5/6] image.bbclass: include IMAGE_MODE support
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
X-List-Received-Date: Mon, 15 May 2017 13:27:23 -0000

Inheriting image-mode.bbclass does not change anything by default, but
ensures that the variable is getting checked consistently in all image
recipes and distros when it gets set.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..976db0d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -20,6 +20,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 TESTIMAGECLASS = "${@base_conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
 inherit ${TESTIMAGECLASS}
 
+# Add support for IMAGE_MODE.
+inherit image-mode
+
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-- 
git-series 0.9.1

