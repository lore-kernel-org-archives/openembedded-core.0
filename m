Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DACD77A2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:07:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 69so478175wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cIC3Cj+GuVmWl72d6isd9/oo0K2vnTqNWUth9yIs5rI=;
	b=szMqr72nKJsERCvcAXQ5/cf8lWce0S1xLyJsAXoR2wIn2gzMP4/4I6qxl2ln0zVECF
	szqQjIy8GghTOHR7pZ0NS6jH4kp0xptEngq1NG7RD+8v4LmCpS9G+wPbWmahkWFQwdJ4
	4LRAEOQl0DvJUf3q8qCo6TK0fAmoBpSoJYy3nzs+czAns0VjjwGHwntodW8OvQQNPCgQ
	lRQ4iunkt9iHB0KaB2orLEMmvrCNqD+rpPEf7EAnLEOSk3JBONga5ArdVxWtAr2sSEnV
	c9NwM7mNFdhhDY4hpQn1k1Bg0WF9YGSgQNO2OPFtgoyU2/7a6lZQeDD1xO50pMw7LGo/
	XKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cIC3Cj+GuVmWl72d6isd9/oo0K2vnTqNWUth9yIs5rI=;
	b=acQGwO6yyx40h3/8hXyrKMEmEnQb6/1KsZ+Z4j9V89Hk9OoQTQ9pUaWU+JfAizhhSU
	YSG2bg4kjUPCu4BWvjlYGVZT9LnQ6Xz/0xlpKwAo/t+sGGm+q3VydCk53RKF1Tcp+vWK
	KcqvOG5st5n9Z5Zz0m7pZrAnCUM1IwtDBvm4YmSJiN22r+1OizNjE0I5HCOP+Gs3noZd
	YETgHJomr3Da8p4tBGa5vIFW7NQTvKLudlNgsCuyohGD0RB9hPp3zqhM8iGqFIEQKBzG
	e7C+P3ePrgPXeBaPBN9ydSGekAgm0DmQoryiE9zP98cxal2l7Gp3N7DkdJFiPP4UE+e8
	K4bg==
X-Gm-Message-State: AHYfb5iRgGBLaHkznt38ilNdrSyz/enNha5fH/DQBbB4uJOq9EDqtCS6
	87gSAZiOC2v6mBUGUaVlfTzcTvfL2Q==
X-Received: by 10.28.13.140 with SMTP id 134mr154258wmn.176.1503515239047;
	Wed, 23 Aug 2017 12:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Wed, 23 Aug 2017 12:07:18 -0700 (PDT)
In-Reply-To: <1503514478-20276-1-git-send-email-bruce.ashfield@windriver.com>
References: <1503514478-20276-1-git-send-email-bruce.ashfield@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 Aug 2017 12:07:18 -0700
Message-ID: <CAJ86T=WvQuxybbB3Dhyy_hSTQup66GUrk4F7HxE27=ud7CwzVA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: relax BSP definition test
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
X-List-Received-Date: Wed, 23 Aug 2017 19:07:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 11:54 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> commit 44aea7b873 [kernel-yocto: ensure that only valid BSPs are built]
> introduced a new check to ensure that a valid BSP definition was found,
> rather than building something that 'closely' matched the current
> MACHINE.
>
> This check breaks valid configurations which do not have a bsp
> definition but are otherwise completely configured machines.
>
> To allow both elements to co-exist (and not add warnings or errors
> to otherwise valid builds), we first check to see if an empty bsp
> definition was found, but then check to see if a defconfig was
> provided.
>
> If a defconfig has been provided, that is a sign that the board
> configuration is complete and we should continue the build without
> otherwise bothering the user.
>
> Tested on meta-raspberrypi and linux-yocto*
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 3c6df92131bc..d68e720589dc 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -143,8 +143,11 @@ do_kernel_metadata() {
>
>         # expand kernel features into their full path equivalents
>         bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
> -       if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
> -               bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYPE}."
> +       if [ -z "$bsp_definition" ]; then
> +               echo -q "$sccs" | grep defconfig

echo -q ?

> +               if [ $? -ne 0 ]; then
> +                       bberror "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
> +               fi
>         fi
>         meta_dir=$(kgit --meta)
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

