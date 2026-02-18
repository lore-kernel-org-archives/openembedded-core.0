Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36631E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:44:49 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6150.1771392957153209731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 21:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0AK4Rh+;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: careers.myinfo@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8fa449e618so709060166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 21:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771392955; cv=none;
        d=google.com; s=arc-20240605;
        b=bmLd102Ruait2oWpWHlDJi1uSGMr+rC7WHa7lkz8btYGXLMDtjXGUav/HyqIrssR/F
         wWBjzGRCnyfdak7paERXF8jgN7yRSWnkFsfJEDy3V1Ya6S/cyxLCV9CagFwyp/xzedQo
         qReAMxYK7DquOYRrnhs8BQHmfa2rwMUqzovRm82ZkeKvOLxAEcdtdBtl46U42uI+3Tbg
         kVQKf7Qkrv8AWSXM7ripf433fMH7975n0I16k74aTAyLJ/zIkahKUg1w7UNIxL2Z58hK
         fk8vmN+uQAb5SE9fFvMMy/E7CgwjBoRLqxPbhlBQakXhYpYcwHbFixiydjZJNyZ9utZx
         3IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uat4KKFWFTv62YT5M6WaCwqb7xUKW28+Vl+bOiwpUa8=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=PEjMKVMTap164LLCX2TSNLEGJ6EJEWDCAhgPiFGPLLaOAhBohUbW71razZ9UEp0wO4
         FMKCHThHnTtOq2D8nrrgh2/QQX9jpu1m7s/fg5J3ekwMwcXGzvruw/oPLC5a9mwynZAG
         JTIQhc19pfwMuSKYP7DIuPJg5UdNSV9noaG8mr9VYQVy5OLDyhJ9mqTYL3nEL0Ff3Mjb
         SBALtNZHTXqx98OjBRE277uYmD43MydzcihhwogLknxlSqpxxb1DHYUBtLmIr+lLLP+f
         ZspY9EO4MNk0ql5CO9B7ymWEeqjY0ly4V72exi+cmirrnRbw8JqZMDQveWmjXM2yYRM7
         kZPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771392955; x=1771997755; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uat4KKFWFTv62YT5M6WaCwqb7xUKW28+Vl+bOiwpUa8=;
        b=M0AK4Rh+0Boze31j5HLthkPeVoQ3kZVT24qaa+XEBa/oLVFrQbKsJ4str+UYjYadkH
         6eM7wXuwtkCAblmUC4EYrTJHDZt5+WNbSwA8+osbbpMoRhiDw5bMEiNDMMppR3cHUANJ
         BjvsWx7HvZpVVgXHa/fwnAX63T1IDh09zEByPwFnQztXt420Rhy8BLlr9odBRyzTFS3b
         Azr9kYuWOxb83gYJc9dWbjCibxsxEsw076NjhibhAWLKtb8T+PawGjf8oWx9Dnuo8k73
         uAYM8UDjvAthkP56hmL/AjPL352nL0o79LBOV7DUysDULF6qcI5mnQ3miUJZAzij4kO4
         prng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771392955; x=1771997755;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uat4KKFWFTv62YT5M6WaCwqb7xUKW28+Vl+bOiwpUa8=;
        b=uKNpetHyTfAljYhG+N257Pms49ZKuCmOW2fA5X8/vPjqGVFKv1mT2xMt/vsGRSE7ff
         j5ySGpsUwALMThBl2J78Bh+oYAVoDUPweGqfCaIpFjxyh57oUYAQyce71vIC8l0M2XyH
         SSaPHgTtfOhntE5lwBohB6as0rZPgyfiYZalK6YiHNwu7TIbS4yDbFebagiD/TnTSnnY
         0M8raeBNzFBpmB25+il+i+rG8+uGArRd/8Bu1Qq4nmN57dSEIQc3BY0f45Dw5r8hlx79
         EMasYLQqYMh5fwbGxyEA8u9GohsGlqVGT7/OAjyyf8YjsjQm9jdvS/wNzK6E8btsi3MF
         kvPQ==
X-Gm-Message-State: AOJu0YwxKtml5q1kA4gYab1d2BZAuxOTRppdw2JKpBzPGCUZVzixzxtL
	OpCuQdgyTEf0mjWSkUhDYMN03NNkTRZC8Kx0LKrejx9xMCOc5zkuTiRu72f5h8ufvkQAcVvPBPO
	8Ljn+1uH8hanq0kcVOXPBWPwtJuIGErm7gQ==
