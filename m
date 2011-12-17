Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rbj0W-0001l6-Vl
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 02:24:13 +0100
Received: by eeit10 with SMTP id t10so241477eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rleLCkP5or8UjN1h0ffTCRdDl79+SN9dcW6Y/R2Qdjg=;
	b=uQj2PcO8z2JcoHbcQoJT/Mv54vw7EZwK2O4FgRHlp5GBgP8wAvFOwv6OmmBxraOK23
	3piGIs12mmk5p4g7ciec/HG9tTPSuJA7TMEA/xZwzzkUyDo3Mc8i6cxvfFlCtAaR7Ys7
	D0JIv6BsEr9S9LtzO2orMhXF2ZGTQ1/vA8LUY=
Received: by 10.213.26.9 with SMTP id b9mr740206ebc.106.1324084632915;
	Fri, 16 Dec 2011 17:17:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x12sm4426804eef.9.2011.12.16.17.17.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 17:17:11 -0800 (PST)
Date: Sat, 17 Dec 2011 02:16:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111217011658.GE3997@jama.jama.net>
References: <1323983329.4568.63.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1323983329.4568.63.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Graham Gower <graham.gower@gmail.com>
Subject: Re: opkg: Update svn 625 -> 633 and fix preinst issues
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
X-List-Received-Date: Sat, 17 Dec 2011 01:24:13 -0000
X-Groupsio-MsgNum: 14369
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline

--0H629O+sVkh21xTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 09:08:49PM +0000, Richard Purdie wrote:
> There is a major issue with opkg images at the moment as preinst
> functions are not being executed before their dependencies are installed
> and this is leading to corruption of images containing avahi/dbus in
> particular.
>=20
> There are various changes in upstream opkg in the last 8 revisions which
> make changes in this area but sadly these aren't enough to get things
> working for us. I've updated to the latest svn revision with this patch
> since it makes sense to pull in those changes first and then supplement
> them with the attached patches.
>=20
> There is a full description of the patches in the patch headers but in
> summary they:
>=20
> a) Ensure preinst functions execute with their dependencies installed.
>    This is a pretty invasive change as it changes the package install
>    ordering in general.
> b) Ensure opkg sets $D, not $PKG_ROOT which we don't use
> c) Change opkg to allow execution of postinstall functions which fail
>    resulting in execution on the target device as rootfs_ipk.bbclass
>    currently does manually.
>=20
> The remaining changes interface this with the rest of the OE build
> infrastructure, adding in the option to tell opkg to run the preinst and
> postinst functions, ensure the correct environment is present for the
> postinst scripts and removing the now unneeded rootfs_ipk class code
> which opkg now does itself.
>=20
> [YOCTO #1711]

Hi,

today I got image build failing with this and it seems like some kind of
circular dependency or something.

In fsogsmd_git.bb we have:
PACKAGES =3D+ "${PN}-connman ${PN}-connman-dev ${PN}-connman-dbg"
RDEPENDS_${PN} +=3D "${PN}-connman"

and there is also fsogsmd-connman dependency on fsogsmd (because of shlibs),
so it's really circular dependency between runtime packages and new opkg ca=
nnot
deal with it.

Then in log.do_rootfs
Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528=
-r6.7) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/qemuarm/fsogsmd_0.5.0+g=
itr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d0=
87c6c528-r6.7) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/qemuarm/fsogsmd-connman=
_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528=
-r6.7) to root...
Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d0=
87c6c528-r6.7) to root...
and then this last 2 lines 1794/2 times
Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528=
-r6.7) to root...
Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d0=
87c6c528-r6.7) to root...
Installing task-core-ssh-openssh (1.0-r0) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv5te/task-core-ssh-o=
penssh_1.0-r0_armv5te.ipk.
=2E..
and in the end:
ERROR: Function 'do_rootfs' failed (see /OE/shr-core/tmp-eglibc/work/qemuar=
m-oe-linux-gnueabi/shr-lite-image/2.0-r20/temp/log.do_rootfs.20387 for furt=
her information)
Collected errors:
 * gz_close: Unzip process killed by signal 11.

 * pkg_get_installed_files: Error extracting file list from /tmp/opkg-T7G08=
