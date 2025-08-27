Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EB8CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 11:30:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.12654.1756294211409418179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZ8qM7Yn;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3253f0c8788so5609472a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294211; x=1756899011; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sS7yvDVhfN5e0NqCHJTGu60TAJ4OM3fzE4mJrAAW8as=;
        b=MZ8qM7Ynym/wmkXJFVV7mazgljeUWjmd4pri5zdf1efT5XCKkZB5CGJ0xAThtjKxHI
         H/1cGOc1agYlZ/1qjgYsGrDX+/izKRraCP6QUbDr+TqK0aMcPIkFMBXCnOkjzPdmY3cU
         96sxHPeOI63YXgbYEJZKNFq5PN8o6gDUrxKKhw1LEgG5U17EDPo7dJsUsZNalXMtAs+o
         rxNtUmxo8CTl9WEHD6+8KGnjM7MtnqIn/eWdDqHzetmpjyto7Rn9sFdUqOYH46KYAGNx
         86iO6JdszPs0cruG4uj5Kjb7l7fqoW/UvnIG8eYt7Bktb1x+NxNaVXuqappU3iJqER/n
         lV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294211; x=1756899011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sS7yvDVhfN5e0NqCHJTGu60TAJ4OM3fzE4mJrAAW8as=;
        b=dUtYOaiLbfu1thyWZ185XfJUPu3HkCpoPJgcMcbmpRtlwkA3izWthL+2lTMQuLsC9y
         d8BPMSsh4pezJXVZp2HFJooFgf/Z5TO3zJYnCWYrOVD0r9N7XpFo6F90/H+mLvciyGz2
         NdBFrybz6PnonH7c8z7i3bPp3JF0HgJk4Mv8hwFunkB9fewsziEfJMJHlZVfAQKlFu7f
         rkzcgl39d/RVST2gkQAjBcLk5aptzTihc+jy7gcKKTIaXPhH/H5+3LYYGZ401dnkr9jW
         b+TWnrgt6ONt5HJE3Va3s28kS4vF8yTxlKwumb3xcWJKCQcSVJUyu7ai+/CLsFUeKa2X
         +uGg==
X-Forwarded-Encrypted: i=1; AJvYcCWJg+ArRnKCMeph6dIJMB9iWy8xjc5jnFHsEo9Q2lb1Nrbsnrr037qhAgmOfyt+9ha2KF8TXSMDVqOB4fsYG/v1Ew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YybGuwnW6EiZZ2YktH6LbKlF6HInhO9VJYiIp5hiPou3N6jZynR
	ZnuQrFxU7N5VxZOu6DfqnguiBmVGi5O5Te4QA9jyrJ72+VKyiFf+rMUGc2lW7c28cVSPL9cUrju
	E7FW0YQC3fv6Wax4fMMIV8WPT+RAe0Qw=
X-Gm-Gg: ASbGnctsYE/Kc3yL+mvmcTRbxlk6Ec1YT9GjUPzMwEBKEyLOOfzocLl53uCsSBaow6J
	7MUdwSVrMfxaTjsc6R1rAJp2c7+U2o2CCi4KuwV2ho1OyJTjiXXn96o+C/gp6ldJatwXSTB4fi8
	uLyoHL2iQ8OAuuGwPcnIablbA6yTYDCoxIpv3rlSOKxCVEgfi74AxSDpl08M9FgG08UE18ALsBo
	mZZltSyti3tK/p+kMam0WWb1vJOw06qEG5RkmhAX4NoHz8y8J4=
X-Google-Smtp-Source: AGHT+IEJi92j3FnueCgKo1nCTPjEesenmzDEdvn6QVRTl+mpWbpXRqQ7/VBZxVDkNQrn83QFdAPI+as/lKOxwP9OvgU=
X-Received: by 2002:a17:90b:2fcd:b0:31f:20d4:9966 with SMTP id
 98e67ed59e1d1-32515ec151dmr26967343a91.17.1756294209861; Wed, 27 Aug 2025
 04:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250827024658.2076887-1-bruce.ashfield@gmail.com> <CAOMZO5CtiiGcR58QckxY2MWDBwLL0JzFbiR2S-ZOq85R8xRO1g@mail.gmail.com>
