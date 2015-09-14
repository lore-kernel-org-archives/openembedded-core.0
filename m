Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1E473D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 14:43:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 14 Sep 2015 07:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,528,1437462000"; d="scan'208";a="804110023"
Received: from tsun1-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.17.190])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2015 07:43:04 -0700
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1440568697-32101-1-git-send-email-rongqing.li@windriver.com>
From: Saul Wold <sgw@linux.intel.com>
Message-ID: <55F6DCF8.9030906@linux.intel.com>
Date: Mon, 14 Sep 2015 07:43:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440568697-32101-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][v2] perf: fix the install-python_ext
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
X-List-Received-Date: Mon, 14 Sep 2015 14:43:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2015 10:58 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> 1. $(grep xxx xxx) never returns 0, it maybe return empty or string, and
> can not compare with 0, this fixes that python module never are installed.
>
> 2. python library is installed into /usr/lib/ by default, but we expect
> it is installed into ${libdir}, so add --install-lib parameter for python
> setup.py to set the library dir;
> this fixes not shipped warning, since python modules are installed into
> /usr/lib/, but FILE_${PN}-python expects it is under ${libdir}, which is
> /usr/lib64/ for 64bit machine
>
> 3. the makefile target install-python_ext is moved from Makefile to
> Makefile.perf from linux v3.13, so match install-python_ext in Makefile.*
> and --root='/\$(DESTDIR_SQ)' before linux v3.13 will install the target
> python library to native sysroot, so replace it with --prefix as after linux
> 3.13;
> this fixes not shipped warning, and install target files to native dir, like
> below:
> ERROR: QA Issue: perf: Files/directories were installed but not shipped in any package:
>    /home
>    /home/pokybuild
>    /home/pokybuild/yocto-autobuilder
>    /home/pokybuild/yocto-autobuilder/yocto-worker
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info
>

This patch actually seems to introduce this failure,

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/494/steps/BuildImages/logs/stdio

This needs to be addressed.

Sau!

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index b18e474..adb3a2c 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -44,6 +44,7 @@ export STAGING_INCDIR
>   export STAGING_LIBDIR
>   export BUILD_SYS
>   export HOST_SYS
> +export PYTHON_SITEPACKAGES_DIR
>
>   #kernel 3.1+ supports WERROR to disable warnings as errors
>   export WERROR = "0"
> @@ -111,7 +112,7 @@ do_install() {
>   	unset CFLAGS
>   	oe_runmake DESTDIR=${D} install
>   	# we are checking for this make target to be compatible with older perf versions
> -	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0" ]; then
> +	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ] && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
>   		oe_runmake DESTDIR=${D} install-python_ext
>   	fi
>   }
> @@ -143,7 +144,12 @@ do_configure_prepend () {
>       if [ -e "${S}/tools/perf/Makefile.perf" ]; then
>           sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
>               ${S}/tools/perf/Makefile.perf
> +        sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
> +            ${S}/tools/perf/Makefile.perf
>       fi
> +    sed -i -e "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
> +        ${S}/tools/perf/Makefile
> +
>       if [ -e "${S}/tools/build/Makefile.build" ]; then
>           sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
>               ${S}/tools/build/Makefile.build
>

