Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SjXMP-0006No-Vv
	for Openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 17:07:22 +0200
Received: from puchatek.dom (87-206-60-144.dynamic.chello.pl [87.206.60.144])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 46BE5D232B;
	Tue, 26 Jun 2012 16:56:33 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 16:56:27 +0200
Message-Id: <1340722587-16368-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libxml: add lzma to build time dependencies
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
X-List-Received-Date: Tue, 26 Jun 2012 15:07:22 -0000

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
 meta/recipes-core/libxml/libxml2.inc      |    2 +-
 meta/recipes-core/libxml/libxml2_2.8.0.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 7d8cc16..b68c79f 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
 DEPENDS_virtclass-native = "python-native"
-DEPENDS =+ "zlib"
+DEPENDS =+ "zlib lzma"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
            file://libxml-64bit.patch"
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
1.7.10.4



