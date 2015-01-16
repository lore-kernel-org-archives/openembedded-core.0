Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2FE72575
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 22:15:41 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so6626335wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=IhtX0N/nU4tF0cIC+5XD8ShmvmyAxgsXsHKXQbRq9/E=;
	b=AIiLVe8pQvdV/xu4dobIBYFU6O/nmFA6QxYqutCyfKt4YbHFskgyGGdvIPRq23pGee
	/+0jWzzS6b2SAoe/Jw1OHicBn/HDRFFN3Yv5YZtiu8B8A2ksDuLwAanuNC+buKXkMteA
	f4dImXS42r47x9F8AvUN2z0Wem3inJmGqhIkoh7beuL4qhfFAy1FZXK2hcSuShA7qDMf
	IG+pVvbAZEAgj67y6gg5gj284R7yP0XSY0yZp6uZglxv+lfk0yNIMOqxf6s+g+TZQuTf
	f8toIlktkTCJPnUi3FEioSmud/RItbqJ941zTyeiDTN22HlHWwAGDIZjGgMOXGEaEJPY
	Xlyg==
X-Received: by 10.181.13.42 with SMTP id ev10mr10290096wid.78.1421446541531;
	Fri, 16 Jan 2015 14:15:41 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id x6sm7664547wjf.24.2015.01.16.14.15.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jan 2015 14:15:40 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 22:15:22 +0000
Message-Id: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2 0/7] opkg refactoring
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
X-List-Received-Date: Fri, 16 Jan 2015 22:15:46 -0000

Sorry it has took so long to respin these as V2, it's been a busy few weeks!

Original notes:

    Summary of changes:
      - The opkg recipe is cleanup up and opkg.inc is merged into opkg_0.2.4.bb.

      - opkg-collateral is updated and then merged into the main opkg recipe.

      - The cryptically named opkg-config-base is given the much more obvious
        name opkg-arch-config.

      - poky-feed-config-opkg is dropped, it is recommended that people use
        distro-feed-configs from meta-oe.

      - A new opkg-keyrings recipe is created to package up keys used to verify
        packages and package feeds. The functionality within opkg which this
        depends upon is backported.

    After these changes:
      - All generic files are in 'opkg', including the main opkg config which
        should be upgraded in step with opkg itself.

      - Arch-specific config is only in 'opkg-arch-config' which has
        MACHINE_ARCH.  Additional arch-specific config can easily be added to
        this package with a bbappend.

      - Distro-specific config is in 'distro-feed-config' and 'opkg-keyrings'.
        Additional distro-specific config is probably best added as extra
        recipes.

    I think this is a much cleaner layout but let me know if you disagree, I'm
    happy to discuss/improve/respin these patches.

    All these changes work locally in qemuarm and the on-target upgrade path is
    mostly clean. opkg-collateral does get left behind on the target filesystem
    after an upgrade but it's effectively an empty package. I don't think this
    poses any problems.

V2 changes:
  - Add RCONFLICTS and RPROVIDES where RREPLACES is specified

  - Drop lists_dir patch as this has been merged

  - opkg-collateral is no longer left behind on the target filesystem after an
    upgrade.

Paul Barker (7):
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
 ...-config-base_1.0.bb => opkg-arch-config_1.0.bb} |  5 +-
 meta/recipes-devtools/opkg/opkg-collateral.bb      | 24 ------
 meta/recipes-devtools/opkg/opkg-collateral/dest    |  1 -
 meta/recipes-devtools/opkg/opkg-collateral/src     |  0
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb    | 48 ++++++++++++
 meta/recipes-devtools/opkg/opkg.inc                | 76 ------------------
 .../opkg/0001-opkg-key-Backport-improvements.patch | 78 +++++++++++++++++++
 .../opkg.conf.comments => opkg/opkg.conf}          |  2 +
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           | 90 +++++++++++++++++++++-
 12 files changed, 222 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
 rename meta/recipes-devtools/opkg/{opkg-config-base_1.0.bb => opkg-arch-config_1.0.bb} (79%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/dest
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/src
 create mode 100644 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg.inc
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
 rename meta/recipes-devtools/opkg/{opkg-collateral/opkg.conf.comments => opkg/opkg.conf} (92%)

-- 
1.9.1


