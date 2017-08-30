Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4EFA77B96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 21:38:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 14:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="1009425106"
Received: from yctb05.ostc.intel.com (HELO yctb05) ([10.54.69.59])
	by orsmga003.jf.intel.com with ESMTP; 30 Aug 2017 14:38:23 -0700
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
References: <20170830171856.55394-1-leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 30 Aug 2017 14:38:23 -0700
In-Reply-To: <20170830171856.55394-1-leonardo.sandoval.gonzalez@linux.intel.com>
	(leonardo sandoval gonzalez's message of "Wed, 30 Aug 2017 10:18:56
	-0700")
Message-ID: <5qtw0o7n3k.fsf@yctb05>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.0.50 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] waffle: prefix MLPREFIX on libgl dependency
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
X-List-Received-Date: Wed, 30 Aug 2017 21:38:22 -0000
Content-Type: text/plain

leonardo.sandoval.gonzalez@linux.intel.com writes:

please ignore this patch. I will git-amend and provide a better explanation.

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Otherwise, on a multilib environment we get the following bitbake errors
> while building 'world'
>
>     ERROR: Nothing PROVIDES 'virtual/lib32-libgl' (but virtual:multilib:lib32:/meta/recipes-graphics/waffle/waffle_1.5.2.bb DEPENDS on or otherwise requires it). Close matches:
>       virtual/lib32-libsdl
>       virtual/lib32-libc
>       virtual/lib32-libsdl2
>     ERROR: Required build target 'lib32-meta-world-pkgdata' has no buildable providers.
>     Missing or unbuildable dependency chain was: ['lib32-meta-world-pkgdata', 'meta-world-pkgdata', 'lib32-waffle', 'virtual/lib32-libgl']
>
>     Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
> [YOCTO #10900]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/recipes-graphics/waffle/waffle_1.5.2.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> index 9d6b0e0e0d..a5179db1da 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> @@ -21,20 +21,20 @@ PACKAGECONFIG ??= "glx"
>  REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
>  
>  # virtual/libgl requires opengl in DISTRO_FEATURES.
> -REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/libgl', 'opengl', '', d)}"
> +REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX}libgl', 'opengl', '', d)}"
>  
>  # I say virtual/libgl, actually wants gl.pc
> -PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/libgl libx11"
> +PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/${MLPREFIX}libgl libx11"
>  
>  # I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
>  # DISTRO_FEATURE.
> -PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,-Dwaffle_has_wayland=0,virtual/libgl wayland"
> +PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,-Dwaffle_has_wayland=0,virtual/${MLPREFIX}libgl wayland"
>  
>  # I say virtual/libgl, actually wants gbm.pc egl.pc
> -PACKAGECONFIG[gbm] = "-Dwaffle_has_gbm=1,-Dwaffle_has_gbm=0,virtual/libgl udev"
> +PACKAGECONFIG[gbm] = "-Dwaffle_has_gbm=1,-Dwaffle_has_gbm=0,virtual/${MLPREFIX}libgl udev"
>  
>  # I say virtual/libgl, actually wants egl.pc
> -PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,-Dwaffle_has_x11_egl=0,virtual/libgl libxcb"
> +PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,-Dwaffle_has_x11_egl=0,virtual/${MLPREFIX}libgl libxcb"
>  
>  FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake \
>                      ${libdir}/cmake/Waffle/"

