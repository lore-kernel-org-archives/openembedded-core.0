Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE89C3ABC5
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 16:10:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.179.1746634247542068272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 09:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SStH/2hf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.47, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549b116321aso9347e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746634245; x=1747239045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yyd7dnCpc7Klf5hkZL7NqjmKUM++D1NnFEmVwViJ2q4=;
        b=SStH/2hfn1JuZvYgiBl1Z0FCjwRhVjMHiBOgyqhg2aZ6oTXJ9sHyS9uhnRWAC/giMN
         miULY72VyJrw7L8XBRULvNs175wE4stFepkeJbHF2zj1HkWCEui0lX1tss+e14i2RV5f
         yTk+sBYFP9u7jy2V6bowJDDw1hHbYeDs9pLa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634245; x=1747239045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyd7dnCpc7Klf5hkZL7NqjmKUM++D1NnFEmVwViJ2q4=;
        b=ATOJi7OeedW5euXOUlGjbzAxEjEvmnMXS8DQqAsRqCeNqG/aqbBwZDHpk/qqtF3qxX
         ROuk8svSiGHp/NMxQw6i1WkIQlCyJLZyIS2+OFMh6JjySdUkEX3K2y0wIbwvjMOCfVA5
         mgyCVwI6zLp7aKfOehcMM2dTmPsjlDGXD0GjWuX1Se0DY/vN70xBJiSaS3pzFQa1le8d
         54M3/1yIjAGGjxZZJ182BgdK6vhP19pqLXX03cqHdAjxmZpl5RiW5F/pX8PhgP0/KHEW
         WTu2+AQTLr5yxa2OAIzP6wxM/LDtdQiGei62A+c5k8aFv9/jsOyHFu3wSQM3yzpsge3w
         T86Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkbK45DrJNSXCZNfkkjBW07CHw5wuazHAFKgIHRyWnZc0Y3t02U9eRg05EepGsD1zqtVAlSMtCSEqeCofSXCfT5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3NETwPqC1dSP3jklCf/IV5L0J2lZ2qJ4zTNfpUdKcNkWIaDVB
	0PWQVpg23HwyTrhDtb+mUJB237s+3CTIs65S2J1XX3zp8i3OJ99AtMAn17WXvHbcpHpff2GU8gN
	uHXjZ+DZkWRQ8efScDWSPOeh5WdudBHjhDYNunQ==
X-Gm-Gg: ASbGnctT4a+qfkcyM4OqTuvejwvyezFpoSLFqpGlxJD5VecHRcC11J1iPuCHhGn4/8z
	uC/ScgeTBpZiXQrI59MUYx1NUrGgwsKg8bjVEEIj66xCsQGteQ4uB9uLBaNAOmt6xqkXY2vUx52
	t9QrMkGy8BSXEHgDLTsy9xv1VEtxfRNA==
X-Google-Smtp-Source: AGHT+IFUHO1YMWv5UJpSzNU7iIDxaO/LyqAEtlpIRHuOIrg+7EdcJRmFhi0ttNMqIfVPDEtn5XwTGNsh7SkCowwDSps=
X-Received: by 2002:a05:6512:1113:b0:549:c1e6:cbb9 with SMTP id
 2adb3069b0e04-54fb95f522cmr1529444e87.9.1746634243811; Wed, 07 May 2025
 09:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250418133504.932848-1-thomas.perrot@bootlin.com>
 <39feaeb4-a937-408d-9e2d-90d2460acbf9@gmail.com> <b422d462b12c51ac9f50eb0fe4f673ace665a29d.camel@bootlin.com>
 <e8cb10fbf0d0bb9e20241059fb75083501d7fa8b.camel@linuxfoundation.org>
In-Reply-To: <e8cb10fbf0d0bb9e20241059fb75083501d7fa8b.camel@linuxfoundation.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 7 May 2025 09:10:31 -0700
X-Gm-Features: ATxdqUG01T3vUortP3LTw0QTlcu1Uzxenz9Qau9atNZeqQdP9-fnlgVEFLJrwcM
Message-ID: <CADfgfoaQ7yALN_eo0c3JEY2wOdKKEPtW2b0bGgK00O0EeuTLYw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] send-error-report: improve debugging
To: richard.purdie@linuxfoundation.org
Cc: thomas.perrot@bootlin.com, skandigraun@gmail.com, 
	openembedded-core@lists.openembedded.org, yocto@lists.yoctoproject.org, 
	helpdesk <helpdesk@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000a7bef206348df976"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 16:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216121

--000000000000a7bef206348df976
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The new Django 4.2.20 https://errors.yoctoproject.org/ is live. The
previous version is still available at
https://errors-prev.yoctoproject.org/Errors/Latest/Autobuilder/ for
comparison. Tracking at
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15336.


Thanks to everyone who helped with the upgrade.


