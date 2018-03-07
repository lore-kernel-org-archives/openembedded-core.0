Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99EFD78A28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 20:00:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w27K0dhN018005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Mar 2018 12:00:39 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 7 Mar 2018 12:00:04 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Mar 2018 12:00:37 -0800
Message-ID: <20180307200037.93040-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] python3: Fix install purelib to make pip3-python work properly
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
X-List-Received-Date: Wed, 07 Mar 2018 20:00:38 -0000
Content-Type: text/plain

The oe-core version of python3 patches the purelib use directory to
the system libdir so as to make it work with multilibs properly inside
the patch fix_for_using_different_libdir.patch with:

-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
+        'purelib': '{base}/'+sys.lib+'/python{py_version_short}/site-packages',

The problem is that this broke the pip3-python package because the
install directory is out of sync when using a multilib version of
python.  When ever a module is installed with pip3 install that is a
purelib it will get installed to a location that python3 will never
reference and cause random failures.

This patch fixes the purelib install directory to match the purelib
use directory for externally managed python modules when using
multilibs.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/python/python/multilib.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index f5568d2d2b..94fdfeb630 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -41,11 +41,13 @@ Index: Python-2.7.13/Lib/distutils/command/install.py
  if sys.version < "2.2":
      WINDOWS_SCHEME = {
          'purelib': '$base',
-@@ -42,7 +44,7 @@ else:
+@@ -41,8 +43,8 @@ else:
+ 
  INSTALL_SCHEMES = {
      'unix_prefix': {
-         'purelib': '$base/lib/python$py_version_short/site-packages',
+-        'purelib': '$base/lib/python$py_version_short/site-packages',
 -        'platlib': '$platbase/lib/python$py_version_short/site-packages',
++        'purelib': '$platbase/'+libname+'/python$py_version_short/site-packages',
 +        'platlib': '$platbase/'+libname+'/python$py_version_short/site-packages',
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
-- 
2.11.0


