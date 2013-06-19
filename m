Return-Path: <Jate.Sujjavanich@myfuelmaster.com>
Received: from stspspam.syntech.org (exchsrvr.syntech-fuelmaster.com
	[199.44.250.2])
	by mail.openembedded.org (Postfix) with ESMTP id E9BBB608CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:08:09 +0000 (UTC)
Received: from pps.filterd (stspspam [127.0.0.1])
	by stspspam.syntech.org (8.14.5/8.14.5) with SMTP id r5JEoooc012231
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 11:08:10 -0400
Received: from courier.syntech-fuelmaster.com (courier.syntech.org
	[172.16.10.30]) by stspspam.syntech.org with ESMTP id 1cykfftews-1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 11:08:10 -0400
Received: from Courier.syntech.org ([::1]) by Courier.syntech.org ([::1]) with
	mapi; Wed, 19 Jun 2013 11:08:10 -0400
From: Jate Sujjavanich <Jate.Sujjavanich@myfuelmaster.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 11:08:10 -0400
Thread-Topic: [PATCH] Checksums for local files now stored using partial
	recipe path
Thread-Index: Ac5s/Ugl+vXwzcvbRqeXjlcFBBvaTAAAWk+A
Message-ID: <6C2434209962DC46B88345CA85C334A201C9F4A70BF2@Courier.syntech.org>
References: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
In-Reply-To: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 05354D400049A005354E8D
acceptlanguage: en-US
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-06-19_05:2013-06-19, 2013-06-19,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0 phishscore=0
	adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=7.0.1-1305240000 definitions=main-1306190114
Subject: [PATCH] Checksums for local files now stored using partial recipe path
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
X-List-Received-Date: Wed, 19 Jun 2013 15:08:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This allows sstate-cache to be shared between builds in different directori=
es.

Differences in the full path were triggering a false positive when there we=
re actually no changes.

Signed-off-by: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>
---
 bitbake/lib/bb/fetch2/__init__.py |   14 +++++++++-----
 bitbake/lib/bb/siggen.py          |    3 ++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py
index dd1cc93..7ab44d7 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -900,8 +900,7 @@ def get_checksum_file_list(d):
=20
     return " ".join(filelist)
=20
-
-def get_file_checksums(filelist, pn):
+def get_file_checksums(filelist, pn, topdir):
     """Get a list of the checksums for a list of local files
=20
     Returns the checksums for a list of local files, caching the results a=
s @@ -917,7 +916,12 @@ def get_file_checksums(filelist, pn):
             bb.warn("Unable to get checksum for %s SRC_URI entry %s: %s" %=
 (pn, os.path.basename(f), e))
             return None
         return checksum
+   =20
+    (recipe_root, _) =3D os.path.split(topdir)
=20
+    def remove_recipe_parent(data):
+        return data.replace(recipe_root, '').strip('/')
+   =20
     checksums =3D []
     for pth in filelist.split():
         checksum =3D None
@@ -927,7 +931,7 @@ def get_file_checksums(filelist, pn):
             for f in glob.glob(pth):
                 checksum =3D checksum_file(f)
                 if checksum:
-                    checksums.append((f, checksum))
+                    checksums.append((remove_recipe_parent(f),=20
+ checksum))
         elif os.path.isdir(pth):
             # Handle directories
             for root, dirs, files in os.walk(pth):
@@ -935,12 +939,12 @@ def get_file_checksums(filelist, pn):
                     fullpth =3D os.path.join(root, name)
                     checksum =3D checksum_file(fullpth)
                     if checksum:
-                        checksums.append((fullpth, checksum))
+                       =20
+ checksums.append((remove_recipe_parent(fullpth), checksum))
         else:
             checksum =3D checksum_file(pth)
=20
         if checksum:
-            checksums.append((pth, checksum))
+            checksums.append((remove_recipe_parent(pth), checksum))
=20
     checksums.sort(key=3Doperator.itemgetter(1))
     return checksums
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py index 8861=
337..c64acfe 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -74,6 +74,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
         self.pkgnameextract =3D re.compile("(?P<fn>.*)\..*")
         self.basewhitelist =3D set((data.getVar("BB_HASHBASE_WHITELIST", T=
rue) or "").split())
         self.taskwhitelist =3D None
+        self.topdir =3D data.getVar("TOPDIR", True)
         self.init_rundepcheck(data)
=20
     def init_rundepcheck(self, data):
@@ -187,7 +188,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
             self.runtaskdeps[k].append(dep)
=20
         if task in dataCache.file_checksums[fn]:
-            checksums =3D bb.fetch2.get_file_checksums(dataCache.file_chec=
ksums[fn][task], recipename)
+            checksums =3D=20
+ bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task],=20
+ recipename, self.topdir)
             for (f,cs) in checksums:
                 self.file_checksum_values[k][f] =3D cs
                 data =3D data + cs
--
1.7.0.4


