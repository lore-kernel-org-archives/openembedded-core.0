Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 68BFB65E6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 03:00:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3G30dMk001994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Apr 2014 20:00:40 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Apr 2014 20:00:39 -0700
Message-ID: <534DF255.9010506@windriver.com>
Date: Wed, 16 Apr 2014 11:00:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1397487085-8924-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1397487085-8924-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [dora][PATCH_V3] mesa: double check for eglplatform.h
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
X-List-Received-Date: Wed, 16 Apr 2014 03:00:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/14/2014 10:51 PM, Valentin Popa wrote:
> Even if 'egl' is in PACKAGECONFIG, mesa egl support
> can be disabled explicitly (changing configure flags
> using a .bbappend, for example).
> On dora, meta-fsl-arm is an example of this kind.
> On master there are no known cases, and we should
> encourge package configuration through PACKAGECONFIG.
>
> This patch adds another check for the existence
> of eglplatform.h before 'sed' can alter it.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>

Reviewed and Tested by: Robert Yang <liezhi.yang@windriver.com>

// Robert

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
>

