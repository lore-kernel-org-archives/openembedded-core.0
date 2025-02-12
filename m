Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F7DC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 08:08:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.10166.1739347731377766636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 00:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZYZlH9tR;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dcae0d6dcso2866096f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 00:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739347730; x=1739952530; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WsS4ocerA+h0AQd2ikVM3lqOK87TXUoZCV/UvDWk/BA=;
        b=ZYZlH9tRnnUNnW+bPm4yyeJ5QQUl1LvHY27bQET0OH8vosm05PrOQR1TaZGAyPhg69
         9FNo/3DkeuvaMiQ+aFnNXCySaU1NHD4wJYGOo60CI8pJpBAJbB7uBECHVob47ncDe2u4
         Drs7d6mE4dk+rdX4eJD7hSK9A7CZ8dh/Eocj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739347730; x=1739952530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsS4ocerA+h0AQd2ikVM3lqOK87TXUoZCV/UvDWk/BA=;
        b=TVieGXR2nFZ34lv9//ASYQtaB4jy+Domml8uFkOHLIASS7nwTciWi3sVzfk14tgHl/
         /CT9jShs88+FQ1kdCYxVgy1Ib9cLLGNBufCuZMP60nwHhJVOU4PvJMuRPEHYjoUGraQy
         jNUnv9ihRy+1TvoHHYX7plepM2tiDaVRbyhbzo7Egb7Q1efn3bsDnT7iNBjSl6dFi2Py
         BoTUPaRzYsLAEDh5hgNbpH69wSUa2831fSFFo4kiAalfEE3pTajMY4hD9igWotYk9tCp
         5+eQzifKoiYztCKMgLPJZN3PWCCoVvzo6lMtg13zluHudYOxbbHHKKCPfVfGCWUzGWKd
         p+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXPTHsiFITkn+o9plPKpQfezdUTsZrBbLsjOVtqbHcm9e7ozT7ZDt4t3TZ6NrPKN4dJTw4CFw2ptKcBlA6uTrdlOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1whRVvUy2c8vROyJh2Uxu/zYJdzqCMVQP6/m+vlT5cm5zPnEX
	Evh4AkNXZ4L9Nd9GZdkBrLnlHw5WxamvIBLZo/url4CyyosmDHVjFOxH6RK8foagO3f9ivrd0m+
	hRY+QzXKkY6ewclndQh8qilgvuUY5eRPR+/JbFA==
X-Gm-Gg: ASbGnct9aXbPEUyV4NkENRvzPVPkeylJmFIRelVLKu/zLnA/mc7plbXXT5s6GtJ5Y4s
	2ewX6OIhydcsDtETc9m2UCd2wMN7XOpZPQsBgUqR27L+IiHFJ/Hka/dxGZ6QENGCW6F83WE+cHz
	al9bq61FQK/FdEE5mt+3JfYZTzIyrz
X-Google-Smtp-Source: AGHT+IEyqLdJHZ59TAp6P1uOsPmwXSlo5GFuDtMKVP7xhOIH8Bixdrhq/KAew/xCCwaRLvnWXvZJfz4QVzk1G6zv8e0=
X-Received: by 2002:a5d:6d88:0:b0:38d:b28f:564a with SMTP id
 ffacd0b85a97d-38dea26f160mr1607779f8f.21.1739347729315; Wed, 12 Feb 2025
 00:08:49 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com> <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
In-Reply-To: <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 09:08:23 +0100
X-Gm-Features: AWEUYZlpAmFyNPP6aqQp0femxgy-wP9ttx0wd-YuSKgrjCQg_W3PzcrpcRKmwI0
Message-ID: <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: yocto@lists.yoctoproject.org, richard.purdie@linuxfoundation.org
Cc: alex.kanavin@gmail.com, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008c0f7b062ded7399"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 08:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211211

--0000000000008c0f7b062ded7399
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 12 f=C3=A9vr. 2025 =C3=A0 00:36, Richard Purdie via lists.yoctoproj=
ect.org
<richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> a =C3=A9crit =
:

> On Tue, 2025-02-11 at 19:42 +0100, Alexander Kanavin via
> lists.openembedded.org wrote:
> > On Tue, 11 Feb 2025 at 16:57, Stephen Jolley via
> > lists.openembedded.org
> > <sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> wrote:
> > > We=E2=80=99d like to request help to process the open github pull req=
uests for
> openembedded-core and bitbake:
> > >
> > > https://github.com/openembedded/openembedded-core/pulls
> > >
> > > https://github.com/openembedded/bitbake/pulls
> > >
> > > Having these open doesn=E2=80=99t look good for the projects and we c=
an=E2=80=99t
> disable them, some have been open for a long time. We did already clean u=
p
> the poky pull requests.
> >
> > I'm sorry but I have to say a couple of unpleasant things. Here goes.
> >
> > The only processing I would be willing to do is mass-closing these
> > pull requests with a polite note to submit them according to the
> > official process. Otherwise this tacitly admits github as a valid way
> > to contribute, and we're not ready for that, and possible will never
> > be.
>
> There are potentially useful bug reports and fixes buried in there and
> I am reluctant to turn people away so I'd prefer to not mass close.
>
> > While we're at it, how were these repositories created in the first
> > place, and what was the plan for the pull requests they would attract?
> > Should we delete these repositories now?
>
> The repositories were added to try and share bandwidth costs, give
> people easier mirrors and various other justifications. I warned
> strongly about the pull request problems at the time, I was told it
> would get handled and people would help and I was over reacting. Some
> of the people who made those offers aren't active with the project any
> more, other things just drifted with time. At one point I ended up
> having to add those mirrors to my own push scripts and maintain them
> because nobody else was willing and we had complaints they were not up
> to date.
>
> You used to be able to disable pull requests for six month periods, it
> looks like you can no longer do that and it was a pain having to try
> and remember anyway.
>
> The bandwidth/mirror/backup benefits are valid and I'd be reluctant to
> delete them as some people can only discover things through github too.
> Google indexing doesn't work well with our own server.
>
> So I guess I made my own peace with their existence. I know touching
> them will make it look more like a condoned submission method but I
> really don't see many good options here. Removing them is a simple easy
> option but life sometimes isn't easy/simple.
>

