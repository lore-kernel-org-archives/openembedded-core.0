Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9DFC021A1
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 11:20:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.13375.1739359204233899454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 03:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0ZklMJ7V;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38ddfee3ba9so2608694f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 03:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739359202; x=1739964002; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1MFb0uWMBwcayTjzFruv+sTsW1m5ogzZR695U4s9Og=;
        b=0ZklMJ7VzUyB07IW/wwZvD/lapVM4SW/BR+5A1ujSK3+JBpU3HOONihW4n6y8NguaI
         GozHpB6F1A6S5WE21+wVfSHoNzKSqXhiS3VINXMtusS2H0iz99L4Zkty7qjRjemq/qvd
         Pt2yBZZBAmsB5Z5aeiFdyTPFCt3Ym3Zl5uQrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359202; x=1739964002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1MFb0uWMBwcayTjzFruv+sTsW1m5ogzZR695U4s9Og=;
        b=pXL8Ur4NjZFlZpfgdlpYArMbYE9rjQtyeooY93BPoK6kEBF7bU++GiLJ/aysb8dTVQ
         rqiaV6i0YTsVYNsmcJwSf19AF27tGm1F11LnAgbcnn7+jPxq4cOTHhKaIhpw6g/NPfKK
         NLFe3AJdpV2C6dXAqYWBzpXyS4xV43etXs+DBBgPCcI7D9KgYXHfxQHI1LFkGgRRJCVU
         2nphwdUjpwHxbGnTBoMMxadM9XRbl9VAd6DCVmllAh+ABGLgRHrJz8nBEVExT07+DCZF
         /phE8F6lzYjh11aADQzooI31iiSlu7iunrV3A/jRtEFDzZS43W+3jgQiIIzRCfVjOp97
         DCFw==
X-Forwarded-Encrypted: i=1; AJvYcCX7uiA48ecvmynH6O75fTfzKOmo7EPbcSNf5I+5Y3EPq2fhnyddt3GG4B6Wjxb7SuN5ggdaGdtni//2AZlcipHPxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlYTnbIAvOLxEoZ0l8EZjgmeixQWoMR5fkDGV6kB+wr+Qdi0Jr
	wbI2uuyuDQ5wimYfuYhoWBs0A3oCwOAI1RmUx/Fesa9WPfBC1QEz7VOP72QvJsq4x/X0wuGDU7w
	N0m5U98/0E7nS3I32MPwymPnFivkSmkRxvJjP8w==
X-Gm-Gg: ASbGnctwnMAUc4htxtU7lv+JLGsmdSYJrqMfB9BkP4A/xfCNyBlLgR0AWl04Ig0PTqS
	X2TSw0hi1J4UQsBE8CLyHVsxLvxyFidKhqT66SfPBvRPepNvq5SWgytJ5FPGjmvrUGDIxrrtROp
	UPJOgZ3kYUNLeI8SW+nHqnQcU6sdwP
X-Google-Smtp-Source: AGHT+IGU0Vpkvc07s5q97hy4xo+1DhJLKEfYYCy8l6W2/WHU0CTPmmbyAFyLC8M1zquyJArQrkG7nl0W7PuhlSXidkk=
X-Received: by 2002:a5d:64cd:0:b0:385:deca:f7cf with SMTP id
 ffacd0b85a97d-38dea25bb44mr2372222f8f.8.1739359202597; Wed, 12 Feb 2025
 03:20:02 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com> <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
In-Reply-To: <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 12:19:49 +0100
X-Gm-Features: AWEUYZmxHXjgDwYiGrlj_mLdnuEet_PwPA1RKLb2ME_a3dqAJ3ntKi9Z509vtn0
Message-ID: <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000686f67062df01f39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211226

--000000000000686f67062df01f39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 12 f=C3=A9vr. 2025 =C3=A0 10:51, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2025-02-12 at 09:08 +0100, Yoann Congal wrote:
> > Le mer. 12 f=C3=A9vr. 2025 =C3=A0 00:36, Richard Purdie via lists.yocto=
project.org
> <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> a =C3=A9cri=
t :
> > > The repositories were added to try and share bandwidth costs, give
> > > people easier mirrors and various other justifications. I warned
> > > strongly about the pull request problems at the time, I was told it
> > > would get handled and people would help and I was over reacting. Some
> > > of the people who made those offers aren't active with the project an=
y
> > > more, other things just drifted with time. At one point I ended up
> > > having to add those mirrors to my own push scripts and maintain them
> > > because nobody else was willing and we had complaints they were not u=
p
> > > to date.
> > >
> > > You used to be able to disable pull requests for six month periods, i=
t
> > > looks like you can no longer do that and it was a pain having to try
> > > and remember anyway.
> > >
> > > The bandwidth/mirror/backup benefits are valid and I'd be reluctant t=
o
> > > delete them as some people can only discover things through github to=
o.
> > > Google indexing doesn't work well with our own server.
> > >
> > > So I guess I made my own peace with their existence. I know touching
> > > them will make it look more like a condoned submission method but I
> > > really don't see many good options here. Removing them is a simple ea=
sy
> > > option but life sometimes isn't easy/simple.
> >
> > We can try things to push users out of github :
> > * Leaving a fake PR at the top of the list with a title along the
> > line of "Please don't open a PR but instead go to <contributing guide
> > link>"
> > * using the PR template (the text pre-filled for the new PR
> > description) to convey the same info
> > * A bot that automatically answer the PRs with a comment with the
> > same idea (the bot could also close the PR but that might be a bit
> > harsh)
>
> If anyone has experience of setting this up I'd welcome help. The
> things I did learn briefly looking yesterday are that:
>
> * the template requires putting .git* files in the repo which is a bit
> annoying
>
> * there is a way to do it in a separate repo but that would apply to
> all repos, not just oe-core and bitbake, at least from what I read
>
> * our type of account may or may not have some of the features needed
> for bots and so on
>
> So I'm not against any of these but it could do with someone with some
> experience. I can probably learn what is needed but I have time
> challenges like everyone else.
>
> There will probably be a need to maintain any bot going forward too.
>

