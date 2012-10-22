Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEfw-00046Z-EW
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:52:01 +0200
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:38:08 -0700
Received: by mail-lb0-f197.google.com with SMTP id b5so1853908lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yMmUytk2iho5iX54OUgpF4MBsl/gPDi7ik7a8msudhg=;
	b=e/x6Fgohn3TfdQ2rjWwWiXPysOl5ywEYL3Twj9qR5wUa9eTR7jh7Fhh+kZEX/RIsO3
	wpcUe015KorAvpoLRDAGdS6vrVKZyh3LhWOcEWx8SJwYW4awfkmWx7lBdInHiAoFhR7j
	YVDv5gffciIKc+K6pprW1AhuejKvGokXC31A7ltoR+60AXGViXX7zJbYu2biKsHbHkQx
	3H/GGItQZZ7T75NVKpEyuZdwz1mMH4nMPZWKCwMIMGDFtAxSSMqDW6GLmbthQiUTg2/l
	21oYTosQ+R4NDByOHlxbNnQW1EY6LDCehvoH1/qa202ziWMxLsyBgeu9L2jFQihBTzGG
	bIig==
Received: by 10.180.100.136 with SMTP id ey8mr19838048wib.1.1350898711831;
	Mon, 22 Oct 2012 02:38:31 -0700 (PDT)
Received: by 10.180.100.136 with SMTP id ey8mr19838030wib.1.1350898711688;
	Mon, 22 Oct 2012 02:38:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id v3sm20970938wiy.5.2012.10.22.02.38.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:38:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:37:20 +0100
Message-Id: <cover.1350898411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQngPC6cAD2A+Ji6vmU9McPwhMPn6QZBtQnv9org4BJUVdUJ3D0SIQ3Sdew+NTUuZekkxHP3SphqR93KfhWhUeXzYLWZcT2jBsWKQcn9HjflIpHiGsTUqVxL6+sdh6Hjuz3kbRTuPE0/3H23QliV/DgSpdCTXnMDknW3tV0k9dDI9mxYRzt7+82PdolwrwZ10GsrANiL
Subject: [PATCH 0/3] Add Xorg driver ABI dependencies
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
X-List-Received-Date: Mon, 22 Oct 2012 09:52:01 -0000

Hi,

The xserver driver ABIs frequently change and as such are versioned.  It's
entirely possible to build an image with an Xserver with ABI 13 but drivers
using ABI 11, and in this situation the server won't load the modules.  These
ABI versions have no relationship to the package version so the existing
dependencies can't be made stricter.

The solution Debian (and probably others) take is to add versioned Provides to
the server, and dependencies on those provides in the drivers.  Then ABI version
mismatches become package dependencies errors and are caught at image
construction time, not boot time.

Ross

The following changes since commit caba9cbfce09f19eb27f4c6615c0c5c48e1a2952:

  kernel.bbclass: add kernel-modules to PACKAGES (2012-10-19 23:06:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/xorg

for you to fetch changes up to 4bb20610fa08a2daf71f59b42929181500345e75:

  insane: add a check for Xorg driver ABI dependencies (2012-10-22 09:26:20 +0100)

----------------------------------------------------------------
Ross Burton (3):
      xserver-xorg: add runtime provides for the driver ABI version
      xorg-driver: add xserver driver ABI dependencies
      insane: add a check for Xorg driver ABI dependencies

 meta/classes/insane.bbclass                        |   20 ++++++++++++++-
 .../xorg-driver/xorg-driver-common.inc             |   17 +++++++++++-
 .../xorg-driver/xorg-driver-input.inc              |    4 +++
 .../xorg-driver/xorg-driver-video.inc              |    3 +++
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   27 +++++++++++++++++++-
 5 files changed, 68 insertions(+), 3 deletions(-)

Ross Burton (3):
  xserver-xorg: add runtime provides for the driver ABI version
  xorg-driver: add xserver driver ABI dependencies
  insane: add a check for Xorg driver ABI dependencies

 meta/classes/insane.bbclass                        |   20 ++++++++++++++-
 .../xorg-driver/xorg-driver-common.inc             |   17 +++++++++++-
 .../xorg-driver/xorg-driver-input.inc              |    4 +++
 .../xorg-driver/xorg-driver-video.inc              |    3 +++
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   27 +++++++++++++++++++-
 5 files changed, 68 insertions(+), 3 deletions(-)

-- 
1.7.10



