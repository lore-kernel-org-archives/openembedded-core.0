Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2512FF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 15:15:53 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1058.1777562152121444139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 08:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cWE1PKPZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479d68a9063so389112b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 08:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777562151; cv=none;
        d=google.com; s=arc-20240605;
        b=LI0KYmm5nXEBQ2/jglBm2ScKpgW2hnhEHdoZkoHUk0NSt8BcgKYE4hkNaA+iguf/3a
         jI/xfgVq8XxBT2qZWVP1EHVBUCsbZEQlemsp7CwL7eISOyhxrNO50MiyYdwx9Rkk6a5Y
         KZh9ZFEGa478l/wpUMgaiJtSSR0ZfqOdQYmZ34FSfz5nE3x3+nbfNK0K1Ld6AVwj30Xj
         FGe7lx4/KJSlpqn0lr4NLjKtqm2MEryxupsAT/d2BQsi97W6ksfdk1VCUW87Vn9a8pLg
         ctWbWmiCVzD5DTELaFgJ5EXlrobPW8YPG7dJynISglIpQrDOYViQkHacQDSl5+9i6fmI
         nuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7TO1CfkumEpJCus6XJncEAMPm9MJlaIT4cBRXaslDdI=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=WyDtYhjsZ6Pf3UdUGiN9ifMrosJuEP9C4JSFRHm/dtwl5B75guO/Lp+rSJzFRNOyuH
         7j93qm41ZlL5Nib/97jMGAXFQBooJdyf7lDJSFN9s3LoyQmMyiJ4Q2btgu1ri7jr7z9K
         W5MQ9ta7TV3s0V4ZatZPN9CweTWzhid1iI7xmPSf+XbDUa693oR6dDiv2ivP+zBefr/h
         LsgrJkRaMzPlobVCCR7Z6lVUwft9dzUokmfF61IOkZmJFhIQcaQ3WXLFsoj50Vtnu3q7
         +dBz8fsmdfy3tr83rqEfaA1xUHAVO0eaV2lKDg5hIzL7wVUF/qpmOTRKn/opfWG9TyA6
         tPNw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777562151; x=1778166951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7TO1CfkumEpJCus6XJncEAMPm9MJlaIT4cBRXaslDdI=;
        b=cWE1PKPZZNGsZcPDzogDY6Y/kyY8gl0kVqyYtmFM1E3zG9Tm5syZrLaxDNrvoM6Bql
         3CYK+zpoBMOiSenIKdztBOM2YbdOODoKA41FTJM3JVcJ9zAcmOBPT3S12FDUH5JTajI8
         iPHhJQSnnGXoLLB5k6XgPKgmAcHOXS+Q0SlqOkCI/6LfAC2lsOLmOmMG5vLz347BszkL
         S0OxRyIUANk4xzEUf1ScHVX69TDBHOhMOL1jwEp4Av6FWpc/qAf1uzi3kX3jaTA+vNVG
         2Ev0D4tWRoMHA7jxuqutc7/9JFVSmmeHcz8Arfzp+sKO3l+8IsvtymM4w6cvpSLrsQUr
         YniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777562151; x=1778166951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TO1CfkumEpJCus6XJncEAMPm9MJlaIT4cBRXaslDdI=;
        b=AXLQKoOTEPp1hy2s7u3VsUbKqGsHjkD4gvIiceBcxtX4S/xpkulWbisBwjGPoCaV8i
         ZgWnxqCui0UfeG4ibyCQihKLK64JEALarxYnRVVycsm4WA1RJaMlwimM/ZPHxSL3JeD8
         6U82MSrTemUczCNAkoxERbGnwsp09+cYJMrGtNSKwtTdtIHEvukd4WSS2aTaT2R4NSwZ
         ofdfUkjeahaNYXWybhdlN9y+dQi5cWsPN2ejiQFfR/e5vEZtBvtLsoebI/ST6SThQcio
         IOvJ8qHdRmxLIRKovbv/UZVwX2Otqs3WXbRJ8Mmod61XnhN8UTFJsHTRDpaoU9sO20Sa
         HmDw==
X-Gm-Message-State: AOJu0Yy8u9S8PM/GWAb9acnia+ZtwnjmTS/SPjzwhct3dqbTLMOGArme
	4oR5SeytP+nxByt4EI7alPnqZwl1p2g875EWlSQdnIgG61I/T68AjD/CRTur5OOMyZBQoxdsOPQ
	mNjEjmsxPVLxuJmZvkgKSZg1ICIcvHiI=
