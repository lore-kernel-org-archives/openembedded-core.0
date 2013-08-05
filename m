Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EEDED60593
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:39:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 10:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="376483970"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2013 10:39:50 -0700
Message-ID: <51FFE366.7010603@linux.intel.com>
Date: Mon, 05 Aug 2013 10:39:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Bian Naimeng <biannm@cn.fujitsu.com>
References: <51FF72B7.9070706@cn.fujitsu.com>
In-Reply-To: <51FF72B7.9070706@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: fix configure error
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
X-List-Received-Date: Mon, 05 Aug 2013 17:39:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2013 02:39 AM, Bian Naimeng wrote:
> If we don't create ${STAGING_ICU_DIR_NATIVE} before doing
> do_configure for cross target, the following will be caught.
>
>   |configure: error: No such directory ${cross_buildroot} supplied as
>   | the argument to --with-cross-build. Use an absolute path.
>   |Configure failed. The contents of all config.log files follows to
>   | aid debugging
>   |ERROR: oe_runconf failed
>
Is this really needed?  Which ICU is failing, the target or -native 
version?  The target version depends on the -native version which should 
have created this directory first.

What are the steps to reproduce this?

Sau!

> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>
> ---
>   meta/recipes-support/icu/icu.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
> index e3944cd..3987e42 100644
> --- a/meta/recipes-support/icu/icu.inc
> +++ b/meta/recipes-support/icu/icu.inc
> @@ -27,6 +27,7 @@ EXTRA_OECONF_class-native = ""
>   # http://bugs.icu-project.org/trac/ticket/9790
>   do_configure_prepend() {
>       [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
> +    [ -d ${STAGING_ICU_DIR_NATIVE} ] || mkdir -p ${STAGING_ICU_DIR_NATIVE}
>   }
>
>   do_install_append_class-native() {
>

