Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C851E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 20:07:29 +0000 (UTC)
Received: from so254-41.mailgun.net (so254-41.mailgun.net [198.61.254.41])
 by mx.groups.io with SMTP id smtpd.web10.4449.1734120442729875294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 12:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=Z7u4dmnD;
 spf=pass (domain: asterius.io, ip: 198.61.254.41, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1734120442; x=1734127642;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=MmbPC2k0UcvW7O43kB1djhByXDsWZIYxp595ClvCqe0=;
 b=Z7u4dmnD5c8AzzVWVtjXs9Qx5a0Qi1w/VgCAaXRCrdzs7NSuI1oazY7mphueJD35RjmlIlsGs4Q7gAnphRsgifSf4aoTAVgcrz2mM75CdZVmoCDa6JH7U1JrLIfsXKN5qo/C5e/6xscJN89Mj2FCl6Utn04Zzl6bcw3MSPQoKZU=
X-Mailgun-Sending-Ip: 198.61.254.41
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52]) by
 5c791a730f77 with SMTP id 675c93fabed72c5f41290cc5 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Fri, 13 Dec 2024 20:07:22 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa670ffe302so387310266b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 12:07:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj1QK81cbSIGEYFCuHZViYpLXxQLD1VK1afGGOkFF1i+Du9z+4uJlcHahLt4fYLzLu5NgFdalQAP3/ddgvzjH5ag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzhu4jcKbA21EURuYncWeuEJF+rHEB4uG+xC3YiCFCkudhylr0I
	o13ReTHbs9QwV0GJcIJ8w5+hpEZnkSEo/AZu/HT/qtyP3qVMB/IWXNhyAaUzTIulI5/cJSfYs5M
	b6e3lTIYHmNg6mj1DDWGOY8xpMgU=
X-Google-Smtp-Source: AGHT+IFZDfmvk8UpObBk9viUN0w6axp1PEWRz7QWhDOsU5CV5OJ1riggTNSE9HSV7NtcKLWDb4SDVCSjuocSBAgFsP0=
X-Received: by 2002:a17:907:86a1:b0:aa6:7ab4:4597 with SMTP id
 a640c23a62f3a-aab77e8277bmr444511166b.39.1734118776140; Fri, 13 Dec 2024
 11:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20241212185619.1599668-1-derek@asterius.io> <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
 <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
 <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
 <DE3FC97A-159D-4603-9121-1A6C27FF9AEA@arm.com> <CADNbA1puBC4tf+CmwPy4Ej8d4jMNWwXUx3fAnUmWyNgMk5osrQ@mail.gmail.com>
In-Reply-To: <CADNbA1puBC4tf+CmwPy4Ej8d4jMNWwXUx3fAnUmWyNgMk5osrQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 13 Dec 2024 13:39:23 -0600
X-Gmail-Original-Message-ID: <CADNbA1rA5BBMmHk2ytgp6XAOfcnYqAEemy1UtR1dhLxUMP7UVw@mail.gmail.com>
Message-ID: <CADNbA1rA5BBMmHk2ytgp6XAOfcnYqAEemy1UtR1dhLxUMP7UVw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
To: Ross Burton <Ross.Burton@arm.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6883e06292bfd96"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 20:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208694

--000000000000a6883e06292bfd96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Unfortunately, there's a large swath of packages in both oe-core (>30) in
meta-python (>70) that do not follow PEP625.  I'll send a v3 patchset that
normalizes the URLs and sdist filenames for the future (assuming folks
standardize to follow PEP625 in the future), but we'll still carry a large
number of special cases in the interim.

On Fri, Dec 13, 2024 at 12:09=E2=80=AFPM Derek Straka <derek@asterius.io> w=
rote:

> Hi Ross,
>
> I'll give that normalization another shot.  I saw a couple older packages
> not following the normalized filenames, but those could be outliers.
> Thanks for the pointer.
>
> -Derek
>
> On Fri, Dec 13, 2024 at 12:07=E2=80=AFPM Ross Burton <Ross.Burton@arm.com=
> wrote:
>
>> On 13 Dec 2024, at 15:14, Alexander Kanavin via lists.openembedded.org
>> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > On Fri, 13 Dec 2024 at 15:53, Derek Straka <derek@asterius.io> wrote:
>> >> Thanks for your note.  I=E2=80=99m working through the remaining down=
stream
>> recipe changes today which should address the rest of the UNKNOWN_BROKEN
>> recipes.
>> >>
>> >> While looking at it yesterday, the download packages come primarily i=
n
>> two archetypes:
>> >> 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98 in=
 the source archives
>> >> 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives
>> >>
>> >> Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean fix=
 in the bbclass
