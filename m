Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2E0CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:18:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14075.1781072288657690287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 23:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=moDLQI5X;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: saisneha196@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso8620028a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 23:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781072287; cv=none;
        d=google.com; s=arc-20240605;
        b=Y09X42IeifVG7WkBibOzZghBxIrmfzK1bnO0SHHpnlc98LlwmJdC6GyNZTmMXlBlMg
         +EygIxMsmS5cXZkHGwfu1h/E1qkOhzPqzYIqLojLhrl8efPnQTRRzjv3R8MhnK4yyk8a
         4vyKcIjPb0ZVG8nhM1QQZaDHvDqY/8Xql8HOrDDRMs+585im4iUoOHvxu+ItHBVjX8DQ
         tEYaTHWlOhURNuoh8uTZV/sMl+aQvE42NCrwk93G7Wy7RB6Evz8LsI6veAISkCM2/A8g
         in02FTV5HDL5C/akfF8ZnzspkNKIQVwGKSB+i2OJk5MmZX5FVhoMoHUEHxldvXdebWsF
         Eq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VraLOuc8sYieEFbHGNT4HFsXG3cGH2qhaYo5r9pPLSo=;
        fh=PYI9He5ZuL/N1xKVJQp2YjdFaW5+DYCABJmZLCS03FM=;
        b=HCrxlszIsuHf0fmf65t6AMMcJK1g7OKZXV/htkl03+qXRJ57zPH3PoLD4o8HAxtH2Z
         35I69LjWhTyBOt/TbT3N7fNe3rQvTd1nsj3mnbK+F0A7OYUl+aXwZyFJXjd251DJMURB
         h2z/dx8bdlQGMewKBu5YO/yYJ1LUK69e0v2UQRzcPXMpKXL4C2f2Xebey+qhqB6xFk75
         W3B8xdCkZr+jpUSjS6AAADzD38bf7Wh6Y4BxHn4kF5zcM+fPQt6eDsITMM5XTGw5pD9u
         f9HdH5D6HqVAXYppGiEVgWHdNOnxSBIyhtMevPxIyhyogHykWEz2xkm00JQFCCqdeTAz
         W8jg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781072287; x=1781677087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VraLOuc8sYieEFbHGNT4HFsXG3cGH2qhaYo5r9pPLSo=;
        b=moDLQI5XQIGOOSrdO7osO3jkF4y9KI3dHpS/V4peT99mwI7R7UFGqYaMxukzjXg8sX
         IF0qiEhU9bjzPBZTUShoFCcAWFS9AVksx6Bd+H2pnQ5DhG+xJonniaEfjq+6sRwaIbNe
         S5zXiCXUlZQF6yZn5HWqEQNE5ash2nznvjv/Gw99bwYEemhpey/Aj2wfdsagja/23Ty7
         bBWD0dfVUV7EsHmgIJP5qt1iG5Tm56HNnkmp2mrCIvgU057/hU9ZqWMJu0VbHIferno1
         Q+skPa66u5LuejAtsOsfhHgNTZKgTGUHDIckkoatuVBb8mJXoBwS8ZXgElgYeHu7Qq/l
         rOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072287; x=1781677087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VraLOuc8sYieEFbHGNT4HFsXG3cGH2qhaYo5r9pPLSo=;
        b=tJpb4PvgMWkhxWOPwOrrcUVk1MI0sNHTuRrbsh8ovLMk0qH8l5WyI8NdVEk3x9aPfF
         mPSFvv7z5fY0PD8hv2SfRoLb+fvuQJDU0PVINqLOW9CbLbKG0L1SKWFOVcsijtA1A7A7
         t1uYJ6MLyNtgQYm1qzG9Z0IFA+IzTIcj84DIJ6sGKs/lHHfCZlw+8yhPiaYJHZ2AmMcM
         VA+ahhdxiNtopXRc8F5AdfHzxD1ruPyCzrlNPaSnMnf68L5ic+ohEyRhxmfUMV77UmMi
         49TmhlGbPzdQIsvsFrBdbQjKeLWEiiUj7gRqQMX/U2qFC91IRE8BKSnf5GVv4UmGsdIm
         mFNg==
X-Forwarded-Encrypted: i=1; AFNElJ/UPx/inGJa7O9VFm3E1EaMAK/AxwcX5AkOpoOwvNThQ735xUma8jB37t7F73C+0wPVi/q5OXyguvNF0bUC6d470Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywf8m+Cffjcfb97VcoqXtu8lKsy/94cPczveGG4W4Ij+mWiW9zw
	E/o+0xCFjIMQMTmB42bimA9gFCb30oQhfMmQPSq1hJA2yFfTSacgvnw244FSlN+GlEAhN3T0L15
	h08t3/8j+JdpXXuFlaszpmj6+erds/5M=
