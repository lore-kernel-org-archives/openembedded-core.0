Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E020C6AB73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 18:23:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 11:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,788,1367996400"; d="scan'208";a="379612610"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2013 11:23:32 -0700
Message-ID: <51F95624.6010203@linux.intel.com>
Date: Wed, 31 Jul 2013 11:23:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Tollerton <rich.tollerton@ni.com>
References: <1375294539-1643-1-git-send-email-rich.tollerton@ni.com>
In-Reply-To: <1375294539-1643-1-git-send-email-rich.tollerton@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master, dylan][PATCH] shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt
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
X-List-Received-Date: Wed, 31 Jul 2013 18:23:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 11:15 AM, Richard Tollerton wrote:
> shadow falsely assumes that if --enable-libpam is set, it doesn't need to link
> against libcrypt; this breaks chsh. (This same fix exists in Arch.)
>
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> index caf24c0..c9d64ad 100644
> --- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> @@ -11,7 +11,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
>              shadow-native"
>   RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)} \
>                     base-passwd"
> -PR = "r13"
> +PR = "r14"
>

Thanks for the patch

PR Bumps are no longer needed, please resend a v2

Thanks
	Sau!


>   SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
>              file://login_defs_pam.sed \
> @@ -37,6 +37,10 @@ EXTRA_OECONF += "--without-audit \
>                    --without-selinux"
>   EXTRA_OECONF_libc-uclibc += "--with-nscd=no"
>
> +# Build falsely assumes that if --enable-libpam is set, we don't need to link against
> +# libcrypt. This breaks chsh.
> +BUILD_LDFLAGS += "${@base_contains('DISTRO_FEATURES', 'pam', base_contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
> +
>   PAM_PLUGINS = "libpam-runtime \
>                  pam-plugin-faildelay \
>                  pam-plugin-securetty \
>

