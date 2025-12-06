Return-Path: <dchvs11@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAA9D3ABF6
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 03:31:50 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.431.1764991901245682609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 19:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgERML9G;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: dchvs11@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so4814151a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 19:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764991899; x=1765596699; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17Ihnip6LgltUFYlOkIVcrTHjEsH+oqDnzOrDdJ0M2Q=;
        b=bgERML9GAhgs+fRQJGzGSwge4vc8Cj+MnUr6/+k0/2LBrVFoHrvP7NIsVMZYuItsfT
         fr6U0n0bukCKXfBOvnxZbnjvZydiQCxuMR1ni61y8TaTCxR+st0Z70QYoVWy6rTsLwX4
         sIlosv06BNMgTDDs1WVZLgQi2OXJ3CTtkKWDkJn6cuV6v5aoSqfIiMdoM/G1M5FeBWGM
         nYD0x6rvu4Rx/GweQC+x5YasNBmTdGDcnqdeGkjd6dBsvD/sMUlSQXOxcJU9eajbesNH
         q/ntzmmI5MWciYVlnGThEmOxjjQgX8FmpoVuczU8sQRv48GtF6Ej+rLWTUDWzY2x+ama
         WT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764991899; x=1765596699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17Ihnip6LgltUFYlOkIVcrTHjEsH+oqDnzOrDdJ0M2Q=;
        b=H3Uj2Ox4ThjPenu/Ff2fDqj6QzkSHHLlOcs4UaE7/8+q9ZuAZr899IZLl331jAbIBi
         fVztce7WKG+nRHFY9ZHjQ4Epi/NXSbZCFVr9XI7mMgFPUeknttDdVnX/yEw3g2nSOSqW
         rstCfLhv1I8ywnzjw0esZcF2vXv6XLGPJ7uZ3MlTtxP64A2idVOSv4uA8wgb3yph2Xn8
         I/8AL+ykucciYe0FmAe/qh9/Cx3YvwLVjklUdiDgFpn9dNRg2V8ARgj1qk64kzbIHUkV
         LJYi3S6ocj3SLR7pQQ2fpXPzNFAHzZl1mewxKw6WqKrvAf82YG0K1TL7xmqsYiTRv3R/
         s3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWp7C929RbpVmM3R+Db54NKixvSuML60pUVPJeB++svGj5YVyB7Y5TSAr8YG+FhOUF9h83PvAm5xytxuq1QIVFFdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQwyUj/r2m8F7qDCHhzWfc8EH9uAP0j6dmYZ3+BrIlfLjEtWlI
	W83zpD4jNlinTD51ySENvGjIYOWv5QBVNb2h90frChDNOtM1bsEWJSEjU2khhawzuvoJ15yKGPW
	uis7SN/lKOC3Af5zKxJFmMa4wFZhNdXE=
X-Gm-Gg: ASbGncuxosVQ/CwG2HPlaEbUEaXXSV7BUR7Caxj1E1+AXNOEcje6WIaO+4EYPr5jSBP
	m5u6x2MT5OPo6EpZJ1ZDJyyJyFNA53Gk/0ac5gLqF780Zz6Yv8Ny9UNjnrBGO8TozCdoVVW5RS4
	eQy7mFD/a4JXOMU2NxmCpA/SkWceejm0x39HKvk/82kcLt7I/UgOZ2HrfeWj9Ojb8/jK5Swls0o
	u/yoHJvcF9s09+MkSALhYsve23lHwAy4DYQixSAo+QcuHAp4I5XZHPfRIhYE5XWlbIF0DeW
X-Google-Smtp-Source: AGHT+IGJ4NnpKtbrNceIYBYJHySwUfYObKtNSHhQRl74W6dWkB21gFbP1r4DIlgJAviA64d8vuEBcXGKdIw5/Tu0jZI=
X-Received: by 2002:a17:906:6a0b:b0:b76:69d6:f9fe with SMTP id
 a640c23a62f3a-b7a248487ebmr112874766b.60.1764991899223; Fri, 05 Dec 2025
 19:31:39 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
 <187B446507D0D6B0.100836@lists.yoctoproject.org> <CANNYZj_QRWSTZMne1B0PO8rdo19Ltb=QqQGVmSRk7ZpnaY2MAQ@mail.gmail.com>
 <7cefc9025cec54cc835cd3b065aa653f95a38634.camel@linuxfoundation.org> <CANNYZj8bbNnMYWsJb0oz0a3F_gr=zTYkbj8YLKoRYGdF+XbmBQ@mail.gmail.com>
In-Reply-To: <CANNYZj8bbNnMYWsJb0oz0a3F_gr=zTYkbj8YLKoRYGdF+XbmBQ@mail.gmail.com>
From: Daniel Chaves <dchvs11@gmail.com>
Date: Fri, 5 Dec 2025 21:31:27 -0600
X-Gm-Features: AWmQ_bmXBv4vk5WysCmFlmPfveDLZeG5kIWfCtWoUwWeSwNFr7h4p3MmR6frQgI
Message-ID: <CANDCFSy8dJjVm2qbAgxGDeH3_ywUGLpq=eknCo6n-tgt_7_nsA@mail.gmail.com>
Subject: Re: [OE-core] sharing sstate in bitbake-setup
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002f4b0f0645403321"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 03:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227357

