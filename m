Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 214497533A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F3BBC18512
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id cQe0l0xJEXoM
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 77AFC184E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 663A61A05F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B75F1A05E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 4FC062983
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w36IR3ET017609
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Apr 2018 20:27:03 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w36IR32S017603
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Apr 2018 20:27:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 20:26:54 +0200
Message-Id: <cover.1523039141.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/3] Fix problem with leftover files in tmp/sysroots-components
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
X-List-Received-Date: Fri, 06 Apr 2018 18:27:11 -0000

We have seen problems where sometimes files are leftover in
tmp/sysroots-components when changing PACKAGE_ARCH for a package. This
could then lead to those files being picked up instead of the real
files when the RSS for another package was created.

It turned out that this happened if the original architecture of the
package was one that was added using PACKAGE_EXTRA_ARCHS. Those extra
architectures were not handled in the sstate_eventhandler2() function
in sstate.bbclass that does the clean up of tmp/sysroots-components.

During the course of debugging this problem I also noticed that there
were two index files in tmp/sstate-control for machines that contain a
dash in their names. This turned out to be due to the use of the
stamp-extra-info task flag for some tasks, which were using ${MACHINE}
rather than ${MACHINE_ARCH} to specify the architecture. Since this
seemed inconsistent and confusing, I fixed that as well.

//Peter

The following changes since commit 312a5a93cac95fe62c56e374db728c825b272e64:

  layer.conf: Update LAYERSERIES rocko -> sumo (2018-04-06 11:39:49 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/extra-archs-in-sstate

Peter Kjellerstedt (3):
  Use ${MACHINE_ARCH} instead of ${MACHINE} for stamp-extra-info task
    flag
  sstate.bbclass: Add ${PACKAGE_EXTRA_ARCHS} to SSTATE_ARCHS
  license.bbclass: Minor simplification of get_deployed_dependencies()

 meta/classes/deploy.bbclass            | 2 +-
 meta/classes/image.bbclass             | 2 +-
 meta/classes/license.bbclass           | 4 +---
 meta/classes/package.bbclass           | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/classes/populate_sdk_ext.bbclass  | 2 +-
 meta/classes/sstate.bbclass            | 5 +++--
 meta/recipes-core/meta/signing-keys.bb | 3 ++-
 8 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.12.0


