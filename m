Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0332AE92FF4
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 07:45:37 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.7726.1696578327266959319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 00:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=05gRmL4z;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9b974955474so329488366b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 00:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696578326; x=1697183126; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jilh4mbTkUYzqKFeqUONpJqqriYF0r/TSDm9fefwtJY=;
        b=05gRmL4z+CE+PLxUIPQLvZhN52Q5hlgh/1h9un1sI+qx4Z2NHItF7hnVuKoHHdM/br
         vaWDvtBrPVpb5JOCZxkD/dsuyuZYd6CsVpKiCx5Q4oHJ26TVZlcVEfa2hxq5GRC1xh1C
         VlhJcenO3mV7n7pSOYCgPVkDmxhdKBrmIqET8ZYay6jLJZPGvhXaBAXmyVs4jjXCHCpD
         WrdRH4DBJoUrnaB2hpBK/AHuiCiVQM/Wg/28YkR5+8SW/wBnSZTrkInLXRB1cTge/yC5
         Bo7CLYvUtwqqt1YzRfNp41bJmd5SJ5MAL+Z2Ivr9IL2YxmkSA4xGQ77uAqn5Sq8ntyds
         CtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578326; x=1697183126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jilh4mbTkUYzqKFeqUONpJqqriYF0r/TSDm9fefwtJY=;
        b=D9cgWFRpsWYwJA13UuTWcfgzHjZ3ddn9oIAyrZKMUEPzgzKNI3YWV5hIO1+0sWBPAs
         RYzocpQhHdsW07TC7CYShev9EkINhTH7uHgKsDdZshmPCn5xC+A2UvRAN/154VmbaPib
         zMZfIr0O5kJz8uBQ7u3DRadS3e4aKt5l1fhu7joB7j4Y+FN1eI9eSg/9ipFWEEv6yH+e
         lgfnSigN676kUVOsggAX7J/ariqpRwCs8FqE5KZTdQU9AH0MBARjiC0N5CppRNEjtV+Y
         KZ7RrdCIa6dwVaV4ztA9p/SZFgWysoY66ng9x6kZ/SVmYLXRwEQZ7wIDeNGJ7G++SRTR
         R38A==
X-Gm-Message-State: AOJu0YxSRhK/QXnnC5wg5t3YpvI8wNCMGM0xy82ym4cqnyc4sdrqR5eQ
	r8AXnOxqgf+nEIIg87EhGR8rahQBnKpM1Hv+UZD4KA==
X-Google-Smtp-Source: AGHT+IGmg2njg6gSd8P46ySObV1/WaOfUiUiWh8QQ93SJoXz3jjn424kqUX/GBH7TGqSw3sqzv2c4dcKDWFvmZOOi4Q=
X-Received: by 2002:a17:906:196:b0:9ae:72b8:4a84 with SMTP id
 22-20020a170906019600b009ae72b84a84mr6272375ejb.41.1696578325571; Fri, 06 Oct
 2023 00:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231004125731.1785803-1-yoann.congal@smile.fr> <e67fd6de2709e6ebc48e6384aeb720cf3c1b5d44.camel@linuxfoundation.org>
In-Reply-To: <e67fd6de2709e6ebc48e6384aeb720cf3c1b5d44.camel@linuxfoundation.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Fri, 6 Oct 2023 09:44:59 +0200
Message-ID: <CAMSfU+6sqWmJ67J43zGUUx7dMCs159xbiugqfpEtZSg1JogzYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/4] insane: Add unimplemented-ptest checks
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000006dfb5e0607076cae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 07:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188748

