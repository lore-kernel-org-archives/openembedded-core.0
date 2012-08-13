Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T0vna-0001r4-CF
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 16:39:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2012 07:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,759,1336374000"; d="scan'208";a="180017165"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 13 Aug 2012 07:27:22 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 17:27:19 +0300
Message-Id: <1344868040-885-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: openembedded-core@lists.linuxtogo.org
Subject: [RFC 0/1] adt-installer: add support for relocatable SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2012 14:39:18 -0000

Hi all,

This patch will add relocatable SDK support to adt installer. That is, the user
can provide an install folder, different than the default one (usually
/opt/${DISTRO}/${SDK_VERSION} and the binaries will be automatically relocated.

Why RFC? Well, adt_installer uses opkg in order to populate the SDK rootfs. If
the user wants to install, for example, x86_64 Poky SDK under, say,
/home/user/some/directory, he/she will end up with this directory structure:
/home/user/some/directory/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/...

The idea is to strip opt/poky/1.2+snapshot from this structure and end up with:
/home/user/some/directory/sysroots/x86_64-pokysdk-linux/...

With the meta-toolchain stuff it was easy because tar has the feature to strip
a number of components from file names on extraction and all was fine. But opkg,
doesn't... Not that I know of.

So, I had two options:
	- hard way: patch opkg to be able to support this. Implementation could take
	  some time and the feature will be rarely used in real-life;
	- easy way: the solution I chose: after opkg finishes installation of the
	  entire directory structure, move sysroots directory (together with the
	  setup scripts) to the location we want and then get rid of the
	  ./opt/poky/1.2+snapshot/ tree, which is empty anyway.

Any comments?

Thanks,
Laurentiu

Laurentiu Palcu (1):
  adt-installer: add support for relocatable SDK

 .../installer/adt-installer/adt_installer          |   11 ++
 .../adt-installer/scripts/adt_installer_internal   |  109 ++++++++++++++++----
 .../installer/adt-installer_1.0.bb                 |   37 +++----
 3 files changed, 121 insertions(+), 36 deletions(-)

-- 
1.7.9.5



