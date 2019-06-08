Return-Path: <adrian.freihofer@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 805C67C873
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 08:00:10 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5880Av0023513
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Jun 2019 10:00:10 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.37.201])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x58808sA007590;
	Sat, 8 Jun 2019 10:00:08 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D78A02325006;
	Sat,  8 Jun 2019 10:00:07 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jun 2019 09:59:44 +0200
Message-Id: <20190608075948.30537-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v3 0/4] runqemu: support non-bootable wic images
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
X-List-Received-Date: Sat, 08 Jun 2019 08:00:11 -0000

Please ignore v2. This version 3 only clears up the mess in version 2.

Resolves [Yocto 13336]
Compared to v1, no new wic-nb image type is added (this caused problems
with bitbake -c testimage).

runqemu now evaluates the QB_MACHINE setting to determine whether a wic image
should be booted as a vmtype image (kernel loaded from file passed by -kernel
option) or as a fstype image (kernel in image). If QB_MACHINE contains
"-machine virt" runqemu passes a "-kernel" parameter to qemu. Otherwise
runqemu treats the wic image as vmtype image as before. 

The last patch additionally allows the user to enforce one behavior by passing
wic-vm or wic-fs to runqemu. 


One more comment on v2: The problem with v2 probably arose because I sent the
series from a new email address before registering the address. The patches
seemed to be lost. Half an hour after registering the new e-mail address I
resent them. Then this mess appeared on the mailing list.


Adrian Freihofer (4):
  qemurunner: fix undefined variable
  testimage: consider QB_DEFAULT_FSTYPE
  runqemu: support non-bootable wic images
  runqemu: add wic-fs and wic-wm paramters

 meta/classes/testimage.bbclass    |  6 +++++-
 meta/lib/oeqa/utils/qemurunner.py |  1 +
 scripts/runqemu                   | 40 +++++++++++++++++++++++++++++++++------
 3 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.11.0


