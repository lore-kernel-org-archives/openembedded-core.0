Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6YK-0003Mv-Bk
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:09:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2012 08:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="191201118"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2012 08:57:05 -0700
Message-ID: <504E0DD1.1020504@linux.intel.com>
Date: Mon, 10 Sep 2012 08:57:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1347006136-7449-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1347006136-7449-1-git-send-email-constantinx.musca@intel.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf: use --warning=cross only if supported
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 16:09:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2012 01:22 AM, Constantin Musca wrote:
> Adapt autoconf to pass --warning=cross to automake only if
> supported.
>
> [YOCTO #842]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../autoconf/check-automake-cross-warning.patch    |   34 ++++++++++++++++++++
>   meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    3 +-
>   2 files changed, 36 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
>
> diff --git a/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch b/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
> new file mode 100644
> index 0000000..73394d7
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
> @@ -0,0 +1,34 @@
> +Use --warning=cross only if supported by automake
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +--- a/bin/autoreconf.in
> ++++ b/bin/autoreconf.in
> +@@ -127,6 +127,8 @@ my $aclocal_supports_warnings = 0;
> + my $automake_supports_force_missing = 0;
> + # Does automake support -Wfoo?
> + my $automake_supports_warnings = 0;
> ++# Does automake support --warning=cross
> ++my $automake_supports_cross_warning = 0;
> +
> + my @prepend_include;
> + my @include;
> +@@ -191,6 +193,7 @@ sub parse_args ()
> +   $aclocal_supports_warnings = $aclocal_help =~ /--warnings/;
> +   $automake_supports_force_missing = $automake_help =~ /--force-missing/;
> +   $automake_supports_warnings = $automake_help =~ /--warnings/;
> ++  $automake_supports_cross_warning = $automake_help =~ /cross/;
> +
> +   # Dispatch autoreconf's option to the tools.
> +   # --include;
> +@@ -244,6 +247,8 @@ sub parse_args ()
> +       $libtoolize .= ' --debug';
> +     }
> +   # --warnings;
> ++  @warning = grep { $_ ne "cross" } @warning
> ++    if ! $automake_supports_cross_warning;
> +   if (@warning)
> +     {
> +       my $warn = ' --warnings=' . join (',', @warning);
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> index 478f8ed..1ec1cb5 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> @@ -1,6 +1,6 @@
>   require autoconf.inc
>
> -PR = "r7"
> +PR = "r8"
>
>   PARALLEL_MAKE = ""
>
> @@ -8,6 +8,7 @@ LICENSE = "GPLv2 & GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>   		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
>   SRC_URI += "file://autoreconf-include.patch \
> +	    file://check-automake-cross-warning.patch \
>   	    file://autoreconf-exclude.patch \
>   	    file://autoreconf-foreign.patch \
>   	    file://autoreconf-gnuconfigize.patch \
>

Merged into OE-Core

Thanks
	Sau!



