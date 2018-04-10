Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8D87484E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:48:42 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 188-v6so12357681oih.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MF8YJSFPptz2+GdePQRVAh4/zVDzXUwyBvNwx4d7KKk=;
	b=NylsWq6F4tf8HA66qZnALMTgz+NU47vlyRmbAu4JHuo2prdlQjVC4qnveT8Q6n8Rne
	jaU5rOrdTYme4qu0ZKGXlJjfNeGR5quwv3osJJI+wyajhPvlyS9H77TAyL3gcHoceUOd
	hK+dxi674u5nDdEcitmroBGWOLyNHXnfPBlCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MF8YJSFPptz2+GdePQRVAh4/zVDzXUwyBvNwx4d7KKk=;
	b=eezeN9CYRKUTuKw0LXFEXaVTsoOdaIY03OO8f2xBs5m5KBYTa1mYbZIWgL9XifPOEV
	op97WCyHKYH4nUo+oNhj5eJnwOMM/UYBBmJjNnPOYbaeLHIDsMr2UhqwGI+l91sr+8sc
	+7YTV6Qtcu0sfrgbuixeP9OpiZ6rIYUN2Nixi3RPq7FzD260NF+uEXonSwJxyhM8j5Co
	/IzPnkQzkqWI7/A8EPYi+YIS+2Y73DMQafAJlIobnHDwBteicHsrw3l9ommj2pNb4hrq
	mAVeSdUQSjaiZ7Dw/YBDPfpct6MWaGnK5HowiGbS6FmY6ptnfMdeZVthq3MF7m/Ls6l9
	CIng==
X-Gm-Message-State: ALQs6tApF5ZCQ72rAFW+b2RQtSa1e05GEdsb8u2pxQkwX5A7WVOyQAGb
	UVT16zISr7gVkmmmDqeBf3yoekLos/wERoYclg67rQ==
X-Google-Smtp-Source: AIpwx49ajFED3japXS9qogU2kpMlGCJ024K3Hw/0IP61VOdCcNXBUhUxUB+i7svFLx4N9hcXjaoheLO7c4u4pskpnzc=
X-Received: by 2002:aca:ed08:: with SMTP id l8-v6mr1186570oih.39.1523389723807;
	Tue, 10 Apr 2018 12:48:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.172.135 with HTTP; Tue, 10 Apr 2018 12:48:23 -0700 (PDT)
In-Reply-To: <20180410112040.13506-1-ramon.fried@linaro.org>
References: <20180410112040.13506-1-ramon.fried@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 10 Apr 2018 21:48:23 +0200
Message-ID: <CAP71WjxWzSc8pCSv=_NcRNna-pA8mMNUhhhM+X9M7ShO0XK39A@mail.gmail.com>
To: Ramon Fried <ramon.fried@linaro.org>
Cc: Ramon Fried <rfried@codeaurora.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: Respawn service in case of failure
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
X-List-Received-Date: Tue, 10 Apr 2018 19:48:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 10, 2018 at 1:20 PM, Ramon Fried <ramon.fried@linaro.org> wrote:
> From: Ramon Fried <rfried@codeaurora.org>
>
> It appears that sometimes xserver-nodm.service is starting before
> display driver finished loading causing the following failure in
> Xorg log:
> (EE) open /dev/dri/card0: No such file or directory
>
> The introduced by this patch is to restart the service,
> hopefully the display driver will finish loading.
>
> Signed-off-by: Ramon Fried <rfried@codeaurora.org>

we are seeing this issue on Dragonboard with meta-qcom BSP, where all
drivers needed for display/gpu are modules, so the display
initialization comes up 'late' in the boot. I had a discussion with
some upstream gnome folks who indicated that a similar race can be
observed on any hardware, it is not uncommon, and that's why they use
Restart=always in gdm.service as well, so that it keep trying until
the display comes up.

it sounds reasonable change to me.

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  .../x11-common/xserver-nodm-init/xserver-nodm.service.in                 | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
> index 324a26f549..87dc4f8fcd 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
> @@ -5,6 +5,7 @@ Description=Xserver startup without a display manager
>  EnvironmentFile=/etc/default/xserver-nodm
>  User=@USER@
>  ExecStart=/etc/xserver-nodm/Xserver
> +Restart=always
>
>  [Install]
>  Alias=display-manager.service
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

