Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC407947E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:43 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id AEA4B24E0F51;
	Thu, 20 Sep 2018 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476164; bh=qWPRiXkFQzf7SvPg9CZFuRvJlsNAh/2JvZoELm3izPM=;
	h=From:To:Cc:Subject:Date:From;
	b=eVSrxUP304oEBKxw8LRuql6lWb0FLJj43DLxoRdSOdIknvEMBVSBZyMvkNPqjGGRD
	wElXBYhp/BapVRSMKXUg/NExaTVhNUthwWH5Izw2iHphiD0qJwoY4UJL1xEsETucLP
	tAmSZWfY+dZfbf7jp5RFZk3Cl1Md6AC+dc4eDlx9UVoQDkwojvab4shlKYvrVZBKkt
	Kb+oLjjUV3IC9iRWpvhexuwq5spBAg1Jzdz7aZSIBOQ+7k2BURs/E+lyksTt99MP0x
	yvGD8eBo4LINKnSdFqutxCdZNCPnce2nKEJzyzkcAKqUTQBFIjhqcA+M32EKUCTNkv
	I4SHlR5D0NdcA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 802E03A25;
	Thu, 20 Sep 2018 13:42:43 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:23 +0300
Message-Id: <20180920204232.10583-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 0/9] Introduce ARC port of OpenEmbedded
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:43 -0000

DesignWare ARC Processors are a family of 32-bit CPUs from Synopsys.
This series introduces basic support for ARC architecture in
OpenEmbedded.

As of today latest upstream GCC and Binutils are perfectly usable
for building packages for ARC so we just need a couple of fixes.

Glibc for ARC is under review and we're working hard to get it
accepted in the next upstream release. For now we'll use latest
code-base back-ported on top of 2.28 release via meta-synopsys.

More platform and architecture specific bits could be found in
meta-synopsys layer here (please refer to the "master" branch):
https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys

Changes v1 -> v2:
 * Added upstream status for all patches
 * Rebased on today's master

Alexey Brodkin (8):
  siteinfo: Define data for ARC
  kernel-arch.bbclass: Add ARC to kernel arch map
  openssl: Add support for ARC
  libgpg-error: Add ARC support
  icu: Add ARC support
  gcc: Disable libitm for ARC
  binutils: Fix Glibc building for ARC
  gcc: Fix specs generation for ARC

Antoine Tenart (1):
  nspr: Add ARC support

 meta/classes/kernel-arch.bbclass                   |   1 +
 meta/classes/siteinfo.bbclass                      |   2 +
 .../openssl/openssl10_1.0.2p.bb                    |   2 +-
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb |   2 +-
 meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
 ...location-where-GOT-information-is-collect.patch | 201 ++++++++++++++
 ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  38 +++
 ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  46 ++++
 ...tion-was-still-being-generated-when-symbo.patch |  40 +++
 meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        |  44 +++
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   1 +
 .../icu/icu/0002-Add-ARC-support.patch             |  27 ++
 meta/recipes-support/icu/icu_62.1.bb               |   1 +
 ...port-ARC-CPUs-and-simplify-aliasing-table.patch | 298 +++++++++++++++++++++
 .../libgpg-error/libgpg-error_1.32.bb              |   2 +
 .../nspr/nspr/0004-Add-ARC-support.patch           |  88 ++++++
 meta/recipes-support/nspr/nspr_4.19.bb             |   1 +
 meta/site/arc-common                               |  11 +
 19 files changed, 808 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
 create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
 create mode 100644 meta/site/arc-common

-- 
2.16.2


