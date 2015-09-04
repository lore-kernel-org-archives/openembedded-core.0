Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 255D077016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:44:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 06:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="797779808"
Received: from maholain-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.141])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2015 06:44:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 04 Sep 2015 14:44:17 +0100
Message-ID: <1550683.q95hsuYE53@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <120096577.WLccPTjXSt@peggleto-mobl.ger.corp.intel.com>
References: <cover.1440402124.git.Qi.Chen@windriver.com>
	<1695945.fozQrkdl5z@peggleto-mobl.ger.corp.intel.com>
	<120096577.WLccPTjXSt@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH V3 8/8] populate_sdk_ext: get rid of buildtools
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
X-List-Received-Date: Fri, 04 Sep 2015 13:44:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 01 September 2015 18:35:53 Paul Eggleton wrote:
> On Tuesday 01 September 2015 17:13:49 Paul Eggleton wrote:
> > Hi Qi,
> > 
> > On Monday 24 August 2015 15:46:56 Chen Qi wrote:
> > > If we do `bitbake buildtools-tarball' and then after one day do `bitbake
> > > core-image-minimal -c populate_sdk_ext', we would meet errors like
> > > below.
> > > 
> > > | install: cannot stat
> > > | '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
> > > 
> > > poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-stand
> > > al
> > > on e -1.8+snapshot-20150429.sh': No such file or directory
> > > 
> > > The problem is that the output name for buildtools-tarball has ${DATE}
> > > in
> > > it. So if populate_sdk_ext task is executed but buildtools-tarball is
> > > not
> > > rebuilt, the above error appears.
> > > 
> > > In fact, ext SDK does not have to depend on buildtools. This patch
> > > removes
> > > the buildtools from the ext SDK. After this patch, the ext SDK still
> > > works
> > > and we can no longer see the buildtools error.
> > > 
> > > [YOCTO #7674]
> > > 
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > > 
> > >  meta/classes/populate_sdk_ext.bbclass | 29
> > >  +++++++++++++++++++----------
> > >  1 file changed, 19 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/meta/classes/populate_sdk_ext.bbclass
> > > b/meta/classes/populate_sdk_ext.bbclass index 151ae1d..1dcd982 100644
> > > --- a/meta/classes/populate_sdk_ext.bbclass
> > > +++ b/meta/classes/populate_sdk_ext.bbclass
> > > @@ -7,8 +7,25 @@ inherit populate_sdk_base
> > > 
> > >  TOOLCHAIN_HOST_TASK_task-populate-sdk-ext = " \
> > >  
> > >      meta-environment-extsdk-${MACHINE} \
> > > 
> > > +    nativesdk-python-core \
> > > +    nativesdk-python-modules \
> > > +    nativesdk-python-misc \
> > > +    nativesdk-python-git \
> > > +    nativesdk-python-pexpect \
> > > +    nativesdk-ncurses-terminfo-base \
> > > +    nativesdk-chrpath \
> > > +    nativesdk-tar \
> > > +    nativesdk-buildtools-perl-dummy \
> > > +    nativesdk-git \
> > > +    nativesdk-git-perltools \
> > > +    nativesdk-pigz \
> > > +    nativesdk-make \
> > > +    nativesdk-wget \
> > > +    nativesdk-ca-certificates \
> > > 
> > >      "
> > > 
> > > +SDK_PACKAGE_ARCHS =+ "buildtools-dummy-${SDKPKGSUFFIX}"
> > > +
> > > 
> > >  TOOLCHAIN_TARGET_TASK_task-populate-sdk-ext = ""
> > >  
> > >  SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
> > > 
> > > @@ -183,8 +200,6 @@ install_tools() {
> > > 
> > >  	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool
> > > 
> > > ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool touch
> > > ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
> > > 
> > > -	install
> > > ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_
> > > PK
> > > G
> > > ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh
> > > ${SDK_OUTPUT}/${SDKPATH} -
> > > 
> > >  	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2
> > > 
> > > ${SDK_OUTPUT}/${SDKPATH} }
> > > 
> > > @@ -201,13 +216,7 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext =
> > > "${sdk_ext_preinst}"
> > > 
> > >  # FIXME this preparation should be done as part of the SDK construction
> > >  sdk_ext_postinst() {
> > > 
> > > -	printf "\nExtracting buildtools...\n"
> > > 
> > >  	cd $target_sdk_dir
> > > 
> > > -	printf "buildtools\ny" | ./*buildtools-tarball* > /dev/null
> > > -
> > > -	# Make sure when the user sets up the environment, they also get
> > > -	# the buildtools-tarball tools in their path.
> > > -	echo ". $target_sdk_dir/buildtools/environment-setup*" >>
> > > $target_sdk_dir/environment-setup*
> > > 
> > >  	# Allow bitbake environment setup to be ran as part of this sdk.
> > >  	echo "export OE_SKIP_SDK_CHECK=1" >> $target_sdk_dir/environment-
> 
> setup*
> 
> > > @@ -224,7 +233,7 @@ sdk_ext_postinst() {
> > > 
> > >  	    # dash which is /bin/sh on Ubuntu will not preserve the
> > >  	    # current working directory when first ran, nor will it set $1
> 
> when
> 
> > >  	    # sourcing a script. That is why this has to look so ugly.
> > > 
> > > -	    sh -c ". buildtools/environment-setup* >
> 
> preparing_build_system.log
> 
> > &&
> > 
> > > cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set
> > > $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path}
> > > $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS}
> > > >>
> > > preparing_build_system.log" || { echo "SDK preparation failed: see
> > > `pwd`/preparing_build_system.log" ; exit 1 ; } +	    sh -c "cd
> > > $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set
> > > $target_sdk_dir
> > > && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >>
> > > preparing_build_system.log && bitbake ${SDK_TARGETS} >>
> > > preparing_build_system.log" || { echo "SDK preparation failed: see
> > > `pwd`/preparing_build_system.log" ; exit 1 ; } fi
> > > 
> > >  	echo done
> > >  
> > >  }
> > > 
> > > @@ -249,7 +258,7 @@ do_populate_sdk_ext[rdepends] =
> > > "${@get_sdk_ext_rdepends(d)}" do_populate_sdk_ext[recrdeptask] +=
> > > "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
> > > 
> > > 
> > > -do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk
> > > uninative-tarball:do_populate_sdk" +do_populate_sdk_ext[depends] +=
> > > "uninative-tarball:do_populate_sdk"
> > > 
> > >  do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in
> > > 
> > > d.getVar('SDK_TARGETS', True).split()])}"
> > > do_populate_sdk_ext[recrdeptask]
> > > += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
> > 
> > This doesn't seem to set up the environment correctly such that the
> > components we're installing into the host part of the SDK are able to be
> > used by the build system - prior to this change we were running the
> > buildtools environment setup script in order to do that. (The best way to
> > test this is try to install it on a machine that doesn't have the required
> > git/tar/python versions e.g. CentOS 6).
> 
> Unfortunately there's another problem - the relocation isn't happening for
> binaries in the host part of the SDK. We can enable that by dropping the
> SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext line but then meta-
> environment-extsdk is setting up the paths for uninative to work and that
> means that the relocation script is looking in the wrong place for the
> native sysroot.
> 
> Ugly as it is we may be better off sticking with the buildtools solution for
> now and working around the problems there.

FYI I have slightly reworked your earlier fix for the buildtools filename 
matching and will be sending it in a new series that includes the rest of this 
series plus Brendan's set of fixes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

