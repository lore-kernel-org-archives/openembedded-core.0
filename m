Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856ECC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:42:34 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.3804.1653460952344034561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=KtGm+kzX;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 77F9E5C0238;
	Wed, 25 May 2022 02:42:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 25 May 2022 02:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1653460951; x=1653547351; bh=aW
	/XpHPkTXzUKYOMbHsd9vmIJfDo5yMyHQGVTz4aPm8=; b=KtGm+kzX84VH5VI8rl
	hRUxR00IYB6OIlT5puC/7Rls9QNC+sTTr3CC2Brs3X7qQTmegV+RPbxoobM+yHJ1
	D9PKMnzTu0z0iyl6EjZh+ICUAblcBW659uO3UVoP3ztHALkLPCxTs5b34B2lOqaW
	oeFDiyiI3j1qCBbS5YsLsjF7Tp+5bZo+kLyCZ3fOoJ8IZ2e55AtUS53CDzL+f32q
	07cfEo1YrXWp/C53wt9HRGOnZZ9fqeFSRWbfmDbecMBtUuoauteXywXnil/ThgNS
	C8Npoxne0RRCfb1rmtJSb2OTgPB7jTQBNX3elNwhajPDHVI/ZaAyfDVaFdZLl/To
	B5YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1653460951; x=1653547351; bh=aW/XpHPkTXzUK
	YOMbHsd9vmIJfDo5yMyHQGVTz4aPm8=; b=GMo/guT4pKs+1CJrKAgFUCqRGtK1n
	H1XqcBXlqwS16JbJKyplwHCQFfDH7rxfYOJC/j0UPF6EH9U3rGG4+BD+cOW9rgkK
	2qqJ5bRfomy2ruifPlwsiKxk8+rGItG3+BLM1yzz9QuJbuig60iRPW5FjeHp2gdi
	6KUyqWUxDI/URM8PQ7cSnXfdNvE4UDbjarkc1MscawXQBCCmJ+FKPnjhG+WfgqAs
	NepWpG2Wsul0tsgAjjOvaMYFbkVYkXB/iwZOHyx43tZckSwCqT48hB0hXFcVAilB
	sLSvKNFs1RM95HZK1Q525svxSO9lJeG+Z09+PrfjJiIIJ3RlTswznLJuw==
X-ME-Sender: <xms:18-NYrLwYIBWrteevwuQ_6QZdS5FNMbrxVNF3GDqJrug-VoUI-C8RQ>
    <xme:18-NYvKDlEkoCXccmPvm3zO0W1RvNXLYlAbOzO_ZlADZiq_yxBqBYe6CDjwKdSq1r
    qCH1iMkKm6nWGRfUg4>
X-ME-Received: 
 <xmr:18-NYjvyPznQOE4JGwJ_YBZARlkAXVEcFaJZKYbYdse-dSpqm7Ik6jqr4uTcKqFBOxlGy2o>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhrjgfkgggtsehttdertddtredtnecuhfhrohhmpefrrghv
    vghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpeduffegjedtgedujeevfedtteduleduleffhfejtddtffekueelhffgffdv
    fedvtdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhk
    ohhffhdrnhgvth
X-ME-Proxy: <xmx:18-NYkaRIpHIfJveXtu_pfAJYQ4SkNhw87klQ7L7LfWo8WY4NYvZSw>
    <xmx:18-NYiaDCLf1U2wgpKrUYJ8rugXC2LAfHM6LE2p4jmrsQ0IuuQ8Czg>
    <xmx:18-NYoCXYvCEUwZCVqMBfCSr5dlSTzrg8K82DCXDedX1KO4INcC9dw>
    <xmx:18-NYrD7hOgQKPArrvbiBnghjYyOYFcItb7frSKruPa3S3WSZmuRLg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 02:42:30 -0400 (EDT)
References: <20220525055556.31026-1-Qi.Chen@windriver.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] libsdl2: add back xvm and xinerama options
Date: Wed, 25 May 2022 08:40:31 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: <20220525055556.31026-1-Qi.Chen@windriver.com>
Message-ID: <874k1e15bi.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:42:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166099


I've reported this yesterday.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14812 Feel free to
close this bug once the patch is merged :-)

"Chen Qi" <Qi.Chen@windriver.com> writes:

> When building libsdl2-native, and I met a do_configure error as below.
>
>   | CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
>   | Please set them or make sure they are set and tested correctly in the CMake files:
>   | XINERAMA_LIB
>
> This error appears on hosts with libxinerama-dev installed.
>
> Looking at the CMakeLists.txt file, I got:
>
>   set(SDL_X11_OPTIONS Xcursor Xdbe Xinerama XInput Xfixes Xrandr Xscrnsaver XShape Xvm
>
> We an see neither Xinerama nor Xvm is removed. So we should add back
> these options removed by a previous commit.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> index b112d63784..8519e7f732 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> @@ -43,7 +43,9 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
>                   -DSDL_PTHREADS=ON \
>                   -DSDL_RPATH=OFF \
>                   -DSDL_SNDIO=OFF \
> +                 -DSDL_X11_XVM=OFF \
>                   -DSDL_X11_XCURSOR=OFF \
> +                 -DSDL_X11_XINERAMA=OFF \
>                   -DSDL_X11_XDBE=OFF \
>                   -DSDL_X11_XFIXES=OFF \
>                   -DSDL_X11_XINPUT=OFF \


