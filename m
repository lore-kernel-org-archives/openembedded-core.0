Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TfyUm-0003s6-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 20:49:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4JZ9xa028759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 11:35:09 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 11:35:08 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 13:49:49 -0600
Message-ID: <cover.1354650148.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/6] Integrate Smart for RPM image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 19:49:32 -0000
Content-Type: text/plain

The following patch set relies on the previous "Misc fixes" sent out earlier
today.

The set replaces the existing rootfs generation with one based on Smart.
The work was tested using buildhistory over a wide range of image types:
core-image-minimal
core-image-base
core-image-basic
core-image-lsb
core-image-sato
build-appliance

Each of which contained minor changes from the former version, but the changes
can all be explained by a different package resolver.

Multilib configurations of each of the above images were also verified on 
qemux86_64 configuration with a few lib32 items added to the mix.  This was
shown, by buildhistory, to result in a more compact install solution.

"populate_sdk" was also verified after this patch.  Buildhistory does not
verify SDKs, so these were verified by hand.  The target items all appeared
to match the expected image components.

The incremental RPM installation code was verified as well.. This code was 
verified in both multilib and non-multilib configurations.

Finally, each of these were verified on: qemux86_64, qemumips, qemuppc, qemuarm,
and qemuarm configured w/ hardware float API.  This verifies that both the 
ARM specific "gnueabi" issues and the _ to - in the arch names both work 
properly.

The following changes since commit 0c69e555dda2fa412ba12fa90886b0b92dc60e44:

  license.bbclass: Avoid grep error message (2012-12-04 11:10:18 -0600)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/smart
  http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/smart

Mark Hatle (4):
  rootfs_rpm.bbclass: Revert to default shell logging behavior
  package_rpm: Update the way the multilib package names are translated
  package_rpm.bbclass: Add additional logging
  package_rpm.bbclass: Add support for incremental installs

Paul Eggleton (2):
  classes/*_rpm: integrate Smart into RPM filesystem construction
  classes/rootfs_rpm: install smart instead of zypper in rpm-based
    images

 meta/classes/package_rpm.bbclass      |  691 +++++++++++++--------------------
 meta/classes/populate_sdk_rpm.bbclass |   74 ++---
 meta/classes/rootfs_rpm.bbclass       |   86 ++---
 3 files changed, 338 insertions(+), 513 deletions(-)

-- 
1.7.3.4



