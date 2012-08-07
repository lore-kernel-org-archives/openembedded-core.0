Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1Synop-0000VI-0q
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 19:43:47 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q77HVxVo026964
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 10:31:59 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 13:31:44 -0400
Message-Id: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 07 Aug 2012 17:43:47 -0000

In order to fix the QA Issue for libpam which installed to /lib but
reference /usr/libxx/libz and libcrack, install libz and libcrack
to /lib.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 meta/recipes-core/zlib/zlib_1.2.7.bb              |    8 ++++++--
 meta/recipes-extended/cracklib/cracklib_2.8.19.bb |    2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
index 803fec3..d351437 100644
--- a/meta/recipes-core/zlib/zlib_1.2.7.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -13,7 +13,8 @@ SRC_URI[md5sum] = "2ab442d169156f34c379c968f3f482dd"
 SRC_URI[sha256sum] = "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378c79d52e9334934"
 
 do_configure (){
-	./configure --prefix=${prefix} --shared --libdir=${libdir}
+	#sharedlibdir sets to {libdir} if not set
+	./configure --prefix=${prefix} --shared --libdir="${base_libdir}"
 }
 
 do_compile (){
@@ -21,7 +22,10 @@ do_compile (){
 }
 
 do_install() {
-	oe_runmake DESTDIR=${D} install
+	#libz.a installs to libdir, overwrite the env libdir
+	#install pkgconfig to env libdir/pkgconfig
+	oe_runmake DESTDIR=${D} pkgconfigdir="${libdir}/pkgconfig" \
+		   libdir="${base_libdir}" install
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
index 2951396..aca6211 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
@@ -15,3 +15,5 @@ SRC_URI[md5sum] = "ca0ec168d9c6466612204e8dfb2df8a9"
 SRC_URI[sha256sum] = "7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
 
 inherit autotools gettext
+
+libdir = "${base_libdir}"
-- 
1.7.9.5