I volunteer to setup a PoC in my repos to see what is possible given those
constraints.

I'm more experienced in Gitlab than GitHub but I should be able to
translate.

Obviously, if anyone has direct experience on that, don't hesitate to speak
up.

What kind of account does the yocto project has on GitHub?

Cheers,
>
> Richard
>
>
>
>

--000000000000686f67062df01f39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 12 f=C3=A9vr. 2025 =
=C3=A0 10:51, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-02-=
12 at 09:08 +0100, Yoann Congal wrote:<br>
&gt; Le=C2=A0mer. 12 f=C3=A9vr. 2025 =C3=A0=C2=A000:36, Richard Purdie via =
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.yoctoproject.org</a> &lt;richard.purdie=3D<a href=3D"m=
ailto:linuxfoundation.org@lists.yoctoproject.org" target=3D"_blank" rel=3D"=
noreferrer">linuxfoundation.org@lists.yoctoproject.org</a>&gt; a =C3=A9crit=
=C2=A0:<br>
&gt; &gt; The repositories were added to try and share bandwidth costs, giv=
e<br>
&gt; &gt; people easier mirrors and various other justifications. I warned<=
br>
&gt; &gt; strongly about the pull request problems at the time, I was told =
it<br>
&gt; &gt; would get handled and people would help and I was over reacting. =
Some<br>
&gt; &gt; of the people who made those offers aren&#39;t active with the pr=
oject any<br>
&gt; &gt; more, other things just drifted with time. At one point I ended u=
p<br>
&gt; &gt; having to add those mirrors to my own push scripts and maintain t=
hem<br>
&gt; &gt; because nobody else was willing and we had complaints they were n=
ot up<br>
&gt; &gt; to date.<br>
&gt; &gt; <br>
&gt; &gt; You used to be able to disable pull requests for six month period=
s, it<br>
&gt; &gt; looks like you can no longer do that and it was a pain having to =
try<br>
&gt; &gt; and remember anyway.<br>
&gt; &gt; <br>
&gt; &gt; The bandwidth/mirror/backup benefits are valid and I&#39;d be rel=
uctant to<br>
&gt; &gt; delete them as some people can only discover things through githu=
b too.<br>
&gt; &gt; Google indexing doesn&#39;t work well with our own server.<br>
&gt; &gt; <br>
&gt; &gt; So I guess I made my own peace with their existence. I know touch=
ing<br>
&gt; &gt; them will make it look more like a condoned submission method but=
 I<br>
&gt; &gt; really don&#39;t see many good options here. Removing them is a s=
imple easy<br>
&gt; &gt; option but life sometimes isn&#39;t easy/simple.<br>
&gt; <br>
&gt; We can try things to push users out of github :<br>
&gt; * Leaving a fake PR at the top of the list with a title along the<br>
&gt; line of &quot;Please don&#39;t open a PR but instead go to &lt;contrib=
uting guide<br>
&gt; link&gt;&quot;<br>
&gt; * using the PR template (the text pre-filled for the new PR<br>
&gt; description) to convey the same info<br>
&gt; * A bot that automatically answer the PRs with a comment with the<br>
&gt; same idea (the bot could also close the PR but that might be a bit<br>
&gt; harsh)<br>
<br>
If anyone has experience of setting this up I&#39;d welcome help. The<br>
things I did learn briefly looking yesterday are that:<br>
<br>
* the template requires putting .git* files in the repo which is a bit<br>
annoying<br>
<br>
* there is a way to do it in a separate repo but that would apply to<br>
all repos, not just oe-core and bitbake, at least from what I read<br>
<br>
* our type of account may or may not have some of the features needed<br>
for bots and so on<br>
<br>
So I&#39;m not against any of these but it could do with someone with some<=
br>
experience. I can probably learn what is needed but I have time<br>
challenges like everyone else.<br>
<br>
There will probably be a need to maintain any bot going forward too.<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I volun=
teer to setup a PoC in my repos to see what is possible given those constra=
ints.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m more exper=
ienced in Gitlab than GitHub but I should be able to translate.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Obviously, if anyone has direct exp=
erience on that, don&#39;t hesitate to speak up.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">What kind of account does the yocto project has on=
 GitHub?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000686f67062df01f39--

