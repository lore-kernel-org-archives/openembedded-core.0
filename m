Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09D5B707F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 03:33:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6N3XIvr002125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jul 2014 20:33:18 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 20:33:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 11:33:00 +0800
Message-ID: <cover.1406085105.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V3 0/1] insane: add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Wed, 23 Jul 2014 03:33:20 -0000
Content-Type: text/plain

Change in V3:
- Make the error message more readable. The incorrect assignment
  info will be helpful for issue location.

Change in V2:
- It is more reasonable to move the checking to insance.bbclass
  rather than create a new bbclass. 

Test Steps:

1) Add git://git.yoctoproject.org/meta-fsl-ppc layer
   The openssl and cryptodev-fsl incorrectly assigned
   FILESEXTRAPATHS which forgot the colon.(I have sent the
   fix to meta-fsl-ppc layer mail list)
   ...
   FILESEXTRAPATHS_prepend := "${THISDIR}/openssl-fsl"
   ...
   FILESEXTRAPATHS_prepend := "${THISDIR}/cryptodev-fsl"
   ...
2) bitbake openssl
...
ERROR: FILESEXTRAPATHS-variable, must always use _prepend (or _append)
type of assignment, and don't forget the colon.
Please assign it with the format of:
  FILESEXTRAPATHS_append := ":${THISDIR}/Your_Files_Path" or
  FILESEXTRAPATHS_prepend := "${THISDIR}/Your_Files_Path:"
in your bbappend file

Your incorrect assignment is:
/home/jiahongxu/yocto/meta-openembedded/meta-fsl-ppc/recipes-connectivity/openssl/openssl-fsl__default:

ERROR: Failed to parse recipe: /home/jiahongxu/yocto/meta-openembedded/meta-fsl-ppc/recipes-connectivity/openssl/openssl_1.0.1g.bb
...
 
//Hongxu



The following changes since commit 4d2ac6f6df2b3ef98699dd4f7afadb2d994222bb:

  rootfs: Remove the extraneous install directory (2014-07-19 00:18:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/filesextrapaths
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/filesextrapaths

Hongxu Jia (1):
  insane: add checking to standardize how .bbappend files do
    FILESEXTRAPATHS

 meta/classes/insane.bbclass | 13 +++++++++++++
 meta/classes/utils.bbclass  |  2 ++
 meta/conf/bitbake.conf      |  2 ++
 3 files changed, 17 insertions(+)

-- 
1.8.1.2


