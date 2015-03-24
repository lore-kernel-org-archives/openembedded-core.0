Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4C4572458
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 22:31:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 24 Mar 2015 15:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,460,1422950400"; d="scan'208";a="545776093"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga003.jf.intel.com with ESMTP; 24 Mar 2015 15:31:08 -0700
Message-ID: <5511E5AC.3080202@linux.intel.com>
Date: Tue, 24 Mar 2015 15:31:08 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Tyler Hall <tylerwhall@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1427235430-20299-1-git-send-email-tylerwhall@gmail.com>
In-Reply-To: <1427235430-20299-1-git-send-email-tylerwhall@gmail.com>
Subject: Re: [PATCH] uninative-tarball: fix dependency on patchelf
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
X-List-Received-Date: Tue, 24 Mar 2015 22:31:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2015 03:17 PM, Tyler Hall wrote:
> DEPENDS doesn't actually add the dependency on patchelf-native to the
> populate_sdk task. SDK_DEPENDS does this, but move the append to after
> inheriting the base class so it does not get overwritten.
>
> Without this, uninative-tarball fails to build in a clean workspace on a
> system without patchelf.
>
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> CC: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>   meta/recipes-core/meta/uninative-tarball.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
> index 53435f2..62bdde8 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -11,7 +11,6 @@ TOOLCHAIN_HOST_TASK = "\
>       "
>
>   INHIBIT_DEFAULT_DEPS = "1"
> -DEPENDS += "patchelf-native"
>
>   TOOLCHAIN_OUTPUTNAME ?= "${BUILD_ARCH}-nativesdk-libc"
>
> @@ -25,6 +24,8 @@ inherit populate_sdk
>   deltask install
>   deltask package
>
> +SDK_DEPENDS += "patchelf-native"
> +
>   SDK_PACKAGING_FUNC = ""
>
>   fakeroot create_sdk_files() {
>

This patch is the same as what I had queued up. The only thing is to put the 
yocto bug number 7467 in the commit message.

Acked-by: Randy Witt <randy.e.witt@linux.intel.com>


