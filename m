Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SBJGc-00069k-65
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 06:11:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2012 22:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="124534137"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2012 22:02:56 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 22:02:55 -0700
Message-Id: <3050966a33b84230c8787d4782cd9c2c80f0a5a6.1332565237.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1332565237.git.nitin.a.kamble@intel.com>
References: <cover.1332565237.git.nitin.a.kamble@intel.com>
Subject: [patch v2 1/1] bitbake.conf: fix rpath for sdk executables
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
X-List-Received-Date: Sat, 24 Mar 2012 05:11:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This makes the libraries located in places like this findable:
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib

Which avoids linking sdk executables with host libraries like this:

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
 meta/conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 824ef04..50f0308 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -480,7 +480,9 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
 
 BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
                     -Wl,-rpath-link,${STAGING_LIBDIR} \
+                    -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
                     -Wl,-rpath,${libdir} -Wl,-O1 \
+                    -Wl,-rpath,${libdir}/.. -Wl,-O1 \
                     -L${STAGING_DIR_HOST}${base_libdir} \
                     -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
                     -Wl,-rpath,${base_libdir} -Wl,-O1"
-- 
1.7.6.4