X-Gm-Gg: AeBDies6B2EN7enS5C9dPYLUN4+IUBNBU+QK8O0v2BSuBTVs5ptiKUEoh4xmy0bZnow
	ROHKfwVSLEn4h+3FLyAmZfCRG+KNWb6CAoETLhK+O+D19V3KlVx/SZR9iwppUik3w/YXbsIcN3t
	IxFI8FGwG4Vf5ER2DneR200ObuLafkFCD763hzm6W4Jj1A89mwNsX0i4cFUNZ9FV/kSK8Mxflms
	tLOyfuV8bSBvx/UYKj43Yiv9sNIOde6Eenf6mWAPECvuj09vc8/0kbIOGcYYCCioL7Oq0LCqg7p
	F33hjiFTEfLs1M2iIHBrvC5v10sRcvuRlxNtZ/XAqsh2tr2LuGRB
X-Received: by 2002:a05:6808:4487:b0:479:dcb1:dcee with SMTP id
 5614622812f47-47c5fbcfaa2mr1756272b6e.18.1777562151019; Thu, 30 Apr 2026
 08:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com> <64eb162c5c22721ff9d11d9c1f0d6c15aea3640a.camel@linuxfoundation.org>
In-Reply-To: <64eb162c5c22721ff9d11d9c1f0d6c15aea3640a.camel@linuxfoundation.org>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 30 Apr 2026 17:15:38 +0200
X-Gm-Features: AVHnY4LZJ8gf4DFtf7x_LvQPIei2F-3IXU1D-5i7It8CTrEYrBu4plZILk4rso4
Message-ID: <CAFAffzxnk+YvferrFbRO2O_rrz8FvGbgKAmGewq0Rf=Mxye-cA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from 'BB_HASHEXCLUDE_COMMON'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093eb1e0650aef04d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 15:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236174

--00000000000093eb1e0650aef04d
Content-Type: text/plain; charset="UTF-8"

>
>
> which is a lot of non-trivial change and a lot of extra data in the
> sigdata file.
>
> Do we really want all of this data to be added into every signature
> computation?
>
> Are we 100% sure that add the newly added variable dependencies are
> "safe" and won't trigger sstate cache reuse issues?
>

Well, obviously such increase in the visibility of dependencies is not a
comforting or welcome thing, but let's not forget, that those dependencies
truly are there :-)
I'd ask the opposite question: given the extent and nature of the relations
exposed by this change, do we want to keep wholesale hiding them with the
current implementation?
Or in other words, are those particular dependencies (stemming from
'extend_recipe_sysroot') so irrelevant for the overall signature and sstate
management, that it is justifiable to keep ignoring them in such a unique
way and on such a fundamental level?

Unless it is truly a desirable situation and the whole subject can be
dismissed, what would be the recommended way to tackle it?


>
> Right now, I'm very nervous about this.
>
> Cheers,
>
> Richard
>
>

--00000000000093eb1e0650aef04d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" styl=
e=3D"font-size:small"></span><br>
which is a lot of non-trivial change and a lot of extra data in the<br>
sigdata file.<br>
<br>
Do we really want all of this data to be added into every signature<br>
computation?<br>
<br>
Are we 100% sure that add the newly added variable dependencies are<br>
&quot;safe&quot; and won&#39;t trigger sstate cache reuse issues?<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">Well, obviously such increase in the visibility of dependencies is n=
ot a comforting or welcome thing, but let&#39;s not forget, that those depe=
ndencies truly are there :-)</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;d ask the opposite question: given the extent and natur=
e of the relations exposed by this change, do we want to keep wholesale hid=
ing them with the current implementation?</div><div class=3D"gmail_default"=
 style=3D"font-size:small">Or in other words, are those particular dependen=
cies (stemming from &#39;extend_recipe_sysroot&#39;) so irrelevant for the =
overall signature and sstate management, that it is justifiable to keep ign=
oring them in such a unique way and on such a fundamental level?</div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Unless it =
is truly a desirable situation and the whole subject can be dismissed, what=
 would be the recommended way to tackle it?</div></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Right now, I&#39;m very nervous about this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000093eb1e0650aef04d--

