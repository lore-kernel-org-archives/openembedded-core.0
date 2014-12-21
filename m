Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DF4C2728E9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:06 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so6380265wid.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=frQaw7AQKpmphzj0pnmiJkbvY90GxR4UfRn7+J649ko=;
	b=bEATb6CID5x9TVb4z1M9l/8Pzglo222xc3ZR/jK4rC7o+5/5ULQfrxZLl8LaZaZ2Mc
	Rg9PcQZ9zVLVJ51HVwZGrvwMmVaOZZ5uMdjZof3/eXhg1icaI4PbekhBRkea3ZTRjT+f
	J7iaU4iGYPaFZC9BiicJBmVtcR5e512QQ7BRCW8E9mIbI6bdsLQFblQveEdRcbfZMLXq
	Si5apa/VY/Yn37H+ld/6foshFVB9yjXOrSWp5o6JpId8rDOdNc2HxcXzTdsgJI7clE16
	Mw37Kr3hk3QID6IxVVQ7tj5A+aPtYzqq3V4jKvDZEfCrsm89ODlQ+YLV+u65lKU7aP/Q
	byHw==
X-Received: by 10.180.97.7 with SMTP id dw7mr26211849wib.6.1419199926922;
	Sun, 21 Dec 2014 14:12:06 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:06 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:49 +0000
Message-Id: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/8] opkg recipe improvements
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:07 -0000

This patch series implements the changes I suggested on the mailing list a few
days ago.

Summary of changes:
  - The opkg recipe is cleanup up and opkg.inc is merged into opkg_0.2.4.bb.

  - opkg-collateral is updated and then merged into the main opkg recipe.

  - The cryptically named opkg-config-base is given the much more obvious name
    opkg-arch-config.

  - poky-feed-config-opkg is dropped, it is recommended that people use
    distro-feed-configs from meta-oe.

  - A new opkg-keyrings recipe is created to package up keys used to verify
    packages and package feeds. The functionality within opkg which this depends
    upon is backported.

After these changes:
  - All generic files are in 'opkg', including the main opkg config which should
    be upgraded in step with opkg itself.

  - Arch-specific config is only in 'opkg-arch-config' which has MACHINE_ARCH.
    Additional arch-specific config can easily be added to this package with a
    bbappend.

  - Distro-specific config is in 'distro-feed-config' and 'opkg-keyrings'.
    Additional distro-specific config is probably best added as extra recipes.

I think this is a much cleaner layout but let me know if you disagree, I'm happy
to discuss/improve/respin these patches.

All these changes work locally in qemuarm and the on-target upgrade path is
mostly clean. opkg-collateral does get left behind on the target filesystem
after an upgrade but it's effectively an empty package. I don't think this poses
any problems.

Paul Barker (8):
  opkg-collateral: Use new lists_dir syntax
  opkg-arch-config: Renamed from opkg-config-base
  opkg-collateral: Simplify source files
  opkg: Merge opkg.inc into recipe and tidy up
  opkg: Merge in opkg-collateral
  poky-feed-config-opkg: Remove
  opkg: Backport improvements to opkg-key
  opkg-keyrings: New recipe

 meta/classes/rootfs_ipk.bbclass                    |  2 +-
 meta/conf/layer.conf                               |  2 +-
 .../feed-config/poky-feed-config-opkg_1.0.bb       | 44 -----------
 ...-config-base_1.0.bb => opkg-arch-config_1.0.bb} |  3 +-
 meta/recipes-devtools/opkg/opkg-collateral.bb      | 24 ------
 meta/recipes-devtools/opkg/opkg-collateral/dest    |  1 -
 meta/recipes-devtools/opkg/opkg-collateral/src     |  0
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb    | 48 ++++++++++++
 meta/recipes-devtools/opkg/opkg.inc                | 76 -------------------
 .../opkg/0001-opkg-key-Backport-improvements.patch | 78 +++++++++++++++++++
 .../opkg.conf.comments => opkg/opkg.conf}          |  2 +
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           | 88 +++++++++++++++++++++-
 12 files changed, 218 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
 rename meta/recipes-devtools/opkg/{opkg-config-base_1.0.bb => opkg-arch-config_1.0.bb} (87%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/dest
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/src
 create mode 100644 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg.inc
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
 rename meta/recipes-devtools/opkg/{opkg-collateral/opkg.conf.comments => opkg/opkg.conf} (92%)

-- 
1.9.1


