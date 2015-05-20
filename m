Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0E97273223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:35:08 +0000 (UTC)
Received: by lagr1 with SMTP id r1so62416501lag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bD05F97bEQOC0uACMT+yj8ywqA3O82anJW8jwymtwhM=;
	b=EIceXySLj2PwQ3rC4L8AE3HpHxq1IaKYBIHPOO1gP8gdu3GG6TUAJWcLZKM+xaIAj6
	GHBrae21YnKUGFgfKookFyY0h1j6i4HT8NkWONvYLD1KeekBnEPgx/h6mHjK1/yyNqVl
	UHDFlkmkMrxNar8vxQmpxGgawVXt1h8CMLLE1JldJJMFbdThur72evkCdqO2HP4gVOEX
	//anh6mIwit4rymtT35SJiL0/+ejpEyQv3v22tNuyXajn1HH+UK3ls6X3U3s6Wm9QJpv
	jFc/4DDkounqAbbDg598Jylwc9S6J7vmguPEN45aIDWevbirH8XYOCs7NyNcvl6355gw
	iQuw==
X-Received: by 10.152.8.6 with SMTP id n6mr25151427laa.116.1432110908684; Wed,
	20 May 2015 01:35:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.27.15 with HTTP; Wed, 20 May 2015 01:34:48 -0700 (PDT)
In-Reply-To: <1431357799-30306-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1431357799-30306-1-git-send-email-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 20 May 2015 10:34:48 +0200
Message-ID: <CAPybu_3jHGff83nO-87zRA=rB2mu_EvnB=Uhn6EkSJzhxHW2Sw@mail.gmail.com>
To: =?UTF-8?B?bsOtYmFsIExpbcOzbg==?= <anibal.limon@linux.intel.com>, 
	Dan McGregor <dan.mcgregor@usask.ca>,
	Darren Hart <dvhart@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm: Support reboot from inside X
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
X-List-Received-Date: Wed, 20 May 2015 08:35:10 -0000
Content-Type: text/plain; charset=UTF-8

ping?

On Mon, May 11, 2015 at 5:23 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> If reboot was called from inside the Xserver there could happen a race
> condition where chvt would never end, and therefore the whole system was
> stalled.
>
> The user could not recover the system by ssh the machine or using the
> keyboard.
>
> Running chvt in background fixes the issue.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> index 2e3e09077792..31f545f79199 100755
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> @@ -48,7 +48,7 @@ case "$1" in
>    stop)
>          echo "Stopping XServer"
>          killproc xinit
> -        chvt 1
> +        chvt 1 &
>    ;;
>
>    restart)
> --
> 2.1.4
>



-- 
Ricardo Ribalda