--0000000000002f4b0f0645403321
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alexander, I saw your question about integrating the hash equivalence
server setup into Bitbake Setup. I've have actually tinkered with the basic
hash equivalence setup, and after diving into the documentation for the
hash equivalence looks like we could share hash equivalence data through
following the "Hash Equivalence Server Setup" instructions here:
https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.t=
xt
.

Look at the `bind` and `database` options used when starting `
bitbake-hashserv`. Then, on the client side, the configuration would look
something like this:

```
BB_HASHSERVE =3D "<bind address of the running BitBake hash server>"
BB_SIGNATURE_HANDLER =3D "OEEquivHash"
```

So, in that scenario the site.conf for Bitbake Setup could enable a bind
address of `unix://${TOPDIR}/../hashserv.sock` to the BB_HASHSERVE.

And the server can be started with something like:

`bitbake-hashserv --bind unix://${TOPDIR}/../hashserv.sock --database
${TOPDIR}/../hashserv.db`

Hope that helps.
Regards
Daniel

RidgeRun Embedded SW Engineer
Contact us: support@ridgerun.com
Developers wiki: https://developer.ridgerun.com/
Website: https://www.ridgerun.com


On Wed, Nov 26, 2025 at 10:53=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> On Wed, 26 Nov 2025 at 17:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> linked into every build.
> > >
> > > I quickly hacked bitbake's cooker.py to try this out:
> > >
> > > -                dbfile =3D (self.data.getVar("PERSISTENT_DIR") or
> > > self.data.getVar("CACHE")) + "/hashserv.db"
> > > +                dbfile =3D "/home/alex" + "/hashserv.db"
> > >
> > >
> > > And then made two build directories with shared SSTATE_DIR.
> > >
> > > TL;DR: everything ran smoothly and as expected.
> > >
> > > I ran overlapping builds, added no-ops to gnu-config recipe to 'force=
'
> > > hash equivalency, and there were no errors or crashes, and sstate was
> > > reused as expected.
> > >
> > > So I think we should do it like this, subject to 'shared-sstate'
> > > setting in bitbake-setup, on by default.
> >
> > PERSISTENT_DIR is *not* designed to be shared between builds. it might
> > happen to work but is a really bad idea. Personally, I think those
> > cache directory variables and cache layout need redesigning so we
> > should probably take the opportunity to do that.
>
> I am not sharing PERSISTENT_DIR. Only the hash equivalency database in
> hashserv.db, which I believe is fine because sqlite has locking
> mechanisms and is explicitly designed for it.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226806):
> https://lists.openembedded.org/g/openembedded-core/message/226806
> Mute This Topic: https://lists.openembedded.org/mt/116487236/7043332
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> dchvs11@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002f4b0f0645403321
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div style=3D"color:rgb(69,71,73);background-color:rg=
b(255,255,255);font-weight:normal;font-size:14px;line-height:19px;white-spa=
ce:pre-wrap"><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans=
-serif">Hi, Alexander, I saw your question about integrating the hash equiv=
alence server setup into Bitbake Setup. I&#39;ve have actually tinkered wit=
h the basic hash equivalence setup, and after diving into the documentation=
 for the hash equivalence looks like we could share hash equivalence data t=
hrough following the &quot;Hash Equivalence Server Setup&quot; instructions=
 here:</span></div><div><span style=3D"color:rgb(75,131,205);text-decoratio=
