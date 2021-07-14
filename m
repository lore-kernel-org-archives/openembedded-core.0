Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web09.6748.1626270016220029240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 06:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JdJRMuUU;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id e20so635314ual.9
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuBVlR7WinFboT+Oe5QjQ6KReTBAHtkCZtcBtubFjUs=;
        b=JdJRMuUUlHOJgtpdQ1qanfRK1IiMgS3aUNOBanglMjRO+743it/UrW1lfDBFQErukq
         hj4sR6VfzwLepWQouK+mYeHo3Nn06JBsveFVcOwNbY8ORdjZaoiaHOu9kBYdfPGNf7EE
         /LgxXu2MHSe8T8r8mtyY7N2TukpAmR2L7jjNqKleJmk3kGuET8Af4/FX4+oWjmKw89Kt
         R2ov0PWKuUtcNTHg06FMoD62zeLqt2XRG9uC1MNXeZVsbUs8hCGF15sp73QsI1o0iPoP
         fZ4NVzXYdmPDjO/ITXMnGYifszv2d7MWF7EyrNQqCddMhnecK4BtVZ0oZC7aFY69K5kJ
         Wmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuBVlR7WinFboT+Oe5QjQ6KReTBAHtkCZtcBtubFjUs=;
        b=fYy1mpMqmHHoab998IK+dTUIrY3XLlI3Yscif9lnArBA4aGYqVD0GGDQBvCiQMWGk9
         73hHXWCMKBbcwQchys8O1qUfqtwmwVEZwj2aAmnztm/MnvMcbhh5KL1cOyhKONlir4HB
         S4xSGN4eXxENA4F7luiKNvLd20hSADWItr8OkFe/D1Vo0V7YSbMtOY2Q6zlWN9KciTlw
         oqq5j/AfpI8K5tT40gKB73K9fGBedqwMHVWMCaclmGmC1vqY21KDvmtQpe2NvAB3JiqJ
         ZB6cv3OUgE7atVrs+g2vUZo7Ljltd3c158LG6nN0PXE4Z3HyTL/FGCwmAJDYXlN0OIp1
         F7mQ==
X-Gm-Message-State: AOAM532TW565sqzcxDFsKmiulbQ3CVI+wwPiF5ttqrOBDY3ZOYwPtRXt
	FE106SAC4DAUxVs40OiNfWY7gBMZCWp2Hibz+ww=
X-Google-Smtp-Source: ABdhPJycvT+nJiuYag9BG+ADCGuTToh5RvEV/8V/WjuJozkXzwDSnsraNLR+nH/sFq/TVrf6pQCC5+plJGA+GBqu3BQ=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr13932184uan.93.1626270015326;
 Wed, 14 Jul 2021 06:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-2-alex.kanavin@gmail.com> <7304a1fd6d1ccfb9da17ec47125de68035094256.camel@linuxfoundation.org>
In-Reply-To: <7304a1fd6d1ccfb9da17ec47125de68035094256.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 14 Jul 2021 15:40:03 +0200
Message-ID: <CANNYZj8hsgF9fkYinpzPdn6gsjhDXWB1YqTFEANGLNhg1vmn7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000928b3305c7157e3f"

--000000000000928b3305c7157e3f
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jul 2021 at 14:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> At the very least the GCC variable is well used in other layers as it is
> hard to
> remember all the different bits of gcc that are listed here so I think
> that
> should stay. Some of these can probably be removed but I'm not sure how far
> we could/should go. glibc's list of recipes isn't trivial either...
>

I used layerindex to check. Alternative gcc versions are provided by
multiple layers (mostly arm-related), but an alternative older glibc is
only in meta-debian and that is using neither PREFERRED_VERSION directly
nor the *LIBCVERSION convenience (so not sure how it's meant to be used). I
will send a v2 with gcc added back.

Anyone else should probably just copy the PREFERRED_VERSION lines for what
they want to adjust into the layers directly. But let's see what Khem says
- I do think getting help from AUH/devtool in doing the updates fully, or
at least using 'devtool upgrade' locally to prepare the git trees for
manual patch rebasing is valuable.

Alex

--000000000000928b3305c7157e3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 14 Jul 2021 at 14:55, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">At the very least the GCC variable is well used in other layers=
 as it is hard to <br>
remember all the different bits of gcc that are listed here so I think that=
 <br>
should stay. Some of these can probably be removed but I&#39;m not sure how=
 far<br>
we could/should go. glibc&#39;s list of recipes isn&#39;t trivial either...=
<br></blockquote><div><br></div><div>I used layerindex to check. Alternativ=
e gcc versions are provided by multiple layers (mostly arm-related), but an=
 alternative older glibc is only in meta-debian and that is using neither P=
REFERRED_VERSION directly nor the *LIBCVERSION convenience (so not sure how=
 it&#39;s meant to be used). I will send a v2 with gcc added back.<br></div=
><div><br></div><div>Anyone else should probably just copy the PREFERRED_VE=
RSION lines for what they want to adjust into the layers directly. But let&=
#39;s see what Khem says - I do think getting help from AUH/devtool in doin=
g the updates fully, or at least using &#39;devtool upgrade&#39; locally to=
 prepare the git trees for manual patch rebasing is valuable.<br></div><div=
><br></div><div>Alex<br></div></div></div>

--000000000000928b3305c7157e3f--