X-Gm-Gg: Acq92OHI9aSgdxwFGIyzfTgHuIAYd4SUccNMgzbE8tvue7Dalmqi8HdABlY7+zSdFmW
	hec2BvCOj857cSJcwvsE2Q7DkfjHwW+7c7g0LH+aHSS1WNzAiLTHHgu37uTj5UpXowUZvUO8Wsj
	RrspPFWXtxjPU3zT7PEt9TkK6v3ydlKUFBhPoT707Q53mbiptD7lrdfCzb5Y1qphUCV+lZsLtl9
	aWy9u7gN+2MlbdxkhB0hFqfpO/NaV8b/GcVdFO9pHYJ3KMNjLywCepd+9ULWJzkyBjrJ1ZHli3g
	RcsT7Jo1KxG8QsbB/wnVXOcz6w2U0685TgwTQ5VBtTCUlnzSbw==
X-Received: by 2002:a17:907:a09:b0:bed:e2e8:d8c3 with SMTP id
 a640c23a62f3a-bf370f5baf0mr1169679266b.22.1781072286634; Tue, 09 Jun 2026
 23:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org> <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
 <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
 <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
 <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org> <18B7A1AFC3F003C5.267903@lists.openembedded.org>
In-Reply-To: <18B7A1AFC3F003C5.267903@lists.openembedded.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Wed, 10 Jun 2026 11:47:52 +0530
X-Gm-Features: AVVi8CfXBlalCcwt5ECXhdOjqYrjtTt9LyoahOBvTDEYfM98oLC_0VRJ5NOQZow
Message-ID: <CANcU11dmkfUA7E8=Qm8O1J8VZLHEv=FW3Gjm2bVpHqvsi7AvUg@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: saisneha196@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000f6d6a80653e03488"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238315

--000000000000f6d6a80653e03488
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tested BB_NO_NETWORK:layer-core =3D "1" and found that it does
not prevent the parse crash for the case where SRCREV is
completely missing.

The crash happens in srcrev_internal_helper() which raises
FetchError before any network access is attempted =E2=80=94 so
BB_NO_NETWORK never gets checked. The BB_NO_NETWORK flag would
only help for the case where SRCREV is set to a floating
branch/tag and latest_revision() is called, since _lsremote()
calls check_network_access() there.

So it seems like two separate fixes are needed:

1. For missing SRCREV =E2=80=94 something needs to prevent the parse
crash in srcrev_internal_helper(). Would it be appropriate
to check BB_NO_NETWORK in srcrev_internal_helper() itself
before raising FetchError?

2. For floating branch/tag =E2=80=94 BB_NO_NETWORK:layer-core =3D "1"
would work.

On the OE-core side I have a simple QA check in insane.bbclass
using supports_srcrev() that fires at build time, which handles
the warning/error reporting cleanly.

Does this analysis make sense?

Best regards,
Sai Sneha


On Wed, 10 Jun 2026 at 11:09=E2=80=AFAM, Sai Sneha via lists.openembedded.o=
rg
<saisneha196=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Richard,
>
> That makes sense if SRCREV is completely missing the recipe
> is unbuildable anyway, so the parse failure is an acceptable
> outcome for that case.
>
> So the complete solution would be:
> - BB_NO_NETWORK:layer-core =3D "1" in OE-core to prevent
> floating branch/tag lookups
> - A QA check in insane.bbclass to warn about missing SRCREV
> for external layers
> - yocto-check-layer catches parse failures during validation
>
> Is this the right direction?
>
> Best regards,
> Sai Sneha
>
>
> On Tue, 9 Jun 2026 at 5:11=E2=80=AFPM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2026-06-09 at 16:04 +0530, Sai Sneha wrote:
>> > Hi Richard,
>> >
>> > Please correct me if am wrong.
>> >   BB_NO_NETWORK:layer-core =3D "1"
>> > would work for the case where SRCREV is set to a floating
>> > branch or tag, since _lsremote() calls check_network_access()
>> > which raises NetworkAccess when BB_NO_NETWORK is set.
>> >
>> > However for the case where SRCREV is completely missing the
>> > crash happens earlier in srcrev_internal_helper() which raises
>> > FetchError before latest_revision() is even called so
>> > BB_NO_NETWORK wouldn=E2=80=99t catch that case.
>>
>> In that case the build fails to parse and is unbuildable? That is
>> probably fine as check-layer tests whether it parses?
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238312):
> https://lists.openembedded.org/g/openembedded-core/message/238312
> Mute This Topic: https://lists.openembedded.org/mt/119719972/10302268
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> saisneha196@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f6d6a80653e03488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto"><br style=3D"font-size:i=
nherit">I tested BB_NO_NETWORK:layer-core =3D &quot;1&quot; and found that =
it does <br style=3D"font-size:inherit">not prevent the parse crash for the=
 case where SRCREV is <br style=3D"font-size:inherit">completely missing.<b=