We can try things to push users out of github :
* Leaving a fake PR at the top of the list with a title along the line of
"Please don't open a PR but instead go to <contributing guide link>"
* using the PR template (the text pre-filled for the new PR description) to
convey the same info
* A bot that automatically answer the PRs with a comment with the same idea
(the bot could also close the PR but that might be a bit harsh)

Regards,

Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#64775):
> https://lists.yoctoproject.org/g/yocto/message/64775
> Mute This Topic: https://lists.yoctoproject.org/mt/111128176/4316185
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000008c0f7b062ded7399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 12=
 f=C3=A9vr. 2025 =C3=A0=C2=A000:36, Richard Purdie via <a href=3D"http://li=
sts.yoctoproject.org">lists.yoctoproject.org</a> &lt;richard.purdie=3D<a hr=
ef=3D"mailto:linuxfoundation.org@lists.yoctoproject.org">linuxfoundation.or=
g@lists.yoctoproject.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Tue, 2025-02-11 at 19:42 +0100, Ale=
xander Kanavin via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Tue, 11 Feb 2025 at 16:57, Stephen Jolley via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;<a href=3D"http://sjolley.yp.pm" rel=3D"noreferrer" target=3D"_bla=
nk">sjolley.yp.pm</a>=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; We=E2=80=99d like to request help to process the open github pull=
 requests for openembedded-core and bitbake:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://github.com/openembedded/openembedded-core/pull=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/ope=
nembedded-core/pulls</a><br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://github.com/openembedded/bitbake/pulls" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openembedded/bitbake/pulls=
</a><br>
&gt; &gt; <br>
&gt; &gt; Having these open doesn=E2=80=99t look good for the projects and =
we can=E2=80=99t disable them, some have been open for a long time. We did =
already clean up the poky pull requests.<br>
&gt; <br>
&gt; I&#39;m sorry but I have to say a couple of unpleasant things. Here go=
es.<br>
&gt; <br>
&gt; The only processing I would be willing to do is mass-closing these<br>
&gt; pull requests with a polite note to submit them according to the<br>
&gt; official process. Otherwise this tacitly admits github as a valid way<=
br>
&gt; to contribute, and we&#39;re not ready for that, and possible will nev=
er<br>
&gt; be.<br>
<br>
There are potentially useful bug reports and fixes buried in there and<br>
I am reluctant to turn people away so I&#39;d prefer to not mass close.<br>
<br>
&gt; While we&#39;re at it, how were these repositories created in the firs=
t<br>
&gt; place, and what was the plan for the pull requests they would attract?=
<br>
&gt; Should we delete these repositories now?<br>
<br>
The repositories were added to try and share bandwidth costs, give<br>
people easier mirrors and various other justifications. I warned<br>
strongly about the pull request problems at the time, I was told it<br>
would get handled and people would help and I was over reacting. Some<br>
of the people who made those offers aren&#39;t active with the project any<=
br>
more, other things just drifted with time. At one point I ended up<br>
having to add those mirrors to my own push scripts and maintain them<br>
because nobody else was willing and we had complaints they were not up<br>
to date.<br>
<br>
You used to be able to disable pull requests for six month periods, it<br>
looks like you can no longer do that and it was a pain having to try<br>
and remember anyway.<br>
<br>
The bandwidth/mirror/backup benefits are valid and I&#39;d be reluctant to<=
br>
delete them as some people can only discover things through github too.<br>
Google indexing doesn&#39;t work well with our own server.<br>
<br>
So I guess I made my own peace with their existence. I know touching<br>
them will make it look more like a condoned submission method but I<br>
really don&#39;t see many good options here. Removing them is a simple easy=
<br>
option but life sometimes isn&#39;t easy/simple.<br></blockquote><div><br><=
/div><div>We can try things to push users out of github :</div><div>* Leavi=
ng a fake PR at the top of the list with a title along the line of &quot;Pl=
ease don&#39;t open a PR but instead go to &lt;contributing guide link&gt;&=
quot;<br></div><div>* using the PR template (the text pre-filled for the ne=
w PR description) to convey the same info</div><div>* A bot that automatica=
lly answer the PRs with a comment with the same idea (the bot could also cl=
ose the PR but that might be a bit harsh)</div><div>=C2=A0</div><div>Regard=
s,</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#64775): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/64775" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/64775</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111128176/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111128176/4316185</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.c=
ongal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000008c0f7b062ded7399--

