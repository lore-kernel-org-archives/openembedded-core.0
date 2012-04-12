Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SIKOa-0006QE-ET
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:49:08 +0200
Received: by qao25 with SMTP id 25so1639284qao.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yemud9g9kKF+oMXh+6dHMEVNOa7XeD4/YUQIHv+zBGc=;
	b=tS/1oK8cLskravE4i4sfvIn5qZwW09v/W/eowr8urQ5sA32IubIlV4ftKf2ZArRj+t
	EOjPMLBZx7k7sSwmOKfepr6bi+gzU7tmAQU9FaCEC1oXOtGHmMGHprVj4xmz5psi8zde
	mAPZjh8zhp5UHuuzb+8BGU+E33eYvgZMjam3VLBPYg0cWrYx+mM4sxz4yR8/Cie4edg/
	/ttX+IJzycSOWffZwGOByadnRhP0l/TPo3uKbYm5eml8MkEl6DZVdHYpgYU9UU2yYjqf
	nBxbPDUFpl2WNlmCGBObiliuH6NuFNhBA/Hk/yF2JNpfeukQT1utNZqfS71Lyynu1kmv
	+Wsg==
MIME-Version: 1.0
Received: by 10.224.31.202 with SMTP id z10mr3961489qac.31.1334237987801; Thu,
	12 Apr 2012 06:39:47 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Thu, 12 Apr 2012 06:39:47 -0700 (PDT)
In-Reply-To: <4F85FACB.8080205@windriver.com>
References: <1334179880.31685.12.camel@ted>
	<4F85FACB.8080205@windriver.com>
Date: Thu, 12 Apr 2012 06:39:47 -0700
Message-ID: <CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
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
X-List-Received-Date: Thu, 12 Apr 2012 13:49:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 2:42 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 4/11/12 4:31 PM, Richard Purdie wrote:
>>
>> We were already having occasional ordering issues with package_rpm.
>> Fixing the ldconfig postinstall issue pushed rpm over the cliff and
>> totally broke rpm builds with the packages getting installed in
>> effectively a random order and the useradd preinstalls getting executed
>> out of order and breaking.
>>
>> The only explanation I can find for this is that rpm is special. It will
>> happily run a preinst for a package without any of that package's
>> dependencies being present regardless of whether there are any circular
>> dependency issues or not. I attempted various ways of solving this such
>> as ordering the total_solution.manifest in creative ways but the bottom
>> line is RPM ignores this. It takes little account of any request to
>> ignore /bin/sh dependencies for the purposes of constructing the final
>> image.
>>
>> The end result is we're having to install the base-passwd, base-files
>> and shadow packages first (if there is a request to install them), then
>> install any other packages.
>>
>> It this wasn't in the middle of a release I'd be rewriting this bbclass
>> file, its horrible.
>>
>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>
>
> I've reviewed this. =A0I don't see anything wrong with this, other then t=
he
> pain of having to do this.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

FWIW, after pulling current poky this morning all of my image builds
are failing with errors like this:

| Installing base dependencies first (base-passwd, base-files and
shadow) since rpm is special
| error: Failed dependencies:
| 	/bin/sh is needed by base-passwd-3.5.24-r0.armv7a
| 	/bin/sh is needed by shadow-4.1.4.3-r8.armv7a
| 	/bin/sh is needed by libgcc1-4.6.3+svnr184847-r24.armv7a
| 	/bin/sh is needed by libc6-2.13-r23+svnr15508.armv7a

I'll investigate, but since it is late in the release process thought
I would mention the issue.

Steve



