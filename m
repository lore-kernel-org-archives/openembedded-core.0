Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 2D75571974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:29:53 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 4F07F10C075A;
	Mon, 17 Sep 2018 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219795; bh=b+QqeDK+eaJGOMbwHH7vvn20nVdBI3w6uSrUrGvBcQg=;
	h=From:To:Cc:Subject:Date:From;
	b=ktYlFxFdoJlEccxwydU3JU5lj46wmGXM1+gke8iCxm0DU9qNJe5Wpd3zghbe4mYEQ
	Fix78Ys6dHz6uWpvasu2bo7OkPZitikcTBUUNF3cxJePqOcNLg2gAxqEE4yB58N0ce
	w1b6KbGjx/b52xGhfMdFLan+fF0BdevJoMnw+I87YxaI6Euo3lLbCYadS6MyOPH5Vc
	444fSLnNaQKUuRg85Y880teOnw4E8H8TWCpAV6efyfTATnOWj5+/MPyEP2REx249Eq
	lX7jkYboBZ0xnEY09veDd9dH7zJ5Z85b/+ynoZgnJTK7yxDCIpT0Er6Qlm94FLLlEB
	Iwt25/WjyXohg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id E8E0354A9;
	Mon, 17 Sep 2018 14:29:52 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:33 +0300
Message-Id: <20180917212943.27237-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 00/10] Introduce ARC port of OpenEmbedded
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
X-List-Received-Date: Mon, 17 Sep 2018 21:29:54 -0000

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

Alexey Brodkin (8):
  siteinfo: Define data for ARC
  site: Add ARC linux
  kernel-arch.bbclass: Add ARC to kernel arch map
  openssl: Add support for ARC
  icu: Add ARC support
  gcc: Disable libitm for ARC
  binutils: Fix Glibc building for ARC
  gcc: Fix specs generation for ARC

Antoine Tenart (1):
  nspr: Add ARC support

Mylene Josserand (1):
  libgpg-error: Add ARC support

 meta/classes/kernel-arch.bbclass                   |   1 +
 meta/classes/siteinfo.bbclass                      |   2 +
 .../openssl/openssl10_1.0.2p.bb                    |   2 +-
 .../openssl/openssl_1.1.1-pre9.bb                  |   2 +-
 meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
 ...location-where-GOT-information-is-collect.patch | 198 +++++++++++++++++++++
 ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  35 ++++
 ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  43 +++++
 ...tion-was-still-being-generated-when-symbo.patch |  37 ++++
 meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        |  40 +++++
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   1 +
 .../icu/icu/0002-Add-ARC-support.patch             |  25 +++
 meta/recipes-support/icu/icu_62.1.bb               |   1 +
 .../0001-syscfg-Add-an-arc-architecture.patch      |  75 ++++++++
 .../libgpg-error/libgpg-error_1.32.bb              |   1 +
 .../nspr/nspr/0004-Add-ARC-support.patch           |  86 +++++++++
 meta/recipes-support/nspr/nspr_4.19.bb             |   1 +
 meta/site/arc-linux                                |  11 ++
 19 files changed, 564 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-architecture.patch
 create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
 create mode 100644 meta/site/arc-linux

-- 
1.8.3.1


