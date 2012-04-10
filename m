Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SHk4J-0004Bt-Re
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 01:01:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 15:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127507202"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.34])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 15:52:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 23:52:23 +0100
Message-Id: <43ee4f8a379076a147644e6b933d3d0a0ab93361.1334098277.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334098277.git.paul.eggleton@linux.intel.com>
References: <cover.1334098277.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334098277.git.paul.eggleton@linux.intel.com>
References: <cover.1334098277.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/package_deb: create .gz index instead of .bz2
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
X-List-Received-Date: Tue, 10 Apr 2012 23:01:49 -0000

apt is looking for Packages.gz files instead of the .bz2 files we are
currently creating and failing when they cannot be found. It is not
immediately obvious how to make the current version use the .bz2
indexes; thus create .gz indexes for now which allows us to
successfully create images.

Tested on both a Fedora 14 and an Ubuntu 11.10 host machine.

Fixes [YOCTO #1858].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_deb.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 9880258..dc0f963 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -83,7 +83,7 @@ package_update_index_deb () {
 			continue;
 		fi
 		cd ${DEPLOY_DIR_DEB}/$arch
-		dpkg-scanpackages . | bzip2 > Packages.bz2
+		dpkg-scanpackages . | gzip > Packages.gz
 		echo "Label: $arch" > Release
 	done
 }
-- 
1.7.5.4



