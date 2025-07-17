Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F1CC83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 17:25:25 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.1239.1752773119625925794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 10:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=logrDm3h;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70f94fe1e40so26783217b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752773119; x=1753377919; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hi5/8IOK1REtNkj0DUXcospXGmOxHrGC/HeKpqgQIt0=;
        b=logrDm3h+9VsacLzL1GUCJvXHrQt4Nz0fkJPUocji7k0Ujc3R1eGOs/TaQS6wuYMTC
         IRwjHjSMf3VwMZ7hVmc3kcFt2GbY2VW4t8SPJLk7nAOSrcAQYNZ9HdL7HaRsZV+f8oe0
         IlSOr+gVL9bl9X9h6OSRokLz4By0Sw2KJM+hPfqiwCinfc5Xm6zQXz3gM1ZoUpPaJm8H
         FfemKg/zTdiVPEoctMA+tnEHWB/ZXzFoFLwtQLx0YBd7jJj3owEkrXFBQzbn0HufYn+6
         SujiNJNjAsYxN389g64xWt//e/HjOIb7GmkJnfiKGTtuJoUCjbKlxs76H5RRm1HX4bF3
         Wf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773119; x=1753377919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi5/8IOK1REtNkj0DUXcospXGmOxHrGC/HeKpqgQIt0=;
        b=pm3ffaM+TKqcfJ/RJuQ3qRUW0PTHFtSvxHEldJEvyDfzqPxX4r49A4fclritw3U9uz
         2enMB15Ay2xgPFWqnrTvKWFheHAYir/01a8yPd7jMYKvC6qKnvoXo7jZy9PLi0IHlcQQ
         ro0VLfql2sOcPo9L4jwbovXJCrjT/0SdVU/hPRR9LpTdBLpNe34lMWOcS+KgEyaq5/cT
         boJypH7/DAkXMg2jUF9JGVmk7KxT6N9wmzMx6FYvmCAAA+6mj93fWhzYZlZnaIHbNPeP
         D8Bk+nKt+VB+6XoIUsZ7OWpHlGbX/IPq/j2pNEUgxaFZIENN8iosnseuCKtwcdMbEoTH
         7Ykw==
X-Forwarded-Encrypted: i=1; AJvYcCXXLba9k0I8gNNqcIt9ntyKHBpVUo2iUSW3PzgmzpgsP/ZULoKZz3yiwsvbuWH81A13FQlcZ8jDhsFj2Ano7hfKIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxGQi2WMcZWbKrnIDpWakzJeD57xbuhmCZHeh3wFsAMs7UQMokM
	CFC1CuvgxGcMmvBhX8ht9wXfcLtqSzCqB3Rh+jjdIxeE9fUOxNRLWitMg8TwUclvDQ4whT/Zvuz
	nEmwJ2quJQR+KT6PQripOoyN7ApZVtww=
X-Gm-Gg: ASbGnctWUYHRaIiwuM3+9Vmor44ToChjfvRuLPfjN9BNCZzHQtfS2mQILn6t4Yk5Zuj
	mXuBblfoiu4LmenO0v56XnD4o3e5u1PivxVGLF12UmjCk/r/BIwZAyt/MNzYd9rmgbIbbLlSMWz
	cHMmswRoNsGi9TQGsREfj+NuUWYNFn1WQ+R2wNlV7r7+9qDSkm7rznJ7itT+tOdSfna0nZ4tsEs
	knZtwpIlJKnCWrxgUBYUeKNt4o0KKSwMPGXzK+WvYs1ed/0kZg=
X-Google-Smtp-Source: AGHT+IGOL/TFv3vEABH1LZKuMi+earHeBarLfKMofJr0XvFahfTPWb+lTySu6+RgnNvXBjiivHHqVGF4Zb6zPhufjws=
X-Received: by 2002:a05:690c:9983:b0:70e:7e33:fbd6 with SMTP id
 00721157ae682-7184f819305mr59905527b3.17.1752773118639; Thu, 17 Jul 2025
 10:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
 <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
 <27vjhf4ojfpwvsbdxkboo5hgoaaj7ongeax5icelqv7trobh5c@vfj4cn4mm5h2>
 <1a2f4fc1cc4dc0b911968695c4ccb60764f8bf6d.camel@linuxfoundation.org>
 <6fa096c2-856d-4ef2-93d0-da4c5022a354@oss.qualcomm.com> <CABWbsgCUOCbvpzM3ucvP1=NqmeX1PTC2-p+w8FnZSXJ_AMTvtA@mail.gmail.com>
