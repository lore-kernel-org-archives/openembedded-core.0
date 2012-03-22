Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAm2k-0004yl-Hq
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:43:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2012 10:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80502190"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2012 10:34:14 -0700
Message-ID: <4F6B6296.6080800@linux.intel.com>
Date: Thu, 22 Mar 2012 10:34:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332379983-2512-1-git-send-email-denis@denix.org>
In-Reply-To: <1332379983-2512-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] bitbake.conf: fix distro-less failure expanding FILESPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 17:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2012 06:33 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@ti.com>
>
> If DISTRO is not set, FILESPATH becomes littered with directories like
> files/${DISTRO} etc. It won't bomb until you try to eval it - i.e.
> manipulating FILESPATH directly with .= works fine, but calling e.g.
> base_set_filespath() throws this:
>
> ERROR: Failure expanding variable FILESPATH, expression was ${@blah} which
> triggered exception SyntaxError: EOL while scanning string literal (FILESPATH,
> line 1)
>
> Signed-off-by: Denys Dmytriyenko<denys@ti.com>
> ---
>   meta/conf/bitbake.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 17d2f26..16e72e4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -637,7 +637,7 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
>   # This works for  functions as well, they are really just environment variables.
>   # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
>   OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
> -DISTROOVERRIDES ?= "${DISTRO}"
> +DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
>   MACHINEOVERRIDES ?= "${MACHINE}"
>   MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
>

Merged into OE-Core

Thanks
	Sau!


