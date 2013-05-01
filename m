Received: from mailserver6.natinst.com ([130.164.80.6]
	helo=spamkiller06.natinst.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh.cartwright@ni.com>) id 1UXf8B-0003Ol-FL
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 00:04:08 +0200
Received: from mailserv58-us.natinst.com (nb-hsrp-1338.natinst.com
	[130.164.19.133])
	by spamkiller06.natinst.com (8.14.5/8.14.5) with ESMTP id
	r41L6NUx025281 for <openembedded-core@lists.openembedded.org>;
	Wed, 1 May 2013 16:06:23 -0500
Received: from beefymiracle.amer.corp.natinst.com ([130.164.14.197])
	by mailserv58-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013050116062350-585715 ;
	Wed, 1 May 2013 16:06:23 -0500 
Received: by beefymiracle.amer.corp.natinst.com (Postfix, from userid 1000)
	id 3434361D79; Wed,  1 May 2013 16:07:12 -0500 (CDT)
Date: Wed, 1 May 2013 16:07:12 -0500
From: Josh Cartwright <josh.cartwright@ni.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130501210712.GA1429@beefymiracle.amer.corp.natinst.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on MailServ58-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 05/01/2013 04:06:23 PM,
	Serialize by Router on MailServ58-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 05/01/2013 04:06:23 PM,
	Serialize complete at 05/01/2013 04:06:23 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8626, 1.0.431,
	0.0.0000
	definitions=2013-05-01_06:2013-05-01, 2013-05-01,
	1970-01-01 signatures=0
Subject: [PATCH] gcc-4.7: fix gcc ICE when building with gcc-4.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 22:04:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Backport fix for internal compiler error when building gcc-4.7.2 with a
gcc-4.8.0 host gcc.

See upstream bug here: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56308

Signed-off-by: Josh Cartwright <josh.cartwright@ni.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |  3 +-
 .../gcc/gcc-4.7/avoid-oob-array-access.patch       | 45 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index a05cac9..81c8f07 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r19"
+PR = "r20"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -77,6 +77,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://use-ml-conf-files-from-B.patch \
 	   file://wcast-qual-PR55383.patch \
 	   file://disable-texinfo-5.patch \
+	   file://avoid-oob-array-access.patch \
 	  "
 SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
 SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch b/meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
new file mode 100644
index 0000000..4ba707d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+
+See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56308
+
+From 1e37e371d2cca3549b71a247bf79778aa1a9e1c4 Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 21 Sep 2012 10:08:35 +0000
+Subject: [PATCH] 2012-09-21  Richard Guenther  <rguenther@suse.de>
+
+	PR middle-end/54638
+	Backport from mainline
+	2012-04-19  Richard Guenther  <rguenther@suse.de>
+
+	* ira-int.h (ira_allocno_object_iter_cond): Avoid out-of-bound
+	array access.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_7-branch@191605 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog | 9 +++++++++
+ gcc/ira-int.h | 9 +++++++--
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/ira-int.h b/gcc/ira-int.h
+index 9faabb5..771a368 100644
+--- a/gcc/ira-int.h
++++ b/gcc/ira-int.h
+@@ -1138,8 +1138,13 @@ static inline bool
+ ira_allocno_object_iter_cond (ira_allocno_object_iterator *i, ira_allocno_t a,
+ 			      ira_object_t *o)
+ {
+-  *o = ALLOCNO_OBJECT (a, i->n);
+-  return i->n++ < ALLOCNO_NUM_OBJECTS (a);
++  int n = i->n++;
++  if (n < ALLOCNO_NUM_OBJECTS (a))
++    {
++      *o = ALLOCNO_OBJECT (a, n);
++      return true;
++    }
++  return false;
+ }
+ 
+ /* Loop over all objects associated with allocno A.  In each
+-- 
+1.8.2.2
+
-- 
1.8.2.2


