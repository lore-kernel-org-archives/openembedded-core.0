Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SIMDd-0000Wg-8M
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 17:45:57 +0200
Received: by qcso7 with SMTP id o7so1329921qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=o/JmYVNbYktet5ZwCZhpxxO2hOnJgZdHdEzAVXkITCM=;
	b=HEqYpygm303UREo1NRG0YtKbec5m8WpzeG83U4gS8lIjCSs52jZjq1QbttCXcFitIC
	5nL62AyjgocAEtcWqu1BcREZEsM0IQ35ZdqKojvBsAedzJrXRafOvl6/Ay5FwNZ5icgp
	3glgSzL301SF8tN9pnpnCbZHCblylwcB2RhlqgWxhTlMLPtRffYBgT6xHd9zZvXrHucE
	Q+YAJ0NSx72jneUIhtawnDscWfaW3IalP2sWAa+1kFwHT0IijujCfq2TEvSx8jbaNf8i
	eajBg7t2ms/bT+gfPmGM/wlZ1xxluJdW4U4xeOBqiicb9xWYL7TLAeiLynOtS49xtiZ8
	Xe1w==
MIME-Version: 1.0
Received: by 10.229.137.85 with SMTP id v21mr1196480qct.70.1334244996608; Thu,
	12 Apr 2012 08:36:36 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Thu, 12 Apr 2012 08:36:36 -0700 (PDT)
In-Reply-To: <CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
Date: Thu, 12 Apr 2012 08:36:36 -0700
Message-ID: <CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2012 15:45:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 6:39 AM, Steve Sakoman <sakoman@gmail.com> wrote:

> FWIW, after pulling current poky this morning all of my image builds
> are failing with errors like this:
>
> | Installing base dependencies first (base-passwd, base-files and
> shadow) since rpm is special
> | error: Failed dependencies:
> | =A0 =A0 =A0 /bin/sh is needed by base-passwd-3.5.24-r0.armv7a
> | =A0 =A0 =A0 /bin/sh is needed by shadow-4.1.4.3-r8.armv7a
> | =A0 =A0 =A0 /bin/sh is needed by libgcc1-4.6.3+svnr184847-r24.armv7a
> | =A0 =A0 =A0 /bin/sh is needed by libc6-2.13-r23+svnr15508.armv7a
>
> I'll investigate, but since it is late in the release process thought
> I would mention the issue.

I have no idea if this is the proper fix, but adding bash to the list
of packages to install first fixed the issue for me:

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bb=
class
index fd00fb1..a5f0b06 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -475,7 +475,8 @@ EOF
                echo "Skipping pre install due to exisitng image"
        else
                echo "# Initial Install manifest" >
${target_rootfs}/install/initial_install.manifest
-               echo "Installing base dependencies first (base-passwd,
base-files and shadow) since rpm is special"
+               echo "Installing base dependencies first (bash,
base-passwd, base-files and shadow) since rpm is special"
+               grep /bash-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install.manife
                grep /base-passwd-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install
                grep /base-files-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install.
                grep /shadow-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install.mani

I'm concerned we are on a slippery slope here!

Steve


