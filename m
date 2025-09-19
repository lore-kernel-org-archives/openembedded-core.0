Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4354BCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:06:16 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.12704.1758276369574769282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OaBJbJ1G;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-792f273fbe4so11338076d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758276368; x=1758881168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErB4hBQBX7CB9aXayR4X3nktkfOlFi4vYCfOxS1hrDA=;
        b=OaBJbJ1Ge89AAeopDj75gt3q/9qWSbSlkyYWPnqNqcF9qhhPvrjRSbUlN6azvVEPro
         vQJpwRoUGSDgFbj1eykl8KYzrI5jRS9nkbi90X1pbabD61xv/IXluNs2me1Zr4jqEd4N
         1dShOAMqfdM7UYLtai+P0jkWP7SzlpiaabPKm3sS6nFOQU6K0hW86CqXUBH5ldt47Xs8
         9b60C1BnZTZdTYMOXspCM4jBlFpvwREY/8V5UUUHwkpj8cUXj21rxNSeZGAelmYFVnqI
         +JFcaRrAcXF1wc4iCEr2WYlscitYhZcJBTjElDYMPqBcFI5muoybYEZsvlR7wXc3sNnc
         R52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758276368; x=1758881168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErB4hBQBX7CB9aXayR4X3nktkfOlFi4vYCfOxS1hrDA=;
        b=MiY+YZOY2rTGYrGH+M3tWsENeWdVwYzsPcW2zdDoVzRaoVy+wYuqq4UODFcQTcZGT4
         gYMmMJATSOkGkhArY12PVQgrWGlgPRjBh4gyneloa7rHWd4mFaLagAjQcCEDDHnMH6IL
         5d0uJEi4fUnDJf8Fc9RSdCF2P/6VeQqy4N+R6FWH0wzwGcpfJwDFx/BtZpT9n2o/12oo
         sqbqwrZYFxB5BMGxYcCe2fTTvRKPE8kjHkp30cxsDOs83HrmNmWotXyWyp6FdrcmlINS
         0Dv/MmwrdSnMg7pZZ0qS3ie22BcKDQ6NpgcrB6be/MvYlfxXUW99D/M4MebAXZiK8yn2
         eueA==
X-Gm-Message-State: AOJu0YxQ7egNj0A0jnw1muhreUu1Xp66ypfQunHTzR6nHA/2dIPeyRex
	AjPcZcYQSPdE9UGxLYPC5O5Ac83W8l8JOgZfj8QogmTukXZATfPxshPx4TV2nALtELXXd/+9CXb
	cFyMiwjdPKrNtZwWhz2z8OPDcYrcBjd4=
X-Gm-Gg: ASbGncuML/93D21jYDjZquUDwhykeL0RYvR9jhLVqnZ+F+6PjUaASXsEpcX7DU8SF3K
	L9Tkx4vN7d26fVLUWueOgnNkajDUVNiUchk4YJfdQukSlVVXOcPMiDFwO/lXfX9Ibqn2yU4ydRg
	OdH86NfzarmQp73Wsv0dOKvXZ95RtlHWzlx18SkMxmrfG6lF9bg/dyY+Nypl6+rne6NtbQhA0xf
	Jq3BJIv5B+PBHaBIN3eS6fxq/4zqGC9BlNmpPu8HQApVxvpfOV1lz84esLGdYvIH5zaclhPuqMY
	ZipH
X-Google-Smtp-Source: AGHT+IELH4qH6gtbwww7EAZG8WX2TlPR6pibIyjnvpQwyUPRSTbE4mMj4s+VxjijTmkVyLdtZhaUZBP7koNliIvpqs4=
X-Received: by 2002:ad4:5f06:0:b0:765:106d:d5ea with SMTP id
 6a1803df08f44-7991bf3c108mr34381996d6.31.1758276368449; Fri, 19 Sep 2025
 03:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <PU4P216MB11685F7E2B6017C6CFB2615EEC15A@PU4P216MB1168.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PU4P216MB11685F7E2B6017C6CFB2615EEC15A@PU4P216MB1168.KORP216.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Sep 2025 12:05:57 +0200
