Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3717771AFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 07:23:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4I7N4e2026867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 May 2017 00:23:04 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 18 May 2017 00:23:03 -0700
To: Awais Belal <awais_belal@mentor.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170518065043.1662-1-awais_belal@mentor.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
Date: Thu, 18 May 2017 15:23:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20170518065043.1662-1-awais_belal@mentor.com>
Subject: Re: [PATCH] autogen-native: allow user to set POSIX_SHELL as desired
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
X-List-Received-Date: Thu, 18 May 2017 07:23:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Awais,

On 05/18/2017 02:50 PM, Awais Belal wrote:
> Using 'test -x' is only viable in situations where
> POSIX_SHELL is directly set to an executable whereas
> there are scenarios where a user might want to set
> it to "env sh" so that it can be used in places
> where there's a problem with shebang lengths etc. This
> is exactly how it is being used in OE so build failures
> are seen in cases where deep directory hierarchies are
> used for the builddir.
> We now use 'test -n' just to make sure if POSIX_SHELL
> is set by the user or not and then move forward to
> other tests in case it is unset.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  .../autogen/autogen-native_5.18.12.bb              |  1 +
>  ...pts-allow-user-to-set-POSIX_SHELL-as-desi.patch | 37 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch
>
> diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> index 853477cf7c..37571e3358 100644
> --- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> +++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> @@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
>             file://fix-script-err-when-processing-libguile.patch \
>             file://0001-config-libopts.m4-regenerate-it-from-config-libopts..patch \
>             file://0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch \
> +           file://0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch \
>  "
>
>  SRC_URI[md5sum] = "551d15ccbf5b5fc5658da375d5003389"
> diff --git a/meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch b/meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch
> new file mode 100644
> index 0000000000..bfbf6621e1
> --- /dev/null
> +++ b/meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch
> @@ -0,0 +1,37 @@
> +From dfb30e438a051993c69357c5069170ec779e91e4 Mon Sep 17 00:00:00 2001
> +From: Awais Belal <awais_belal@mentor.com>
> +Date: Wed, 17 May 2017 15:06:48 +0500
> +Subject: [PATCH] config/libopts: allow user to set POSIX_SHELL as desired
> +
> +Using 'test -x' is only viable in situations where
> +POSIX_SHELL is directly set to an executable whereas
> +there are scenarios where a user might want to set
> +it to "env sh" so that it can be used in places
> +where there's a problem with shebang lengths etc.
> +We now use 'test -n' just to make sure if POSIX_SHELL
> +is set by the user or not and then move forward to
> +other tests in case it is unset.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> +---
> + config/libopts.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/libopts.m4 b/config/libopts.m4
> +index 51e6a39..efabc7f 100644
> +--- a/config/libopts.m4
> ++++ b/config/libopts.m4
> +@@ -114,7 +114,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
> +   AC_PROG_SED
> +   [while :
> +   do
> +-      test -x "$POSIX_SHELL" && break
> ++      test -n "$POSIX_SHELL" && break

The problem is libopts.m4 is auto generated, so it may override
when upgrade autogen-native.

// Robert

> +       POSIX_SHELL=`which bash`
> +       test -x "$POSIX_SHELL" && break
> +       POSIX_SHELL=`which dash`
> +--
> +2.11.1
> +
>

