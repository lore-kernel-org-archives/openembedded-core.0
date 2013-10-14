Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD796BF59
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:59:28 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id o14so5612187lbi.4
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ekT7jwLJ8ecRJHI/kXhwO+wLLwkVRNddQAYgj3PsQDI=;
	b=sRXwpZuBNX9gvfUr+zHKRrX0cD0KFp6wWEuQVZ0UmQpCxIXR+lmPLcnjpfenRthjQq
	CTVb4HOHqB1d5njr82DQ+AhtJWg1jE9knFKfwv0E48EjL/QpAETSoNbgZO1XzjRlqGU8
	cwWdAQsdTqPs+IScldI0dQPrGRR8/V+LMQwbwZcgqdhN6OTxfWNM4Vr/M7Lgl7cXa8Ez
	yVzJDfhEFfpNNk50ibEEwnWXXzITDyi2wBltsjLvC6hGibc8r1LYOtM53fZeVH6DNBn/
	3a/U2UhBJ+L4hLmWfl7cz0w8DPfxANbNwcR2NYysvYk5uqi44U+w/3AjdSvxV4cGD8QG
	m4Eg==
MIME-Version: 1.0
X-Received: by 10.112.29.17 with SMTP id f17mr1533514lbh.45.1381759169248;
	Mon, 14 Oct 2013 06:59:29 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Mon, 14 Oct 2013 06:59:29 -0700 (PDT)
In-Reply-To: <1381761079-8709-1-git-send-email-Chase.Maupin@ti.com>
References: <1381761079-8709-1-git-send-email-Chase.Maupin@ti.com>
Date: Mon, 14 Oct 2013 15:59:29 +0200
Message-ID: <CAAQYJAtZYFkxBMHz8eO_KCnXrToKb1uocVsDtnoeOphqQCYkSA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: update local rules for new touchscreen device
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
X-List-Received-Date: Mon, 14 Oct 2013 13:59:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 14, 2013 at 4:31 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> * While working with a new capacitive touchscreen it was found
>   that the existing udev rule that creates the
>   /dev/input/touchscreen0 symlink was too restrictive and did not
>   match the MODALAIS entry for this touchscreen. which is:
>
>   MODALIAS=input:b0018v0000p0000e0000-e0,1,3,k14A,ra0,1,2F,35,36,39,mlsfw
>
> * By looking at the input_print_modalias function in the Linux
>   kernel drivers/input/input.c file and referencing the meaning
>   of the evbits and attributes of the input_dev structure it seems
>   that for identification of a touchscreen the match with ,18
>   which was matching part of the absbit structure is overkill.
>
> * It seems that the absbit entry is used for devices like
>   touchscreens and if that the the "a" is followed by 0 and 1 this
>   is sufficient.
>
> * So the logic has now been changed to check for the "e" 0 and 3
>   values which correspond to EV_SYN and EV_ABS, then check for
>   the "a" attribute with 0 and 1.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/recipes-core/udev/udev/local.rules |    4 +++-
>  meta/recipes-core/udev/udev_182.bb      |    2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
> index 72d92ef..d0cbf91 100644
> --- a/meta/recipes-core/udev/udev/local.rules
> +++ b/meta/recipes-core/udev/udev/local.rules
> @@ -17,5 +17,7 @@
>  ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
>
>  # Create a symlink to any touchscreen input device
> -SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
> +# Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
> +# has an EV_ABS value (-a) which is used for touchscreen type devices.
> +SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
>
> diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
> index d66292e..a90c289 100644
> --- a/meta/recipes-core/udev/udev_182.bb
> +++ b/meta/recipes-core/udev/udev_182.bb
> @@ -1,6 +1,6 @@
>  include udev.inc
>
> -PR = "r7"
> +PR = "r8"
>
>  # module-init-tools from kmod_git will provide libkmod runtime
>  DEPENDS += "module-init-tools"
> --
> 1.7.0.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Agreed

I noticed it some time ago but the patch is still on hold....
http://patchwork.openembedded.org/patch/25093/


Acked-by: Andrea Adami <andrea.adami@gmail.com>