>> without a more invasive change to the upstream check logic.  I can,
>> however, package all the changes for one-core into a single patchset and
>> submit a v2.  That will at least address all the core updates in one fel=
l
>> swoop.
>> >>
>> >> Does that sound reasonable?
>> >
>> > Seems so, yes.
>> >
>> > Historically pypi upstream checks have been a pain, as there has been
>> > a constant stream of seemingly random breaking changes, of two types:
>> >
>> > 1. _ being replaced by - and vice versa
>> > 2. CamelCasing being replaced by lowercasing and vice versa.
>> >
>> > I haven't been able to figure out any pattern in this, or come up with
>> > a universal check. If you can simply fix up core recipes to not return
>> > UNKNOWN_BROKEN, I'd appreciate.
>>
>> I=E2=80=99ve some partial branches that attempt to bring sanity to this =
but yes,
>> it=E2=80=99s a mess.
>>
>> The good news is that https://peps.python.org/pep-0625/ says that sdist
>> filenames should be normalised and from what I can tell everything but
>> setuptools does normalise, and the use of setuptools is falling.
>>
>> The simple update API says that the project name is normalised, so we ca=
n
>> add a little normalise function:
>>
>> def pypi_normalize(s):
>>     import re
>>     return re.sub(r"[-_.]+", "_", s).lower()
>>
>> And use that to turn the PYPI_PACKAGE into the right thing, surely?
>>
>> Rationalising this is the source of at least three wip branches I have
>> locally, so I=E2=80=99d love to see it sorted.
>>
>> Ross
>
>

--000000000000a6883e06292bfd96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Unfortunately, there&#39;s a large swath of packages in bo=
th oe-core (&gt;30) in meta-python (&gt;70)=C2=A0that do not follow PEP625.=
=C2=A0 I&#39;ll send a v3 patchset that normalizes the URLs and sdist filen=
ames for the future (assuming folks standardize to follow PEP625 in the fut=
ure), but we&#39;ll still carry a large number of special cases in the inte=
rim.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Dec 13, 2024 at 12:09=E2=80=AFPM Derek Straka &lt;<a href=3D"ma=
ilto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>Hi Ross,<div><br></div><div>I&#39;ll give that normalization another shot.=
=C2=A0 I saw a couple older packages not following the normalized filenames=
, but those could be outliers.=C2=A0 Thanks for the pointer.</div><div><br>=
</div><div>-Derek</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Dec 13, 2024 at 12:07=E2=80=AFPM Ross Burton=
 &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@a=
rm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 13 Dec 2024, at 15:14, Alexander Kanavin via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; On Fri, 13 Dec 2024 at 15:53, Derek Straka &lt;<a href=3D"mailto:derek=
@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt; wrote:<br>
&gt;&gt; Thanks for your note.=C2=A0 I=E2=80=99m working through the remain=
ing downstream recipe changes today which should address the rest of the UN=
KNOWN_BROKEN recipes.<br>
&gt;&gt; <br>
&gt;&gt; While looking at it yesterday, the download packages come primaril=
y in two archetypes:<br>
&gt;&gt; 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98=
 in the source archives<br>
&gt;&gt; 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives<b=
r>
&gt;&gt; <br>
&gt;&gt; Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean =
fix in the bbclass without a more invasive change to the upstream check log=
ic.=C2=A0 I can, however, package all the changes for one-core into a singl=
e patchset and submit a v2.=C2=A0 That will at least address all the core u=
pdates in one fell swoop.<br>
&gt;&gt; <br>
&gt;&gt; Does that sound reasonable?<br>
&gt; <br>
&gt; Seems so, yes.<br>
&gt; <br>
&gt; Historically pypi upstream checks have been a pain, as there has been<=
br>
&gt; a constant stream of seemingly random breaking changes, of two types:<=
br>
&gt; <br>
&gt; 1. _ being replaced by - and vice versa<br>
&gt; 2. CamelCasing being replaced by lowercasing and vice versa.<br>
&gt; <br>
&gt; I haven&#39;t been able to figure out any pattern in this, or come up =
with<br>
&gt; a universal check. If you can simply fix up core recipes to not return=
<br>
&gt; UNKNOWN_BROKEN, I&#39;d appreciate.<br>
<br>
I=E2=80=99ve some partial branches that attempt to bring sanity to this but=
 yes, it=E2=80=99s a mess.<br>
<br>
The good news is that <a href=3D"https://peps.python.org/pep-0625/" rel=3D"=
noreferrer" target=3D"_blank">https://peps.python.org/pep-0625/</a> says th=
at sdist filenames should be normalised and from what I can tell everything=
 but setuptools does normalise, and the use of setuptools is falling.<br>
<br>
The simple update API says that the project name is normalised, so we can a=
dd a little normalise function:<br>
<br>
def pypi_normalize(s):<br>
=C2=A0 =C2=A0 import re<br>
=C2=A0 =C2=A0 return re.sub(r&quot;[-_.]+&quot;, &quot;_&quot;, s).lower()<=
br>
<br>
And use that to turn the PYPI_PACKAGE into the right thing, surely?<br>
<br>
Rationalising this is the source of at least three wip branches I have loca=
lly, so I=E2=80=99d love to see it sorted.<br>
<br>
Ross</blockquote></div>
</blockquote></div>

--000000000000a6883e06292bfd96--

