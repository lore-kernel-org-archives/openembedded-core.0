Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA4CF6FF04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:59:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2BHxagq016954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 11 Mar 2016 09:59:38 -0800
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 11 Mar 2016 09:59:34 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Mar 2016 19:58:51 +0200
Message-ID: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: otavio.salvador@ossystems.com.br
Subject: [master][PATCH] ARMv8 32-bit & 64-bit compiler tunings
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
X-List-Received-Date: Fri, 11 Mar 2016 17:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Hello!

This is a second version for the patch for 32-bit, against MASTER branch.

@Martin, I tested all the new tunes with your script, and I got no errors.

About 64-bit tunes, I need some guidance about the approach for adding 
specific tunes for aarch64.
I tried to inherit the ones from 32-bit and to add the aarch64 feature, but 
I got those errors when building libgcc-initial:

| aarch64_be-oe-linux-gcc: error: unrecognized command line option '-mfpu=crypto-neon-fp-armv8'
| aarch64_be-oe-linux-gcc: error: unrecognized command line option '-marm'
| aarch64_be-oe-linux-gcc: error: unrecognized command line option '-mfpu=neon'
| aarch64_be-oe-linux-gcc: error: unrecognized command line option '-mfloat-abi=hard'

I searched and I found that aarch64 didn't support thumb or neon options:
https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html
It seems that AArch64 and ARM backends are completely separate in gcc.
  
For aarch64 I found just those options:
‘crc’
    Enable CRC extension. This is on by default for -march=armv8.1-a.
‘crypto’
    Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions.
‘fp’
    Enable floating-point instructions. This is on by default for all possible values for options 
    -march and -mcpu.
‘simd’
    Enable Advanced SIMD instructions. This also enables floating-point instructions. 
    This is on by default for all possible values for options -march and -mcpu.
‘lse’
    Enable Large System Extension instructions. This is on by default for -march=armv8.1-a.

Any help will be highly appreciated!

Thanks,
Daniel

Daniel Dragomir (1):
  arch-armv8a.inc: Add tune for 32-bit ARMv8a

 meta/conf/machine/include/arm/arch-armv8a.inc      | 382 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 2 files changed, 383 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

-- 
1.9.1


