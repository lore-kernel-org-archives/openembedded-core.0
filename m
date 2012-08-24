Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1T4qgR-0002P5-0D
	for Openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 12:00:07 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 1514AD22E8; Fri, 24 Aug 2012 11:48:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id AEB7ED22DE;
	Fri, 24 Aug 2012 11:47:31 +0200 (CEST)
Message-ID: <50374DAF.7080701@linaro.org>
Date: Fri, 24 Aug 2012 11:47:27 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120814 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1345706669-28914-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<503659AA.3090505@linux.intel.com>
In-Reply-To: <503659AA.3090505@linux.intel.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] subversion: update to 1.7.6
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
X-List-Received-Date: Fri, 24 Aug 2012 10:00:07 -0000
X-Groupsio-MsgNum: 28173
Content-Type: multipart/mixed; boundary="------------090708050201040900040008"

--------------090708050201040900040008
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 23.08.2012 18:26, Saul Wold pisze:
> On 08/23/2012 12:24 AM, Marcin Juszkiewicz wrote:
>> Dropped --without-apache option as it does not exists.
>>
>> Added patch from subversion-users ML to not build mod_dontdothat.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

> I seem to be having a problem applying this patch, can you verify it or
> resend.

Exported it again and applied to other tree.

--------------090708050201040900040008
Content-Type: text/x-patch;
 name="0001-subversion-update-to-1.7.6.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-subversion-update-to-1.7.6.patch"

From 75b8550a2da432edf86205a08833f52a9588fae4 Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 22 Aug 2012 22:25:04 +0200
Subject: [PATCH 1/2] subversion: update to 1.7.6

Dropped --without-apache option as it does not exists.

Added patch from subversion-users ML to not build mod_dontdothat.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../subversion-1.7.6/fix-install-depends.patch     |   48 +++++++++
 .../libtool2.patch                                 |    0
 ...ersion-1.7.6_mod_dontdothat_svnserve_only.patch |  108 ++++++++++++++++=
++++
 .../{subversion_1.7.2.bb =3D> subversion_1.7.6.bb}   |    9 +-
 4 files changed, 160 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/fix-i=
