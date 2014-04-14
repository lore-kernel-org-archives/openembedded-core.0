Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 100A465D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:57:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2014 06:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,857,1389772800"; d="scan'208";a="520159820"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2014 06:57:31 -0700
Message-ID: <534BE951.8030701@intel.com>
Date: Mon, 14 Apr 2014 16:57:37 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1397483657-8081-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1397483657-8081-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] mesa: double check for eglplatform.h
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
X-List-Received-Date: Mon, 14 Apr 2014 13:57:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2014 04:54 PM, Valentin Popa wrote:
> Even if 'egl' is in PACKAGECONFIG, mesa egl support
> can be disabled explicitly (using a .bbappend, for example).
> This patch adds another check for the existence
> of eglplatform.h before 'sed' can alter it.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa_9.1.6.bb | 4 +++-
>   meta/recipes-graphics/mesa/mesa_git.bb   | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> index 6e9cd82..388cfd7 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> @@ -19,6 +19,8 @@ S = "${WORKDIR}/Mesa-${PV}"
>   #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>   do_install_append() {
>       if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +        if [ -e "${D}${includedir}/EGL/eglplatform.h" ]; then
> +            sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +        fi
>       fi
>   }
> \ No newline at end of file
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
> index 1babcc0..714911f 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -23,6 +23,8 @@ S = "${WORKDIR}/git"
>   #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>   do_install_append() {
>       if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +        if [ -e "${D}${includedir}/EGL/eglplatform.h" ]; then
> +            sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +        fi
>       fi
>   }
Not sure why subject-prefix didn't work. I'll resend this. Please ignore!

