Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 061BD60034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 09:32:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2015 02:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,390,1427785200"; d="scan'208";a="568278975"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.28.13])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2015 02:32:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 08 May 2015 10:32:41 +0100
Message-ID: <2100752.ocFVfOC089@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <c8ffc58be15eb07a95d84ec02e2895bb6828e1bf.1430726210.git.Qi.Chen@windriver.com>
References: <cover.1430726210.git.Qi.Chen@windriver.com>
	<c8ffc58be15eb07a95d84ec02e2895bb6828e1bf.1430726210.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/2] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Fri, 08 May 2015 09:32:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Monday 04 May 2015 15:59:30 Chen Qi wrote:
> Copy the contents of local.conf under TOPDIR into the final generated
> local.conf. In this way, custom settings are also made into the final
> local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx, etc.
> 
> Before this change, installing extensible SDK would usually report failure
> when preparing the build system if the user has custom configuration for
> DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in
> local.conf also don't get built correctly.
> 
> This patch solves the above problem.
> 
> A blacklist mechanism is also introduced so that we can blacklist variables
> that should not be copied into the final local.conf file. Currently, the
> blacklist contains 'TMPDIR', 'SSTATE_DIR', 'DL_DIR', 'STAMPS_DIR',
> 'BASE_WORKDIR' and 'DEPLOY_DIR'. What these variables have in common is
> that they are set in bitbake.conf using '?=' or '??='.
> 
> This list of course doesn't cover every possible setting allowed in
> local.conf. And it's possible that some setting in local.conf would still
> result in failure when preparing build system at installation time of
> extensible SDK. The point is that we want to make sure that reasonable
> settings like PACKAGECONFIG, DISTRO_FEATURES, IMAGE_INSTALL, etc, don't
> result in failure which would very much depress the users of extensible
> SDK.
> 
> [YOCTO #7616]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index 2fc4c11..f08ba86 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -16,6 +16,7 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = "
> ${SDK_TARGETS}" SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
> 
>  SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
> +SDK_META_CONF_BLACKLIST ?= "TMPDIR DL_DIR SSTATE_DIR STAMPS_DIR
> BASE_WORKDIR DEPLOY_DIR"
> 
>  SDK_TARGETS ?= "${PN}"
>  OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
> @@ -114,6 +115,25 @@ python copy_buildsystem () {
>          f.write('# this configuration provides, it is strongly suggested
> that you set\n') f.write('# up a proper instance of the full build system
> and use that instead.\n\n')
> 
> +        # Copy configurations from the current local.conf
> +        builddir = d.getVar('TOPDIR', True)
> +        with open(builddir + '/conf/local.conf', 'r') as lf:
> +            varblacklist = d.getVar('SDK_META_CONF_BLACKLIST',
> True).split() +            skip = False
> +            for line in lf:
> +                line = line.lstrip()
> +                if line.startswith('#'):
> +                    continue
> +                for varname in varblacklist:
> +                    if line.startswith(varname):
> +                        skip = True
> +                        break
> +                if not skip:
> +                    f.write(line)
> +                skip = False
> +        f.write('\n')
> +
> +        # Configurations in local.conf which are specific for extensible
> SDK f.write('INHERIT += "%s"\n\n' % 'uninative')
>          f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))

All you've done since v1 is extend the blacklist - I was hoping for something 
generic that stops inappropriate paths bleeding into the SDK configuration. Can 
you please add some code to handle that?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

