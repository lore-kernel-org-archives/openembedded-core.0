Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865A1C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:07:00 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.54180.1700496416326988429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjbbtNMJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so1721180f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700496415; x=1701101215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iBeYZGsUNivPZCUAc2a4mmL6JqTr1Eoy5RSCjWBuHuM=;
        b=JjbbtNMJuCJY3c6AssYdxsBcFkjyEk2J/cGzTvV5RHgKhOaO6bRdmyKeYKkndBSZmM
         5OXN1qFkLwaXjGfjRbLG3SNX9kcfi2eUurzQEeSN31x3XK8Dejc9wO+W61oFKkdxI8X4
         7709/zEsc9mPjxTwDe26m8H5VkQyKAbDk0r6KktAM0pM980xx61yT0RRWX42ZQGWWLC7
         +uUSbG6NPo2JemcK+aPlYUtUds+X2J0WqRqzgP1FsOZ7o7iLIfUy6YHgAz0zD1EhSXXx
         7ngLvLjpsEdZlCIBHBxaRsNW0DBM/Frocu6qlY5zeqcth7+yxTir6naIt0Trde1qXJ9G
         dbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496415; x=1701101215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBeYZGsUNivPZCUAc2a4mmL6JqTr1Eoy5RSCjWBuHuM=;
        b=ozSbHxRbsxRElQ7dRRDDhoddHcW8m1CMkyjACufrNYUs39+bDmva5imluf45XKn7Uj
         20cm0npN9ZGSuRlYq1jvxgEkMfAMrhN7pFhzwXxpCQdenFYCp20EjMw6dy9Ves2/Rzgo
         ORrkeXXVfmSpHWIdM5TitKp9hmp5sPW+Iq2mlei9msaAkxUhe3VUoFiVXmHP0jG7z60r
         I/CE0J5yo2jEaBRRPou0UKun2C6sxII6Qx8R98qNiP08gL7P0AO+jt7kD+Na1l0DU0tC
         wx4FYYphC/poJ7cBk/fKJTyvMwDKLLBZHpj5hbioExdNZmhCrd7943VBjU3/xT8eRn/p
         mdaQ==
X-Gm-Message-State: AOJu0YwZ3XykqGDzNI0HHrnHNMFLI4n0brQNvwaNzNXSyicHSJ25kue+
	O7p9xFwClkT15R1dD+5he+AaJ10AdNnVAiVjgqE=
X-Google-Smtp-Source: AGHT+IHSbHSz9PnyFMK8eRMHllncApZnQvPxvE7YgVmhAuJZu7hjkoVXpBydtnzOSUOSYSxCZFN83TIsY473lUBAMYo=
X-Received: by 2002:a5d:59a4:0:b0:32d:c792:fcaf with SMTP id
 p4-20020a5d59a4000000b0032dc792fcafmr10569933wrr.26.1700496414396; Mon, 20
 Nov 2023 08:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20231031042735.3842176-1-javier.tia@linaro.org>
 <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org> <8aee753f-8ebf-4205-87d3-7988a46e3676@linaro.org>
In-Reply-To: <8aee753f-8ebf-4205-87d3-7988a46e3676@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Nov 2023 17:06:40 +0100
Message-ID: <CA+chaQdpsD2NfROa6+McWj_chmQg97Jgj8iV8JOaJ8GTVdb4EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: split strip cmd when ccache is used
To: Javier Tia <javier.tia@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b8d360060a97acf7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190883

--000000000000b8d360060a97acf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was already removed from KERNEL_STRIP in:
https://git.openembedded.org/openembedded-core/commit/?id=3D41f019afc41f800=
b622c46a6d7cf1beffc97716a

On Mon, Nov 20, 2023 at 4:28=E2=80=AFPM Javier Tia <javier.tia@linaro.org> =
wrote:

> On 10/31/23 06:26, Richard Purdie wrote:
> >
> > That looks very like a hack/workaround rather than a real fix. The
> > packaging code shouldn't know/care about ccache.
> Took another look at the problem to find a proper solution. Removing
> CCACHE from KERNEL_STRIP along with the rest of the KERNEL_* variables,
> except for the compiler.
>
> As of right now, ccache is limited to compilers. Attempting to use it
> with other tools is not beneficial. I received the confirmation from
> ccache's maintainer. [1]
>
> I will be submitting another patch.
>
> [1]
> https://github.com/ccache/ccache/discussions/1346#discussioncomment-76161=
80
>
> Regards,
> =C2=BB Javier Tia =F0=9F=96=8B
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190882):
> https://lists.openembedded.org/g/openembedded-core/message/190882
> Mute This Topic: https://lists.openembedded.org/mt/102291706/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b8d360060a97acf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was already removed from KERNEL_STRIP in:<div><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D41f019afc41=
f800b622c46a6d7cf1beffc97716a">https://git.openembedded.org/openembedded-co=
re/commit/?id=3D41f019afc41f800b622c46a6d7cf1beffc97716a</a><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Nov 20, 2023 at 4:28=E2=80=AFPM Javier Tia &lt;<a href=3D"mailto:javier.=
tia@linaro.org">javier.tia@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 10/31/23 06:26, Richard Purdie wrot=
e:<br>
&gt;<br>
&gt; That looks very like a hack/workaround rather than a real fix. The <br=
>
&gt; packaging code shouldn&#39;t know/care about ccache.<br>
Took another look at the problem to find a proper solution. Removing<br>
CCACHE from KERNEL_STRIP along with the rest of the KERNEL_* variables, <br=
>
except for the compiler.<br>
<br>
As of right now, ccache is limited to compilers. Attempting to use it <br>
with other tools is not beneficial. I received the confirmation from <br>
ccache&#39;s maintainer. [1]<br>
<br>
I will be submitting another patch.<br>
<br>
[1] <br>
<a href=3D"https://github.com/ccache/ccache/discussions/1346#discussioncomm=
ent-7616180" rel=3D"noreferrer" target=3D"_blank">https://github.com/ccache=
/ccache/discussions/1346#discussioncomment-7616180</a><br>
<br>
Regards,<br>
=C2=BB Javier Tia =F0=9F=96=8B<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190882): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190882" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190882</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102291706/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102291706/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b8d360060a97acf7--

