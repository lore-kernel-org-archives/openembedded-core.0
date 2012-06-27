Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZY-0001h2-HY
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344562"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:21 -0700
Message-Id: <60bdf8ad3119e6e7a738d18faad0e2b4dd6531f4.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/20] libxml: disable lzma
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:29 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

On my system libxml-native got linked with host copy of liblzma and as a
result libxslt-native was not linkable:

| x86_64-linux-libtool: link: gcc -isystem/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/include -O2 -pipe -Wall -Wl,-rpath-link -Wl,/home/hrw
/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link -Wl,/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-
linux/lib -Wl,-rpath -Wl,/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/home/hrw/HDD/devel/canonical/ci-linaro/oecore/buil
d/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-O1 -o .libs/xsltproc xsltproc.o  -L/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/home/hrw/
HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/lib ../libxslt/.libs/libxslt.so ../libexslt/.libs/libexslt.so /home/hrw/HDD/devel/canonical/ci-linaro/oecore/
build/tmp-eglibc/work/x86_64-linux/libxslt-native-1.1.26-r8/libxslt-1.1.26/libxslt/.libs/libxslt.so /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux
/usr/lib/libxml2.so -ldl /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/liblzma.so -lrt -lz -lm -pthread -Wl,-rpath -Wl,/home/hrw/HDD/deve
l/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib
| /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference to `lzma_code@XZ_5.0'
| /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference to `lzma_auto_decoder@XZ_5.0'
| /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference to `lzma_end@XZ_5.0'
| /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference to `lzma_properties_decode@XZ_5.0'
| collect2: error: ld returned 1 exit status
| make[2]: *** [xsltproc] Error 1
| make[2]: Leaving directory `/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-linux/libxslt-native-1.1.26-r8/libxslt-1.1.26/xsltproc'

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/libxml/libxml2.inc      |    8 ++++----
 meta/recipes-core/libxml/libxml2_2.8.0.bb |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 7d8cc16..9433631 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -23,10 +23,10 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n"
-EXTRA_OECONF_virtclass-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n"
-EXTRA_OECONF_virtclass-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n"
-EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n"
+EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_virtclass-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_virtclass-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"
 
 # required for pythong binding
 export HOST_SYS
diff --git a/meta/recipes-core/libxml/libxml2_2.8.0.bb b/meta/recipes-core/libxml/libxml2_2.8.0.bb
index 243789c..fe9ec05 100644
--- a/meta/recipes-core/libxml/libxml2_2.8.0.bb
+++ b/meta/recipes-core/libxml/libxml2_2.8.0.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "c62106f02ee00b6437f0fb9d370c1093"
 SRC_URI[sha256sum] = "f2e2d0e322685193d1affec83b21dc05d599e17a7306d7b90de95bb5b9ac622a"
-- 
1.7.7.6



