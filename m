Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id F0C147605E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:26:11 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 0760E10C1B4E;
	Fri, 21 Sep 2018 07:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537539973; bh=HcXAXypqFtGAIhC51BsrHwPmgSsSWFn7oTvxnV1eCsg=;
	h=From:To:Cc:Subject:Date:From;
	b=F+MOyz0+MXw6Up/goiyxL4x+/jihSGClhIcu/Q17x876niqMSEWIS1Kyla1E1veS3
	RKZ5m+wkSekKHnO417aHmcVM+gzqPnw13Sg61PBMojzu3+Txrp/Df6hIbV8gL0GVMU
	Fxo+9b70z/nxa67iCfCRWX8Rq8gd5FY+haW8Rq52lG6+5hTEDJ2E9LDAlhMrCyRd6U
	8SqKHXrFCrctjJzqMTn/Rh76tGYobikw/lDwMsZFosLhCqHFty8nNgk2/NYUbk+UHp
	yiioD1lahli/twZKGp/+flD1faXgDg6/IeVZeDqB9Q/sdWg3Xfn3TpZkFgdthfyUUy
	6VutRMHrYOATg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 9E9E55CAD;
	Fri, 21 Sep 2018 07:26:11 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:25:59 +0300
Message-Id: <20180921142608.36203-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 0/9] Introduce ARC port of OpenEmbedded
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
X-List-Received-Date: Fri, 21 Sep 2018 14:26:12 -0000

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

Changes v2 -> v3:
 * libgpg-error: Use proper upstream fix for ARC Glibc tools
 * libgpg-error: Fix header name for x86_64

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
 ...cfg-Add-support-for-arc-unknown-linux-gnu.patch |  35 +++
 .../libgpg-error/libgpg-error_1.32.bb              |   7 +-
 .../nspr/nspr/0004-Add-ARC-support.patch           |  88 ++++++
 meta/recipes-support/nspr/nspr_4.19.bb             |   1 +
 meta/site/arc-common                               |  11 +
 20 files changed, 847 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch
 create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
 create mode 100644 meta/site/arc-common

-- 
2.16.2