On Fri, Apr 25, 2025 at 8:19=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Fri, 2025-04-25 at 17:02 +0200, Thomas Perrot via
> lists.openembedded.org wrote:
> > Hello,
> >
> > On Sun, 2025-04-20 at 12:44 +0200, Gyorgy Sarvari via
> > lists.openembedded.org wrote:
> > > I noticed that this (or at least v1) was applied on master - would
> > > like
> > > to call some attention to a related discussion[1] in a neighboring
> > > list,
> > > and some patches[2][3][4] that followed it - at least [3] is a
> > > pre-requisite for this patch (error-report-web has hardcoded the
> > > version
> > > of the script to 0.3).
> > >
> > > [1]: https://lists.yoctoproject.org/g/yocto/message/65184
> > > [2]: https://lists.yoctoproject.org/g/yocto/message/65188
> > > [3]: https://lists.yoctoproject.org/g/yocto/message/65199
> > > [4]: https://lists.yoctoproject.org/g/yocto/message/65200
> > >
> >
> > Can you revert the patch v1 and then apply patch v2, at least after
> > patch [3] has been applied to error-report-web?
>
> It would be helpful to address that to the person who maintains the
> repo. I've updated to the v2 of your patch.
>
> I've queued your patch for the server but updating the instance is
> beyond my access/skills. I also queued a django and python3 upgrade on
> master-next there which it would be good to test.
>
> Copying helpdesk to see if they can schedule in some help in updating
> the instance either to master (easier) or ultimately to test master-
> next and move to that.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215480):
> https://lists.openembedded.org/g/openembedded-core/message/215480
> Mute This Topic: https://lists.openembedded.org/mt/112330994/1003190
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mhalstead@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000a7bef206348df976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-bz_comment_text" id=3D"gmail-comment_t=
ext_2">The new Django 4.2.20 <a href=3D"https://errors.yoctoproject.org/">h=
ttps://errors.yoctoproject.org/</a> is live. The previous version is still =
available at <a href=3D"https://errors-prev.yoctoproject.org/Errors/Latest/=
Autobuilder/">https://errors-prev.yoctoproject.org/Errors/Latest/Autobuilde=
r/</a> for comparison. Tracking at <a href=3D"https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D15336">https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D15336</a>. </pre><pre class=3D"gmail-bz_comment_text" id=3D"gmail-co=
mment_text_2"><br></pre><pre class=3D"gmail-bz_comment_text" id=3D"gmail-co=
mment_text_2">Thanks to everyone who helped with the upgrade.</pre></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 25, 2025 at 8:19=E2=80=AFAM Richard Purdie via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ri=
chard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org=
">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Fri, 2025-04-25 at 17:02 +02=
00, Thomas Perrot via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; On Sun, 2025-04-20 at 12:44 +0200, Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; I noticed that this (or at least v1) was applied on master - woul=
d<br>
&gt; &gt; like<br>
&gt; &gt; to call some attention to a related discussion[1] in a neighborin=
g<br>
&gt; &gt; list,<br>
&gt; &gt; and some patches[2][3][4] that followed it - at least [3] is a<br=
>
&gt; &gt; pre-requisite for this patch (error-report-web has hardcoded the<=
br>
&gt; &gt; version<br>
&gt; &gt; of the script to 0.3).<br>
&gt; &gt; <br>
&gt; &gt; [1]: <a href=3D"https://lists.yoctoproject.org/g/yocto/message/65=
184" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
yocto/message/65184</a><br>
&gt; &gt; [2]: <a href=3D"https://lists.yoctoproject.org/g/yocto/message/65=
188" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
yocto/message/65188</a><br>
&gt; &gt; [3]: <a href=3D"https://lists.yoctoproject.org/g/yocto/message/65=
199" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
yocto/message/65199</a><br>
&gt; &gt; [4]: <a href=3D"https://lists.yoctoproject.org/g/yocto/message/65=
200" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
yocto/message/65200</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; Can you revert the patch v1 and then apply patch v2, at least after<br=
>
&gt; patch [3] has been applied to error-report-web?<br>
<br>
It would be helpful to address that to the person who maintains the<br>
repo. I&#39;ve updated to the v2 of your patch.<br>
<br>
I&#39;ve queued your patch for the server but updating the instance is<br>
beyond my access/skills. I also queued a django and python3 upgrade on<br>
master-next there which it would be good to test.<br>
<br>
Copying helpdesk to see if they can schedule in some help in updating<br>
the instance either to master (easier) or ultimately to test master-<br>
next and move to that.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215480): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215480" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215480</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112330994/100=
3190" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112330994/1003190</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:mhalstead@linuxfoundation.=
org" target=3D"_blank">mhalstead@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Pr=
oject</div><div>Systems Operations Engineer</div></div></div>

--000000000000a7bef206348df976--