e/fsogsmd-connman_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.=
7_qemuarm.ipk.
 * opkg_install_cmd: Cannot install package task-shr-minimal-apps.

Reverting this patch and rebuilding opkg before running image build helps.

I'll try to upgrade only opkg without your patches first, but I guess it's
because of fix_installorder.patch, can we teach it to break circular depend=
encies
or should I fix it in metadata? It seem that longer cycles like

fsogsmd-config -> fsogsmd-module-modem-ti-calypso -> fsogsmd -> fsogsmd-con=
fig

does work.

Regards,

>    =20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.=
bbclass
> index 1633aff..aeabc11 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -133,7 +133,7 @@ package_install_internal_ipk() {
> =20
>  	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
> =20
> -	local ipkg_args=3D"-f ${conffile} -o ${target_rootfs} --force-overwrite"
> +	local ipkg_args=3D"-f ${conffile} -o ${target_rootfs} --force-overwrite=
 --force_postinstall"
> =20
>  	opkg-cl ${ipkg_args} update
> =20
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bb=
class
> index ec01951..b5556fa 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -60,14 +60,14 @@ fakeroot rootfs_ipk_do_rootfs () {
>  	export INSTALL_CONF_IPK=3D"${IPKGCONF_TARGET}"
>  	export INSTALL_PACKAGES_IPK=3D"${PACKAGE_INSTALL}"
> =20
> -	package_install_internal_ipk
> -
>  	#post install
>  	export D=3D${IMAGE_ROOTFS}
>  	export OFFLINE_ROOT=3D${IMAGE_ROOTFS}
>  	export IPKG_OFFLINE_ROOT=3D${IMAGE_ROOTFS}
>  	export OPKG_OFFLINE_ROOT=3D${IPKG_OFFLINE_ROOT}
> =20
> +	package_install_internal_ipk
> +
>  	# Distro specific packages should create this
>  	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
>  	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf
> @@ -75,28 +75,8 @@ fakeroot rootfs_ipk_do_rootfs () {
>  	${OPKG_POSTPROCESS_COMMANDS}
>  	${ROOTFS_POSTINSTALL_COMMAND}
>  =09
> -	runtime_script_required=3D0
> -
> -	# Base-passwd needs to run first to install /etc/passwd and friends
> -	if [ -e ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst ] ; then
> -		sh ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst
> -	fi
> -
> -	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.preinst; do
> -		if [ -f $i ] && ! sh $i; then
> -		     	runtime_script_required=3D1
> -			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
> -		fi
> -	done
> -	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.postinst; do
> -		if [ -f $i ] && ! sh $i configure; then
> -		     	runtime_script_required=3D1
> -			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
> -		fi
> -	done
> -
>  	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "fals=
e" ,d)}; then
> -		if [ $runtime_script_required -eq 1 ]; then
> +		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status=
; then
>  			echo "Some packages could not be configured offline and rootfs is rea=
d-only."
>  			exit 1
>  		fi
> diff --git a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch b/met=
a/recipes-devtools/opkg/opkg/fix_installorder.patch
> new file mode 100644
> index 0000000..e782ce7
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
> @@ -0,0 +1,174 @@
> +There is a problem with dependency order when installing packages. The k=
ey=20
> +problem revolves around the satisfy_dependencies_for() function which is=
=20
> +called from opkg_install_pkg just before the installation (and preinst)
> +happens.
> +
> +The satisfy_dependencies_for() function calls pkg_hash_fetch_unsatisfied=
_dependencies()
> +which will only return packages which were previously not marked as=20
> +*going* to be installed at some point. For the purposes of=20
> +opkg_install_pkg() we really need to know which dependencies haven't bee=
n=20
> +installed yet.
> +
> +This patch adds pkg_hash_fetch_satisfied_dependencies() which returns a=
=20
> +list of package dependencies. We can then directly check the status of=
=20
> +these and ensure any hard dependencies (not suggestions or recommendatio=
ns)
> +are installed before returning.
> +
> +Consider the situation (where -> means 'depends on'):
> +
> +X -> A,E
> +A -> B,E
> +E -> B
> +B -> C
> +
> +Currently X would install A and E. When installing A the packages B, E=
=20
> +and C would be marked as "to install". When the package B is considered
> +the second time (as a dependency of E rather than A), it would install=
=20
> +straight away even though C was not currently installed, just marked
> +as needing to be installed.
> +
> +The patch changes the behaviour so B can't install until C really is ins=
talled.
> +
> +This change is required to run the postinst scripts in the correct order.
> +
> +Upstream-Status: Pending
> +
> +RP 2011/12/15
> +
> +Index: trunk/libopkg/opkg_install.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/opkg_install.c	2011-12-15 15:58:39.000000000 +0000
> ++++ trunk/libopkg/opkg_install.c	2011-12-15 15:58:41.838334788 +0000
> +@@ -76,6 +77,27 @@
> +      }
> +=20
> +      if (ndepends <=3D 0) {
> ++	  pkg_vec_free(depends);     =20
> ++	  depends =3D pkg_hash_fetch_satisfied_dependencies(pkg);
> ++
> ++	  for (i =3D 0; i < depends->len; i++) {
> ++	       dep =3D depends->pkgs[i];
> ++	       /* The package was uninstalled when we started, but another
> ++	          dep earlier in this loop may have depended on it and pulled
> ++	          it in, so check first. */
> ++	       if ((dep->state_status !=3D SS_INSTALLED) && (dep->state_status=
 !=3D SS_UNPACKED)) {
> ++		    opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
> ++		    err =3D opkg_install_pkg(dep, 0);
> ++		    /* mark this package as having been automatically installed to
> ++		     * satisfy a dependancy */
> ++		    dep->auto_installed =3D 1;
> ++		    if (err) {
> ++			 pkg_vec_free(depends);
> ++			 return err;
> ++		    }
> ++	       }
> ++	  }
> ++
> + 	  pkg_vec_free(depends);
> + 	  return 0;
> +      }
> +Index: trunk/libopkg/pkg_depends.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/pkg_depends.c	2010-12-22 16:04:43.000000000 +0000
> ++++ trunk/libopkg/pkg_depends.c	2011-12-15 15:58:41.838334788 +0000
> +@@ -259,6 +259,88 @@
> +      return unsatisfied->len;
> + }
> +=20
> ++
> ++pkg_vec_t *
> ++pkg_hash_fetch_satisfied_dependencies(pkg_t * pkg)
> ++{
> ++     pkg_vec_t *satisfiers;
> ++     int i, j, k;
> ++     int count;
> ++     abstract_pkg_t * ab_pkg;
> ++
> ++     satisfiers =3D pkg_vec_alloc();
> ++
> ++     /*
> ++      * this is a setup to check for redundant/cyclic dependency checks,
> ++      * which are marked at the abstract_pkg level
> ++      */
> ++     if (!(ab_pkg =3D pkg->parent)) {
> ++	  opkg_msg(ERROR, "Internal error, with pkg %s.\n", pkg->name);
> ++	  return satisfiers;
> ++     }
> ++
> ++     count =3D pkg->pre_depends_count + pkg->depends_count + pkg->recom=
mends_count + pkg->suggests_count;
> ++     if (!count)
> ++	  return satisfiers;
> ++
> ++     /* foreach dependency */
> ++     for (i =3D 0; i < count; i++) {
> ++	  compound_depend_t * compound_depend =3D &pkg->depends[i];
> ++	  depend_t ** possible_satisfiers =3D compound_depend->possibilities;;
> ++
> ++          if (compound_depend->type =3D=3D RECOMMEND || compound_depend=
->type =3D=3D SUGGEST)
> ++              continue;
> ++
> ++	  if (compound_depend->type =3D=3D GREEDY_DEPEND) {
> ++	       /* foreach possible satisfier */
> ++	       for (j =3D 0; j < compound_depend->possibility_count; j++) {
> ++		    /* foreach provided_by, which includes the abstract_pkg itself */
> ++		    abstract_pkg_t *abpkg =3D possible_satisfiers[j]->pkg;
> ++		    abstract_pkg_vec_t *ab_provider_vec =3D abpkg->provided_by;
> ++		    int nposs =3D ab_provider_vec->len;
> ++		    abstract_pkg_t **ab_providers =3D ab_provider_vec->pkgs;
> ++		    int l;
> ++		    for (l =3D 0; l < nposs; l++) {
> ++			 pkg_vec_t *test_vec =3D ab_providers[l]->pkgs;
> ++			 /* if no depends on this one, try the first package that Provides t=
his one */
> ++			 if (!test_vec){   /* no pkg_vec hooked up to the abstract_pkg!  (ne=
ed another feed?) */
> ++			      continue;
> ++			 }
> ++
> ++			 /* cruise this possiblity's pkg_vec looking for an installed versio=
n */
> ++			 for (k =3D 0; k < test_vec->len; k++) {
> ++			      pkg_t *pkg_scout =3D test_vec->pkgs[k];
> ++			      /* not installed, and not already known about? */
> ++			      if (pkg_scout->state_want =3D=3D SW_INSTALL && pkg_scout !=3D =
pkg)
> ++      			          pkg_vec_insert(satisfiers, pkg_scout);
> ++			 }
> ++		    }
> ++	       }
> ++
> ++	       continue;
> ++	  }
> ++
> ++	  /* foreach possible satisfier, look for installed package  */
> ++	  for (j =3D 0; j < compound_depend->possibility_count; j++) {
> ++	       /* foreach provided_by, which includes the abstract_pkg itself =
*/
> ++	       depend_t *dependence_to_satisfy =3D possible_satisfiers[j];
> ++	       abstract_pkg_t *satisfying_apkg =3D possible_satisfiers[j]->pkg;
> ++	       pkg_t *satisfying_pkg =3D
> ++		    pkg_hash_fetch_best_installation_candidate(satisfying_apkg,
> ++							       pkg_installed_and_constraint_satisfied,
> ++							       dependence_to_satisfy, 1);
> ++               /* Being that I can't test constraing in pkg_hash, I wil=
l test it here */
> ++	       if (satisfying_pkg !=3D NULL && satisfying_pkg !=3D pkg) {
> ++                  if (pkg_constraint_satisfied(satisfying_pkg, dependen=
ce_to_satisfy) && satisfying_pkg->state_want =3D=3D SW_INSTALL)
> ++	              pkg_vec_insert(satisfiers, satisfying_pkg);
> ++               }
> ++
> ++	  }
> ++     }
> ++     return satisfiers;
> ++}
> ++
> ++
> + /*checking for conflicts !in replaces
> +   If a packages conflicts with another but is also replacing it, I shou=
ld not consider it a
> +   really conflicts
> +Index: trunk/libopkg/pkg_depends.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/pkg_depends.h	2010-12-22 16:04:43.000000000 +0000
> ++++ trunk/libopkg/pkg_depends.h	2011-12-15 15:58:41.838334788 +0000
> +@@ -82,6 +82,7 @@
> + void buildDependedUponBy(pkg_t * pkg, abstract_pkg_t * ab_pkg);
> + int version_constraints_satisfied(depend_t * depends, pkg_t * pkg);
> + int pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *dep=
ends, char *** unresolved);
> ++pkg_vec_t * pkg_hash_fetch_satisfied_dependencies(pkg_t * pkg);
> + pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
> + int pkg_dependence_satisfiable(depend_t *depend);
> + int pkg_dependence_satisfied(depend_t *depend);
> diff --git a/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch b/=
meta/recipes-devtools/opkg/opkg/offline_postinstall.patch
> new file mode 100644
> index 0000000..b197f6b
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch
> @@ -0,0 +1,57 @@
> +When we have an offline root and have specified force-postinstall,=20
> +attempt to run the postinstall but if it fails, just leave it in the
> +status file as neeing to run. We can issue a NOTICE this is happened
> +but supress errors. This means the OE class doesn't have to do any
> +further post processing of the postinstalls itself.
> +
> +Upstream-Status: Pending
> +
> +RP 2011/12/15
> +
> +
> +Index: trunk/libopkg/pkg.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
> ++++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
> +@@ -1297,8 +1297,9 @@
> +      free(cmd);
> +=20
> +      if (err) {
> +-	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n",=20
> +-               pkg->name, script, err);
> ++          if (!conf->offline_root)
> ++	       opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n=
",=20
> ++                    pkg->name, script, err);
> + 	  return err;
> +      }
> +=20
> +Index: trunk/libopkg/opkg_cmd.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/opkg_cmd.c	2011-12-15 19:49:25.826014150 +0000
> ++++ trunk/libopkg/opkg_cmd.c	2011-12-15 19:50:52.346012148 +0000
> +@@ -453,7 +453,8 @@
> + 		    pkg->state_flag &=3D ~SF_PREFER;
> + 		    opkg_state_changed++;
> + 	       } else {
> +-		    err =3D -1;
> ++                    if (!conf->offline_root)
> ++		         err =3D -1;
> + 	       }
> + 	  }
> +      }
> +Index: trunk/libopkg/opkg_configure.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/opkg_configure.c	2011-12-15 19:50:11.586013081 +0=
000
> ++++ trunk/libopkg/opkg_configure.c	2011-12-15 19:52:15.082010347 +0000
> +@@ -35,7 +35,10 @@
> +=20
> +     err =3D pkg_run_script(pkg, "postinst", "configure");
> +     if (err) {
> +-	opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
> ++        if (!conf->offline_root)
> ++	     opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
> ++        else
> ++	     opkg_msg(NOTICE, "%s.postinst returned %d, marking as unpacked on=
ly, configuration required on target.\n", pkg->name, err);
> + 	return err;
> +     }
> +=20
> diff --git a/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch b/=
meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
> new file mode 100644
> index 0000000..a67f389
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
> @@ -0,0 +1,20 @@
> +OE uses D as the offline install directory in its scripts, not PKG_ROOT.
> +
> +Upstream-Status: Inappropriate [OE specific usage]
> +
> +RP 2011/12/15
> +
> +Index: trunk/libopkg/pkg.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
> ++++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
> +@@ -1280,7 +1280,7 @@
> +=20
> +      opkg_msg(INFO, "Running script %s.\n", path);
> +=20
> +-     setenv("PKG_ROOT",
> ++     setenv("D",
> + 	    pkg->dest ? pkg->dest->root_dir : conf->default_dest->root_dir, 1);
> +=20
> +      if (! file_exists(path)) {
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtoo=
ls/opkg/opkg_svn.bb
> index acb21f2..2645d52 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -12,13 +12,16 @@ RREPLACES_${PN} =3D "opkg-nogpg"
>  SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtrunk;proto=3Dhttp \
>             file://add_vercmp.patch \
>             file://add_uname_support.patch \
> +           file://fix_installorder.patch \
> +           file://offline_postinstall.patch\
> +           file://offlineroot_varname.patch \
>  "
> =20
>  S =3D "${WORKDIR}/trunk"
> =20
> -SRCREV =3D "625"
> +SRCREV =3D "633"
>  PV =3D "0.1.8+svnr${SRCPV}"
> -PR =3D "r4"
> +PR =3D "r2"
> =20
>  PACKAGES =3D+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-altern=
atives-cworth${PKGSUFFIX}"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7r7YoACgkQN1Ujt2V2gByIEwCgldXCH9GIGxezpNwmpdwA5qxy
llEAnjFI0HcUs5yecRd0R349qJpyP+pN
=h9Uh
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--
