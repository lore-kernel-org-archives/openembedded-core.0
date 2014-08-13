Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A8D9D617B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 06:02:07 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XHRdP-00077b-Ta from Yasir_Khan@mentor.com ;
	Tue, 12 Aug 2014 23:02:07 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 12 Aug 2014 23:02:07 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 10:59:44 +0500
Message-Id: <1407909584-48528-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 13 Aug 2014 06:02:07.0711 (UTC)
	FILETIME=[1D3456F0:01CFB6BC]
Subject: [PATCH] python-native: disable user site support
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
X-List-Received-Date: Wed, 13 Aug 2014 06:02:09 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

The user site-packages gets inserted into sys.path ahead of the
system site directories, so a site package installed there will
be used in preference to what's in our sysroot, causing less
deterministic builds, and potential build breakage, depending
on what the user has installed there. Disable it for our native
python, so they don't affect our builds.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../recipes-devtools/python/python-native_2.7.3.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 827654d..e55f5fe 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -58,4 +58,8 @@ do_install() {
 	# (these often end up too long for the #! parser in the kernel as the
 	# buffer is 128 bytes long).
 	ln -s python-native/python ${D}${bindir}/nativepython
+	
+	# We don't want modules in ~/.local being used in preference to those
+	# installed in the native sysroot, so disable user site support.
+	sed -i -e 's,^\(ENABLE_USER_SITE = \).*,\1False,' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
 }
-- 
1.7.9.5


