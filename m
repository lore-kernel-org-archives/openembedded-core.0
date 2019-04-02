Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 370407D202
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 11DC4183AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:10 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id EofnDQatRHFr
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 39BB718522
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ED631A06D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13DAD1A06B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 080FA2816
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x32JV6pr026873
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 21:31:06 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x32JV6jQ026872
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Apr 2019 21:31:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 21:30:58 +0200
Message-Id: <cover.1554233389.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Tue, 02 Apr 2019 19:31:09 -0000

These patches are intended to improve the ARM tunings and came about
after I had to study the tune files a lot more than I first had
anticipated...

The first patch (arch-armv8a.inc: Correct
PACKAGE_EXTRA_ARCHS_tune-armv8a-*) avoids odd architectures such as
"crc" and "crypto" to be included in PACKAGE_EXTRA_ARCHS.

The following three patches (where i have sent the latter two to the
list before) restores the "armv*" features to TUNE_FEATURES for all ARM
based SoCs as it does not make sense to remove them from the SoC
specific tune files just to determine whether -mcpu or -march shall be
used. This is because the SoCs still support the armv* features
specified in their TUNE_FEATURES even if they also have more specific
SoC tunings.

The next patch (arch-arm64.inc: Lower the priority of aarch64 in
MACHINEOVERRIDES) makes sure that ${SOC_FAMILY} (if present) and
${MACHINE} have higher override priorities than aarch64, as should be.

Finally, the last patch (arm-tunes: Add armv8a to TUNE_FEATURES as
appropriate) adds the "armv8a" feature to TUNE_FEATURES for the
Cortex-A32, Cortex-A35, Cortex-A53 and Cortex-A72 to match all the other
ARM tunings.

//Peter

The following changes since commit a397fd17e42d745e6a23dee86e82b887f3d25ccd:

  layer.conf: Update to warrior release name series (2019-04-02 15:24:50 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/arm-tunings

Peter Kjellerstedt (6):
  arch-armv8a.inc: Correct PACKAGE_EXTRA_ARCHS_tune-armv8a-*
  Revert "arch-armv5-dsp.inc: Check for dsp only to enable 'e' in
    package arches"
  Revert "arm-tunes: Remove -march option if mcpu is already added"
  arm-tunes: Prefer the -mcpu option over -march
  arch-arm64.inc: Lower the priority of aarch64 in MACHINEOVERRIDES
  arm-tunes: Add armv8a to TUNE_FEATURES as appropriate

 meta/conf/machine/include/arm/arch-arm.inc       |  6 +++++
 meta/conf/machine/include/arm/arch-arm64.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv4.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc    |  2 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc   |  2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc    | 12 +++++-----
 meta/conf/machine/include/tune-arm1136jf-s.inc   |  6 ++---
 meta/conf/machine/include/tune-arm920t.inc       |  6 ++---
 meta/conf/machine/include/tune-arm926ejs.inc     |  6 ++---
 meta/conf/machine/include/tune-arm9tdmi.inc      |  6 ++---
 meta/conf/machine/include/tune-cortexa15.inc     | 29 ++++++++++-------------
 meta/conf/machine/include/tune-cortexa17.inc     | 29 ++++++++++-------------
 meta/conf/machine/include/tune-cortexa32.inc     | 11 ++++-----
 meta/conf/machine/include/tune-cortexa35.inc     |  6 ++---
 meta/conf/machine/include/tune-cortexa5.inc      | 29 ++++++++++-------------
 meta/conf/machine/include/tune-cortexa53.inc     | 10 ++++----
 meta/conf/machine/include/tune-cortexa7.inc      | 29 ++++++++++-------------
 meta/conf/machine/include/tune-cortexa72.inc     |  6 ++---
 meta/conf/machine/include/tune-cortexa8.inc      | 21 +++++++----------
 meta/conf/machine/include/tune-cortexa9.inc      | 30 ++++++++++--------------
 meta/conf/machine/include/tune-ep9312.inc        |  3 +--
 meta/conf/machine/include/tune-iwmmxt.inc        |  3 +--
 meta/conf/machine/include/tune-strongarm1100.inc |  5 ++--
 meta/conf/machine/include/tune-thunderx.inc      |  2 +-
 meta/conf/machine/include/tune-xscale.inc        |  9 +++----
 28 files changed, 125 insertions(+), 153 deletions(-)

-- 
2.12.0


