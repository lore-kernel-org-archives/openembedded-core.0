Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 43AB372027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 19:08:37 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id hv19so16046095lab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 11:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DfolpbpgcIeentLKY1Sm8H8rvfho1xfsI/ATxvondY4=;
	b=mBFzQZBlHpwp6B247sWE1LTK+zCbfWaxosIhw743efJXnjLrKjBydGpLTXgU5vzKWT
	3Rya7DIl1UCUF4qfubC97Edm+t44RvroQbThCMSGp8hwKDBoHiV6iq1JPvwJ+zbSSf8G
	CDMqjcFgj9QE0S3julm6FprHL2TnYyk9F18Mp2CFk0/Qm0CbGY5M6A34nAac5Sk2aFCf
	p8n80fbpRrn8Z3JhZJZYTWbTxLq45ghyQtxO3cAoDkx3IUVqwgLSzJCH+eAokBjrSwh1
	kfVkasWxXOZYCCfw2Y7MxhScylab49uGJkFZUf0jgG3hAdu+AFk1egMDLOcTKcIlOjRc
	4tCQ==
MIME-Version: 1.0
X-Received: by 10.112.134.74 with SMTP id pi10mr22798429lbb.67.1420830517794; 
	Fri, 09 Jan 2015 11:08:37 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Fri, 9 Jan 2015 11:08:37 -0800 (PST)
In-Reply-To: <1420826673-9471-1-git-send-email-openembedded@mindchasers.com>
References: <1420826673-9471-1-git-send-email-openembedded@mindchasers.com>
Date: Fri, 9 Jan 2015 14:08:37 -0500
Message-ID: <CADkTA4NRg0CUoGfe38zfK77r+OyaXt6TvydTAy1GeBZmhQmTvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bob Cochran <openembedded@mindchasers.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: change oldnoconfig to olddefconfig
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
X-List-Received-Date: Fri, 09 Jan 2015 19:08:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 9, 2015 at 1:04 PM, Bob Cochran
<openembedded@mindchasers.com> wrote:
> KERNEL_CONFIG_COMMAND is defined as passing oldnoconfig to
> oe_runmake_call, but oldnoconfig is both an alias to olddefconfig and a
> misleading name.  Therefore, change it to the meaningfully named
> option: olddefconfig.

We've discussed this on the mailing list before. To keep compatibility with
the widest range of possible kernels, we are using the oldest target
on purpose, with
a fallback where appropriate:

http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089242.html
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg49040.html

Cheers,

Bruce

>
> For further background, please see commit fb16d8912db5268f29706010ecafff74b971c58d  in
> Linux kernel source tree:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fb16d8912db5268f29706010ecafff74b971c58d
>
> Signed-off-by: Bob Cochran <openembedded@mindchasers.com>
> ---
>  meta/classes/kernel.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 88356b1..aebbc65 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -275,7 +275,7 @@ python sysroot_stage_all () {
>      oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>  }
>
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
>
>  kernel_do_configure() {
>         # fixes extra + in /lib/modules/2.6.37+
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

