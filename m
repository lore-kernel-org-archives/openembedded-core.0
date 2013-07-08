Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 48E2561883
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:29:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2013 08:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1020,1363158000"; d="scan'208";a="366555278"
Received: from unknown (HELO [10.255.13.85]) ([10.255.13.85])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2013 08:29:20 -0700
Message-ID: <51DADAC8.7020208@linux.intel.com>
Date: Mon, 08 Jul 2013 08:29:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com, Amy Fong <amy.fong@windriver.com>
References: <cover.1373254421.git.jackie.huang@windriver.com>
	<45395363a744785f10811752669eac4a7c43f52a.1373254421.git.jackie.huang@windriver.com>
In-Reply-To: <45395363a744785f10811752669eac4a7c43f52a.1373254421.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] nativesdk-glib-2.0: cannot build on hosts without libffi.so.5
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
X-List-Received-Date: Mon, 08 Jul 2013 15:29:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2013 09:11 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The compile phase of nativesdk-glib-2.0 tries to run some binaries built
> and since the -Wl,rpath doesn't specify the sysroot libraries with libffi.so.5,
> attempts to run the binrary on hosts without libffi.so.5 results in an error
> message complaining that it cannot find libffi.so.5, to fix this, specify
> -Wl,rpath == -Wl,rpath-link

I am not sure this makes sense, we have relocation code already, and 
glib-2.0 DEPENDS on libffi, so it should be available.  What binary is 
being run?  That same binary might be built for the target and would 
have to be run native, so I think this is not correct.

Sau!

>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> index ffe34ac..bd4f526 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> @@ -46,6 +46,13 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
>               eglibc-localedata-translit-cjk-variants \
>              "
>
> +BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
> +                    -Wl,-rpath-link,${STAGING_LIBDIR} \
> +                    -Wl,-rpath,${STAGING_LIBDIR} -Wl,-O1 \
> +                    -L${STAGING_DIR_HOST}${base_libdir} \
> +                    -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
> +                    -Wl,-rpath,${STAGING_DIR_HOST}${base_libdir} -Wl,-O1"
> +
>   do_configure_prepend() {
>   	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
>   }
>