In-Reply-To: <CAOMZO5CtiiGcR58QckxY2MWDBwLL0JzFbiR2S-ZOq85R8xRO1g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Aug 2025 08:29:59 -0300
X-Gm-Features: Ac12FXwv_KQ_XSMXMC6MUNRGu0zOutzDliIDj_pAVtXK_xIWf097hMWDECwWbM0
Message-ID: <CADkTA4MQiJfA4xjE8zJAtYsSo7wjHUHvEsCqmjHiYqNEBx_VSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/6.16: cfg fix configuration audit warnings
To: Fabio Estevam <festevam@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <jdmason@kudzu.us>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000007fff88063d571cd0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 11:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222505

--0000000000007fff88063d571cd0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II


On Wed, Aug 27, 2025, 1:02=E2=80=AFAM Fabio Estevam <festevam@gmail.com> wr=
ote:

> On Tue, Aug 26, 2025 at 11:47=E2=80=AFPM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/.:
> >
> > 1/1 [
> >     Author: Bruce Ashfield
> >     Email: bruce.ashfield@gmail.com
> >     Subject: arm/6.16: remove unsettable and obsolete options
> >     Date: Tue, 26 Aug 2025 22:43:01 -0400
> >
> >     These crypto options are only selected or have been dropped
> >     from 6.16, so we drop them from our configs.
>
> If you still want to support CHACHA20 crypto, you should remove
> CONFIG_CRYPTO_CHACHA20_NEON and select CONFIG_CRYPTO_CHACHA20.
>
> Please see this commit for a proper fix:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv6.17-rc3&id=3D6c9ab811871bc9a08e9cd4b96371a60667fa9ec8



I'll leave that up to Jon/Ross.  I'm just making sure there's no warning
and that what I did was visible so they can make a policy call.

Thanks for the information!

Bruce




>

--0000000000007fff88063d571cd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div><br></div><div><br></div><div data-smartmail=3D=
"gmail_signature">- Thou shalt not follow the NULL pointer, for chaos and m=
adness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf=
, Star Trek II<br><br></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 27, 2025, 1:02=E2=
=80=AFAM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Aug=
 26, 2025 at 11:47=E2=80=AFPM Bruce Ashfield via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Integrating the following commit(s) to linux-yocto/.:<br>
&gt;<br>
&gt; 1/1 [<br>
&gt;=C2=A0 =C2=A0 =C2=A0Author: Bruce Ashfield<br>
&gt;=C2=A0 =C2=A0 =C2=A0Email: <a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Subject: arm/6.16: remove unsettable and obsolete o=
ptions<br>
&gt;=C2=A0 =C2=A0 =C2=A0Date: Tue, 26 Aug 2025 22:43:01 -0400<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0These crypto options are only selected or have been=
 dropped<br>
&gt;=C2=A0 =C2=A0 =C2=A0from 6.16, so we drop them from our configs.<br>
<br>
If you still want to support CHACHA20 crypto, you should remove<br>
CONFIG_CRYPTO_CHACHA20_NEON and select CONFIG_CRYPTO_CHACHA20.<br>
<br>
Please see this commit for a proper fix:<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?h=3Dv6.17-rc3&amp;id=3D6c9ab811871bc9a08e9cd4b96371a60667fa9ec8"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.kernel.org/pub=
/scm/linux/kernel/git/torvalds/linux.git/commit/?h=3Dv6.17-rc3&amp;id=3D6c9=
ab811871bc9a08e9cd4b96371a60667fa9ec8</a></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll =
leave that up to Jon/Ross.=C2=A0 I&#39;m just making sure there&#39;s no wa=
rning and that what I did was visible so they can make a policy call.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the information!</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Bruce=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--0000000000007fff88063d571cd0--

