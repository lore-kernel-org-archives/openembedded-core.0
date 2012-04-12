Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIMNF-0000ic-VV
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 17:55:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3CFkSDx001895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2012 08:46:28 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 08:46:27 -0700
Message-ID: <4F86F8D2.2050402@windriver.com>
Date: Thu, 12 Apr 2012 10:46:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Steve Sakoman <sakoman@gmail.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
In-Reply-To: <CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 12 Apr 2012 15:55:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/12 10:36 AM, Steve Sakoman wrote:
> On Thu, Apr 12, 2012 at 6:39 AM, Steve Sakoman<sakoman@gmail.com>  wrote:

That is very odd, the system is supposed to identify all of the dependencies 
needed for the first set of packages... (the three base-passwd, base-files and 
shadow).

The end result is a list of 10-12 binaries to be installed that meet those 
requirements, as well as the original three requested packages.

We also shouldn't specify bash because busybox provides /bin/sh in a lot of 
configurations.

Which image did you try to build and I'll see what I can replicate here.

--Mark

>> FWIW, after pulling current poky this morning all of my image builds
>> are failing with errors like this:
>>
>> | Installing base dependencies first (base-passwd, base-files and
>> shadow) since rpm is special
>> | error: Failed dependencies:
>> |       /bin/sh is needed by base-passwd-3.5.24-r0.armv7a
>> |       /bin/sh is needed by shadow-4.1.4.3-r8.armv7a
>> |       /bin/sh is needed by libgcc1-4.6.3+svnr184847-r24.armv7a
>> |       /bin/sh is needed by libc6-2.13-r23+svnr15508.armv7a
>>
>> I'll investigate, but since it is late in the release process thought
>> I would mention the issue.
>
> I have no idea if this is the proper fix, but adding bash to the list
> of packages to install first fixed the issue for me:
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index fd00fb1..a5f0b06 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -475,7 +475,8 @@ EOF
>                  echo "Skipping pre install due to exisitng image"
>          else
>                  echo "# Initial Install manifest">
> ${target_rootfs}/install/initial_install.manifest
> -               echo "Installing base dependencies first (base-passwd,
> base-files and shadow) since rpm is special"
> +               echo "Installing base dependencies first (bash,
> base-passwd, base-files and shadow) since rpm is special"
> +               grep /bash-[0-9]
> ${target_rootfs}/install/total_solution.manifest>>
> ${target_rootfs}/install/initial_install.manife
>                  grep /base-passwd-[0-9]
> ${target_rootfs}/install/total_solution.manifest>>
> ${target_rootfs}/install/initial_install
>                  grep /base-files-[0-9]
> ${target_rootfs}/install/total_solution.manifest>>
> ${target_rootfs}/install/initial_install.
>                  grep /shadow-[0-9]
> ${target_rootfs}/install/total_solution.manifest>>
> ${target_rootfs}/install/initial_install.mani
>
> I'm concerned we are on a slippery slope here!
>
> Steve
>
>
>>>> diff --git a/meta/classes/package_rpm.bbclass
>>>> b/meta/classes/package_rpm.bbclass
>>>> index 16a2c87..1b0f6f2 100644
>>>> --- a/meta/classes/package_rpm.bbclass
>>>> +++ b/meta/classes/package_rpm.bbclass
>>>> @@ -166,22 +167,23 @@ rpm_common_comand () {
>>>>   # install or remove the pkg
>>>>   rpm_update_pkg () {
>>>>
>>>> +    manifest=$1
>>>> +    btmanifest=$manifest.bt
>>>>       local target_rootfs="${INSTALL_ROOTFS_RPM}"
>>>>
>>>>       # Save the rpm's build time for incremental image generation, and the
>>>> file
>>>>       # would be moved to ${T}
>>>> -    rm -f ${target_rootfs}/install/total_solution_bt.manifest
>>>> -    for i in `cat ${target_rootfs}/install/total_solution.manifest`; do
>>>> +    rm -f $btmanifest
>>>> +    for i in `cat $manifest`; do
>>>>           # Use "rpm" rather than "${RPM}" here, since we don't need the
>>>>           # '--dbpath' option
>>>> -        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">>    \
>>>> -            ${target_rootfs}/install/total_solution_bt.manifest
>>>> +        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">>    $btmanifest
>>>>       done
>>>>
>>>>       # Only install the different pkgs if incremental image generation is
>>>> set
>>>>       if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f
>>>> ${T}/total_solution_bt.manifest -a \
>>>>           "${IMAGE_PKGTYPE}" = "rpm" ]; then
>>>> -        cur_list="${target_rootfs}/install/total_solution_bt.manifest"
>>>> +        cur_list="$btmanifest"
>>>>           pre_list="${T}/total_solution_bt.manifest"
>>>>           sort -u $cur_list -o $cur_list
>>>>           sort -u $pre_list -o $pre_list
>>>> @@ -203,8 +205,7 @@ rpm_update_pkg () {
>>>>               -Uvh ${target_rootfs}/install/incremental.manifest
>>>>       else
>>>>           # Attempt to install
>>>> -        rpm_common_comand --replacepkgs \
>>>> -            -Uhv ${target_rootfs}/install/total_solution.manifest
>>>> +        rpm_common_comand --replacepkgs -Uhv $manifest
>>>>       fi
>>>>   }
>>>>
>>>> @@ -440,14 +441,7 @@ package_install_internal_rpm () {
>>>>
>>>>         fi
>>>>
>>>> -       # If base-passwd or shadow are in the list of packages to install,
>>>> -       # ensure they are installed first to support later packages that
>>>> -       # may create custom users/groups (fixes Yocto bug #2127)
>>>> -       infile=${target_rootfs}/install/install_solution.manifest
>>>> -       outfile=${target_rootfs}/install/total_solution.manifest
>>>> -       cat $infile | grep /base-passwd-[0-9]>    $outfile || true
>>>> -       cat $infile | grep /shadow-[0-9]>>    $outfile || true
>>>> -       cat $infile | grep -v /shadow-[0-9] | grep -v /base-passwd-[0-9]>>
>>>>   $outfile || true
>>>> +       cat ${target_rootfs}/install/install_solution.manifest>
>>>>   ${target_rootfs}/install/total_solution.manifest
>>>>         cat ${target_rootfs}/install/install_multilib_solution.manifest>>
>>>>   ${target_rootfs}/install/total_solution.manifest
>>>>
>>>>         # Construct install scriptlet wrapper
>>>> @@ -474,8 +468,45 @@ EOF
>>>>
>>>>         chmod 0755 ${WORKDIR}/scriptlet_wrapper
>>>>
>>>> -    rpm_update_pkg
>>>> +       # RPM is special. It can't handle dependencies and preinstall
>>>> scripts correctly. Its
>>>> +       # probably a feature. The only way to convince rpm to actually run
>>>> the preinstall scripts
>>>> +       # for base-passwd and shadow first before installing packages that
>>>> depend on these packages
>>>> +       # is to do two image installs, installing one set of packages,
>>>> then the other.
>>>> +       if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f
>>>> ${T}/total_solution_bt.manifest ]; then
>>>> +               echo "Skipping pre install due to exisitng image"
>>>> +       else
>>>> +               echo "# Intial Install manifest">
>>>>   ${target_rootfs}/install/initial_install.manifest
>>>> +               echo "Installing base dependencies first (base-passwd,
>>>> base-files and shadow) since rpm is special"
>>>> +               grep /base-passwd-[0-9]
>>>> ${target_rootfs}/install/total_solution.manifest>>
>>>>   ${target_rootfs}/install/initial_install.manifest || true
>>>> +               grep /base-files-[0-9]
>>>> ${target_rootfs}/install/total_solution.manifest>>
>>>>   ${target_rootfs}/install/initial_install.manifest || true
>>>> +               grep /shadow-[0-9]
>>>> ${target_rootfs}/install/total_solution.manifest>>
>>>>   ${target_rootfs}/install/initial_install.manifest || true
>>>> +
>>>> +               # Generate an install solution by doing a --justdb
>>>> install, then recreate it with
>>>> +               # an actual package install!
>>>> +               mkdir -p ${target_rootfs}/initial
>>>> +
>>>> +               ${RPM} --predefine "_rpmds_sysinfo_path
>>>> ${target_rootfs}/etc/rpm/sysinfo" \
>>>> +                       --predefine "_rpmrc_platform_path
>>>> ${target_rootfs}/etc/rpm/platform" \
>>>> +                       -D "_dbpath ${target_rootfs}/initial" -D "`cat
>>>> ${confbase}-base_archs.macro`" \
>>>> +                       -D "__dbi_txn create nofsync" \
>>>> +                       -U --justdb --noscripts --notriggers
>>>> --noparentdirs --nolinktos --ignoresize \
>>>> +                       ${target_rootfs}/install/initial_install.manifest
>>>> +
>>>> +               ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --yaml \
>>>> +                       -D "__dbi_txn create nofsync private" \
>>>> +                       | grep -i 'Packageorigin' | cut -d : -f 2>
>>>>   ${target_rootfs}/install/initial_solution.manifest
>>>> +
>>>> +               rpm_update_pkg
>>>> ${target_rootfs}/install/initial_solution.manifest
>>>> +
>>>> +               grep -Fv -f
>>>> ${target_rootfs}/install/initial_solution.manifest
>>>> ${target_rootfs}/install/total_solution.manifest>
>>>>   ${target_rootfs}/install/total_solution.manifest.new
>>>> +               mv ${target_rootfs}/install/total_solution.manifest.new
>>>> ${target_rootfs}/install/total_solution.manifest
>>>> +
>>>> +               rm -rf ${target_rootfs}/initial
>>>> +       fi
>>>> +
>>>> +       echo "Installing main solution manifest
>>>> (${target_rootfs}/install/total_solution.manifest)"
>>>>
>>>> +       rpm_update_pkg ${target_rootfs}/install/total_solution.manifest
>>>>   }
>>>>
>>>>   python write_specfile () {
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



