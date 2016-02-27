Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB86077140
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 12:45:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1RCj3QC004187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 27 Feb 2016 04:45:03 -0800 (PST)
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 27 Feb 2016 04:45:02 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Feb 2016 14:44:42 +0200
Message-ID: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2] ARMv8 32-bit compiler tunings
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
X-List-Received-Date: Sat, 27 Feb 2016 12:45:04 -0000
Content-Type: text/plain

Hello!

This is a second version for the patch:
http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117603.html

I remove the python method from feature-arm-vfp and I added the TUNE_CCARGS appends for CRC, CRYPTO and fp-armv8 only in armv8a tune file.
I fix some parsing failures for armv7a*-neon-vfpv4 tunes.
Also, I reworked the tunes to eliminate multiple parsing failures that I got running Martin's script.

@Martin, I ran again the script and the results are better. I pushed the results in a personal repo:
Tune results without the patch - clean open-embedded:
https://github.com/ddragomi/tune_test/tree/14861fd72be9aebaaa209d9990d72745c90b43eb/tune

Tune results with this patch (VERSION 2):
https://github.com/ddragomi/tune_test/tree/master/tune

And a diff between those here (I fix some parsing failures for armv7a*-neon-vfpv4 tunes):
https://github.com/ddragomi/tune_test/commit/06fbd558bf7e5d91d312628a023b8c0495e8f37a

NOTE: I also added a new fake-machine (axxiaarm) that require arch-arm8a.inc
to test/parse armv8a tunes:
DEFAULTTUNE ?= "armv8a-neon"
require conf/machine/include/arm/arch-armv8a.inc

Previous message:
Starting with linux-yocto-4.1, Intel provides kernel support for its
ARM v8 Axxia platforms, both on 32-bit and 64-bit.
Poky already contains arm 64-bit compiler tunings, so I added 32-bit
tunings based on those for armv7.

The patch that I send you is a draft. Please review it and if it's ok
I will return with thumb and big-endian tunings.

Best regards,
Daniel Dragomir (1):
  Add tune for 32-bit ARMv8-a

 meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-
 meta/conf/machine/include/arm/arch-armv8a.inc | 75 +++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

-- 
1.9.1