X-Gm-Gg: AZuq6aJ51LnrwKELfi85fRkNWl3SSf38d+kbh1dbvcjNCD9TVcwUurOQQ1XxI2aMKnM
	hIEppASdipZiZadqfL1qtbFX/B9mrWrqxcxLFHjJw22DYiV4DCZsmdLZVQcrEGJWFJUtZGuZxp2
	ql1FTAq7mP9s89msWWyHpvnQkAPKnH1qU4kybdWszPdV0eGOpzGFgw7IW1myqE1ICGuh69+AbSD
	aivpNW1lDuj04kKrAkFbgjyEERDoC6ORyWek7Dq3mQlb97ai+F9WardZEl361vpom0bTBCHkE3V
	/BWLmZiqocRV6cMSDJDA/r1HV85VxQjFo0eY+Js=
X-Received: by 2002:a17:907:7253:b0:b8e:a143:3ae1 with SMTP id
 a640c23a62f3a-b8fb450a4e5mr925330566b.54.1771392628229; Tue, 17 Feb 2026
 21:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20260211072322.79206-1-moins@kpit.com> <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
In-Reply-To: <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
From: Shaik Moin <careers.myinfo@gmail.com>
Date: Wed, 18 Feb 2026 11:00:13 +0530
X-Gm-Features: AaiRm52Ekl7Aq-SV1A58ecvr1kEKyW3rl0cEKOwBMpHcEPk_Tur3Irf65Ygnhpw
Message-ID: <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005d0874064b127c19"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231282

--0000000000005d0874064b127c19
Content-Type: text/plain; charset="UTF-8"

Hi team,

I updated master branch patch. Please check.

Thanks!

On Wed, 11 Feb 2026, 2:23 pm Yoann Congal, <yoann.congal@smile.fr> wrote:

> On Wed Feb 11, 2026 at 8:23 AM CET, Shaik Moin via lists.openembedded.org
> wrote:
> > Install libpcre2 test suite and run it as ptest.
> >
> > Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine
> (RunTest), and grep utility (RunGrepTest).
> >
> > pcre2posix_test: Verifies the POSIX wrapper API
> > RunTest: Executes the core PCRE2 test suite through pcre2test
> > RunGrepTest: Checks pcre2grep to ensure its grepping style matching
> works as expected with various patterns and input files.
> >
> > Signed-off-by: Shaik Moin <moins@kpit.com>
> > ---
> >  .../libpcre/libpcre2/run-ptest                | 39 +++++++------------
> >  .../recipes-support/libpcre/libpcre2_10.43.bb | 22 +++++------
> >  2 files changed, 22 insertions(+), 39 deletions(-)
>
> Thanks for the patches but, as I already wrote, adding ptest is not
> usually acceptable under the stable policy[0]. That also applies to your
> kirkstone patch.
>
> [0]:
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_Acceptance_Policies
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000005d0874064b127c19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi team,<div dir=3D"auto"><br></div><div dir=3D"auto">I u=
pdated master branch patch. Please=C2=A0check.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks!</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 11 Feb 20=
26, 2:23 pm Yoann Congal, &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoan=
n.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Wed Feb 11, 2026 at 8:23 AM CET, Shaik Moin via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; Install libpcre2 test suite and run it as ptest.<br>
&gt;<br>
&gt; Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunT=
est), and grep utility (RunGrepTest).<br>
&gt;<br>
&gt; pcre2posix_test: Verifies the POSIX wrapper API<br>
&gt; RunTest: Executes the core PCRE2 test suite through pcre2test<br>
&gt; RunGrepTest: Checks pcre2grep to ensure its grepping style matching wo=
rks as expected with various patterns and input files.<br>
&gt;<br>
&gt; Signed-off-by: Shaik Moin &lt;<a href=3D"mailto:moins@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">moins@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libpcre/libpcre2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 39 +++++++------------<br>
&gt;=C2=A0 .../recipes-support/libpcre/<a href=3D"http://libpcre2_10.43.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.43.bb</a> | 22=
 +++++------<br>
&gt;=C2=A0 2 files changed, 22 insertions(+), 39 deletions(-)<br>
<br>
Thanks for the patches but, as I already wrote, adding ptest is not<br>
usually acceptable under the stable policy[0]. That also applies to your<br=
>
kirkstone patch.<br>
<br>
[0]: <a href=3D"https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#S=
table/LTS_Patch_Acceptance_Policies" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stabl=
e/LTS_Patch_Acceptance_Policies</a><br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000005d0874064b127c19--

