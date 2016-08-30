Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED795731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 13:05:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UD5bIO002619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 30 Aug 2016 06:05:37 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 06:05:36 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
Date: Tue, 30 Aug 2016 09:05:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472547914.8449.25.camel@andred.net>
Subject: Re: [PATCH 5/6] kernel-yocto: streamline patch, configuration and audit phases
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 13:05:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-08-30 05:05 AM, André Draszik wrote:
> My kmeta stuff is located directly inside two meta-* layers (i.e. not in an
> extra git repo), where the 2nd layer's kernel recipes .bbappends to the 1st
> one with additional kmeta things.
>
> This used to work fine, but since this commit it doesn't anymore as only the
> kmeta stuff from the 2nd layer is being copied into workdir.
>
> Have I been doing something that wasn't guaranteed / supposed to work in the
> first place? Or should that still work? Is it worth fixing or should I
> rethink my approach?

That was complexity that I had tried to remove, but thinking on it a
bit, I think I can restore that without adding much complexity.

I'm just finishing work on the 4.8 kernel today, and can look at this
tomorrow.

Do you have any public layers that I can reference to pull together a
test case ?

Bruce


>
>
> Cheers,
> Andre'
>
>
> On Mo, 2016-08-15 at 14:26 -0400, Bruce Ashfield wrote:
>> We've been running with a set of kern-tools that were designed to work
>> with build systems that knew nothing about git, trees, commits, etc.
>>
>> As such, there's been a set of shims/wrappers in place to work with
>> within bitbake/oe-core. These were the *me scripts: createme, updateme,
>> patchme and configme.
>>
>> With this commit, we strip that legacy code and use the tools directly.
>> This means less complexity, fewer corner cases .. and no surprises
>> when the tools are arunning. As another benefit, the tools consume
>> much less time during a typical build and have no noticeable impact
>> on the overall build time.
>>
>> Existing .scc files, features, and processing are not impacted as
>> these tools are compatible with existing feature descriptions and
>> kerne configuration fragments.
>>
>> The audit of kernel configuration fragments is now detached
>> from the linux-yocto build structure and process. This means that
>> they can eventually be tweaked to offer kernel audit to any type of
>> kernel build and configuration process.
>>
>> Additionally, the kernel symbol audit phase can now resolve symbol
>> dependencies and offer guidance when a symbol is missing:
>>
>>    WARNING: linux-yocto-4.4.15+gitAUTOINC+b030d96c7b_f5e2c49d58-r0
>> do_kernel_configcheck: [kernel config]: specified values did not make it
>> into the kernel's final configuration:
>>
>>    ---------- CONFIG_BT_6LOWPAN -----------------
>>    Config: CONFIG_BT_6LOWPAN
>>    From: /home/bruce/poky/build/tmp/work-shared/qemux86-64/kernel-
>> source/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg
>>    Requested value:  CONFIG_BT_6LOWPAN=y
>>    Actual value:
>>
>>    Config 'BT_6LOWPAN' has the following conditionals:
>>      BT_LE && 6LOWPAN (value: "n")
>>    Dependency values are:
>>      BT_LE [y] 6LOWPAN [n]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass                  | 143 ++++++++------
>> -------
>>  .../kern-tools/kern-tools-native_git.bb            |   4 +-
>>  2 files changed, 55 insertions(+), 92 deletions(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-
>> yocto.bbclass
>> index a9d4205..8650e55 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -119,77 +119,42 @@ do_kernel_metadata() {
>>  	patches="${@" ".join(find_patches(d))}"
>>  	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
>>
>> -	# add any explicitly referenced features onto the end of the
>> feature
>> -	# list that is passed to the kernel build scripts.
>> -	if [ -n "${KERNEL_FEATURES}" ]; then
>> -		for feat in ${KERNEL_FEATURES}; do
>> -			addon_features="$addon_features --feature $feat"
>> -		done
>> -	fi
>> -
>>  	# check for feature directories/repos/branches that were part of
>> the
>>  	# SRC_URI. If they were supplied, we convert them into include
>> directives
>>  	# for the update part of the process
>> -	if [ -n "${feat_dirs}" ]; then
>> -	    for f in ${feat_dirs}; do
>> +	for f in ${feat_dirs}; do
>>  		if [ -d "${WORKDIR}/$f/meta" ]; then
>> -		    includes="$includes -I${WORKDIR}/$f/meta"
>> +			includes="$includes -I${WORKDIR}/$f/meta"
>>  		elif [ -d "${WORKDIR}/$f" ]; then
>> -		    includes="$includes -I${WORKDIR}/$f"
>> +			includes="$includes -I${WORKDIR}/$f"
>>  		fi
>> -	    done
>> -	fi
>> +	done
>> +	for s in ${sccs}; do
>> +		sdir=$(dirname $s)
>> +		includes="$includes -I${sdir}"
>> +	done
>>
>> -	# updates or generates the target description
>> -	updateme ${updateme_flags}
>> -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
>> -                         ${includes} ${addon_features} ${ARCH}
>> ${KMACHINE} ${sccs} ${patches}
>> -	if [ $? -ne 0 ]; then
>> -		bbfatal_log "Could not update ${machine_branch}"
>> -	fi
>> +	# expand kernel features into their full path equivalents
>> +	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE}
>> -DKTYPE=${LINUX_KERNEL_TYPE})
>> +	meta_dir=$(kgit --meta)
>> +
>> +	# run1: pull all the configuration fragments, no matter where
>> they come from
>> +	scc --force -o ${S}/${meta_dir}:cfg,meta ${includes}
>> ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>> +
>> +	# run2: only generate patches for elements that have been passed
>> on the SRC_URI
>> +	scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes}
>> ${sccs} ${patches} ${KERNEL_FEATURES}
>>  }
>>
>>  do_patch() {
>>  	cd ${S}
>>
>> -	# executes and modifies the source tree as required
>> -	patchme ${KMACHINE}
>> -	if [ $? -ne 0 ]; then
>> -		bberror "Could not apply patches for ${KMACHINE}."
>> -		bbfatal_log "Patch failures can be resolved in the linux
>> source directory ${S})"
>> -	fi
>> -
>> -	# check to see if the specified SRCREV is reachable from the
>> final branch.
>> -	# if it wasn't something wrong has happened, and we should error.
>> -	machine_srcrev="${SRCREV_machine}"
>> -	if [ -z "${machine_srcrev}" ]; then
>> -		# fallback to SRCREV if a non machine_meta tree is being
>> built
>> -		machine_srcrev="${SRCREV}"
>> -		# if SRCREV cannot be reached something is wrong.
>> -		if [ -z "${machine_srcrev}" ]; then
>> -			bbfatal "Neither SRCREV_machine or SRCREV was
>> specified!"
>> -		fi
>> -	fi
>> -
>> -        if [ -n "${KMETA_AUDIT}" ]; then
>> -            current_branch=`git rev-parse --abbrev-ref HEAD`
>> -            machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>> -            if [ "${current_branch}" != "${machine_branch}" ]; then
>> -                bbwarn "After meta data application, the kernel tree
>> branch is ${current_branch}."
>> -                bbwarn "The SRC_URI specified branch ${machine_branch}."
>> -                bbwarn ""
>> -                bbwarn "The branch will be forced to ${machine_branch},
>> but this means the board meta data"
>> -                bbwarn "(.scc files) do not match the SRC_URI
>> specification."
>> -                bbwarn ""
>> -                bbwarn "The meta data and branch ${machine_branch} should
>> be inspected to ensure the proper"
>> -                bbwarn "kernel is being built."
>> -                git checkout -f ${machine_branch}
>> -            fi
>> -        fi
>> -
>> -	if [ "${machine_srcrev}" != "AUTOINC" ]; then
>> -		if ! [ "$(git rev-parse --verify ${machine_srcrev}~0)" =
>> "$(git merge-base ${machine_srcrev} HEAD)" ]; then
>> -			bberror "SRCREV ${machine_srcrev} was specified,
>> but is not reachable"
>> -			bbfatal "Check the BSP description for incorrect
>> branch selection, or other errors."
>> +	meta_dir=$(kgit --meta)
>> +	(cd ${meta_dir}; ln -sf patch.queue series)
>> +	if [ -f "${meta_dir}/series" ]; then
>> +		kgit-s2q --gen -v --patches .kernel-meta/
>> +		if [ $? -ne 0 ]; then
>> +			bberror "Could not apply patches for
>> ${KMACHINE}."
>> +			bbfatal_log "Patch failures can be resolved in
>> the linux source directory ${S})"
>>  		fi
>>  	fi
>>  }
>> @@ -258,26 +223,37 @@ do_kernel_metadata[depends] = "kern-tools-
>> native:do_populate_sysroot"
>>
>>  do_kernel_configme[dirs] += "${S} ${B}"
>>  do_kernel_configme() {
>> -	bbnote "kernel configme"
>> -	export KMETA=${KMETA}
>> +	set +e
>>
>> -	if [ -n "${KCONFIG_MODE}" ]; then
>> -		configmeflags=${KCONFIG_MODE}
>> -	else
>> -		# If a defconfig was passed, use =n as the baseline,
>> which is achieved
>> -		# via --allnoconfig
>> +	# translate the kconfig_mode into something that merge_config.sh
>> +	# understands
>> +	case ${KCONFIG_MODE} in
>> +		allnoconfig)
>> +			config_flags="-n"
>> +			;;
>> +		alldefconfig)
>> +			config_flags=""
>> +			;;
>> +	    *)
>>  		if [ -f ${WORKDIR}/defconfig ]; then
>> -			configmeflags="--allnoconfig"
>> +			config_flags="-n"
>>  		fi
>> -	fi
>> +	    ;;
>> +	esac
>>
>>  	cd ${S}
>> -	PATH=${PATH}:${S}/scripts/util
>> -	configme ${configmeflags} --reconfig --output ${B}
>> ${LINUX_KERNEL_TYPE} ${KMACHINE}
>> +
>> +	meta_dir=$(kgit --meta)
>> +	configs="$(scc --configs -o ${meta_dir})"
>> +	if [ -z "${configs}" ]; then
>> +		bbfatal_log "Could not find configuration queue
>> (${meta_dir}/config.queue)"
>> +	fi
>> +
>> +	ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
>> ${meta_dir}/cfg/merge_config_build.log 2>&1
>>  	if [ $? -ne 0 ]; then
>>  		bbfatal_log "Could not configure ${KMACHINE}-
>> ${LINUX_KERNEL_TYPE}"
>>  	fi
>> -	
>> +
>>  	echo "# Global settings from linux recipe" >> ${B}/.config
>>  	echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >>
>> ${B}/.config
>>  }
>> @@ -295,36 +271,23 @@ python do_kernel_configcheck() {
>>          kmeta = "." + kmeta
>>
>>      pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True),
>> "${S}/scripts/util/")
>> -    cmd = d.expand("cd ${S}; kconf_check -config %s/meta-series ${S}
>> ${B}" % kmeta)
>> +
>> +    cmd = d.expand("scc --configs -o ${S}/.kernel-meta")
>> +    ret, configs = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
>> +
>> +    cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/
>> ${B}/.config ${S} %s" % (kmeta,configs))
>>      ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
>>
>>      config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True )
>> or 0)
>>      bsp_check_visibility = int(d.getVar( "KCONF_BSP_AUDIT_LEVEL", True )
>> or 0)
>>
>>      # if config check visibility is non-zero, report dropped
>> configuration values
>> -    mismatch_file = "${S}/" + kmeta + "/" + "mismatch.cfg"
>> +    mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
>>      if os.path.exists(mismatch_file):
>>          if config_check_visibility:
>>              with open (mismatch_file, "r") as myfile:
>>                  results = myfile.read()
>>                  bb.warn( "[kernel config]: specified values did not make
>> it into the kernel's final configuration:\n\n%s" % results)
>> -
>> -    # if config check visibility is level 2 or higher, report non-
>> hardware options
>> -    nonhw_file = "${S}/" + kmeta + "/" + "nonhw_report.cfg"
>> -    if os.path.exists(nonhw_file):
>> -        if config_check_visibility > 1:
>> -            with open (nonhw_file, "r") as myfile:
>> -                results = myfile.read()
>> -                bb.warn( "[kernel config]: BSP specified non-hw
>> configuration:\n\n%s" % results)
>> -
>> -    bsp_desc = "${S}/" + kmeta + "/" + "top_tgt"
>> -    if os.path.exists(bsp_desc) and bsp_check_visibility > 1:
>> -        with open (bsp_desc, "r") as myfile:
>> -            bsp_tgt = myfile.read()
>> -            m = re.match("^(.*)scratch.obj(.*)$", bsp_tgt)
>> -            if not m is None:
>> -                bb.warn( "[kernel]: An auto generated BSP description was
>> used, this normally indicates a misconfiguration.\n" +
>> -                         "Check that your machine (%s) has an associated
>> kernel description." % "${MACHINE}" )
>>  }
>>
>>  # Ensure that the branches (BSP and meta) are on the locations specified
>> by
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index c3ded98..6877a0c 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -1,10 +1,10 @@
>>  SUMMARY = "Tools for managing Yocto Project style branched kernels"
>>  LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM =
>> "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70cd5f52972f8884
>> b80743d"
>> +LIC_FILES_CHKSUM =
>> "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e2828845
>> ba0d06c"
>>
>>  DEPENDS = "git-native"
>>
>> -SRCREV = "a6a6f6e1e738d2ecd26b675e9bec867105703416"
>> +SRCREV = "4b5de9011b31ff92ba2b6e052ab818b09affd905"
>>  PR = "r12"
>>  PV = "0.2+git${SRCPV}"
>>
>> --
>> 2.5.0
>>


