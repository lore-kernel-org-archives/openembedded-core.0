Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7640060069
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 16:09:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xDVG5g9Kz3y;
	Sat,  4 May 2019 18:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556986199;
	bh=NOlgrzg6PYZ8LgywI8hAgCeO1H+TcWqSbZPZ5OinxGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3xjZFJawFC3OrMxtkwJu0OGUGSBpE3A/R95U+YaBOAw8F2yuIMdNK5N6dKWspfSo
	Wcz+yF38kMx7QAxHVrjmMgvl3B/ffXFP130XhlIckT+XJLzpejaxSFFo54AUlKz06A
	m3lfi/KNzgaJBMfonZm1PqRg4ZnyE5SBDzgZI+duwZjted+oSbTHlS0XtLHKIRwnGp
	UYtA5ZcD+nTqzhS+Ffk9EOGMN3MLc4MKYiN88EH6dZbxoU1I1Yqz3+6QcXI71SZswh
	8xnbRJgPQl0rjla3c/UPIqKRWE6R0CV12d6NNvHxIZzeXmhRywalOaUR6nrV+EmLXJ
	HXDYL37CwCUutNhdEuN5akBE8yYdMFCzco8tV7Vf7g/yfxu8JgOPAesDdNasxky9tQ
	YaU3pxo90AEwr+Xb9SqVlw3HUXirvOl2Qe5KNv0e/HwnZz4CtYpwjWV6elirjFRnBt
	agSbBsQsvQJ/eJXMPWevJI2qcV3NPtWOQMsfL8jyFkgUIoR1sp6RvFs9vM/aLZlBC4
	G6Y3x9A+dsKpLFA6zcDaZugNBKc6v8Bcqsuc3xXK/9Xs7x+M/QPcXJQ91ISP1kp30h
	ArNgUCW6glLEqw2HQzV1gjxr3Wtu4J/vVZ0CmgKQB363MmjE3DqX3c2TH3233fs7t7
	dwQwYmHgLbDRBw98OfUfuY9Y=
Date: Sat, 4 May 2019 19:09:56 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190504160956.GE11633@localhost>
References: <cover.1556983501.git.akuster808@gmail.com>
	<6b6aa062a72aa2d50a8318dc03f8d91a32c21e94.1556983501.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6b6aa062a72aa2d50a8318dc03f8d91a32c21e94.1556983501.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 40/43] waffle: supprt build waffle without x11
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
X-List-Received-Date: Sat, 04 May 2019 16:09:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 04, 2019 at 08:27:16AM -0700, Armin Kuster wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> respect DISTRO_FEATURES to make waffle support different platform,
> gbm platform is supported by default.
> 
> [YOCTO #6077]
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-graphics/waffle/waffle_1.5.2.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> index 43c3edc..31572f2 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> @@ -15,10 +15,9 @@ inherit cmake distro_features_check lib_package
>  
>  # This should be overridden per-machine to reflect the capabilities of the GL
>  # stack.
> -PACKAGECONFIG ??= "glx"
> -
> -# libx11 requires x11 in DISTRO_FEATURES.
> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
> +                   gbm"
>...

Changing the default PACKAGECONFIG does not look appropriate for
a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


