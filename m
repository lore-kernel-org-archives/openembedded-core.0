Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QjxDd-0003Km-2F
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 19:39:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2011 10:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="30832959"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2011 10:35:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 04:09:53 -0700
Message-Id: <eafb85c6bdc1904c6d99ae3fee97298fc5798f2b.1311246527.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311246527.git.nitin.a.kamble@intel.com>
References: <cover.1311246527.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311246527.git.nitin.a.kamble@intel.com>
References: <cover.1311246527.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] glib-2.0: fix a compilation issue due to dtrace
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
X-List-Received-Date: Thu, 21 Jul 2011 17:39:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

With multilib & x32 builds dtrace is getting turned-on by the glib-2.0
configure, which causes following compilation failure.

| x86_64-linux-libtool: link: ccache gcc
-isystem/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/include
-O2 -pipe -Wall -Wl,-rpath-link
-Wl,/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-rpath
-Wl,/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-O1 -o .libs/gtester gtester.o
-L/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
./.libs/libglib-2.0.so -lrt -Wl,-rpath
-Wl,/disk0/pokybuild/build-multilib/tmp/sysroots/x86_64-linux/usr/lib
| ./.libs/libglib-2.0.so: undefined reference to `GLIB_SLICE_ALLOC'
| ./.libs/libglib-2.0.so: undefined reference to `GLIB_MEM_REALLOC'
| ./.libs/libglib-2.0.so: undefined reference to `GLIB_SLICE_FREE'
| ./.libs/libglib-2.0.so: undefined reference to `GLIB_MEM_ALLOC'
| ./.libs/libglib-2.0.so: undefined reference to `GLIB_MEM_FREE'
| ./.libs/libglib-2.0.so: undefined reference to `GLIB_QUARK_NEW'
| collect2: ld returned 1 exit status
| make[4]: *** [gtester] Error 1

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
index 0b30d17..26fc8fb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
index a2e609f..dce6802 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r2"
+PR = "r3"
 PE = "1"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
@@ -20,3 +20,4 @@ SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1
 
 BBCLASSEXTEND = "native"
 
+EXTRA_OECONF_append = " --enable-dtrace=no"
-- 
1.7.6