r style=3D"font-size:inherit"><br style=3D"font-size:inherit">The crash hap=
pens in srcrev_internal_helper() which raises <br style=3D"font-size:inheri=
t">FetchError before any network access is attempted =E2=80=94 so <br style=
=3D"font-size:inherit">BB_NO_NETWORK never gets checked. The BB_NO_NETWORK =
flag would <br style=3D"font-size:inherit">only help for the case where SRC=
REV is set to a floating <br style=3D"font-size:inherit">branch/tag and lat=
est_revision() is called, since _lsremote() <br style=3D"font-size:inherit"=
>calls check_network_access() there.<br style=3D"font-size:inherit"><br sty=
le=3D"font-size:inherit">So it seems like two separate fixes are needed:<br=
 style=3D"font-size:inherit"><br style=3D"font-size:inherit">1. For missing=
 SRCREV =E2=80=94 something needs to prevent the parse <br style=3D"font-si=
ze:inherit">   crash in srcrev_internal_helper(). Would it be appropriate <=
br style=3D"font-size:inherit">   to check BB_NO_NETWORK in srcrev_internal=
_helper() itself <br style=3D"font-size:inherit">   before raising FetchErr=
or?<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">2. For f=
loating branch/tag =E2=80=94 BB_NO_NETWORK:layer-core =3D &quot;1&quot; <br=
 style=3D"font-size:inherit">   would work.<br style=3D"font-size:inherit">=
<br style=3D"font-size:inherit">On the OE-core side I have a simple QA chec=
k in insane.bbclass <br style=3D"font-size:inherit">using supports_srcrev()=
 that fires at build time, which handles <br style=3D"font-size:inherit">th=
e warning/error reporting cleanly.<br style=3D"font-size:inherit"><br style=
=3D"font-size:inherit">Does this analysis make sense?<br style=3D"font-size=
:inherit"><br style=3D"font-size:inherit">Best regards,<br style=3D"font-si=
ze:inherit">Sai Sneha<br style=3D"font-size:inherit"></div><br></div><div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 10 Jun 2026 at 11:09=E2=80=AFAM, Sai Sneha via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;saisne=
ha196=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div><div style=3D"font-size:inherit" dir=3D"auto">Hi Rich=
ard,<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">That ma=
kes sense if SRCREV is completely missing the recipe <br style=3D"font-size=
:inherit">is unbuildable anyway, so the parse failure is an acceptable <br =
style=3D"font-size:inherit">outcome for that case.<br style=3D"font-size:in=
herit"><br style=3D"font-size:inherit">So the complete solution would be:<b=
r style=3D"font-size:inherit">- BB_NO_NETWORK:layer-core =3D &quot;1&quot; =
in OE-core to prevent <br style=3D"font-size:inherit">  floating branch/tag=
 lookups<br style=3D"font-size:inherit">- A QA check in insane.bbclass to w=
arn about missing SRCREV <br style=3D"font-size:inherit">  for external lay=
ers<br style=3D"font-size:inherit">- yocto-check-layer catches parse failur=
es during validation<br style=3D"font-size:inherit"><br style=3D"font-size:=
inherit">Is this the right direction?=C2=A0<br style=3D"font-size:inherit">=
<br style=3D"font-size:inherit">Best regards,<br style=3D"font-size:inherit=
">Sai Sneha<br style=3D"font-size:inherit"></div><br></div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 9 Jun 202=
6 at 5:11=E2=80=AFPM, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, 2026-06-09 at 16:04 +0530, Sai Sneha wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; Please correct me if am wrong.<br>
&gt; =C2=A0 BB_NO_NETWORK:layer-core =3D &quot;1&quot; <br>
&gt; would work for the case where SRCREV is set to a floating <br>
&gt; branch or tag, since _lsremote() calls check_network_access() <br>
&gt; which raises NetworkAccess when BB_NO_NETWORK is set.<br>
&gt; <br>
&gt; However for the case where SRCREV is completely missing the <br>
&gt; crash happens earlier in srcrev_internal_helper() which raises <br>
&gt; FetchError before latest_revision() is even called so=C2=A0<br>
&gt; BB_NO_NETWORK wouldn=E2=80=99t catch that case.<br>
<br>
In that case the build fails to parse and is unbuildable? That is<br>
probably fine as check-layer tests whether it parses?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238312): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238312" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238312</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119719972/103=
02268" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/119719972/10302268</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:saisneha196@gmail.com" tar=
get=3D"_blank">saisneha196@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f6d6a80653e03488--

