Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SDkRo-0008Tl-GQ
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:37:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Mar 2012 15:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125417097"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 30 Mar 2012 15:28:25 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 15:28:23 -0700
Message-Id: <0f8cf941e9e7d9c25cd882bae083b536b715cd17.1333145263.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <512eae1ae0678b247076db900304725702acc91e.1333145263.git.nitin.a.kamble@intel.com>
References: <512eae1ae0678b247076db900304725702acc91e.1333145263.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1333145263.git.nitin.a.kamble@intel.com>
References: <cover.1333145263.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] cross-canadian.bbclass: fix rpath for sdk executables
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
X-List-Received-Date: Fri, 30 Mar 2012 22:37:32 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This makes the libraries located in places like this findable:
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib

Which avoids linking cross canadian sdk executables with host libraries like this:

$ ldd /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
        linux-vdso.so.1 =>  (0x00007fffb7fff000)
        libreadline.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libreadline.so.6 (0x00007fbfb5511000)
        libdl.so.2 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libdl.so.2 (0x00007fbfb530c000)
        libncurses.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5 (0x00007fbfb50e9000)
        libtinfo.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5 (0x00007fbfb4ec2000)
        libz.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libz.so.1 (0x00007fbfb4cac000)
        libm.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libm.so.6 (0x00007fbfb4a2a000)
        libpthread.so.0 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0 (0x00007fbfb480d000)
        libutil.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1 (0x00007fbfb4609000)
        libexpat.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libexpat.so.1 (0x00007fbfb43e0000)
        libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6 (0x00007fbfb4059000)
        /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/cross-canadian.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index e187b88..4ff092c 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -48,7 +48,9 @@ DPKG_ARCH = "${SDK_ARCH}"
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
 CXXFLAGS = "${BUILDSDK_CFLAGS}"
-LDFLAGS = "${BUILDSDK_LDFLAGS}"
+LDFLAGS = "${BUILDSDK_LDFLAGS} \
+	-Wl,-rpath-link,${STAGING_LIBDIR}/.. \
+	 -Wl,-rpath,${libdir}/.. "
 
 DEPENDS_GETTEXT = "gettext-native gettext-nativesdk"
 
-- 
1.7.6.4