X-Gm-Features: AS18NWCM3-lY2DPNPgV4PfzKiSlisSexYTgLQ7xSALdd_NBKo90yQsOR22x7clM
Message-ID: <CANNYZj8y8DdTEG339g7p=5D6sRRnmfwVzQxAy2XSOx8cFipw=w@mail.gmail.com>
Subject: Re: [OE-core] OpenSSL 3.2 EOL and Security Support in Yocto scarthgap
To: young.yeo@lge.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	=?UTF-8?B?7LKc66qF7ZuIL+2MgOyepS93ZWJPUyBDSe2MgA==?= <myunghoon.chun@lge.com>, 
	=?UTF-8?B?7J207J6s6recL+yxheyehOyXsOq1rOybkC93ZWJPUyBSUOyLnOyKpO2FnOqwnOuwnO2MgA==?= <jaekyu.lee@lge.com>, 
	=?UTF-8?B?7Iug7Iq57ZmYL+yxheyehOyXsOq1rOybkC93ZWJPUyBDSe2MgA==?= <sh0127.shin@lge.com>, 
	=?UTF-8?B?6rmA64yA7IudL+yxheyehOyXsOq1rOybkC9TZWN1cml0eSZDb21wbGlhbmNlIFRhc2s=?= <hedaesik.kim@lge.com>
Content-Type: multipart/alternative; boundary="0000000000005bc448063f249edd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 10:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223735

--0000000000005bc448063f249edd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Sept 2025 at 04:13, =EC=97=AC=EC=98=81=EC=9A=B1/=EC=B1=85=EC=9E=
=84=EC=97=B0=EA=B5=AC=EC=9B=90/webOS CI=ED=8C=80 via
lists.openembedded.org <young.yeo=3Dlge.com@lists.openembedded.org> wrote:

> Dear All,
>
>
> It is noted that OpenSSL version 3.2 is scheduled to reach its End of Lif=
e
> (EOL) in 2025 (https://openssl-library.org/roadmap/index.html).
> I believe it would be preferable for Scarthgap=E2=80=94the latest Yocto L=
TS
> release=E2=80=94to include updated Open Source components.
> Is there any plan to adopt OpenSSL version 3.5 in Scarthgap?
> If not, I would like to confirm whether CVE patches and vulnerability
> issue responses will continue to be provided for OpenSSL 3.2 while
> maintaining it in Scarthgap, as this is important for LTS support.
>

Hello Younguk,

Yocto stable releases, including LTS ones make this promise to their users:
only bug and security fixes. This is done so that products can be
maintained with minimal risk of destabilizing them, and product developers
can themselves decide when and how they add major version updates to the
product on the market. Updating openssl across several major releases would
break that promise, potentially break product functionality, and take away
that freedom from Yocto users, forcing the major feature update on them
without their consent.

It is not a hard 'no', but you need to bring your case, and the technical
proposal to handle it to the Yocto TSC for review. You should in particular
explain, why updating openssl directly in scarthgap is better than the
alternativies:
- adding a supported openssl version to a branch in meta-lts-mixins
- adding a supported openssl version to a private layer in your product
- updating your product to a newer yocto version that contains supported
openssl.

Whether openssl 3.2 will continue to receive CVE fixes in scarthgap depends
entirely on scarthgap users. The project does not have resources or
knowledge in crypto and openssl codebase to track CVEs and backport fixes,
it relies on the users to do this. 3.2 will not suddenly become insecure
when it goes EOL, so everyone has time to consider their options.

We'll make sure the upcoming Yocto LTS release (spring 2026) will have a
LTS openssl in it (which is 3.5).

Alex

--0000000000005bc448063f249edd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 19 Sept 2025 at 04:13, =EC=97=AC=EC=
=98=81=EC=9A=B1/=EC=B1=85=EC=9E=84=EC=97=B0=EA=B5=AC=EC=9B=90/webOS CI=ED=
=8C=80 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;young.yeo=3D<a href=3D"mailto:lge.com@lists.openembedded.org">lge.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg-1809193449365506712">




<div dir=3D"ltr"><div id=3D"m_-1809193449365506712Signature"><p style=3D"te=
xt-align:left;text-indent:0px;line-height:15.3333px;margin:0px"><span style=
=3D"font-family:&quot;LG\00c2a4\00b9c8\00d2b8\00ccb42.0 Light&quot;,&quot;L=
G\00c2a4\00b9c8\00d2b8\00ccb42.0 Regular&quot;;font-size:10pt;color:black">=
Dear All,</span></p>
<p style=3D"text-align:left;text-indent:0px;line-height:15.3333px;margin:0p=
x">
<span style=3D"font-family:&quot;LG\00c2a4\00b9c8\00d2b8\00ccb42.0 Light&qu=
ot;,&quot;LG\00c2a4\00b9c8\00d2b8\00ccb42.0 Regular&quot;;font-size:10pt;co=
lor:black"><br>
</span></p>
<p style=3D"text-align:left;text-indent:0px;line-height:15.3333px;margin:0p=
x">
<span style=3D"font-family:&quot;LG\00c2a4\00b9c8\00d2b8\00ccb42.0 Light&qu=
ot;,&quot;LG\00c2a4\00b9c8\00d2b8\00ccb42.0 Regular&quot;;font-size:10pt;co=
lor:black">It is noted that OpenSSL version 3.2 is scheduled to reach its E=
nd of Life (EOL) in 2025 (<a href=3D"https://openssl-library.org/roadmap/in=
dex.html" target=3D"_blank">https://openssl-library.org/roadmap/index.html<=
/a>).<br>
I believe it would be preferable for Scarthgap=E2=80=94the latest Yocto LTS=
 release=E2=80=94to include updated Open Source components.<br>
Is there any plan to adopt OpenSSL version 3.5 in Scarthgap?<br>
If not, I would like to confirm whether CVE patches and vulnerability issue=
 responses will continue to be provided for OpenSSL 3.2 while maintaining i=
t in Scarthgap, as this is important for LTS support.</span></p></div></div=
></div></blockquote></div><div class=3D"gmail_quote gmail_quote_container">=
<br></div><div class=3D"gmail_quote gmail_quote_container">Hello Younguk,</=
div><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=
=3D"gmail_quote gmail_quote_container">Yocto stable releases, including LTS=
 ones make this promise to their users: only bug and security fixes. This i=
s done so that products can be maintained with minimal risk of destabilizin=
g them, and product developers can themselves decide when and how they add =
major version updates to the product on the market. Updating openssl across=
 several major releases would break that promise, potentially break product=
 functionality, and take away that freedom from Yocto users, forcing the ma=
jor feature update on them without their consent. <br></div><div class=3D"g=
mail_quote gmail_quote_container"><br></div><div class=3D"gmail_quote gmail=
_quote_container">It is not a hard &#39;no&#39;, but you need to bring your=
 case, and the technical proposal to handle it to the Yocto TSC for review.=
 You should in particular explain, why updating openssl directly in scarthg=
ap is better than the alternativies:<br></div><div class=3D"gmail_quote gma=
il_quote_container">- adding a supported openssl version to a branch in met=
a-lts-mixins</div><div class=3D"gmail_quote gmail_quote_container">- adding=
 a supported openssl version to a private layer in your product</div><div c=
lass=3D"gmail_quote gmail_quote_container">- updating your product to a new=
er yocto version that contains supported openssl.</div><div class=3D"gmail_=
quote gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quot=
e_container">Whether openssl 3.2 will continue to receive CVE fixes in scar=
thgap depends entirely on scarthgap users. The project does not have resour=
ces or knowledge in crypto and openssl codebase to track CVEs and backport =
fixes, it relies on the users to do this. 3.2 will not suddenly become inse=
cure when it goes EOL, so everyone has time to consider their options.</div=
><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"g=
mail_quote gmail_quote_container">We&#39;ll make sure the upcoming Yocto LT=
S release (spring 2026) will have a LTS openssl in it (which is 3.5).</div>=
<div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gm=
ail_quote gmail_quote_container">Alex<br></div></div>

--0000000000005bc448063f249edd--