>>> diff --git a/meta/classes/package_rpm.bbclass
>>> b/meta/classes/package_rpm.bbclass
>>> index 16a2c87..1b0f6f2 100644
>>> --- a/meta/classes/package_rpm.bbclass
>>> +++ b/meta/classes/package_rpm.bbclass
>>> @@ -166,22 +167,23 @@ rpm_common_comand () {
>>> =A0# install or remove the pkg
>>> =A0rpm_update_pkg () {
>>>
>>> + =A0 =A0manifest=3D$1
>>> + =A0 =A0btmanifest=3D$manifest.bt
>>> =A0 =A0 =A0local target_rootfs=3D"${INSTALL_ROOTFS_RPM}"
>>>
>>> =A0 =A0 =A0# Save the rpm's build time for incremental image generation=
, and the
>>> file
>>> =A0 =A0 =A0# would be moved to ${T}
>>> - =A0 =A0rm -f ${target_rootfs}/install/total_solution_bt.manifest
>>> - =A0 =A0for i in `cat ${target_rootfs}/install/total_solution.manifest=
`; do
>>> + =A0 =A0rm -f $btmanifest
>>> + =A0 =A0for i in `cat $manifest`; do
>>> =A0 =A0 =A0 =A0 =A0# Use "rpm" rather than "${RPM}" here, since we don'=
t need the
>>> =A0 =A0 =A0 =A0 =A0# '--dbpath' option
>>> - =A0 =A0 =A0 =A0echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">> =A0\
>>> - =A0 =A0 =A0 =A0 =A0 =A0${target_rootfs}/install/total_solution_bt.man=
ifest
>>> + =A0 =A0 =A0 =A0echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">> =A0$btm=
anifest
>>> =A0 =A0 =A0done
>>>
>>> =A0 =A0 =A0# Only install the different pkgs if incremental image gener=
ation is
>>> set
>>> =A0 =A0 =A0if [ "${INC_RPM_IMAGE_GEN}" =3D "1" -a -f
>>> ${T}/total_solution_bt.manifest -a \
>>> =A0 =A0 =A0 =A0 =A0"${IMAGE_PKGTYPE}" =3D "rpm" ]; then
>>> - =A0 =A0 =A0 =A0cur_list=3D"${target_rootfs}/install/total_solution_bt=
.manifest"
>>> + =A0 =A0 =A0 =A0cur_list=3D"$btmanifest"
>>> =A0 =A0 =A0 =A0 =A0pre_list=3D"${T}/total_solution_bt.manifest"
>>> =A0 =A0 =A0 =A0 =A0sort -u $cur_list -o $cur_list
>>> =A0 =A0 =A0 =A0 =A0sort -u $pre_list -o $pre_list
>>> @@ -203,8 +205,7 @@ rpm_update_pkg () {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0-Uvh ${target_rootfs}/install/incremental.ma=
nifest
>>> =A0 =A0 =A0else
>>> =A0 =A0 =A0 =A0 =A0# Attempt to install
>>> - =A0 =A0 =A0 =A0rpm_common_comand --replacepkgs \
>>> - =A0 =A0 =A0 =A0 =A0 =A0-Uhv ${target_rootfs}/install/total_solution.m=
anifest
>>> + =A0 =A0 =A0 =A0rpm_common_comand --replacepkgs -Uhv $manifest
>>> =A0 =A0 =A0fi
>>> =A0}
>>>
>>> @@ -440,14 +441,7 @@ package_install_internal_rpm () {
>>>
>>> =A0 =A0 =A0 =A0fi
>>>
>>> - =A0 =A0 =A0 # If base-passwd or shadow are in the list of packages to=
 install,
>>> - =A0 =A0 =A0 # ensure they are installed first to support later packag=
es that
>>> - =A0 =A0 =A0 # may create custom users/groups (fixes Yocto bug #2127)
>>> - =A0 =A0 =A0 infile=3D${target_rootfs}/install/install_solution.manife=
st
>>> - =A0 =A0 =A0 outfile=3D${target_rootfs}/install/total_solution.manifes=
t
>>> - =A0 =A0 =A0 cat $infile | grep /base-passwd-[0-9]> =A0$outfile || tru=
e
>>> - =A0 =A0 =A0 cat $infile | grep /shadow-[0-9]>> =A0$outfile || true
>>> - =A0 =A0 =A0 cat $infile | grep -v /shadow-[0-9] | grep -v /base-passw=
d-[0-9]>>
>>> =A0$outfile || true
>>> + =A0 =A0 =A0 cat ${target_rootfs}/install/install_solution.manifest>
>>> =A0${target_rootfs}/install/total_solution.manifest
>>> =A0 =A0 =A0 =A0cat ${target_rootfs}/install/install_multilib_solution.m=
anifest>>
>>> =A0${target_rootfs}/install/total_solution.manifest
>>>
>>> =A0 =A0 =A0 =A0# Construct install scriptlet wrapper
>>> @@ -474,8 +468,45 @@ EOF
>>>
>>> =A0 =A0 =A0 =A0chmod 0755 ${WORKDIR}/scriptlet_wrapper
>>>
>>> - =A0 =A0rpm_update_pkg
>>> + =A0 =A0 =A0 # RPM is special. It can't handle dependencies and preins=
tall
>>> scripts correctly. Its
>>> + =A0 =A0 =A0 # probably a feature. The only way to convince rpm to act=
ually run
>>> the preinstall scripts
>>> + =A0 =A0 =A0 # for base-passwd and shadow first before installing pack=
ages that
>>> depend on these packages
>>> + =A0 =A0 =A0 # is to do two image installs, installing one set of pack=
ages,
>>> then the other.
>>> + =A0 =A0 =A0 if [ "${INC_RPM_IMAGE_GEN}" =3D "1" -a -f
>>> ${T}/total_solution_bt.manifest ]; then
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Skipping pre install due to exisitn=
g image"
>>> + =A0 =A0 =A0 else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# Intial Install manifest">
>>> =A0${target_rootfs}/install/initial_install.manifest
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Installing base dependencies first =
(base-passwd,
>>> base-files and shadow) since rpm is special"
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep /base-passwd-[0-9]
>>> ${target_rootfs}/install/total_solution.manifest>>
>>> =A0${target_rootfs}/install/initial_install.manifest || true
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep /base-files-[0-9]
>>> ${target_rootfs}/install/total_solution.manifest>>
>>> =A0${target_rootfs}/install/initial_install.manifest || true
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep /shadow-[0-9]
>>> ${target_rootfs}/install/total_solution.manifest>>
>>> =A0${target_rootfs}/install/initial_install.manifest || true
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # Generate an install solution by doing a=
 --justdb
>>> install, then recreate it with
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # an actual package install!
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkdir -p ${target_rootfs}/initial
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} --predefine "_rpmds_sysinfo_path
>>> ${target_rootfs}/etc/rpm/sysinfo" \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --predefine "_rpmrc_platf=
orm_path
>>> ${target_rootfs}/etc/rpm/platform" \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -D "_dbpath ${target_root=
fs}/initial" -D "`cat
>>> ${confbase}-base_archs.macro`" \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -D "__dbi_txn create nofs=
ync" \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -U --justdb --noscripts -=
-notriggers
>>> --noparentdirs --nolinktos --ignoresize \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${target_rootfs}/install/=
initial_install.manifest
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${RPM} -D "_dbpath ${target_rootfs}/initi=
al" -qa --yaml \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -D "__dbi_txn create nofs=
ync private" \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | grep -i 'Packageorigin'=
 | cut -d : -f 2>
>>> =A0${target_rootfs}/install/initial_solution.manifest
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rpm_update_pkg
>>> ${target_rootfs}/install/initial_solution.manifest
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 grep -Fv -f
>>> ${target_rootfs}/install/initial_solution.manifest
>>> ${target_rootfs}/install/total_solution.manifest>
>>> =A0${target_rootfs}/install/total_solution.manifest.new
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${target_rootfs}/install/total_solutio=
n.manifest.new
>>> ${target_rootfs}/install/total_solution.manifest
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -rf ${target_rootfs}/initial
>>> + =A0 =A0 =A0 fi
>>> +
>>> + =A0 =A0 =A0 echo "Installing main solution manifest
>>> (${target_rootfs}/install/total_solution.manifest)"
>>>
>>> + =A0 =A0 =A0 rpm_update_pkg ${target_rootfs}/install/total_solution.ma=
nifest
>>> =A0}
>>>
>>> =A0python write_specfile () {
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


