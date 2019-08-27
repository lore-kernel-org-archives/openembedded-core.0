Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82FE36D545
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 02:08:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7R28YVC006031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 19:08:44 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 26 Aug 2019 19:08:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2019 10:22:09 +0800
Message-ID: <5f8198b68f123e1e47451a70d8bc3bb5ae893ac2.1566872499.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1566872499.git.Qi.Chen@windriver.com>
References: <cover.1566872499.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gettext: avoid useless RPATH QA issue
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
X-List-Received-Date: Tue, 27 Aug 2019 02:08:53 -0000
Content-Type: text/plain

We are getting useless rpath QA error when enabling libunistring
and msgcat-curses PACKAGECONFIG. Use chrpath to delete the redundant
RPATH in binaries.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 30121ad..4ce47a6 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -118,6 +118,14 @@ FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
 
 do_install_append() {
     rm -f ${D}${libdir}/preloadable_libintl.so
+    # remove useless rpath to avoid QA issue
+    useless_rpath_list="${D}${libdir}/gettext/urlget ${D}${libdir}/gettext/cldr-plurals \
+                        ${D}${libdir}/gettext/hostname ${D}${bindir}/recode-sr-latin"
+    for f in $useless_rpath_list; do
+	if [ -e $f ]; then
+	    chrpath -d $f
+	fi
+    done
 }
 
 do_install_append_class-native () {
@@ -163,6 +171,8 @@ do_install_ptest() {
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
                    ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2
+        # avoid useless rpath
+        [ -e ${D}${PTEST_PATH}/src/cldr-plurals ] && chrpath -d ${D}${PTEST_PATH}/src/cldr-plurals
     fi
 }
 
-- 
1.9.1


