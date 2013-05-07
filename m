Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UZecB-00023i-GY
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 11:55:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2013 02:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="333076246"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2013 02:37:02 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 7 May 2013 10:35:39 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.205]) with mapi id
	14.01.0355.002; Tue, 7 May 2013 10:35:38 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH V2] iptables: upgrade to 1.4.18
Thread-Index: AQHOSwYgo5NJK7okIU2N8CWqqOCBb5j5dkmw
Date: Tue, 7 May 2013 09:35:37 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1622BD41@IRSMSX102.ger.corp.intel.com>
References: <1367919324-989-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1367919324-989-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH V2] iptables: upgrade to 1.4.18
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
X-List-Received-Date: Tue, 07 May 2013 09:55:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

iptables/fix-link-failure-ip6t-NETMAP.patch actually removed.

-----Original Message-----
From: Iorga, Cristian=20
Sent: Tuesday, May 07, 2013 12:35 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH V2] iptables: upgrade to 1.4.18

fix-link-failure-ip6t-NETMAP.patch removed; already included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iptables/fix-link-failure-ip6t-NETMAP.patch    |   86 ----------------=
----
 .../{iptables_1.4.17.bb =3D> iptables_1.4.18.bb}     |    8 +-
 2 files changed, 3 insertions(+), 91 deletions(-)  delete mode 100644 meta=
/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.17.bb =3D> iptables_1.=
4.18.bb} (90%)

diff --git a/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-=
NETMAP.patch b/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6=
t-NETMAP.patch
deleted file mode 100644
index aa8efd6..0000000
--- a/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.=
patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 68e77a26111ee6b8f10c735a76891a7de6d57ee6 Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Tue, 1 Jan 2013 22:47:51 +0000
-Subject: [PATCH] build: resolve link failure for ip6t_NETMAP
-
-Link stage of libip6t_NETMAP failed since recently.
-
-  CCLD     libip6t_NETMAP.so
-/usr/lib64/gcc/x86_64-suse-linux/4.7/../../../../x86_64-suse-linux/bin/ld:
-cannot find -lip6tc
-
-libip6t_NETMAP.c uses the "ipv6_prefix_length" function from -libip6tc.so;=
 "-lip6tc" is used in the Makefile, but, the directory to -it is not specif=
ied.
-
-Why does the link succeed for some people? Because -/usr/lib(64)/libip6tc.=
so satisfies -lip6tc, but not all environments, -especially those without i=
ptables development files, have that file, -hence this link error can happe=
n.
-
-By suggestion of Mike Frysinger, this patch uses libtool to produce -and l=
ink the plugins.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jan Engelhardt <jengelh@inai.de>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- extensions/GNUmakefile.in |   20 ++++++++++++--------
- 1 files changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in -index =
e71e3ff..adad4d6 100644
---- a/extensions/GNUmakefile.in
-+++ b/extensions/GNUmakefile.in
-@@ -33,6 +33,7 @@ AM_VERBOSE_CXX    =3D @echo "  CXX     " $@;
- AM_VERBOSE_CXXLD  =3D @echo "  CXXLD   " $@;
- AM_VERBOSE_AR     =3D @echo "  AR      " $@;
- AM_VERBOSE_GEN    =3D @echo "  GEN     " $@;
-+AM_VERBOSE_NULL   =3D @
- endif
-
- #
-@@ -75,7 +76,7 @@ install: ${targets_install}
- 	if test -n "${targets_install}"; then install -pm0755 $^ "${DESTDIR}${xt=
libdir}/"; fi;
-
- clean:
--	rm -f *.o *.oo *.so *.a {matches,targets}.man initext.c initext4.c inite=
xt6.c;
-+	rm -f *.la *.o *.lo *.so *.a {matches,targets}.man initext.c=20
-+initext4.c initext6.c;
- 	rm -f .*.d .*.dd;
-
- distclean: clean
-@@ -89,19 +90,22 @@ init%.o: init%.c
- #
- #	Shared libraries
- #
--lib%.so: lib%.oo
--	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} -shared ${LDFLAGS} -o $@ $< -L.=
./libxtables/.libs -lxtables ${$*_LIBADD};
-+lib%.so: lib%.la
-+	${AM_VERBOSE_NULL} ln -fs .libs/$@ $@
-
--lib%.oo: ${srcdir}/lib%.c
--	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INI=
T=3Dlib$*_init -DPIC -fPIC ${CFLAGS} -o $@ -c $<;
-+lib%.la: lib%.lo
-+	${AM_VERBOSE_CCLD} ../libtool ${AM_LIBTOOL_SILENT} --tag=3DCC=20
-+--mode=3Dlink ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $<=20
-+../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
-+
-+lib%.lo: ${srcdir}/lib%.c
-+	${AM_VERBOSE_CC} ../libtool ${AM_LIBTOOL_SILENT} --tag=3DCC=20
-+--mode=3Dcompile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS}=20
-+-D_INIT=3Dlib$*_init ${CFLAGS} -o $@ -c $<
-
- libxt_NOTRACK.so: libxt_CT.so
--	ln -fs $< $@
-+	${AM_VERBOSE_GEN} ln -fs $< $@
- libxt_state.so: libxt_conntrack.so
--	ln -fs $< $@
-+	${AM_VERBOSE_GEN} ln -fs $< $@
-
- # Need the LIBADDs in iptables/Makefile.am too for libxtables_la_LIBADD -=
-ip6t_NETMAP_LIBADD  =3D -lip6tc
-+ip6t_NETMAP_LIBADD  =3D ../libiptc/libip6tc.la
- xt_RATEEST_LIBADD   =3D -lm
- xt_statistic_LIBADD =3D -lm
-
---
-1.7.2.5
-
diff --git a/meta/recipes-extended/iptables/iptables_1.4.17.bb b/meta/recip=
es-extended/iptables/iptables_1.4.18.bb
similarity index 90%
rename from meta/recipes-extended/iptables/iptables_1.4.17.bb
rename to meta/recipes-extended/iptables/iptables_1.4.18.bb
index aa932ce..bb8718f 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.17.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.18.bb
@@ -7,8 +7,6 @@ LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3\
                     file://iptables/iptables.c;beginline=3D13;endline=3D25=
;md5=3Dc5cffd09974558cf27d0f763df2a12dc"
=20
-PR =3D "r1"
-
 RRECOMMENDS_${PN} =3D "kernel-module-x-tables \
                      kernel-module-ip-tables \
                      kernel-module-iptable-filter \ @@ -23,12 +21,12 @@ FI=
LES_${PN}-dbg =3D+ "${libdir}/xtables/.debug"
=20
 SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-${PV}.t=
ar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patc=
h \
-           file://fix-link-failure-ip6t-NETMAP.patch \
            file://fix-iptables-extensions-build-error.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink=
.patch \
           "
-SRC_URI[md5sum] =3D "c3fb2ffd5b39d0d54b06ccc4c8660116"
-SRC_URI[sha256sum] =3D "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156a5=
43a1cd70554925"
+
+SRC_URI[md5sum] =3D "a819199d5ec013b82da13a8ffbba857e"
+SRC_URI[sha256sum] =3D "14a99fb8b0ca22027a9ac6eb72fa32c834ceb3073820e0ba79=
bf251c6a7bcf3c"
=20
 inherit autotools
=20
--
1.7.10.4