n:underline;font-family:arial,sans-serif"><a href=3D"https://docs.yoctoproj=
ect.org/dev/_sources/dev-manual/hashequivserver.rst.txt" target=3D"_blank">=
https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.t=
xt</a></span><span style=3D"font-family:arial,sans-serif">.</span></div><sp=
an style=3D"font-family:arial,sans-serif"><br></span><div><span style=3D"co=
lor:rgb(69,71,73);font-family:arial,sans-serif">Look at the </span><span st=
yle=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><span s=
tyle=3D"color:rgb(171,101,38);font-family:arial,sans-serif">bind</span><spa=
n style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><sp=
an style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"> and </span><=
span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span>=
<span style=3D"color:rgb(171,101,38);font-family:arial,sans-serif">database=
</span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">=
`</span><span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"> o=
ptions used when starting </span><span style=3D"color:rgb(119,119,119);font=
-family:arial,sans-serif">`</span><span style=3D"color:rgb(171,101,38);font=
-family:arial,sans-serif">bitbake-hashserv</span><span style=3D"color:rgb(1=
19,119,119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(=
69,71,73);font-family:arial,sans-serif">. Then, on the client side, the con=
figuration would look something like this:</span></div><span style=3D"font-=
family:arial,sans-serif"><br></span><div><span style=3D"color:rgb(119,119,1=
19);font-family:arial,sans-serif">```</span></div><div><span style=3D"color=
:rgb(69,71,73);font-family:arial,sans-serif">BB_HASHSERVE =3D &quot;&lt;bin=
d address of the running BitBake hash server&gt;&quot;</span></div><div><sp=
an style=3D"color:rgb(69,71,73);font-family:arial,sans-serif">BB_SIGNATURE_=
HANDLER =3D &quot;OEEquivHash&quot;</span></div><div><span style=3D"color:r=
gb(119,119,119);font-family:arial,sans-serif">```</span></div><span style=
=3D"font-family:arial,sans-serif"><br></span><div><span style=3D"color:rgb(=
69,71,73);font-family:arial,sans-serif">So, in that scenario the site.conf =
for Bitbake Setup could enable a bind address of </span><span style=3D"colo=
r:rgb(119,119,119);font-family:arial,sans-serif">`</span><span style=3D"col=
or:rgb(171,101,38);font-family:arial,sans-serif">unix://${TOPDIR}/../hashse=
rv.sock</span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-=
serif">`</span><span style=3D"color:rgb(69,71,73);font-family:arial,sans-se=
rif"> to the BB_HASHSERVE.</span></div><span style=3D"font-family:arial,san=
s-serif"><br></span><div><span style=3D"color:rgb(69,71,73);font-family:ari=
al,sans-serif">And the server can be started with something like:</span></d=
iv><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"><b=
r></span></div><div><span style=3D"color:rgb(119,119,119);font-family:arial=
,sans-serif">`</span><span style=3D"color:rgb(171,101,38);font-family:arial=
,sans-serif">bitbake-hashserv --bind </span><span style=3D"color:rgb(119,11=
9,119);font-family:arial,sans-serif"></span><span style=3D"color:rgb(171,10=
1,38);font-family:arial,sans-serif">unix://${TOPDIR}/../hashserv.sock</span=
><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif"></span=
><span style=3D"color:rgb(171,101,38);font-family:arial,sans-serif"> --data=
base </span><span style=3D"color:rgb(171,101,38);font-family:arial,sans-ser=
if">${TOPDIR}/../hashserv.db</span><span style=3D"color:rgb(119,119,119);fo=
nt-family:arial,sans-serif">`</span></div><span style=3D"font-family:arial,=
sans-serif"><br></span></div><span style=3D"font-family:arial,sans-serif">H=
ope that helps.</span></div><div><span style=3D"font-family:arial,sans-seri=
f">Regards<br></span></div><div><span style=3D"font-family:arial,sans-serif=
">Daniel</span></div><div><span style=3D"font-family:arial,sans-serif"><br>=
RidgeRun Embedded SW Engineer<br>Contact us: <a href=3D"mailto:support@ridg=
erun.com" target=3D"_blank">support@ridgerun.com</a><br>Developers wiki: <a=
 href=3D"https://developer.ridgerun.com/" target=3D"_blank">https://develop=
er.ridgerun.com/</a><br>Website: <a href=3D"https://www.ridgerun.com/" targ=
et=3D"_blank">https://www.ridgerun.com</a></span></div><br></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Nov 26, 2025 at 10:53=E2=80=AFAM Alexander Kanavin via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kan=
avin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, 26 Nov 2025 at 17:41, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
linked into every build.<br>
&gt; &gt;<br>
&gt; &gt; I quickly hacked bitbake&#39;s cooker.py to try this out:<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbfile =
=3D (self.data.getVar(&quot;PERSISTENT_DIR&quot;) or<br>
&gt; &gt; self.data.getVar(&quot;CACHE&quot;)) + &quot;/hashserv.db&quot;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbfile =
=3D &quot;/home/alex&quot; + &quot;/hashserv.db&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; And then made two build directories with shared SSTATE_DIR.<br>
&gt; &gt;<br>
&gt; &gt; TL;DR: everything ran smoothly and as expected.<br>
&gt; &gt;<br>
&gt; &gt; I ran overlapping builds, added no-ops to gnu-config recipe to &#=
39;force&#39;<br>
&gt; &gt; hash equivalency, and there were no errors or crashes, and sstate=
 was<br>
&gt; &gt; reused as expected.<br>
&gt; &gt;<br>
&gt; &gt; So I think we should do it like this, subject to &#39;shared-ssta=
te&#39;<br>
&gt; &gt; setting in bitbake-setup, on by default.<br>
&gt;<br>
&gt; PERSISTENT_DIR is *not* designed to be shared between builds. it might=
<br>
&gt; happen to work but is a really bad idea. Personally, I think those<br>
&gt; cache directory variables and cache layout need redesigning so we<br>
&gt; should probably take the opportunity to do that.<br>
<br>
I am not sharing PERSISTENT_DIR. Only the hash equivalency database in<br>
hashserv.db, which I believe is fine because sqlite has locking<br>
mechanisms and is explicitly designed for it.<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226806): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226806" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226806</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116487236/704=
3332" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116487236/7043332</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:dchvs11@gmail.com" target=
=3D"_blank">dchvs11@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002f4b0f0645403321--

