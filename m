Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3811577228
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:50:28 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7BDoQai017964 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 08:50:29 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081108502618-239995 ;
	Thu, 11 Aug 2016 08:50:26 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:49:15 +0300
Message-Id: <20160811134915.7827-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/11/2016 08:50:26 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/11/2016 08:50:29 AM,
	Serialize complete at 08/11/2016 08:50:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-11_10:, , signatures=0
Subject: [PATCH] perl-native: backport libnm link fix
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
X-List-Received-Date: Thu, 11 Aug 2016 13:50:30 -0000

pre-5.25.0 perl by default tries to link to an antiquated libnm (new
math) which is not used anymore since the early 1990's. After 2014
another libnm appeared for NetworkManager causing build failures.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-devtools/perl/perl-native_5.22.1.bb   |  1 +
 .../perl/perl/perl-remove-nm-from-libswanted.patch | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.1.bb b/meta/recipes-devtools/perl/perl-native_5.22.1.bb
index ed8222f..1c21522 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.1.bb
@@ -11,6 +11,7 @@ SRC_URI += "\
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
            file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
+           file://perl-remove-nm-from-libswanted.patch \
           "
 
 SRC_URI[md5sum] = "6671e4829cbaf9cecafa9a84f141b0a3"
diff --git a/meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch b/meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch
new file mode 100644
index 0000000..c489f05
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch
@@ -0,0 +1,30 @@
+From 4732711e2548b6d734ca831d65dbcf501a89774e Mon Sep 17 00:00:00 2001
+From: Andreas Koenig <andk@cpan.org>
+Date: Sun, 3 Jan 2016 08:40:33 +0100
+Subject: [PATCH] Remove nm from libswanted
+
+Nm stood for "New Math" library in the context of 1994. 2014 a conflicting
+library libnm appeared that has a network manager context.
+
+Upstream-Status: Backport [commit 4732711e on branch blead, tag v5.25.0]
+
+---
+ Configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Configure b/Configure
+index 0e71b4b..cfbdaa1 100755
+--- a/Configure
++++ b/Configure
+@@ -1464,7 +1464,7 @@ libswanted_uselargefiles=''
+ : set usesocks on the Configure command line to enable socks.
+ : List of libraries we want.
+ : If anyone needs extra -lxxx, put those in a hint file.
+-libswanted="cl pthread socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld"
++libswanted="cl pthread socket bind inet nsl ndbm gdbm dbm db malloc dl ld"
+ libswanted="$libswanted sun m crypt sec util c cposix posix ucb bsd BSD"
+ : We probably want to search /usr/shlib before most other libraries.
+ : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist.
+-- 
+2.9.2
+
-- 
2.9.2


