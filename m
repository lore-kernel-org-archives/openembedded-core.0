Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 046B16B23B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 20:19:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2013 13:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="385109251"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 13:19:31 -0700
Message-ID: <52167253.1070906@linux.intel.com>
Date: Thu, 22 Aug 2013 13:19:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1377200044-16535-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1377200044-16535-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] cronie: add PACKAGECONFIG data
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
X-List-Received-Date: Thu, 22 Aug 2013 20:19:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 12:34 PM, Joe Slater wrote:
> We add PACKAGECONFIG[] data for audit and move
> the current pam related stuff into it's own entry.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-extended/cronie/cronie_1.4.11.bb |   15 +++++++++------
>   1 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
> index aa1ba39..9d2d30b 100644
> --- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
> @@ -14,9 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
>
>   SECTION = "utils"
>
> -DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> -RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
> -PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>
>   SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
>              file://fix-out-of-tree-build.patch \
> @@ -25,15 +22,21 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
>              ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
>
>   PAM_SRC_URI = "file://crond_pam_config.patch"
> -
> +PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>
>   SRC_URI[md5sum] = "2ba645cf54de17f138ef70312843862f"
>   SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f9864d7be"
>
>   inherit autotools update-rc.d useradd
>
> -EXTRA_OECONF += "\
> -                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
> +
> +PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
> +
> +# yes, no, depends, rdepends
> +#
You must have this in your cut and paste, as with the other patch, we 
don't need the extra comments here.

Thanks
	Sau!

> +PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
> +PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
> +
>
>   INITSCRIPT_NAME = "crond"
>   INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
>

