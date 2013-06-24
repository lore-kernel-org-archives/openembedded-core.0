Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD286AD79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 05:08:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5O582ec017547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 22:08:02 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 23 Jun 2013 22:08:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 13:08:03 +0800
Message-ID: <0931e07ae6c0734cb4300ee0bd94c45b511c3cbb.1372040014.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372040014.git.rongqing.li@windriver.com>
References: <cover.1372040014.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt-mobility: remove /usr/lib from ld rpath-link option
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
X-List-Received-Date: Mon, 24 Jun 2013 05:08:01 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Remove /usr/lib from ld rpath-link option to fix the below build error:

       bitbake_build/tmp/sysroots/x86-kvm-guest/usr/lib/libpng16.so.16:
        undefined reference to `inflateReset2@ZLIB_1.2.3.4'

since sysroot seems not work for rpath-link, and "rpath-link,/usr/lib" makes
ld to search host libraries for target libraries, once host has different
version zlib, the error will happen.

qmake uses QT_MOBILITY_LIB to generate "rpath-link,/usr/lib" when do_configure
but we can not add sysroot into QT_MOBILITY_LIB, since QT_MOBILITY_LIB is dir
which libraries will be installed to, so I remove this dir from rpath-link
before do_compile

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index b0e4278..aba84ab 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -59,6 +59,12 @@ do_configure_prepend() {
 	echo CONFIG += ${qtm_embedded} >>./config.pri
 }
 
+do_compile_prepend() {
+	for NAME in `find ./ -name Makefile` ; do
+	    sed -e 's:-Wl,-rpath-link,${libdir}::g' -i $NAME 
+	done
+}
+
 do_install() {
 	for NAME in */*.prf
 	do
-- 
1.7.10.4


