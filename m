Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61DE472541
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:05:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0FF5Y5H015629
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:05:35 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 Jan 2015 07:05:34 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 09:05:32 -0600
Message-ID: <1421334333-42766-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] Fix compiler name for n32 SDK compiler
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
X-List-Received-Date: Thu, 15 Jan 2015 15:05:44 -0000
Content-Type: text/plain

See bug # 7143 for the details of this issue..

In short, when generating an SDK with the following configuration:

MACHINE = "qemumips64"

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE = "mips32r2"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"

One of the multilib toolchains was missing, either the mips64 n32 or mips64.
This was due to both cross compiler packages ending up with the same PN.

The change was verified with RP's patch:

cross-canadian/meta-environment: Allow modification of TARGET_OS to be optional

being applied as well.

Full configuration for the test was:

MACHINE = "qemumips64"

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE = "mips32r2"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"

USE_LDCONFIG = '0'
IMAGE_INSTALL_append = "lib32-libgcc lib32-libgcc-dev lib32-glibc lib32-glibc-dev lib64-libgcc lib64-libgcc-dev lib64-glibc lib64-glibc-dev"

(See the bug for additional test steps.)

Mark Hatle (1):
  arch-mips.inc: Add the MIPS ABIEXTENSION to toolchain name

 meta/conf/machine/include/mips/arch-mips.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.3


