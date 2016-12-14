Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B738731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 02:34:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2016 18:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,344,1477983600"; d="scan'208";a="42251992"
Received: from oshau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.66])
	by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2016 18:34:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 14 Dec 2016 15:34:30 +1300
Message-ID: <98782592.4a1LfMpUN6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <78c1e5e2-2f42-97e3-fd2b-f4f72123e6b6@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<7337875.m9BQhVBZV7@peggleto-mobl.ger.corp.intel.com>
	<78c1e5e2-2f42-97e3-fd2b-f4f72123e6b6@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] populate_sdk_ext.bbclass: install multilib targets as populate_sdk does
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
X-List-Received-Date: Wed, 14 Dec 2016 02:34:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 14 Dec 2016 10:25:36 Robert Yang wrote:
> After I looked into the code again, these changes are related,
> so that I can't split them into 2, please see my comments inline.

I've replied inline.
 
> On 12/13/2016 12:55 PM, Paul Eggleton wrote:
> > There are a bunch of changes in here that don't relate to the multilib fix
> > - details below.
> > 
> > On Wed, 16 Nov 2016 22:19:30 Robert Yang wrote:
> >> Fixed:
> >> MACHINE = "qemux86-64"
> >> require conf/multilib.conf
> >> MULTILIBS = "multilib:lib32"
> >> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> >> 
> >> $ bitbake core-image-minimal -cpopulate_sdk_ext
> >> [snip]
> >> Testing
> >> /buildarea/lyang1/test_po/tmp/work/qemux86_64-poky-linux/core-image-minim
> >> al
> >> /1.0-r0/testsdkext//tc/environment-setup-x86-pokymllib32-linux test_cvs
> >> (oeqa.sdk.buildcvs.BuildCvsTest) ... FAIL
> >> [snip]
> >> 
> >> It was failed because no lib32 toolchains.
> >> 
> >> The fixes include:
> >> * Set SDK_TARGETS correctly
> >> * Return multilib depends in get_ext_sdk_depends()
> >> * Write information to all environment-setup-* scripts.
> >> 
> >> [YOCTO #10647]
> >> 
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >> 
> >>  meta/classes/populate_sdk_ext.bbclass | 61
> >> 
> >> ++++++++++++++++++++++------------- 1 file changed, 38 insertions(+), 23
> >> deletions(-)
> >> 
> >> diff --git a/meta/classes/populate_sdk_ext.bbclass
> >> b/meta/classes/populate_sdk_ext.bbclass index 26b5ca6..ce9c40a 100644
> >> --- a/meta/classes/populate_sdk_ext.bbclass
> >> +++ b/meta/classes/populate_sdk_ext.bbclass
> >> @@ -39,7 +39,7 @@ SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
> >> 
> >>  SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
> >>  SDK_UPDATE_URL ?= ""
> >> 
> >> -SDK_TARGETS ?= "${PN}"
> >> +SDK_TARGETS ?= "${@multilib_pkg_extend(d, d.getVar('BPN', True))}"
> >> 
> >>  def get_sdk_install_targets(d, images_only=False):
> >>      sdk_install_targets = ''
> >> 
> >> @@ -562,38 +562,52 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext =
> >> "${sdk_ext_preinst}" sdk_ext_postinst() {
> >> 
> >>  	printf "\nExtracting buildtools...\n"
> >>  	cd $target_sdk_dir
> >> 
> >> -	env_setup_script="$target_sdk_dir/environment-
> > 
> > setup-${REAL_MULTIMACH_TARGE
> > 
> >> T_SYS}" 
> >> -	printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} >
> >> buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ;
> >> cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully
> >> installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
> >> +	env_setup_scripts="`ls $target_sdk_dir/environment-setup-*`"
> >> +	./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
> >> +	if [ $? -ne 0 ]; then
> >> +		echo 'ERROR: buildtools installation failed:'
> >> +		cat buildtools.log
> >> +		for e in $env_setup_scripts; do
> >> +			echo "echo 'ERROR: this SDK was not fully installed and needs
> >> reinstalling'" >> $e +		done
> >> +		exit 1
> >> +	fi
> > 
> > This change isn't entirely related to the multilib changes.
> 
> The old code only considers one env_setup_script, but there are multiple
> ones now, so they are related.

Yes, I understand that. What I meant was, you've unrolled the single line 
*and* added handling for multiple env setup scripts - both are good changes 
but I'd like to see them in separate patches so that it's clear what's being 
done.

> >>  		# dash which is /bin/sh on Ubuntu will not preserve the
> >>  		# current working directory when first ran, nor will it set $1
> >>  		when
> >>  		# sourcing a script. That is why this has to look so ugly.
> >>  		LOGFILE="$target_sdk_dir/preparing_build_system.log"
> >> 
> >> -		sh -c ". buildtools/environment-setup* > $LOGFILE && cd
> >> $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set
> >> $target_sdk_dir
> >> && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >>
> >> $LOGFILE
> >> && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE
> >> '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not
> >> fully
> >> installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
> >> -		rm $target_sdk_dir/ext-sdk-prepare.py
> >> +		sh -c ". buildtools/environment-setup* > $LOGFILE && cd
> >> $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set
> >> $target_sdk_dir
> >> && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >>
> >> $LOGFILE
> >> && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE
> >> '${SDK_INSTALL_TARGETS}'" +		if [ $? -ne 0 ]; then
> >> +			for e in $env_setup_scripts; do
> >> +				echo "echo 'ERROR: this SDK was not fully installed and
> >> needs reinstalling'" >> $e +			done
> >> +			exit 1
> >> +		fi
> >> +		rm -f $target_sdk_dir/ext-sdk-prepare.py
> > 
> > That last line is also unrelated.
> 
> The old code only considers one env_setup_script, but there are multiple
> ones now, so they are related.

Specifically in the last line you are doing rm -f. That is a change from rm 
previously. Again, there's nothing wrong with that, but it's not related to 
the multilib handling.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