In-Reply-To: <CABWbsgCUOCbvpzM3ucvP1=NqmeX1PTC2-p+w8FnZSXJ_AMTvtA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 10:25:07 -0700
X-Gm-Features: Ac12FXzhXAW-PGQz9H-JjeCkjw9G9muZ5FfScC3YCYW51uVfFaI4x3FQcJWWDiI
Message-ID: <CAMKF1srSdfbR+cP67xsggtiYueGZ0zdbNZMebUod28qNKTAgFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the SRC_URI
To: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001bc11c063a234bf9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 17:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220559

--0000000000001bc11c063a234bf9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 10:17=E2=80=AFAM Nicolas Dechesne <
nicolas.dechesne@oss.qualcomm.com> wrote:

> On Thu, Jul 17, 2025 at 4:17=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > On 17/07/2025 16:17, Richard Purdie wrote:
> > > On Thu, 2025-07-17 at 16:00 +0300, Dmitry Baryshkov via
> lists.openembedded.org wrote:
> > >> On Wed, Jul 16, 2025 at 05:14:34PM +0200, Martin Jansa wrote:
> > >>> On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via lists.openembe=
dded.org
> > >>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>> On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dmitry.baryshkov=3D
> oss.qualcomm.com@lists.openembedded.org> wrote:
> > >>>>>
> > >>>>> It seems under some circumstances the tag in SRC_URI can prevent
> the
> > >>>>> recipe from being unpacked correctly. Drop it in order to let
> bitbake
> > >>>>> handle the recipe correctly.
> > >>>>
> > >>>>
> > >>>> I think we should look more into underlying problem. I have seen
> projects create release tags that do not belong to any branches and can
> create fetching issues using nobranch=3D1 helped in such cases
> > >>>
> > >>> I think this happens when the git repo tarball already has the
> > >>> revision from SRCREV but not the tag yet.
> > >>
> > >> Most likely. I don't follow exact timeline of the repo, so it well
> might
> > >> be possible that the tag was pushed way later than the commit.
> > >>
> > >>> Adding tag param to SRC_URI only when upgrading the version helps i=
n
> > >>> some cases, but not when the tarball was already created with the
> > >>> right SRCREV.
> > >>>
> > >>> The only work around which worked for us in webOS builds is enforci=
ng
> > >>> to use annotated tags and using SRCREV of that annotated tag (not t=
he
> > >>> SHA of the code it points to), then either both (SHA and tag) exist
> in
> > >>> the tarball or neither and the repo is updated before the tag check=
.
> > >>
> > >> This might work, but not all repos apear to be using annotated tags.
> > >> Maybe we should extend bitbake to check for the tags in Fetch code
> too?
> > >>
> > >> Khem, Richard, can we please pick this patch?
> > >
> > > I'm not keen to start dropping tags without understanding what the
> > > issue is. The fetcher should notice things need updating and pull in
> > > the right pieces. If that isn't working, that is the issue we need to
> > > fix.
> >
> > If the analysys is correct, the SRCREV is present in the fetched
> > sources, but the tag that is used in SRC_URI doesn't. So do_fetch
> > doesn't perform any additional fetching, but the do_unpack fails as it
> > can not find the tag.
> >
>
> While it's not a full proof.. we ran a 'cleanall task of
> spirv-llvm-translator' on our CI which exhibited this issue in the
> first place, and it now builds fine, after it fetched again the tree..


I think that=E2=80=99s perhaps better to recreate the tarball rather than t=
his patch

