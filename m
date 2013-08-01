Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4383661883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 18:12:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2013 11:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="380245355"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2013 11:12:37 -0700
Message-ID: <51FAA515.6050302@linux.intel.com>
Date: Thu, 01 Aug 2013 11:12:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1375073005.git.Qi.Chen@windriver.com>
	<bc3108ce8eea753d38dc70187fface31e6178e71.1375073005.git.Qi.Chen@windriver.com>
In-Reply-To: <bc3108ce8eea753d38dc70187fface31e6178e71.1375073005.git.Qi.Chen@windriver.com>
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] buildtools-tarball: unset OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Thu, 01 Aug 2013 18:12:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2013 06:50 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> When building a qemu image inside the environment created by the
> buildtools-tarball, the qemu image cannot be started, as the runqemu
> script uses the tunctl binary which cannot be found inside the sysroot
> directory of the buildtools-tarball.
>
> The buildtools-tarball is inherently a tool set instead of a fully
> functional SDK, so leaving the OECORE_NATIVE_SYSROOT variable in the
> environment will mess things up.
>
> However, we do need a line of 'OECORE_NATIVE_SYSROOT=xxx' in the environment
> setup script so that the SDK can be extracted and relocated correctly.
>
Where is this being processed, can could be done as a since comment in 
the the environment-setup script instead of exporting and unseting it?

Sau!
> That's why this patch unsets the variable instead of removing it from the
> environment setup script.
>
> [YOCTO #4939]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/meta/buildtools-tarball.bb |    6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 9771497..1f8f142 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -59,7 +59,11 @@ create_sdk_files_append () {
>   	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
>   	touch $script
>   	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
> +	# OECORE_NATIVE_SYSROOT variable needs to be in $script so that the
> +	# relocate script can find the ld-linux.so.
>   	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
> -
> +	# buildtools-tarball is inherently a tool set instead of a fully functional SDK.
> +	# Leaving OECORE_NATIVE_SYSROOT in environment will mess things up.
> +	echo 'unset OECORE_NATIVE_SYSROOT' >> $script
>   	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
>   }
>

