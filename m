Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99EB17316E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:54:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2016 18:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,556,1444719600"; d="scan'208";a="725060390"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by orsmga003.jf.intel.com with ESMTP; 11 Jan 2016 18:54:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:54:10 +1300
Message-ID: <2742933.c5PQfXKTiF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1452546725-211503-3-git-send-email-mark.hatle@windriver.com>
References: <1452546725-211503-1-git-send-email-mark.hatle@windriver.com>
	<1452546725-211503-3-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2 [RFC]] image.bbclass: Unconditional includes of populate_sdk_ext fails
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
X-List-Received-Date: Tue, 12 Jan 2016 02:54:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 11 Jan 2016 15:12:05 Mark Hatle wrote:
> populate_sdk_ext requires uninative support, which is only available on
> glibc based SDKMACHINES.  For instance, when using mingw32 a dependency
> error will occur:
> 
> NOTE: Runtime target 'nativesdk-glibc' is unbuildable, removing...
> ERROR: Required build target 'core-image-minimal' has no buildable
> providers. Missing or unbuildable dependency chain was:
> ['core-image-minimal', 'uninative-tarball', 'nativesdk-glibc']
> 
> This is dues to populate_sdk_ext.bbclass having:
> do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk
> uninative-tarball:do_populate_sdk" addtask populate_sdk_ext
> 
> Since bitbake can't determine for dependency resolution if the task is going
> to be run yet, it blows up and says it simply can't be resolved.
> 
> Workaround this problem by making the inherit conditional on the SDK_OS
> containing 'linux'.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/image.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index e3769b4..d37995a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -1,6 +1,9 @@
>  inherit rootfs_${IMAGE_PKGTYPE}
> 
> -inherit populate_sdk_ext
> +# Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk
> +# in the non-Linux SDK_OS case, such as mingw32
> +SDKEXTCLASS ?= "${@['populate_sdk', 'populate_sdk_ext']['linux' in
> d.getVar("SDK_OS", True)]}" +inherit ${SDKEXTCLASS}
> 
>  TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"

Looks OK to me, FWIW.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