nstall-depends.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.2 =3D> subversion-=
1.7.6}/libtool2.patch (100%)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/subve=
rsion-1.7.6_mod_dontdothat_svnserve_only.patch
 rename meta/recipes-devtools/subversion/{subversion_1.7.2.bb =3D> subversi=
on_1.7.6.bb} (79%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-=
depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.6/fix-insta=
ll-depends.patch
new file mode 100644
index 0000000..fb79b8c
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-depends=
.patch
@@ -0,0 +1,48 @@
+install-neon-lib should depend on libsvn_delta's installation
+
+install-neon-lib needs libsvn_delta-1.la which will be regenerated
+during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
+in regenerating and at the same time install-neon-lib links it, the
+error willl happen.
+
+Let install-neon-lib run after libsvn_delta-1.la is installed will fix
+the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-outputs.mk |    2 +-
+ build.conf       |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+--- subversion-1.7.6.orig/build-outputs.mk
++++ subversion-1.7.6/build-outputs.mk
+@@ -983,11 +983,11 @@ install-locale: subversion/po/de.mo subv
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_CN.mo $(DESTDIR)$(localedir)/zh_=
CN/LC_MESSAGES/$(PACKAGE_NAME).mo
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_=
TW/LC_MESSAGES/$(PACKAGE_NAME).mo
+=20
+-install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la=20
++install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_=
LIB_INSTALL_DEPS)
+ 	$(MKDIR) $(DESTDIR)$(neon_libdir)
+ 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $=
(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
+=20
+ install-ramod-lib: subversion/libsvn_fs/libsvn_fs-1.la subversion/libsvn_=
ra_svn/libsvn_ra_svn-1.la subversion/libsvn_repos/libsvn_repos-1.la subvers=
ion/libsvn_ra_local/libsvn_ra_local-1.la=20
+ 	$(MKDIR) $(DESTDIR)$(ramod_libdir)
+--- subversion-1.7.6.orig/build.conf
++++ subversion-1.7.6/build.conf
+@@ -270,10 +270,12 @@ msvc-export =3D svn_ra.h private\svn_ra_pr
+ [libsvn_ra_neon]
+ type =3D ra-module
+ path =3D subversion/libsvn_ra_neon
+ install =3D neon-lib
+ libs =3D libsvn_delta libsvn_subr aprutil apriconv apr neon
++# conditionally add more dependencies
++add-install-deps =3D $(SVN_FS_LIB_INSTALL_DEPS)
+ msvc-static =3D yes
+=20
+ # Accessing repositories via DAV through serf
+ [libsvn_ra_serf]
+ type =3D ra-module
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.pat=
ch b/meta/recipes-devtools/subversion/subversion-1.7.6/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patc=
h
rename to meta/recipes-devtools/subversion/subversion-1.7.6/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1=
.7.6_mod_dontdothat_svnserve_only.patch b/meta/recipes-devtools/subversion/=
subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
new file mode 100644
index 0000000..77f9135
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mo=
d_dontdothat_svnserve_only.patch
@@ -0,0 +1,108 @@
+Patch taken from subversion-users ML.
+
+From: Roman Plessl <roman.plessl_at_oetiker.ch>=20
+Date: Thu, 16 Aug 2012 09:48:32 +0200 (CEST)
+
+Hi All,=20
+I try to compile and installe the new subversion 1.7.6 using my build=20
+system. I use svnserve as standalone subversion server so my build=20
+is not using the apache bindings.=20
+I got the following compile error for the module mod_dontdothat:=20
+...=20
+/bin/bash /scratch/build/subversion-1.7.6-rp/subversion-1.7.6/libtool=20
+--tag=3DCC --silent --mode=3Dcompile gcc=20
+-I/usr/pack/subversion-1.7.6-rp/include -DLINUX=3D2 -D_REENTRANT=20
+-D_GNU_SOURCE -g -O2 -g -O2 -pthread=20
+-Werror=3Dimplicit-function-declaration -I./subversion/include=20
+-I./subversion -I/usr/pack/subversion-1.7.6-rp/include/apr-1=20
+-I/usr/pack/subversion-1.7.6-rp/include/apr-1=20
+-I/usr/pack/subversion-1.7.6-rp/include=20
+-I/usr/pack/subversion-1.7.6-rp/include/neon=20
+-I/usr/pack/subversion-1.7.6-rp/include/serf-1 -o=20
+tools/server-side/mod_dontdothat/mod_dontdothat.lo -c=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:25:19: error: httpd.h:=
=20
+No such file or directory=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:26:25: error:=20
+http_config.h: No such file or directory=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:27:27: error:=20
+http_protocol.h: No such file or directory=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:28:26: error:=20
+http_request.h: No such file or directory=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:29:22: error:=20
+http_log.h: No such file or directory=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:30:25: error:=20
+util_filter.h: No such file or directory=20
+tools/server-side/mod_dontdothat/mod_dontdothat.c:31:23: error:=20
+ap_config.h: No such file or directory=20
+...=20
+I suppose the module mod_dontdothat should be only build with activated=20
+'apache-mod's . Maybe the build target declaration has been forget when=20
+moving the target for subversion 1.7.6.=20
+...=20
+checking for Apache module support via DSO through APXS... no=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
+WARNING: skipping the build of mod_dav_svn=20
+          try using --with-apxs=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
+...=20
+Could you check that?=20
+I have used the attached patch to fix it for myself.=20
+Cheers=20
+Roman=20
+--
+Roman Plessl            phone:        +41 (62) 775 9904
+OETIKER+PARTNER AG      email:        roman.plessl_at_oetiker.ch
+Aarweg 15               web:          http://it.oetiker.ch
+CH-4600 Olten           switch board: +41 (62) 775 9900
+
+
+
+---
+ build-outputs.mk |    4 ++--
+ build.conf       |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+--- subversion-1.7.6.orig/build-outputs.mk
++++ subversion-1.7.6/build-outputs.mk
+@@ -823,11 +823,11 @@ subversion/tests/libsvn_delta/window-tes
+=20
+ ########################################
+ # Section 6: Install-Group build targets
+ ########################################
+=20
+-apache-mod: subversion/mod_authz_svn/mod_authz_svn.la subversion/mod_dav_=
svn/mod_dav_svn.la
++apache-mod: subversion/mod_authz_svn/mod_authz_svn.la subversion/mod_dav_=
svn/mod_dav_svn.la tools/server-side/mod_dontdothat/mod_dontdothat.la
+=20
+ bdb-lib: subversion/libsvn_fs_base/libsvn_fs_base-1.la
+=20
+ bdb-test: subversion/tests/libsvn_fs_base/changes-test$(EXEEXT) subversio=
n/tests/libsvn_fs_base/fs-base-test$(EXEEXT) subversion/tests/libsvn_fs_bas=
e/strings-reps-test$(EXEEXT)
+=20
+@@ -875,11 +875,11 @@ swig-rb: subversion/bindings/swig/ruby/c
+=20
+ swig-rb-lib: subversion/bindings/swig/ruby/libsvn_swig_ruby/libsvn_swig_r=
uby-1.la
+=20
+ test: subversion/tests/cmdline/atomic-ra-revprop-change$(EXEEXT) subversi=
on/tests/libsvn_subr/auth-test$(EXEEXT) subversion/tests/libsvn_subr/cache-=
test$(EXEEXT) subversion/tests/libsvn_subr/checksum-test$(EXEEXT) subversio=
n/tests/libsvn_client/client-test$(EXEEXT) subversion/tests/libsvn_subr/com=
pat-test$(EXEEXT) subversion/tests/libsvn_subr/config-test$(EXEEXT) subvers=
ion/tests/libsvn_wc/db-test$(EXEEXT) subversion/tests/libsvn_diff/diff-diff=
3-test$(EXEEXT) subversion/tests/libsvn_subr/dirent_uri-test$(EXEEXT) subve=
rsion/tests/libsvn_wc/entries-compat-test$(EXEEXT) subversion/tests/cmdline=
/entries-dump$(EXEEXT) subversion/tests/libsvn_subr/error-test$(EXEEXT) sub=
version/tests/libsvn_fs_fs/fs-pack-test$(EXEEXT) subversion/tests/libsvn_fs=
/fs-test$(EXEEXT) subversion/tests/libsvn_subr/hashdump-test$(EXEEXT) subve=
rsion/tests/libsvn_test-1.la subversion/tests/libsvn_fs/locks-test$(EXEEXT)=
 subversion/tests/libsvn_subr/mergeinfo-test$(EXEEXT) subversion/tests/libs=
vn_wc/op-depth-test$(EXEEXT) subversion/tests/libsvn_subr/opt-test$(EXEEXT)=
 subversion/tests/libsvn_diff/parse-diff-test$(EXEEXT) subversion/tests/lib=
svn_subr/path-test$(EXEEXT) subversion/tests/libsvn_wc/pristine-store-test$=
(EXEEXT) subversion/tests/libsvn_ra_local/ra-local-test$(EXEEXT) subversion=
/tests/libsvn_delta/random-test$(EXEEXT) subversion/tests/libsvn_repos/repo=
s-test$(EXEEXT) subversion/tests/libsvn_subr/revision-test$(EXEEXT) subvers=
ion/tests/libsvn_subr/skel-test$(EXEEXT) subversion/tests/libsvn_subr/strea=
m-test$(EXEEXT) subversion/tests/libsvn_subr/string-test$(EXEEXT) subversio=
n/tests/libsvn_subr/subst_translate-test$(EXEEXT) subversion/tests/libsvn_d=
elta/svndiff-test$(EXEEXT) subversion/tests/libsvn_subr/target-test$(EXEEXT=
) subversion/tests/libsvn_subr/time-test$(EXEEXT) subversion/tests/libsvn_s=
ubr/translate-test$(EXEEXT) subversion/tests/libsvn_wc/tree-conflict-data-t=
est$(EXEEXT) subversion/tests/libsvn_subr/utf-test$(EXEEXT) subversion/test=
s/libsvn_delta/vdelta-test$(EXEEXT) subversion/tests/libsvn_wc/wc-incomplet=
e-tester$(EXEEXT) subversion/tests/libsvn_wc/wc-lock-tester$(EXEEXT) subver=
sion/tests/libsvn_delta/window-test$(EXEEXT)
+=20
+-tools: tools/diff/diff$(EXEEXT) tools/diff/diff3$(EXEEXT) tools/diff/diff=
4$(EXEEXT) tools/server-side/mod_dontdothat/mod_dontdothat.la tools/server-=
side/svn-populate-node-origins-index$(EXEEXT) tools/server-side/svn-rep-sha=
ring-stats$(EXEEXT) tools/server-side/svnauthz-validate$(EXEEXT) tools/clie=
nt-side/svnmucc/svnmucc$(EXEEXT) tools/dev/svnraisetreeconflict/svnraisetre=
econflict$(EXEEXT)
++tools: tools/diff/diff$(EXEEXT) tools/diff/diff3$(EXEEXT) tools/diff/diff=
4$(EXEEXT) tools/server-side/svn-populate-node-origins-index$(EXEEXT) tools=
/server-side/svn-rep-sharing-stats$(EXEEXT) tools/server-side/svnauthz-vali=
date$(EXEEXT) tools/client-side/svnmucc/svnmucc$(EXEEXT) tools/dev/svnraise=
treeconflict/svnraisetreeconflict$(EXEEXT)
+=20
+=20
+ ########################################
+ # Section 7: Install-Group install targets
+ ########################################
+--- subversion-1.7.6.orig/build.conf
++++ subversion-1.7.6/build.conf
+@@ -367,11 +367,11 @@ msvc-libs =3D libhttpd.lib
+ description =3D Apache Httpd module to block certain kinds of Apache Subv=
ersion requests
+ type =3D apache-mod
+ path =3D tools/server-side/mod_dontdothat
+ nonlibs =3D mod_dav_svn apr aprutil
+ libs =3D libsvn_subr xml
+-install =3D tools
++install =3D apache-mod
+ msvc-libs =3D libhttpd.lib
+=20
+ # -----------------------------------------------------------------------=
-----
+ #
+ # CONSTRUCTED HEADERS
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/re=
cipes-devtools/subversion/subversion_1.7.6.bb
similarity index 79%
rename from meta/recipes-devtools/subversion/subversion_1.7.2.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.6.bb
index c3e6763..b21d5be 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.6.bb
@@ -7,21 +7,20 @@ HOMEPAGE =3D "http://subversion.tigris.org"
=20
 BBCLASSEXTEND =3D "native"
=20
-PR =3D "r5"
-
 inherit gettext
=20
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
+           file://subversion-1.7.6_mod_dontdothat_svnserve_only.patch \
 "
-SRC_URI[md5sum] =3D "1e5dfffd27be080672e5a042564368a8"
-SRC_URI[sha256sum] =3D "7eb3e1ae2b0385e1cc20ca9e1839e0ef0ac98a7455dc52ba4c=
df567547bfc517"
+SRC_URI[md5sum] =3D "4baa434db7709bb059b05d02a2547663"
+SRC_URI[sha256sum] =3D "d1a4f13c5c992a1527a2aeac262c6f54e073963ce1d13abfab=
b2a90980fa7d05"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4ecd=
4"
=20
 EXTRA_OECONF =3D " \
-                --without-berkeley-db --without-apxs --without-apache \
+                --without-berkeley-db --without-apxs \
                 --without-swig --with-apr=3D${STAGING_BINDIR_CROSS} \
                 --with-apr-util=3D${STAGING_BINDIR_CROSS} \
                 ac_cv_path_RUBY=3Dnone"
--=20
1.7.10.4


--------------090708050201040900040008--
