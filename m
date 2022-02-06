Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CB0C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 17:32:05 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web08.11127.1644168724323632166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 09:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K5PP05R0;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id w17so6624419vko.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PicnMjsA0EM9B38sgi9tjjKd7Z2q+DlWw+ChSbnuKZY=;
        b=K5PP05R0r/H5ucq3GbKAdKD/giXVAhAmzsOneqbAF0+xL3vzy6AKM17rwcJIummcrb
         hnL1bMhCejnCtWSQd+jHqas2K72WORvyafV3Wh5Lycri73Ahg0Gv05vozSKyeP0Oxfue
         eQ+Db6A6gC78Gg66vgn+PTZ2QvoXd2KWTPf4qC0ZF2TW1oqMgDogTTE7hfM+ovla76Ai
         2l6jkqbvc969YpJroe/kyxHnv4tqQrV1TehKWhsaAq8LgNesdB9D5mu3c9N0Fr8yIeSj
         QQe7zS5jNQeUQMpNtp/XJj6Eg5jTabGUDkwTNw4CAgUsLK4LwLafjlMtZHAtgpKtMu0h
         W02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PicnMjsA0EM9B38sgi9tjjKd7Z2q+DlWw+ChSbnuKZY=;
        b=NZrTdaCi9wZlpuwGe4PsYcnzJUqiftP3I5wkuwLrOz4RTpQICA1WIp1qzxNxAtKj9D
         mb+yf47Iz93ikC4TVZHSX1IxqIAlYQXKjRxPYAt2cDy7ldUSsPkDpmIJk5XW0SEtOvLx
         54Tb5M2NtKYZRelDquSuTcy4QAgxCoU5Tdf+4GsUlPZOlkUmKCY1mmeHQ90rKIPetq1q
         OFgpqH40WYvk9kqTUxOYCQDNm01zfheF0EDRikqmQfCsiVC2kFA1ArMgLA8Iq4GnmAEy
         JdDJWfoxx92E5hPQWPikc0ONKei9t1JdXNEYhYLoxEoujfHfMaC0YnezXIBxSwHs+pA+
         7hqA==
X-Gm-Message-State: AOAM5320VlG8j56W0pc6kOP8u9XujWAX0ia17W4P+9Lp8uAqOtZSFltb
	tVhIROlI/BiYr3Glqe8AUdXTvemVy4TtsXokqDc=
X-Google-Smtp-Source: 
 ABdhPJwUvJ+J2EAxf6ArL5HQqklugrIOVhbi48KVF1hGejcrViqOlVJuT7vpoisWIQf/n0M7eZp7WJixyaCx3IH0OSo=
X-Received: by 2002:a05:6122:2190:: with SMTP id
 j16mr3953398vkd.21.1644168723345;
 Sun, 06 Feb 2022 09:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
 <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
 <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
In-Reply-To: <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 6 Feb 2022 18:31:52 +0100
Message-ID: 
 <CANNYZj_sSHo29iDkJTndnyuXu57z=V976WGH6ii_T9OEAmKGxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000b4b4a105d75cdcd2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 17:32:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161407

--000000000000b4b4a105d75cdcd2
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Feb 2022 at 18:27, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

> It definitely works in Honister (I'm actively using it.)
>
> We produce a single package set, then allow for multiple image recipes to
> select
> which init manager to use.  This simplifies the eSDK, sstate-cache and
> binary
> package feed -- while still giving the end user the ability to switch.
>

Selection of init manager is a distro setting, it can be used by component
recipes to make decisions, and overriding it from images is neither tested
nor supported.

Alex

--000000000000b4b4a105d75cdcd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 6 Feb 2022 at 18:27, Mark Hatle &lt;<a href=3D"mailto:mark.h=
atle@kernel.crashing.org">mark.hatle@kernel.crashing.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">It definitely works=
 in Honister (I&#39;m actively using it.)<br>
<br>
We produce a single package set, then allow for multiple image recipes to s=
elect <br>
which init manager to use.=C2=A0 This simplifies the eSDK, sstate-cache and=
 binary <br>
package feed -- while still giving the end user the ability to switch.<br><=
/blockquote><div><br></div><div>Selection of init manager is a distro setti=
ng, it can be used by component recipes to make decisions, and overriding i=
t from images is neither tested nor supported.</div><div><br></div><div>Ale=
x <br></div></div></div>

--000000000000b4b4a105d75cdcd2--

