Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB0C6010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 23:06:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vARN63HQ026208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Nov 2017 15:06:04 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 27 Nov 2017 15:06:02 -0800
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171124165203.11759-1-limon.anibal@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5cff7c9d-788c-65bf-0576-88a71ac4ccf3@windriver.com>
Date: Mon, 27 Nov 2017 18:06:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171124165203.11759-1-limon.anibal@gmail.com>
X-Originating-IP: [172.25.44.3]
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCH] recipes-graphics/piglit: Add patch for fix build in HiKey platforms
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
X-List-Received-Date: Mon, 27 Nov 2017 23:06:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-11-24 11:52 AM, Aníbal Limón wrote:
> From: Aníbal Limón <anibal.limon@linaro.org>
> 
> Some EGL implementations do not actually ship all Khronos-extensions.
> As it turns out, the Mali 450 driver does not include eglGetPlatformDisplay
> symbol so there is not grauntee to exists use piglit_egl_get_default_display

Anibal,

First, my grammar OCD corrections,   :)

s/grauntee/guarantee/

and more generally:
   so there is not guarantee ...
   so there is no guarantee that it exists,
      use piglit_egl_get_default_display

or just use the upstream commit log:
     The entry point is not guaranteed to exist, so use the
     piglit_egl_get_default_display() helper which does the
     correct thing.


This a backport of 45095dc08b from the piglet git repo
so please make that clear in the long log as well.

Thanks,

../Randy


> wrapper instead.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> ---
>   ...gl-context-priority.c-Use-piglit_egl_get_.patch | 39 ++++++++++++++++++++++
>   meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
> 
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
> new file mode 100644
> index 0000000000..6b73950fc1
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
> @@ -0,0 +1,39 @@
> +From 3b6c3abe3698abb0ae08d14a399eea29805cafd6 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
> +Date: Fri, 24 Nov 2017 10:11:42 -0600
> +Subject: [PATCH] tests/egl/egl-context-priority.c: Use
> + piglit_egl_get_default_display
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Some EGL implementations do not actually ship all Khronos-extensions.
> +As it turns out, the Mali 450 driver does not include eglGetPlatformDisplay
> +symbol so there is not grauntee to exists use piglit_egl_get_default_display
> +wrapper instead. See rev 45095dc08b.
> +
> +Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> +Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> +
> +Upstream-Status: Submitted [piglit@lists.freedesktop.org]
> +---
> + tests/egl/egl-context-priority.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/tests/egl/egl-context-priority.c b/tests/egl/egl-context-priority.c
> +index 7f26fc614..9590ccae3 100644
> +--- a/tests/egl/egl-context-priority.c
> ++++ b/tests/egl/egl-context-priority.c
> +@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)
> + 	if (!strstr(exts, "EGL_MESA_platform_surfaceless"))
> + 		piglit_report_result(PIGLIT_SKIP);
> +
> +-	dpy = eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA,
> +-				    EGL_DEFAULT_DISPLAY, NULL);
> ++	dpy = piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_MESA);
> +
> + 	ok = eglInitialize(dpy, &major, &minor);
> + 	if (!ok) {
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index eae3eed342..c6d4e5c6e0 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
>   SRC_URI = "git://anongit.freedesktop.org/piglit \
>              file://0001-cmake-install-bash-completions-in-the-right-place.patch \
>              file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
> +           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch \
>              "
>   
>   # From 2017-02-06
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

