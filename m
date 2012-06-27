Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jrsantos@jonathanrsantos.com>) id 1SjuRy-0001Yv-4K
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:46:38 +0200
Received: by vcbfl15 with SMTP id fl15so802710vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 08:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cw4DWDzoDTjsWbkRbN8pi0rYYkCRXFBEl3LQG2fHFUY=;
	b=QR22g3FyBwD0AHHk1cGsQCR2GnqI9eFmxKpqNJvkC5A8Lb9U8lWFDUyc9fr59UJKfj
	C+Aa3vFGniIsa2xW+1vgEnUS87oErcATvGf6jWWtcC9hD3y95rCJC6lbxW4rtdmvnU/L
	+nkccJe4nnHb4vV7CUIqixgXnjS2YOuVq1OM8x4jYPjSBhxhKzrOKKf0wZPyIMDQps2f
	wIiKVCq1dn2gdE5OWV41r/0um5dQjOGN7il+nS3Zl8oN+185IK/KNDpph+PtWWA1N8sb
	Gsmrz9lmfbpJKWLnCNvye+/VGc0f52bYBYw5tVD6rBfyswa39uBuG+SkT/Vzru0CJUKi
	9WdA==
Received: by 10.220.149.148 with SMTP id t20mr14398093vcv.12.1340811344244;
	Wed, 27 Jun 2012 08:35:44 -0700 (PDT)
Received: from el-gaucho.home (pool-72-74-140-89.bstnma.fios.verizon.net.
	[72.74.140.89])
	by mx.google.com with ESMTPS id by2sm59528202vdb.22.2012.06.27.08.35.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 08:35:43 -0700 (PDT)
From: Jonathan Santos <jrsantos@jonathanrsantos.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 11:35:39 -0400
Message-Id: <1340811339-6223-1-git-send-email-jrsantos@jonathanrsantos.com>
X-Mailer: git-send-email 1.7.11
X-Gm-Message-State: ALoCoQlfEEZge2uenk/AmAVyauIa/HOJSjlcJhjub/fi47pn3ogRTTziyxobvC7lH+uNjtks8Uzk
Cc: Jonathan Santos <jrsantos@jonathanrsantos.com>
Subject: [PATCH] openjade-native: Fix use of obsolete getopts.pl in msggen.pl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 15:46:38 -0000

getopts.pl was deprecated in perl 5.14, and removed in 5.16.

Signed-off-by: Jonathan Santos <jrsantos@jonathanrsantos.com>
---
 .../openjade/openjade-1.3.2/getopts.patch            | 20 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb                |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch
new file mode 100644
index 0000000..b89861d
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch
@@ -0,0 +1,20 @@
+--- ./msggen.pl.orig	2012-06-11 11:35:22.000000000 +0000
++++ ./msggen.pl	2012-06-11 11:37:06.000000000 +0000
+@@ -4,6 +4,7 @@
+ # See the file COPYING for copying permission.
+ 
+ use POSIX;
++use Getopt::Std;
+ 
+ # Package and version.
+ $package = 'openjade';
+@@ -18,8 +19,7 @@ $gen_c = 0;
+ undef $opt_l;
+ undef $opt_p;
+ undef $opt_t;
+-do 'getopts.pl';
+-&Getopts('l:p:t:');
++getopts('l:p:t:');
+ $module = $opt_l;
+ $pot_file = $opt_p;
+ 
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 5b29c1f..a69c697 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -15,7 +15,8 @@ RDEPENDS_${PN} = "sgml-common-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
            file://reautoconf.patch \
-	   file://user-declared-default-constructor.patch"
+           file://user-declared-default-constructor.patch \
+           file://getopts.patch"
 
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
-- 
1.7.11



