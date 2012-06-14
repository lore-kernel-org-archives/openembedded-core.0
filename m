Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfC8E-0000s6-HY
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 17:38:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 08:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112132921"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jun 2012 08:28:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 08:28:01 -0700
Message-Id: <fbe26dfa59449f567fcf07d9567bc331674c7326.1339687522.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339687522.git.sgw@linux.intel.com>
References: <cover.1339687522.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339687522.git.sgw@linux.intel.com>
References: <cover.1339687522.git.sgw@linux.intel.com>
Subject: [PATCH 6/6] beecrypt: add patch for build issue on Fedora 17
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
X-List-Received-Date: Thu, 14 Jun 2012 15:38:46 -0000

../../x86_64-linux-libtool --tag=CXX   --mode=compile g++ -DHAVE_CONFIG_H -I. -I../.. -I../../include  -isystem/intel/poky/builds/f17/tmp/sysroots/x86_64-linux/usr/include  -isystem/intel/poky/builds/f17/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wa,--noexecstack -c -o Properties.lo Properties.cxx
x86_64-linux-libtool: compile:  g++ -DHAVE_CONFIG_H -I. -I../.. -I../../include -isystem/intel/poky/builds/f17/tmp/sysroots/x86_64-linux/usr/include -isystem/intel/poky/builds/f17/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wa,--noexecstack -c Properties.cxx  -fPIC -DPIC -o .libs/Properties.o
In file included from ../../include/beecrypt/c++/util/Hashtable.h:42:0,
                 from ../../include/beecrypt/c++/util/Properties.h:36,
                 from Properties.cxx:25:
../../include/beecrypt/c++/util/AbstractSet.h: In instantiation of 'bool beecrypt::util::AbstractSet<E>::equals(const beecrypt::lang::Object*) const [with E = beecrypt::util::Map<beecrypt::lang::Object, beecrypt::lang::Object>::Entry]':
Properties.cxx:228:1:   required from here
../../include/beecrypt/c++/util/AbstractSet.h:59:27: error: 'containsAll' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
../../include/beecrypt/c++/util/AbstractSet.h:59:27: note: declarations in dependent base 'beecrypt::util::AbstractCollection<beecrypt::util::Map<beecrypt::lang::Object, beecrypt::lang::Object>::Entry>' are not found by unqualified lookup
../../include/beecrypt/c++/util/AbstractSet.h:59:27: note: use 'this->containsAll' instead
../../include/beecrypt/c++/util/AbstractSet.h: In instantiation of 'bool beecrypt::util::AbstractSet<E>::equals(const beecrypt::lang::Object*) const [with E = beecrypt::lang::Object]':
Properties.cxx:228:1:   required from here
../../include/beecrypt/c++/util/AbstractSet.h:59:27: error: 'containsAll' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
../../include/beecrypt/c++/util/AbstractSet.h:59:27: note: declarations in dependent base 'beecrypt::util::AbstractCollection<beecrypt::lang::Object>' are not found by unqualified lookup
../../include/beecrypt/c++/util/AbstractSet.h:59:27: note: use 'this->containsAll' instead

[YOCTO #2593]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../beecrypt/beecrypt/fix-for-gcc-4.7.patch        |   13 +++++++++++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    5 +++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/fix-for-gcc-4.7.patch

diff --git a/meta/recipes-support/beecrypt/beecrypt/fix-for-gcc-4.7.patch b/meta/recipes-support/beecrypt/beecrypt/fix-for-gcc-4.7.patch
new file mode 100644
index 0000000..3d3a8ff
--- /dev/null
+++ b/meta/recipes-support/beecrypt/beecrypt/fix-for-gcc-4.7.patch
@@ -0,0 +1,13 @@
+Index: beecrypt-4.2.1/include/beecrypt/c++/util/AbstractSet.h
+===================================================================
+--- beecrypt-4.2.1.orig/include/beecrypt/c++/util/AbstractSet.h
++++ beecrypt-4.2.1/include/beecrypt/c++/util/AbstractSet.h
+@@ -56,7 +56,7 @@ namespace beecrypt {
+ 					if (c->size() != size())
+ 						return false;
+ 
+-					return containsAll(*c);
++					return this->containsAll(*c);
+ 				}
+ 				return false;
+ 			}
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 2b2b348..7baf92e 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -6,7 +6,8 @@ DESCRIPTION="Beecrypt is a general-purpose cryptography library."
 HOMEPAGE="http://sourceforge.net/projects/beecrypt"
 SRC_URI="${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
 	 file://disable-icu-check.patch \
-	 file://fix-security.patch"
+	 file://fix-security.patch \
+         file://fix-for-gcc-4.7.patch"
 
 SRC_URI[md5sum] = "8441c014170823f2dff97e33df55af1e"
 SRC_URI[sha256sum] = "286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d"
@@ -17,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
 
 DEPENDS = "icu"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools multilib_header
 acpaths=""
-- 
1.7.7.6



