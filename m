Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Pz6Vg-00053z-I0
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 13:04:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2011 05:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,315,1297065600"; d="scan'208";a="719881448"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2011 05:01:41 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Pz6MI-0005Fk-As; Mon, 14 Mar 2011 19:54:46 +0800
Message-Id: <6474406b6e730df7dbff45175c0e512b41e70211.1300103431.git.qing.he@intel.com>
In-Reply-To: <cover.1300103431.git.qing.he@intel.com>
References: <cover.1300103431.git.qing.he@intel.com>
Old-Date: Fri, 11 Mar 2011 17:16:36 +0800
Date: Mon, 14 Mar 2011 19:54:46 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 2/4] libzypp: add machine arch support
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
X-List-Received-Date: Mon, 14 Mar 2011 12:04:29 -0000

From: Qing He <qing.he@intel.com>

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../libzypp/libzypp/archconf.patch                 |   15 +++
 .../libzypp/libzypp/builtin-arch.patch             |  122 +++++++++++++++++++
 .../libzypp/libzypp/no-builtin-arch.patch          |  128 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |   28 ++++-
 4 files changed, 292 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/archconf.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/archconf.patch b/meta/recipes-extended/libzypp/libzypp/archconf.patch
new file mode 100644
index 0000000..44ebe33
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/archconf.patch
@@ -0,0 +1,15 @@
+diff --git a/zypp.conf b/zypp.conf
+index 1e84a3f..7a26548 100644
+--- a/zypp.conf
++++ b/zypp.conf
+@@ -17,7 +17,10 @@
+ ## ** Changing this needs a full refresh (incl. download)
+ ## ** of all repository data.
+ ##
++## ** CAUTION: Don't change this value on yocto !
++##
+ # arch = s390
++arch = @MACHINE_ARCH@
+ 
+ 
+ ##
diff --git a/meta/recipes-extended/libzypp/libzypp/builtin-arch.patch b/meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
new file mode 100644
index 0000000..53dcfac
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
@@ -0,0 +1,122 @@
+This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
+libzypp available archs, see do_archpatch in .bb for more
+details, this is the version for ${BASE_PACKAGE_ARCH} already
+recognized in libzypp.
+
+Also "all" is added as a synonym for noarch.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/zypp/Arch.cc b/zypp/Arch.cc
+index 7b357bb..d9102cc 100644
+--- a/zypp/Arch.cc
++++ b/zypp/Arch.cc
+@@ -122,7 +122,13 @@ namespace zypp
+ 
+   /** \relates Arch::CompatEntry */
+   inline bool operator==( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
+-  { return lhs._idStr == rhs._idStr; }
++  {
++    if ( (lhs._idStr == "all" && rhs._idStr == "noarch") ||
++         (lhs._idStr == "noarch" && rhs._idStr == "all") )
++      return true;
++    else
++      return lhs._idStr == rhs._idStr;
++  }
+   /** \relates Arch::CompatEntry */
+   inline bool operator!=( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
+   { return ! ( lhs == rhs ); }
+@@ -153,7 +159,7 @@ namespace zypp
+     //       bit for each architecture.
+     //
+ #define DEF_BUILTIN(A) const IdString  _##A( #A );
+-    DEF_BUILTIN( noarch );
++    const IdString _noarch( "all" );
+ 
+     DEF_BUILTIN( i386 );
+     DEF_BUILTIN( i486 );
+@@ -202,6 +208,8 @@ namespace zypp
+ 
+     DEF_BUILTIN( sh4 );
+     DEF_BUILTIN( sh4a );
++
++    const IdString _machine( "@MACHINE_ARCH@" );
+ #undef DEF_BUILTIN
+ 
+     ///////////////////////////////////////////////////////////////////
+@@ -326,12 +334,14 @@ namespace zypp
+         //
+         defCompatibleWith( _sh4,	_noarch );
+         defCompatibleWith( _sh4a,	_noarch,_sh4 );
++
++        defCompatibleWith( _machine,    @PKG_ARCH_TAIL@,_@PKG_ARCH@ );
+         //
+         ///////////////////////////////////////////////////////////////////
+         // dumpOn( USR ) << endl;
+       }
+ 
+-    private:
++    public:
+       /** Return the next avialable _idBit.
+        * Ctor injects _noarch into the _compatSet, 1 is for
+        * nonbuiltin archs, so we can use <tt>size</tt> for
+@@ -440,6 +450,8 @@ namespace zypp
+   const Arch Arch_sh4( _sh4 );
+   const Arch Arch_sh4a( _sh4a );
+ 
++  const Arch Arch_machine( _machine );
++
+   ///////////////////////////////////////////////////////////////////
+   //
+   //	METHOD NAME : Arch::Arch
+diff --git a/zypp/Arch.h b/zypp/Arch.h
+index 6b18a6e..092211c 100644
+--- a/zypp/Arch.h
++++ b/zypp/Arch.h
+@@ -249,6 +249,8 @@ namespace zypp
+   extern const Arch Arch_sh4;
+   /** \relates Arch */
+   extern const Arch Arch_sh4a;
++
++  extern const Arch Arch_machine;
+   //@}
+ 
+   ///////////////////////////////////////////////////////////////////
+diff --git a/zypp/parser/yum/schema/common-inc.rnc b/zypp/parser/yum/schema/common-inc.rnc
+index f12ac3b..24ce06e 100644
+--- a/zypp/parser/yum/schema/common-inc.rnc
++++ b/zypp/parser/yum/schema/common-inc.rnc
+@@ -26,6 +26,7 @@ private.evr =
+ private.localizedtext = attribute lang { "en" | "de" }, text
+ 
+ private.archenum = "noarch"
++            | "all"
+             | "armv4l"
+             | "armv5el"
+             | "armv5tel"
+@@ -46,4 +47,5 @@ private.archenum = "noarch"
+             | "sh4"
+             | "x86_64"
+             | "src"
++            | "@MACHINE_ARCH@"
+ 
+diff --git a/zypp/parser/yum/schema/common-inc.rng b/zypp/parser/yum/schema/common-inc.rng
+index 60e5742..8a9ce2e 100644
+--- a/zypp/parser/yum/schema/common-inc.rng
++++ b/zypp/parser/yum/schema/common-inc.rng
+@@ -89,6 +89,7 @@
+   <define name="private.archenum">
+     <choice>
+       <value>noarch</value>
++      <value>all</value>
+       <value>armv4l</value>
+       <value>armv5el</value>
+       <value>armv5tel</value>
+@@ -109,6 +110,7 @@
+       <value>sh4</value>
+       <value>x86_64</value>
+       <value>src</value>
++      <value>@MACHINE_ARCH@</value>
+     </choice>
+   </define>
+ </grammar>
diff --git a/meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch b/meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
new file mode 100644
index 0000000..22dd89c
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
@@ -0,0 +1,128 @@
+This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
+libzypp available archs, see do_archpatch in .bb for more
+details, this is the version for ${BASE_PACKAGE_ARCH} not
+recognized in libzypp.
+
+Also "all" is added as a synonym for noarch.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/zypp/Arch.cc b/zypp/Arch.cc
+index 7b357bb..d4cbca6 100644
+--- a/zypp/Arch.cc
++++ b/zypp/Arch.cc
+@@ -122,7 +122,13 @@ namespace zypp
+ 
+   /** \relates Arch::CompatEntry */
+   inline bool operator==( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
+-  { return lhs._idStr == rhs._idStr; }
++  {
++    if ( (lhs._idStr == "all" && rhs._idStr == "noarch") ||
++         (lhs._idStr == "noarch" && rhs._idStr == "all") )
++      return true;
++    else
++      return lhs._idStr == rhs._idStr;
++  }
+   /** \relates Arch::CompatEntry */
+   inline bool operator!=( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
+   { return ! ( lhs == rhs ); }
+@@ -153,7 +159,7 @@ namespace zypp
+     //       bit for each architecture.
+     //
+ #define DEF_BUILTIN(A) const IdString  _##A( #A );
+-    DEF_BUILTIN( noarch );
++    const IdString _noarch( "all" );
+ 
+     DEF_BUILTIN( i386 );
+     DEF_BUILTIN( i486 );
+@@ -202,6 +208,9 @@ namespace zypp
+ 
+     DEF_BUILTIN( sh4 );
+     DEF_BUILTIN( sh4a );
++
++    const IdString _package( "@PKG_ARCH@" );
++    const IdString _machine( "@MACHINE_ARCH@" );
+ #undef DEF_BUILTIN
+ 
+     ///////////////////////////////////////////////////////////////////
+@@ -326,12 +335,15 @@ namespace zypp
+         //
+         defCompatibleWith( _sh4,	_noarch );
+         defCompatibleWith( _sh4a,	_noarch,_sh4 );
++
++        defCompatibleWith( _package,    _noarch );
++        defCompatibleWith( _machine,    _noarch,_package );
+         //
+         ///////////////////////////////////////////////////////////////////
+         // dumpOn( USR ) << endl;
+       }
+ 
+-    private:
++    public:
+       /** Return the next avialable _idBit.
+        * Ctor injects _noarch into the _compatSet, 1 is for
+        * nonbuiltin archs, so we can use <tt>size</tt> for
+@@ -440,6 +452,9 @@ namespace zypp
+   const Arch Arch_sh4( _sh4 );
+   const Arch Arch_sh4a( _sh4a );
+ 
++  const Arch Arch_package( _package );
++  const Arch Arch_machine( _machine );
++
+   ///////////////////////////////////////////////////////////////////
+   //
+   //	METHOD NAME : Arch::Arch
+diff --git a/zypp/Arch.h b/zypp/Arch.h
+index 6b18a6e..f91a562 100644
+--- a/zypp/Arch.h
++++ b/zypp/Arch.h
+@@ -249,6 +249,9 @@ namespace zypp
+   extern const Arch Arch_sh4;
+   /** \relates Arch */
+   extern const Arch Arch_sh4a;
++
++  extern const Arch Arch_package;
++  extern const Arch Arch_machine;
+   //@}
+ 
+   ///////////////////////////////////////////////////////////////////
+diff --git a/zypp/parser/yum/schema/common-inc.rnc b/zypp/parser/yum/schema/common-inc.rnc
+index f12ac3b..04677c3 100644
+--- a/zypp/parser/yum/schema/common-inc.rnc
++++ b/zypp/parser/yum/schema/common-inc.rnc
+@@ -26,6 +26,7 @@ private.evr =
+ private.localizedtext = attribute lang { "en" | "de" }, text
+ 
+ private.archenum = "noarch"
++            | "all"
+             | "armv4l"
+             | "armv5el"
+             | "armv5tel"
+@@ -46,4 +47,6 @@ private.archenum = "noarch"
+             | "sh4"
+             | "x86_64"
+             | "src"
++            | "@PKG_ARCH@"
++            | "@MACHINE_ARCH@"
+ 
+diff --git a/zypp/parser/yum/schema/common-inc.rng b/zypp/parser/yum/schema/common-inc.rng
+index 60e5742..27694aa 100644
+--- a/zypp/parser/yum/schema/common-inc.rng
++++ b/zypp/parser/yum/schema/common-inc.rng
+@@ -89,6 +89,7 @@
+   <define name="private.archenum">
+     <choice>
+       <value>noarch</value>
++      <value>all</value>
+       <value>armv4l</value>
+       <value>armv5el</value>
+       <value>armv5tel</value>
+@@ -109,6 +110,8 @@
+       <value>sh4</value>
+       <value>x86_64</value>
+       <value>src</value>
++      <value>@PKG_ARCH@</value>
++      <value>@MACHINE_ARCH@</value>
+     </choice>
+   </define>
+ </grammar>
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index b9110eb..825339d 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -13,12 +13,15 @@ RDEPENDS_${PN} = "sat-solver"
 
 S = "${WORKDIR}/git"
 PV = "0.0-git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
            file://rpm5.patch \
            file://rpm5-no-rpmdbinit.patch \
+           file://builtin-arch.patch;apply=no \
+           file://no-builtin-arch.patch;apply=no \
+           file://archconf.patch;apply=no \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
@@ -27,3 +30,26 @@ FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
 FILES_${PN}-dev += "${datadir}/cmake"
 
 EXTRA_OECMAKE += "-DLIB=lib"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_archpatch () {
+	PKG_ARCH_TAIL=`sed -n ${S}/zypp/Arch.cc -e "s|^.*defCompatibleWith( _${BASE_PACKAGE_ARCH},[ \t]*\(.*\) .*$|\1|p"`
+	if [ "x${PKG_ARCH_TAIL}" == x ]; then
+		PATCHFILE=${WORKDIR}/no-builtin-arch.patch
+	else
+		PATCHFILE=${WORKDIR}/builtin-arch.patch
+	fi
+
+	sed -i "${PATCHFILE}" \
+		-e "s|@MACHINE_ARCH@|${MACHINE_ARCH}|g" \
+		-e "s|@PKG_ARCH@|${BASE_PACKAGE_ARCH}|g" \
+		-e "s|@PKG_ARCH_TAIL@|${PKG_ARCH_TAIL}|g"
+
+	patch -p1 -i "${PATCHFILE}"
+
+	sed -i ${WORKDIR}/archconf.patch -e "s|@MACHINE_ARCH@|${MACHINE_ARCH}|g"
+	patch -p1 -i ${WORKDIR}/archconf.patch
+}
+
+addtask archpatch before do_patch after do_unpack
-- 
1.7.0