>
>
> > >
> > > Cheers,
> > >
> > > Richard
> >
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220547):
> https://lists.openembedded.org/g/openembedded-core/message/220547
> > Mute This Topic: https://lists.openembedded.org/mt/114186099/9005974
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nicolas.dechesne@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001bc11c063a234bf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 17, 2025 at 10:17=E2=80=AFA=
M Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@oss.qualcomm.com"=
>nicolas.dechesne@oss.qualcomm.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Thu, Jul 17, 2025 at 4:17=E2=80=AFPM Dmitry Baryshkov via=
<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;dmitry.baryshkov=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedde=
d.org" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; On 17/07/2025 16:17, Richard Purdie wrote:<br>
&gt; &gt; On Thu, 2025-07-17 at 16:00 +0300, Dmitry Baryshkov via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; &gt;&gt; On Wed, Jul 16, 2025 at 05:14:34PM +0200, Martin Jansa wrote:=
<br>
&gt; &gt;&gt;&gt; On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a><br>
&gt; &gt;&gt;&gt; &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Barysh=
kov via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"ma=
ilto:oss.qualcomm.com@lists.openembedded.org" target=3D"_blank">oss.qualcom=
m.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; It seems under some circumstances the tag in SRC_=
URI can prevent the<br>
&gt; &gt;&gt;&gt;&gt;&gt; recipe from being unpacked correctly. Drop it in =
order to let bitbake<br>
&gt; &gt;&gt;&gt;&gt;&gt; handle the recipe correctly.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I think we should look more into underlying problem. =
I have seen projects create release tags that do not belong to any branches=
 and can create fetching issues using nobranch=3D1 helped in such cases<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I think this happens when the git repo tarball already ha=
s the<br>
&gt; &gt;&gt;&gt; revision from SRCREV but not the tag yet.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Most likely. I don&#39;t follow exact timeline of the repo, s=
o it well might<br>
&gt; &gt;&gt; be possible that the tag was pushed way later than the commit=
.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Adding tag param to SRC_URI only when upgrading the versi=
on helps in<br>
&gt; &gt;&gt;&gt; some cases, but not when the tarball was already created =
with the<br>
&gt; &gt;&gt;&gt; right SRCREV.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; The only work around which worked for us in webOS builds =
is enforcing<br>
&gt; &gt;&gt;&gt; to use annotated tags and using SRCREV of that annotated =
tag (not the<br>
&gt; &gt;&gt;&gt; SHA of the code it points to), then either both (SHA and =
tag) exist in<br>
&gt; &gt;&gt;&gt; the tarball or neither and the repo is updated before the=
 tag check.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This might work, but not all repos apear to be using annotate=
d tags.<br>
&gt; &gt;&gt; Maybe we should extend bitbake to check for the tags in Fetch=
 code too?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Khem, Richard, can we please pick this patch?<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not keen to start dropping tags without understanding wha=
t the<br>
&gt; &gt; issue is. The fetcher should notice things need updating and pull=
 in<br>
&gt; &gt; the right pieces. If that isn&#39;t working, that is the issue we=
 need to<br>
&gt; &gt; fix.<br>
&gt;<br>
&gt; If the analysys is correct, the SRCREV is present in the fetched<br>
&gt; sources, but the tag that is used in SRC_URI doesn&#39;t. So do_fetch<=
br>
&gt; doesn&#39;t perform any additional fetching, but the do_unpack fails a=
s it<br>
&gt; can not find the tag.<br>
&gt;<br>
<br>
While it&#39;s not a full proof.. we ran a &#39;cleanall task of<br>
spirv-llvm-translator&#39; on our CI which exhibited this issue in the<br>
first place, and it now builds fine, after it fetched again the tree..</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think that=E2=80=99=
s perhaps better to recreate the tarball rather than this patch</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; With best wishes<br>
&gt; Dmitry<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#220547): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/220547" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/220547</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11418609=
9/9005974" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/114186099/9005974</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:nicolas.dechesne@oss.=
qualcomm.com" target=3D"_blank">nicolas.dechesne@oss.qualcomm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000001bc11c063a234bf9--

