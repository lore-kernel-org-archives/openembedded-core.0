Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RoAKU-0006mD-SE
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 10:00:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2012 00:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97881811"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 20 Jan 2012 00:52:32 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 20 Jan 2012 16:50:31 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 20 Jan 2012 16:50:28 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.21]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.229]) with mapi id
	14.01.0355.002; Fri, 20 Jan 2012 16:49:50 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc: Ensure that the shared source directory
	shared the same sstate hashes
Thread-Index: AQHM1uIBlU0j0FulQEKnsINEnDlET5YUZIKAgACL8xA=
Date: Fri, 20 Jan 2012 08:49:50 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FCC088E@SHSMSX102.ccr.corp.intel.com>
References: <1327001920.23015.1.camel@ted> <4F192381.1020603@linux.intel.com>
In-Reply-To: <4F192381.1020603@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH] gcc: Ensure that the shared source directory shared the same sstate hashes
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
X-List-Received-Date: Fri, 20 Jan 2012 09:00:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf
> Of Saul Wold
> Sent: Friday, January 20, 2012 4:19 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] gcc: Ensure that the shared source directo=
ry shared the same sstate hashes
>=20
> On 01/19/2012 11:38 AM, Richard Purdie wrote:
> > The fetch/unpack/patch/headerfix tasks are shared and hence their sstat=
e hashes
> > should also match. Sadly this is not the case since:
> >
> > a) gcc-runtime applies an additional patch
> > b) The do_headerfix task was missing from libgcc
> > c) The do_headerfix task is a shell task and hence depends
> >     on all exported variables which can vary between cross and target
> >     recipes.
> >
> > To fix this, the patch moves the patch to the common code, adds
> > the headerfix task to a common include file and disabled shell
> > dependencies on the do_headerfix task since its clear in this case
> > we don't need thsoe dependencies since we just call sed.
> >
> > With this patch applied, all these recipes now share common sstate chec=
ksums.
> >
> Richard,
>=20
> I tried both a sstate build with and existing tmp and a clean tmp, the
> existing tmp seemed to work ok, but with a clean tmp (and sstate), I got
> the following patch issue still.
>=20
> This was with BB_SIGNATURE_HANDLER ?=3D 'basichash' set.
>=20
> ERROR: Command Error: exit status: 1  Output:
> Could not link file
> `.pc/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch/configure' to `configure': No
> such file or directory
> Applying patch gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> patching file configure.ac
> Hunk #1 FAILED at 3073.
> 1 out of 1 hunk FAILED -- rejects in file configure.ac
> patching file configure
> Hunk #1 FAILED at 7594.
> 1 out of 1 hunk FAILED -- rejects in file configure
> Patch gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch does not apply (enforce with =
-f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /intel/poky2/builds/binutils/tmp/work-shared/gcc-4.6.2+svnr181430-r20/tem=
p/log.do_patch.15457
> NOTE: package libgcc-4.6.2+svnr181430-r20: task do_patch: Failed
> ERROR: Task 882
> (/intel/poky2/distro/meta/recipes-devtools/gcc/libgcc_4.6.bb, do_patch)
> failed with exit code '1'
>=20
> I have not tried a clean sstate / clean tmp.
>=20
Well, using the poky-conrib/rpurdie/t1 branch, it seems that the libgcc sti=
ll has different signature with=20
gcc-cross-initial for task patch. But bitbake-diffsigs reports nothing. gcc=
-runtime seems to be ok now.

>=20
> > Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devto=
ols/gcc/gcc-4.6.inc
> > index 4bbb2d2..a76fa0b 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> > @@ -73,6 +73,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;modul=
e=3D${BRANCH};proto=3Dhttp \
> >   	   file://pr47551.patch \
> >   	   file://gcc-arm-set-cost.patch \
> >   	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
> > +	   file://fortran-cross-compile-hack.patch \
> >   	  "
> >
> >   SRC_URI_append_sh3  =3D " file://sh3-installfix-fixheaders.patch "
> > diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-de=
vtools/gcc/gcc-common.inc
> > index fe112d9..ed41b0f 100644
> > --- a/meta/recipes-devtools/gcc/gcc-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> > @@ -88,3 +88,20 @@ python workshared_clean () {
> >   	bb.note("Removing " + dir)
> >   	oe.path.remove(dir)
> >   }
> > +
> > +do_headerfix () {
> > +	# Change the default dynamic linker path, in case $base_liddir is non=
-standard
> > +	# (e.g. in multilib or sdk cases)
> > +	#
> > +	# We want something like the following:
> > +	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> > +	# becomes
> > +	#	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2=
"
> > +	#
> > +	sed -i ${S}/gcc/config/*/linux*.h -e \
> > +		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_=
DIR "\3#'
> > +}
> > +
> > +addtask headerfix after do_unpack before do_patch
> > +
> > +do_headerfix[vardepvalue] =3D "PATH"
> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/=
recipes-devtools/gcc/gcc-configure-common.inc
> > index d014980..c4b6ac1 100644
> > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > @@ -62,21 +62,6 @@ SYSTEMHEADERS =3D "${target_includedir}"
> >   SYSTEMLIBS =3D "${target_base_libdir}/"
> >   SYSTEMLIBS1 =3D "${target_libdir}/"
> >
> > -do_headerfix () {
> > -	# Change the default dynamic linker path, in case $base_liddir is non=
-standard
> > -	# (e.g. in multilib or sdk cases)
> > -	#
> > -	# We want something like the following:
> > -	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> > -	# becomes
> > -	#	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2=
"
> > -	#
> > -	sed -i ${S}/gcc/config/*/linux*.h -e \
> > -		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_=
DIR "\3#'
> > -}
> > -
> > -addtask headerfix after do_unpack before do_patch
> > -
> >   do_configure_prepend () {
> >   	# teach gcc to find correct target includedir when checking libc ssp=
 support
> >   	mkdir -p ${B}/gcc
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb b/meta/recipe=
s-devtools/gcc/gcc-runtime_4.6.bb
> > index 568b5af..97468db 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
> > @@ -2,8 +2,6 @@ require gcc-${PV}.inc
> >   require gcc-configure-runtime.inc
> >   require gcc-package-runtime.inc
> >
> > -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> > -
> >   ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> >
> >   EXTRA_OECONF +=3D "--disable-libunwind-exceptions"
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


