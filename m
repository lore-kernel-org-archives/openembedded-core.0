Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8F3C5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:47:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10930.1673002055740145770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bP4cNxDM;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so3272962wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 02:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CLfFRFIa9gcHEIJo1NI/XYDtLHpcGRSOKjwRRLJcdkA=;
        b=bP4cNxDMQnkar9PHGzLmTWGqCpyaaKNb2BvfdBBfH/jzTdtnwlz2fn0NGL+nAHjv+w
         WEaVzkEYZoAAfc86HJiGc3IaIn2HxHftkJ2bmc8qLtaTjOk70Pdn+qyYaWCFEbUasF5C
         L7lVtklciFXIhGTZCH5ex4fg+53iUi9Z2OITodkAIvFtaK/bUQFN6jBV1LWbOQXpoQ++
         SQ0CUWnVQYSmFJhRGv/EYzBOJWUdblO7cnmWpSqEs8dAr3ByqAIeR8snPg1GNmwcP2jd
         CNJhL6W2STWm1PqZQwfemgIfWfRvwsiYKD/erJuIie419mIICnNM/mQ6SrgAaRX33aTY
         k5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLfFRFIa9gcHEIJo1NI/XYDtLHpcGRSOKjwRRLJcdkA=;
        b=ainbnEsPlwHuVN/NK0pjeoVPH80aR8VDX8xlXnBckYKe8LRvhY5uuLOVhLD5P95WuC
         /DRsguIHS+BY4pNueHor5oXNQtg5rVSO0F/EwYJlmxgMb/ur/Y/JxGLsd8kHV+WNPFtU
         hUht8Vw01Ph6EI8SqaaViw+fkFQrvl8GtE+kqpbRGDgLTmZSD7KF0hjV4hOMiF90aaqr
         0m9hPG72Z2mvkA4F2uhKX8mtDZ76/ZUFKLiy8vCbbetqM1nAFWTPY5UPsuLuSb+LlirH
         G2AVgJB1IgInqw2DsvpOZfygp6Gap0dTzTt+2iopYEj2EUrTq0xooS5UGlX0b67leAL8
         tNXA==
X-Gm-Message-State: AFqh2kpn5l6I5UO9PO9jFT9AMvpEE4OP/Pp1Voc4GFrGh+wpo8PcsUbL
	T53FZGIVtW73w9P5hZUrbVTI9uWwixCWhRtyaFM=
X-Google-Smtp-Source: AMrXdXvz3ci6P6m8dLgk53VIyNdkjr2nsM4h+iU1sZ7//TgOtzWxsCwmaaC8HUf5L9PDYa5wUG65UZjGp8/qMKNNPDE=
X-Received: by 2002:a05:600c:d9:b0:3d1:ed5f:b8ec with SMTP id
 u25-20020a05600c00d900b003d1ed5fb8ecmr2658110wmm.102.1673002054091; Fri, 06
 Jan 2023 02:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
 <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj-BCH5XkMMcYMQSAdKSk-YGYLf5xk-pBbt6ekC6qPaa3Q@mail.gmail.com> <de6ea321f2dbd0eb5b7d1fd867af7327f0bdb1a2.camel@linuxfoundation.org>
In-Reply-To: <de6ea321f2dbd0eb5b7d1fd867af7327f0bdb1a2.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Jan 2023 11:47:17 +0100
Message-ID: <CA+chaQdcQvYMVd3f5TSGprmGNMZdTRFRnk1QchaFnVpbCJZjmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Mingli" <Mingli.Yu@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002489a505f196256e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175572

--0000000000002489a505f196256e
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 11:36 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> For example, imagine the dependency is "virtual/libc" and somehow you
> break the providers of it, i.e. break the glibc recipe. All of a sudden
> "bitbake world" would return success even though it built nothing since
> anything depending on virtual/libc was magically removed (which is
> nearly everything at some point).
>
> The conclusion I came too last time I thought about this was they we
> really did want to mark up the cases where things have a specific
> requirement, even if at times that is painful.
>

FWIW: here is the earlier (2014) discussion about this:
https://lore.kernel.org/all/1414675717.7649.56.camel@ted/

--0000000000002489a505f196256e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jan 6, 2023 at 11:36 AM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">For example, imagine the =
dependency is &quot;virtual/libc&quot; and somehow you<br>
break the providers of it, i.e. break the glibc recipe. All of a sudden<br>
&quot;bitbake world&quot; would return success even though it built nothing=
 since<br>
anything depending on virtual/libc was magically removed (which is<br>
nearly everything at some point).<br>
<br>
The conclusion I came too last time I thought about this was they we<br>
really did want to mark up the cases where things have a specific<br>
requirement, even if at times that is painful.<br></blockquote><div><br></d=
iv><div>FWIW: here is the earlier (2014) discussion about this:</div><div><=
a href=3D"https://lore.kernel.org/all/1414675717.7649.56.camel@ted/">https:=
//lore.kernel.org/all/1414675717.7649.56.camel@ted/</a></div></div></div>

--0000000000002489a505f196256e--

