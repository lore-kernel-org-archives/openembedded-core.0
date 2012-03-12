Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S78Ey-0003WN-1G
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 17:36:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Mar 2012 09:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117819261"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 12 Mar 2012 09:28:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 09:28:10 -0700
Message-Id: <537de2381d30818bbc1bd0758f4fb1a8dc7f49de.1331569628.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1331569628.git.nitin.a.kamble@intel.com>
References: <cover.1331569628.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Mon, 12 Mar 2012 16:36:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Some libraries like libcrypto.so are installed at base_libdir
instead of libdir. So add the base_libdir to CMAKE_LIBRARY_PATH
so that these libraries can be found correctly.

This resolves an issues with libzypp, which was not finding the
libcrypo library correctly in an x32 build.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/cmake.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8aec759..dcd974a 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -59,7 +59,7 @@ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
-set( CMAKE_LIBRARY_PATH ${libdir} )
+set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 
 EOF
 }
-- 
1.7.6.4