--0000000000006dfb5e0607076cae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 6 oct. 2023 =C3=A0 09:20, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2023-10-04 at 14:57 +0200, Yoann Congal wrote:
> > To increase ptest coverage we can check if the sources of a recipe look=
s
> like
> > it contains unittest and warn the user that a test may be implemented
> there.
> >
> > This series provide the check infrastructure as a package QA check and
> some checks for :
> > python pytest, perl Test::, meson, cmake, autotools-based tests... as
> well as
> > the naive check of "Is there a test/ directory in the sources?" which
> work
> > surprisingly well.
> >
> > Currently, this check find:
> > * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
> > * 827 unimplemented ptest in meta-openembedded
> >
> > Full list :
> https://gist.githubusercontent.com/ycongal-smile/0969e92aec1ca37e61b6cdbc=
af1f6885/raw/b1be8a5b576e144b6563f5481d31b32de9b22368/gistfile1.txt
> >
> > v1->v2:
> > * Corrected: shortlog tag
> > * Fixed infinite loop on source package containing symlink loops (e.g.
> md5deep)
> > * Added test result
> >
> > J=C3=A9r=C3=A9my Rosen (4):
> >   insane: Add unimplemented-ptest infrastructure
> >   insane: Detect python and perl based tests
> >   insane: Detect build-system test harnesses
> >   insane: Add a naive heuristic to detect test subdirectories
> >
> >  meta/classes-global/insane.bbclass | 50 ++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
>
> Somehow this series causes:
>
> oe-selftest -r
> sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
>
> to fail and the other test failures in:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5816/st=
eps/14/logs/stdio
>
> I've not looked into why, just narrowed it to this series.
>

Ok, thanks! We'll look into this.
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000006dfb5e0607076cae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 6 oct. 2023 =C3=A0=C2=A0=
09:20, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2023-10-04 at 1=
4:57 +0200, Yoann Congal wrote:<br>
&gt; To increase ptest coverage we can check if the sources of a recipe loo=
ks like<br>
&gt; it contains unittest and warn the user that a test may be implemented =
there.<br>
&gt; <br>
&gt; This series provide the check infrastructure as a package QA check and=
 some checks for :<br>
&gt; python pytest, perl Test::, meson, cmake, autotools-based tests... as =
well as<br>
&gt; the naive check of &quot;Is there a test/ directory in the sources?&qu=
ot; which work<br>
&gt; surprisingly well.<br>
&gt; <br>
&gt; Currently, this check find:<br>
&gt; * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp<br>
&gt; * 827 unimplemented ptest in meta-openembedded<br>
&gt; <br>
&gt; Full list : <a href=3D"https://gist.githubusercontent.com/ycongal-smil=
e/0969e92aec1ca37e61b6cdbcaf1f6885/raw/b1be8a5b576e144b6563f5481d31b32de9b2=
2368/gistfile1.txt" rel=3D"noreferrer" target=3D"_blank">https://gist.githu=
busercontent.com/ycongal-smile/0969e92aec1ca37e61b6cdbcaf1f6885/raw/b1be8a5=
b576e144b6563f5481d31b32de9b22368/gistfile1.txt</a><br>
&gt; <br>
&gt; v1-&gt;v2:<br>
&gt; * Corrected: shortlog tag<br>
&gt; * Fixed infinite loop on source package containing symlink loops (e.g.=
 md5deep)<br>
&gt; * Added test result<br>
&gt; <br>
&gt; J=C3=A9r=C3=A9my Rosen (4):<br>
&gt;=C2=A0 =C2=A0insane: Add unimplemented-ptest infrastructure<br>
&gt;=C2=A0 =C2=A0insane: Detect python and perl based tests<br>
&gt;=C2=A0 =C2=A0insane: Detect build-system test harnesses<br>
&gt;=C2=A0 =C2=A0insane: Add a naive heuristic to detect test subdirectorie=
s<br>
&gt; <br>
&gt;=C2=A0 meta/classes-global/insane.bbclass | 50 ++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 50 insertions(+)<br>
<br>
Somehow this series causes:<br>
<br>
oe-selftest -r<br>
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs<br>
<br>
to fail and the other test failures in:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/5816/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5816/steps/14/logs/=
stdio</a><br>
<br>
I&#39;ve not looked into why, just narrowed it to this series.<br></blockqu=
ote><div><br></div><div>Ok, thanks! We&#39;ll look into this. <br></div></d=
iv><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yo=
ann Congal</font><div><font face=3D"Raleway, regular">Smile ECS - Tech expe=
rt<br></font></div></div></div></div>

--0000000000006dfb5e0607076cae--

