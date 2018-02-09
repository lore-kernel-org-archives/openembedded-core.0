Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D92B6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 20:27:00 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id a25so3585265lfg.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 12:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cOy2r50Q2mlfSyVa5pc4DMSqCMurLlMLWQeWCO0iyPU=;
	b=phPZwHEVubNpStdiEUO3XvQrGrQYBcSZnQ2zkMHJPdo/wDw4LoFQlQUF2u+9vyp+oD
	H6Ngttzep9Bs8feLzcusj9dwYZEPRV776OwPwHAL+IXE6tSxvxqbm1GUJBcmDZfNouTC
	ZMJkIXCwirGNv5BCkx613lSxnm8/8MffRME6/pIi9soVoNZlBqBR0tPNV2tj7sIMxZCz
	/OguF24iuwli3BrYzdpHGLC19kvQw9faApLaVWYnSgz11UWb1pdMlFzhqgS+KAC1hgAv
	O5sf5OdVECcRolUC+S4rSBPQ0iFy4NmPbTRCrUdFDuDGaCjaAyXlPI6r1JMmJMITJpar
	llOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cOy2r50Q2mlfSyVa5pc4DMSqCMurLlMLWQeWCO0iyPU=;
	b=BKi1qqZ0H1RbLZrInmetZXs24Rt3/A6lBcZCldC4GhNNV3d0uKIv5L9tfHOARfWKlE
	kzWhbJTzqorTteYMMq25mdh5f87/KGlbhKonPOfUgxDUdqoRyxF/NBME2bZF++O6bTEk
	2/QmYPCb/S+oyUMuxquR+D8GHrq4gdaH1+/7U3Fdizp1Rfyj38fyvyOHzwmcCQkuNv7D
	aIIpDWbbd8GrxV1MGh997mIJF4NbrKZ5zQv0952tgDpNBWtL2uWJMvFbcAMa0jaKbsaI
	2axvGgKq0aaSqWsLC5YERGI4MPa/lpUSuQjgCAVbhEX1J3apjNP6ysS0xM4NouiJjYNB
	/CNQ==
X-Gm-Message-State: APf1xPDTwQW1SbJO8EgL1aX9gjq4MeVIrR2oCofEfo90pWINMFPQ9HiP
	3Z6/vCus/WknTwhFh0PS0+17vnW4Tm+Ksm5YPje0EA==
X-Google-Smtp-Source: AH8x226Ys/VsIZD9k/1/zJtRb+4y3+GP2riND2lg+OUfYnysyiYqimNEdP24xFxAsfbIZNJ3GqcNmJM63q4dJylq6CA=
X-Received: by 10.25.213.19 with SMTP id m19mr2621197lfg.4.1518208021155; Fri,
	09 Feb 2018 12:27:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Fri, 9 Feb 2018 12:27:00 -0800 (PST)
In-Reply-To: <20180209195337.27617-1-jsbronder@cold-front.org>
References: <20180209195337.27617-1-jsbronder@cold-front.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 Feb 2018 15:27:00 -0500
Message-ID: <CADkTA4OVbFXs=oEwkZF3FiGTwXC1X-1BjRNixK3zSo1xGq1=gA@mail.gmail.com>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: create dummy git user if necessary
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
X-List-Received-Date: Fri, 09 Feb 2018 20:27:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 9, 2018 at 2:53 PM, Justin Bronder <jsbronder@cold-front.org> wrote:
> The user's global git configuration may not have the name and email set
> and git autodetection can fail.  The initialization commit for a non-git
> kernel directory doesn't really need to be tied back to them anyways.
> Instead, create a user and email that's clearly tied back to
> kernel-yocto.bbclass.
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 60979a218f..dbf01f86b6 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -247,6 +247,8 @@ do_kernel_checkout() {
>                 fi
>                 rm -f .gitignore
>                 git init
> +               git config user.name 'Yocto Kernel Git Initializer'
> +               git config user.email 'kernel-yocto.bbclass@invalid'


This is already handled in the utility classes via the
check_git_config routine and it is called in
kernel-yocto's do_patch routine.

If it is needed earlier (as it appears it is), move that call to
do_kernel_checkout.

Bruce

>                 git add .
>                 git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
>                 git clean -d -f
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

