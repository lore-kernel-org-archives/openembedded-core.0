Return-Path: <AlexeiS@astrosoft.ru>
X-Greylist: delayed 1778 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Mar 2015 07:15:50 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0084.outbound.protection.outlook.com [157.56.112.84])
	by mail.openembedded.org (Postfix) with ESMTP id 36AB66AC3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 07:15:50 +0000 (UTC)
Received: from DB4PR03MB622.eurprd03.prod.outlook.com (10.141.234.28) by
	DB4PR03MB0928.eurprd03.prod.outlook.com (25.161.248.12) with Microsoft
	SMTP Server (TLS) id 15.1.118.21; Fri, 20 Mar 2015 07:15:49 +0000
Received: from pollux.denx.de (82.135.33.74) by
	DB4PR03MB622.eurprd03.prod.outlook.com (10.141.234.28) with Microsoft
	SMTP Server (TLS) id 15.1.112.19; Fri, 20 Mar 2015 07:15:49 +0000
From: Alexey Spirkov <Alexey.Spirkov@astrosoft-development.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 08:15:27 +0100
Message-ID: <1426835727-511-1-git-send-email-Alexey.Spirkov@astrosoft-development.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
X-Originating-IP: [82.135.33.74]
X-ClientProxiedBy: AM3PR08CA0001.eurprd08.prod.outlook.com (25.160.207.139) To
	DB4PR03MB622.eurprd03.prod.outlook.com (10.141.234.28)
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DB4PR03MB622;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DB4PR03MB0928; 
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(110136001)(122386002)(81472002)(40100003)(229853001)(46102003)(50226001)(2351001)(36756003)(47776003)(87976001)(77096005)(53416004)(50986999)(42186005)(92566002)(62966003)(450100001)(77156002)(19580395003)(66066001)(19580405001)(48376002)(50466002)(42882002)(80792004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR03MB622; H:pollux.denx.de;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Antispam-PRVS: <DB4PR03MB6222B6268EAFB55CEB620EAC90E0@DB4PR03MB622.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:DB4PR03MB622; BCL:0;
	PCL:0; RULEID:; SRVR:DB4PR03MB622; 
X-Forefront-PRVS: 05214FD68E
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2015 07:15:49.0677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB622
X-OriginatorOrg: astrosoft-development.com
Cc: Alexey Spirkov <Alexey.Spirkov@astrosoft-development.com>
Subject: [PATCH] Fix big endian romfs issue
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
X-List-Received-Date: Fri, 20 Mar 2015 07:15:53 -0000
Content-Type: text/plain

By given scenario mkromfs tool do not recompiled for target
endianness but reused from native build. It is incorrect in
field of view of different endianness of host and target
machines. Before that fix internal ghostscript romfs was
unreadable that was indicated by following warning:

*** Warning: GenericResourceDir doesn't point to a valid resource directory.
               the -sGenericResourceDir=... option can be used to set this.

Mkromfs source code was fixed to give possibility to generate
big endian romfs on little endian machine. Scenario and
ghostscript makefiles patched also.

Signed-off-by: Alexey Spirkov <Alexey.Spirkov@astrosoft-development.com>
---
 .../ghostscript/ghostscript-9.15-forcebe.patch     | 90 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.15.bb                | 12 +++
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-forcebe.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-forcebe.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-forcebe.patch
new file mode 100644
index 0000000..13c7500
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-forcebe.patch
@@ -0,0 +1,90 @@
+diff -rupN ghostscript-9.15-orig/base/lib.mak ghostscript-9.15/base/lib.mak
+--- ghostscript-9.15-orig/base/lib.mak	2015-03-17 15:25:31.000000000 +0100
++++ ghostscript-9.15/base/lib.mak	2015-03-17 16:15:44.077730116 +0100
+@@ -3130,13 +3130,13 @@ $(GLD)romfs0.dev :  $(LIB_MAK) $(ECHOGS_
+ 
+ $(GLGEN)gsromfs1_.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
+ 	$(EXP)$(MKROMFS_XE) -o $(GLGEN)gsromfs1_.c \
+-	-X .svn -X CVS -P $(GLSRCDIR)$(D)..$(D) iccprofiles$(D)* \
++	$(FORCE_BE) -X .svn -X CVS -P $(GLSRCDIR)$(D)..$(D) iccprofiles$(D)* \
+ 	$(PCLXL_ROMFS_ARGS) $(PJL_ROMFS_ARGS) $(XPS_ROMFS_ARGS) \
+ 	$(PS_ROMFS_ARGS) $(GL_ROMFS_ARGS)
+ 
+ $(GLGEN)gsromfs1_1.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
+ 	$(EXP)$(MKROMFS_XE) -o $(GLGEN)gsromfs1_1.c \
+-	-X .svn -X CVS -P $(GLSRCDIR)$(D)..$(D) iccprofiles$(D)* \
++	$(FORCE_BE) -X .svn -X CVS -P $(GLSRCDIR)$(D)..$(D) iccprofiles$(D)* \
+ 	$(UFST_ROMFS_ARGS) $(PCLXL_ROMFS_ARGS) $(PJL_ROMFS_ARGS) $(XPS_ROMFS_ARGS) \
+ 	$(PS_ROMFS_ARGS) $(GL_ROMFS_ARGS)
+ 
+diff -rupN ghostscript-9.15-orig/base/mkromfs.c ghostscript-9.15/base/mkromfs.c
+--- ghostscript-9.15-orig/base/mkromfs.c	2014-09-22 12:17:33.000000000 +0200
++++ ghostscript-9.15/base/mkromfs.c	2015-03-17 15:58:42.597969590 +0100
+@@ -85,6 +85,8 @@
+ 
+ #include <zlib.h>
+ 
++static int _forceBigEndian = 0;
++
+ /*
+  * The rom file system is an array of pointers to nodes, terminated by a NULL
+  */
+@@ -365,7 +367,11 @@ void put_uint32(FILE *out, const unsigne
+ #if ARCH_IS_BIG_ENDIAN
+     fprintf (out, "0x%08x,", q);
+ #else
+-    fprintf (out, "0x%02x%02x%02x%02x,", q & 0xff, (q>>8) & 0xff, (q>>16) & 0xff, (q>>24) & 0xff);
++    if(_forceBigEndian == 0)
++        fprintf (out, "0x%02x%02x%02x%02x,", q & 0xff, (q>>8) & 0xff, (q>>16) & 0xff, (q>>24) & 0xff);
++    else
++        fprintf (out, "0x%08x,", q);
++    
+ #endif
+ }
+ 
+@@ -389,7 +395,7 @@ void put_bytes_padded(FILE *out, unsigne
+         w2c.c.c2 = p[j++];
+         w2c.c.c3 = p[j++];
+         w2c.c.c4 = p[j++];
+-        if (isbigendian() != ARCH_IS_BIG_ENDIAN) {
++        if (isbigendian() != ARCH_IS_BIG_ENDIAN || _forceBigEndian == 1) {
+             fprintf (out, "0x%02x%02x%02x%02x,", (w2c.w) & 0xff, (w2c.w>>8) & 0xff, (w2c.w>>16) & 0xff, (w2c.w >>24) & 0xff);
+         }
+         else {
+@@ -406,7 +412,7 @@ void put_bytes_padded(FILE *out, unsigne
+         w2c.c.c2 = p[j+1];
+       case 1:
+         w2c.c.c1 = p[j];
+-        if (isbigendian() != ARCH_IS_BIG_ENDIAN) {
++        if (isbigendian() != ARCH_IS_BIG_ENDIAN || _forceBigEndian == 1) {
+             fprintf (out, "0x%02x%02x%02x%02x,", (w2c.w) & 0xff, (w2c.w>>8) & 0xff, (w2c.w>>16) & 0xff, (w2c.w >>24) & 0xff);
+         }
+         else {
+@@ -2292,6 +2298,7 @@ main(int argc, char *argv[])
+                 "               -b              compression off (binary).\n"
+                 "               -C              postscript 'compaction' on\n"
+                 "               -B              postscript 'compaction' off\n"
++                "               -F              force big endian mode\n"
+                 "               -g initfile gconfig_h \n"
+                 "                       special handling to read the 'gs_init.ps' file (from\n"
+                 "                       the current -P prefix path), and read the gconfig.h for\n"
+@@ -2325,7 +2332,7 @@ main(int argc, char *argv[])
+ #if ARCH_IS_BIG_ENDIAN
+     fprintf(out,"\t/* this code assumes a big endian target platform */\n");
+ #else
+-    fprintf(out,"\t/* this code assumes a little endian target platform */\n");
++    fprintf(out,"\t/* this code assumes a little endian target platform if there is no -F command line switch */\n");
+ #endif
+     fprintf(out,"\n#include \"stdint_.h\"\n");
+     fprintf(out,"\n#include \"time_.h\"\n\n");
+@@ -2339,6 +2346,10 @@ main(int argc, char *argv[])
+               case 'b':
+                 compression = 0;
+                 break;
++              case 'F':
++                _forceBigEndian = 1;
++                 fprintf(out,"\t/* forced big endian mode */\n");
++                break;
+               case 'c':
+                 compression = 1;
+                 break;
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.15.bb b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
index 5788837..e920bb7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
@@ -25,11 +25,13 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-parallel-make.patch \
            file://cups-no-gcrypt.patch \
            file://ghostscript-9.15-parallel-make.patch \
+           file://ghostscript-9.15-forcebe.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://ghostscript-native-fix-disable-system-libtiff.patch \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
+                        file://ghostscript-9.15-forcebe.patch \
                         "
 
 SRC_URI[md5sum] = "5a78ab0990ff6ec3a103576bc8777c46"
@@ -81,12 +83,22 @@ do_configure_append () {
 	fi
 }
 
+FORCE_BE = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', '-F', d)}"
+
 do_install_append () {
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
     cp -r ${S}/Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r ${S}/iccprofiles ${D}${datadir}/ghostscript/${PV}/
 }
 
+do_install_prepend () {
+    export FORCE_BE=${FORCE_BE}
+}
+
+do_compile_prepend () {
+    export FORCE_BE=${FORCE_BE}
+}
+
 do_compile_class-native () {
     mkdir -p obj
     for i in genarch genconf mkromfs echogs gendev genht; do
-- 
2.1.0