>> diff --git a/meta/classes/package_rpm.bbclass
>> b/meta/classes/package_rpm.bbclass
>> index 16a2c87..1b0f6f2 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -166,22 +167,23 @@ rpm_common_comand () {
>> =A0# install or remove the pkg
>> =A0rpm_update_pkg () {
>>
>> + =A0 =A0manifest=3D$1
>> + =A0 =A0btmanifest=3D$manifest.bt
>> =A0 =A0 =A0local target_rootfs=3D"${INSTALL_ROOTFS_RPM}"
>>
>> =A0 =A0 =A0# Save the rpm's build time for incremental image generation,=
 and the
>> file
>> =A0 =A0 =A0# would be moved to ${T}
>> - =A0 =A0rm -f ${target_rootfs}/install/total_solution_bt.manifest
>> - =A0 =A0for i in `cat ${target_rootfs}/install/total_solution.manifest`=
; do
>> + =A0 =A0rm -f $btmanifest
>> + =A0 =A0for i in `cat $manifest`; do
>> =A0 =A0 =A0 =A0 =A0# Use "rpm" rather than "${RPM}" here, since we don't=
 need the
>> =A0 =A0 =A0 =A0 =A0# '--dbpath' option
>> - =A0 =A0 =A0 =A0echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">> =A0\
>> - =A0 =A0 =A0 =A0 =A0 =A0${target_rootfs}/install/total_solution_bt.mani=
fest
>> + =A0 =A0 =A0 =A0echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">> =A0$btma=
nifest
>> =A0 =A0 =A0done
>>
>> =A0 =A0 =A0# Only install the different pkgs if incremental image genera=
tion is
>> set
>> =A0 =A0 =A0if [ "${INC_RPM_IMAGE_GEN}" =3D "1" -a -f
>> ${T}/total_solution_bt.manifest -a \
>> =A0 =A0 =A0 =A0 =A0"${IMAGE_PKGTYPE}" =3D "rpm" ]; then
>> - =A0 =A0 =A0 =A0cur_list=3D"${target_rootfs}/install/total_solution_bt.=
manifest"
>> + =A0 =A0 =A0 =A0cur_list=3D"$btmanifest"
>> =A0 =A0 =A0 =A0 =A0pre_list=3D"${T}/total_solution_bt.manifest"
>> =A0 =A0 =A0 =A0 =A0sort -u $cur_list -o $cur_list
>> =A0 =A0 =A0 =A0 =A0sort -u $pre_list -o $pre_list
>> @@ -203,8 +205,7 @@ rpm_update_pkg () {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0-Uvh ${target_rootfs}/install/incremental.man=
ifest
>> =A0 =A0 =A0else
>> =A0 =A0 =A0 =A0 =A0# Attempt to install
>> - =A0 =A0 =A0 =A0rpm_common_comand --replacepkgs \
>> - =A0 =A0 =A0 =A0 =A0 =A0-Uhv ${target_rootfs}/install/total_solution.ma=
nifest
>> + =A0 =A0 =A0 =A0rpm_common_comand --replacepkgs -Uhv $manifest
>> =A0 =A0 =A0fi
>> =A0}
>>
>> @@ -440,14 +441,7 @@ package_install_internal_rpm () {
>>
>> =A0 =A0 =A0 =A0fi
>>
>> - =A0 =A0 =A0 # If base-passwd or shadow are in the list of packages to =
install,
>> - =A0 =A0 =A0 # ensure they are installed first to support later package=
s that
>> - =A0 =A0 =A0 # may create custom users/groups (fixes Yocto bug #2127)
>> - =A0 =A0 =A0 infile=3D${target_rootfs}/install/install_solution.manifes=
t
>> - =A0 =A0 =A0 outfile=3D${target_rootfs}/install/total_solution.manifest
>> - =A0 =A0 =A0 cat $infile | grep /base-passwd-[0-9]> =A0$outfile || true
>> - =A0 =A0 =A0 cat $infile | grep /shadow-[0-9]>> =A0$outfile || true
>> - =A0 =A0 =A0 cat $infile | grep -v /shadow-[0-9] | grep -v /base-passwd=
-[0-9]>>
>> =A0$outfile || true
>> + =A0 =A0 =A0 cat ${target_rootfs}/install/install_solution.manifest>
>> =A0${target_rootfs}/install/total_solution.manifest
>> =A0 =A0 =A0 =A0cat ${target_rootfs}/install/install_multilib_solution.ma=
nifest>>
>> =A0${target_rootfs}/install/total_solution.manifest
>>
>> =A0 =A0 =A0 =A0# Construct install scriptlet wrapper
>> @@ -474,8 +468,45 @@ EOF
>>
>> =A0 =A0 =A0 =A0chmod 0755 ${WORKDIR}/scriptlet_wrapper
>>
>> - =A0 =A0rpm_update_pkg
>> + =A0 =A0 =A0 # RPM is special. It can't handle dependencies and preinst=
all
>> scripts correctly. Its
>> + =A0 =A0 =A0 # probably a feature. The only way to convince rpm to actu=
ally run
>> the preinstall scripts
>> + =A0 =A0 =A0 # for base-passwd and shadow first before installing packa=
ges that
>> depend on these packages
>> + =A0 =A0 =A0 # is to do two image installs, installing one set of packa=
ges,
>> then the other.
>> + =A0 =A0 =A0 if [ "${INC_RPM_IMAGE_GEN}" =3D "1" -a -f
>> ${T}/total_solution_bt.manifest ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Skipping pre install due to exisitng=
 image"
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# Intial Install manifest">
>> =A0${target_rootfs}/install/initial_install.manifest
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Installing base dependencies first (=
base-passwd,
>> base-files and shadow) since rpm is special"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep /base-passwd-[0-9]
>> ${target_rootfs}/install/total_solution.manifest>>
>> =A0${target_rootfs}/install/initial_install.manifest || true
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep /base-files-[0-9]
>> ${target_rootfs}/install/total_solution.manifest>>
>> =A0${target_rootfs}/install/initial_install.manifest || true
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep /shadow-[0-9]
>> ${target_rootfs}/install/total_solution.manifest>>
>> =A0${target_rootfs}/install/initial_install.manifest || true
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # Generate an install solution by doing a =
--justdb
>> install, then recreate it with
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # an actual package install!
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkdir -p ${target_rootfs}/initial
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} --predefine "_rpmds_sysinfo_path
>> ${target_rootfs}/etc/rpm/sysinfo" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --predefine "_rpmrc_platfo=
rm_path
>> ${target_rootfs}/etc/rpm/platform" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -D "_dbpath ${target_rootf=
s}/initial" -D "`cat
>> ${confbase}-base_archs.macro`" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -D "__dbi_txn create nofsy=
nc" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -U --justdb --noscripts --=
notriggers
>> --noparentdirs --nolinktos --ignoresize \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${target_rootfs}/install/i=
nitial_install.manifest
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} -D "_dbpath ${target_rootfs}/initia=
l" -qa --yaml \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -D "__dbi_txn create nofsy=
nc private" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | grep -i 'Packageorigin' =
| cut -d : -f 2>
>> =A0${target_rootfs}/install/initial_solution.manifest
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rpm_update_pkg
>> ${target_rootfs}/install/initial_solution.manifest
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep -Fv -f
>> ${target_rootfs}/install/initial_solution.manifest
>> ${target_rootfs}/install/total_solution.manifest>
>> =A0${target_rootfs}/install/total_solution.manifest.new
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${target_rootfs}/install/total_solution=
.manifest.new
>> ${target_rootfs}/install/total_solution.manifest
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -rf ${target_rootfs}/initial
>> + =A0 =A0 =A0 fi
>> +
>> + =A0 =A0 =A0 echo "Installing main solution manifest
>> (${target_rootfs}/install/total_solution.manifest)"
>>
>> + =A0 =A0 =A0 rpm_update_pkg ${target_rootfs}/install/total_solution.man=
ifest
>> =A0}
>>
>> =A0python write_specfile () {
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


