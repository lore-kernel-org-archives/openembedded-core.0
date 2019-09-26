Return-Path: <stefan@agner.ch>
X-Greylist: delayed 508 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Sep 2019 08:27:40 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id A24337C7A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 08:27:40 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id EC2145C0258;
	Thu, 26 Sep 2019 10:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1569485952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=R5oXuL5l/JDxNi8DtNYZt+TTXkdJ67873XCkmMjWCZ0=;
	b=luLgtcym/45cFEWYinvjIEBuFb3fwCBPmWQjtwWZiA6nifCul+omcHoj0tcA2EmX1HbQP9
	z/FLG7DKy25KE+I7b+kt0FO66HS3thcXJNzIHwF6b+LvyJQVzP8rxnkEa+IyUWnE/KemLJ
	z9JcrzB1+TCZDivbOIo4jKMiFT2IDYQ=
MIME-Version: 1.0
Date: Thu, 26 Sep 2019 10:19:12 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Andrew F. Davis" <afd@ti.com>
In-Reply-To: <20190917131053.32411-4-afd@ti.com>
References: <20190917131053.32411-1-afd@ti.com>
	<20190917131053.32411-4-afd@ti.com>
Message-ID: <2be09d9daa44612fd8c52483dc73131e@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: openembedded-core@lists.openembedded.org,
	Gowtham Tammana <g-tammana@ti.com>, Eric Ruei <e-ruei1@ti.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2 4/4] weston: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Thu, 26 Sep 2019 08:27:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-17 15:10, Andrew F. Davis via Openembedded-core wrote:
> The dependency is for EGL and GLES2 libraries. On some systems these
> are not provided by Mesa, list what is actually needed so the system
> can choose the correct provider.

Unfortunately I saw that a bit late, but this is breaking our use case.

Weston works perfectly fine on non-GPU systems without EGL/OpenGL ES
using pixman renderer. Currently libgbm is still a compile time
dependency, but I have a merge request pending which should drop this
dependency, then the DRM backend can be compiled fine with only KMS
support.

--
Stefan


> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> ---
> 
> Changes from v1:
>  - s/gles2/libgles2
> 
>  meta/recipes-graphics/wayland/weston_7.0.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> index 5d2a9336f3..f9efdbd20a 100644
> --- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> @@ -36,9 +36,9 @@ PACKAGECONFIG ??=
> "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
>  # Compositor choices
>  #
>  # Weston on KMS
> -PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev
> virtual/mesa virtual/libgbm mtdev"
> +PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev
> virtual/egl virtual/libgles2 virtual/libgbm mtdev"
>  # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] =
> "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
> +PACKAGECONFIG[wayland] =
> "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl
> virtual/libgles2"
>  # Weston on X11
>  PACKAGECONFIG[x11] =
> "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb
> libxcursor cairo"
>  # Headless Weston
> -- 
> 2.17.1

