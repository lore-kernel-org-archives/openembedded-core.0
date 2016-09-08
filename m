Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id CBDD177122
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:58:00 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u889w0RN028957 for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 04:58:00 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016090804580039-618630 ;
	Thu, 8 Sep 2016 04:58:00 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 8 Sep 2016 12:56:33 +0300
Message-Id: <20160908095633.26651-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/08/2016 04:58:00 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/08/2016 04:58:00 AM,
	Serialize complete at 09/08/2016 04:58:00 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-08_06:, , signatures=0
Subject: [PATCH] pango: add libpcre to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 09:58:02 -0000

pango has a build time dependency on libpcre which causes a build
race, if pango gets built before libpcre, it fails with the error:

| ./gen-all-unicode > all-unicode.txt
| ./gen-all-unicode: error while loading shared libraries: libpcre.so.1: cannot open shared object file: No such file or directory
| Makefile:1459: recipe for target 'all-unicode.txt' failed
| make[2]: *** [all-unicode.txt] Error 127
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/mnt/build/jenkins-jobs/nilrt_OE_core_x64-pname/workspace/build/tmp-glibc/work/core2-64-nilrt-linux/pango/1.40.1-r0/build/tests'
| Makefile:576: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/mnt/build/jenkins-jobs/nilrt_OE_core_x64-pname/workspace/build/tmp-glibc/work/core2-64-nilrt-linux/pango/1.40.1-r0/build'

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-graphics/pango/pango_1.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.40.1.bb b/meta/recipes-graphics/pango/pango_1.40.1.bb
index 60288a1..159f591 100644
--- a/meta/recipes-graphics/pango/pango_1.40.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.1.bb
@@ -19,7 +19,7 @@ SRC_URI += "file://run-ptest \
 SRC_URI[archive.md5sum] = "6fc88c6529890d6c8e03074d57a3eceb"
 SRC_URI[archive.sha256sum] = "e27af54172c72b3ac6be53c9a4c67053e16c905e02addcf3a603ceb2005c1a40"
 
-DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
+DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz libpcre"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
-- 
2.9.3


