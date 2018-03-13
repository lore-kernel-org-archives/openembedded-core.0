Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6656378952
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 03:08:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2D38XTq001201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 20:08:33 -0700 (PDT)
Received: from localhost.localdomain (172.25.59.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 20:07:54 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 22:08:26 -0500
Message-ID: <1520910506-1642-3-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
References: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python3: Fix purelib install and runtime paths
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
X-List-Received-Date: Tue, 13 Mar 2018 03:08:32 -0000
Content-Type: text/plain

oe-core commit: 45afadf0b6 fixed the pip problem with purelib for
python2, even though the the patch stated it was for python3.  This
patch addresses the purelib problem for python3.

If you install the package python3-pip you will have a pip3 binary
where you can see the problem on the device easily where the modules
install into the incorrect area and are not able to be referenced by
python3 at all.

Example error:
   pip3 install imutils
   pip3 list |grep imutils || echo ERROR no imutils
      ERROR no imutils
   python3 -c 'import imutils'
     Traceback (most recent call last):
       File "<string>", line 1, in <module>
     ImportError: No module named 'imutils'

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../python/python3/python-3.3-multilib.patch        | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 77da615..cc35dc1 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -52,11 +52,13 @@ Index: Python-3.5.4/Lib/distutils/command/install.py
  WINDOWS_SCHEME = {
      'purelib': '$base/Lib/site-packages',
      'platlib': '$base/Lib/site-packages',
-@@ -30,7 +32,7 @@ WINDOWS_SCHEME = {
+@@ -29,8 +31,8 @@ WINDOWS_SCHEME = {
+ 
  INSTALL_SCHEMES = {
      'unix_prefix': {
-         'purelib': '$base/lib/python$py_version_short/site-packages',
+-        'purelib': '$base/lib/python$py_version_short/site-packages',
 -        'platlib': '$platbase/lib/python$py_version_short/site-packages',
++        'purelib': '$platbase/'+libname+'/python$py_version_short/site-packages',
 +        'platlib': '$platbase/'+libname+'/python$py_version_short/site-packages',
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
@@ -103,10 +105,11 @@ Index: Python-3.5.4/Lib/sysconfig.py
      'posix_prefix': {
 -        'stdlib': '{installed_base}/lib/python{py_version_short}',
 -        'platstdlib': '{platbase}/lib/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
 +        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
 +        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'purelib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
 +        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
          'include':
              '{installed_base}/include/python{py_version_short}{abiflags}',
@@ -117,10 +120,11 @@ Index: Python-3.5.4/Lib/sysconfig.py
      'posix_home': {
 -        'stdlib': '{installed_base}/lib/python',
 -        'platstdlib': '{base}/lib/python',
+-        'purelib': '{base}/lib/python',
+-        'platlib': '{base}/lib/python',
 +        'stdlib': '{installed_base}/'+sys.lib+'/python',
 +        'platstdlib': '{base}/'+sys.lib+'/python',
-         'purelib': '{base}/lib/python',
--        'platlib': '{base}/lib/python',
++        'purelib': '{base}/'+sys.lib+'/python',
 +        'platlib': '{base}/'+sys.lib+'/python',
          'include': '{installed_base}/include/python',
          'platinclude': '{installed_base}/include/python',
@@ -131,10 +135,11 @@ Index: Python-3.5.4/Lib/sysconfig.py
      'posix_user': {
 -        'stdlib': '{userbase}/lib/python{py_version_short}',
 -        'platstdlib': '{userbase}/lib/python{py_version_short}',
+-        'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
 +        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
 +        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
--        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'purelib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
 +        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
-- 
2.7.4


