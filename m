Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B263BC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 18:29:39 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4039.1782757773086141655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 11:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ql4yXQmK;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6649ffb1d01so2664289d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757772; cv=none;
        d=google.com; s=arc-20260327;
        b=kUTkKFSIDXMdWkYG1l+s2W1gNx67rVYRo9746E2USStv2WQYfLdb+o7up04d6+UGIn
         6fxehxrSzN4FJtAfpSx1nAIFivSBcYPCQ6jv1bWdXI/yOpt+OFoIG85g3DWD3T0PJR/z
         PgVZSfuMjGKG1WEqNJyLcfSQbnd56Hxut667TNAV7e9nyF1EBhUHgN8bJhaNNBvL0tyj
         6XtPM8JOd2miChPIgekxpBVGXmeerCL2OT8I1rG1osNkFYhUwU1tqnZN6evwWEl13OAV
         6LC69baVGIkBKM/uK4XvXQdjxOJR06G+l+EqJkvWFNrK3Ek+RY5WcMPUJgtW7B1uuVNi
         oJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6Ix/SYt3VJ+Uj5FRhzb/UcvmvFB/DF8IetVdwaWN3U4=;
        fh=zIq79hwLI19SakoAky5ZnsIxm8+B5hmkv2Af2fNAKeY=;
        b=FhVHz0I/olObcLGttcyd0ircGuwAKhRoPrrb+6+auKpNhb4okd8mAuUr0hRmT7k9oR
         U95p0JOezo7V7la1L8e0Bw6QID9zvk1RNDWyAvoBIMfad4mCy73qqODQA9L7NZSmGrQ8
         ooqVgqUSBFsh0cnWoWS5bdXOBXn5GQuU/p2M9lgPK/seHwTUNJq08S3py5xqraMvLb+v
         jDLWJnDfogjz2LH4mQ9xgB0hZCw3qgtN8pPu4P0fuHBZMcanEZIhPdWsTrYH/u+LqRm+
         wonXsPTGYfZgpABRcr/8l9TRHYeq5nACQHkZa92pIgCIgJN6ikSWybHMMTwopSb9gQPO
         gGyw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757772; x=1783362572; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ix/SYt3VJ+Uj5FRhzb/UcvmvFB/DF8IetVdwaWN3U4=;
        b=Ql4yXQmKUI6xuv+PYlbzs2RhhuwvkyQlXrZaW7KFyZAxx68k0UvwjPBJ7xiOHOTtqR
         RKPj4hhOqZ8CO2O9ZlCe0XrRp1YreHSA/6X+2ZqgPMzc0pSWQXmuX/wH1OSpod2FU+si
         xTy6gIem8rwQ6+ahkypiAVXwtWp9me7s03EM1WQLViKocVrRrcK/eD1A1L0qPXKSGQMU
         +p6UlRFgKDSLeenr1UF152f7K4fKlgwpUGc+HVGFEjyFmm5KcUpxzEiMWBGjAFMcAxUn
         UU2zXaus2m7BT8vFAYNQeGGB8HX2x/BIRyRpwik8pGQZJ4cgTnEpsmz05yrUSvxvJQuQ
         bmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757772; x=1783362572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ix/SYt3VJ+Uj5FRhzb/UcvmvFB/DF8IetVdwaWN3U4=;
        b=orbXbhxe21LzHp/44wXOlIP01UOkUtbuZUl3K+3FKn+kOY28CWirYdhJyGrru4U4+V
         kMxGhKpYoGzRpqggyys2qmWN/o5x+Pq/rdcNmiarz+SD+1mkWFCyQ2VRoBJII7zQpBut
         aGB/0KnSVT2mik89s7grfcVlZJkni7dsZzb8/K1Sb5BPwdY6ja4eRpLERcMCImdX0rNH
         xQ1ikQ8r7Tkg+LtsDyiWoccyllw5QM/eTlLTYmUvAbnZdIPrM6ZkT+SiKUKW3UrF1hPe
         GsYiIHpnJJ7uz++EAjvp3hnGhTLXLg43GMZh8/MjYAKjmIU3Ej+mXnU5t+oln32JPgdI
         v9KA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7RnpUlXR1X9RrCG/b41up7eyS4EjWIIKgpEMkhVLsNyvQoyJsXaZ8Rd8O7QafSR4rHUHyUHYgIrWqbP+Kd4P6dg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9Z4H7NbIrbzic+e7MJO8TO++1cAAFZCw/3+L3OL7nnzL9MCCF
	6gcq3fW8svnr8roWD8gFFD3Fdsa3Wcy42Tkib2qK2bJU/1USFqU43ooqaFNxCk7BVLVEL6m6gZn
	bKkgV5ynfDK41fRPd3nX3pPcdlOIa8FI=
X-Gm-Gg: AfdE7ckkk+dd3C5tBkIlSdxiv8InXT2el+Q8trt2MuY8SJl3zCpSewUw+am1fz2CNbn
	p0Rifhqc2qoMbzQf7aFrO2G2MMZwblIbnInGBUB5a/lKxdKR4RCTyE1rkTZ3z/vzOvCtouGF60M
	0eufilx+tSVEcmMnAZjRoZX4kZdmo4gPwElTWqLfvBgyvVJMM7eXpedS1moo2YlgcFiInnzOQGh
	ORVZ49TuJ2nEyIWS2C3zBwJ0V8BuErMNRyWjUXpBPUPmIyXyvh4jI7twEYrGLLLrv9wij56pFS8
	uPXxmpC/ILNve9lZ5ubRBg==
X-Received: by 2002:a05:690c:670f:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-810d9909043mr7314777b3.42.1782757771989; Mon, 29 Jun 2026
 11:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154904.338233-1-jan.vermaete@gmail.com>
 <CAJdd5GZJUmZDyKng2u2qSz+YWkchPZtLMivq-z12C9s9UrD2AQ@mail.gmail.com> <CANNYZj_Tpj9u7ZFkL=DjLpttRcesCdyPDXdWRj20SXBB_coPZw@mail.gmail.com>
In-Reply-To: <CANNYZj_Tpj9u7ZFkL=DjLpttRcesCdyPDXdWRj20SXBB_coPZw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 29 Jun 2026 12:29:20 -0600
X-Gm-Features: AVVi8CcjE8HqpEydHpCiD3q-0R_mDrL5Jn5NoHcKlNzF5ErrzttYxam3beE9TTE
Message-ID: <CAJdd5GZM_EfthrxzaD7r24qERamc8mT3sonWXP9vP=+crTT-ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pull-spdx-license.py: add the SPDX licenses exceptions
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: jan.vermaete@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b855ff065568a3a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 18:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239821

--000000000000b855ff065568a3a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 12:25=E2=80=AFPM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Mon, 29 Jun 2026 at 20:18, Joshua Watt via lists.openembedded.org
> <JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:
> > Thanks, but we can't actually use the license exceptions this way. The
> problem is that exceptions are only valid after an spdx `WITH` statement
> (e.g. "GPL-3.0 AND OpenSSL-exception" is not valid), which our license
> expressions do not support. Also, it's better to keep the licenses and
> exceptions in separate files so that it's easier to distinguish them when
> parsing.
> >
> > Regardless, I have been working on converting all our license
> expressions to valid SPDX expressions, but it got sidetracked by some SBo=
M
> work. Part of that was somewhat similar patch to fetch the exceptions. If
> you would like to take a look, the branch is contrib/jpew/spdx-licenses. =
I
> hope to get back to working on that as soon as the SBoM stuff is sorted o=
ut.
>
> A related issue is that lack of support for SPDX exceptions holds up
> correctly specifying fmt's license terms (which is 'MIT WITH
> fmt-exception' if I understood you right):
>
> https://spdx.org/licenses/fmt-exception.html
> https://github.com/fmtlib/fmt/blob/main/doc/LICENSE-exception
>
> The current recipe says simply 'MIT'.
>

Correct. In the short term, you can make a new "OE" license that is
"MIT-with-fmt-exception" to capture this (we have examples of this already,
see Apache-2.0-with-LLVM-exception), and then once my changes are in you
can change to the correct SPDX expression "MIT WITH fmt-exception"


>
> Alex
>

--000000000000b855ff065568a3a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 29,=
 2026 at 12:25=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Mon, 29 Jun 2026 at 20:18, Joshua W=
att via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a><br>
&lt;JPEWhacker=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; Thanks, but we can&#39;t actually use the license exceptions this way.=
 The problem is that exceptions are only valid after an spdx `WITH` stateme=
nt (e.g. &quot;GPL-3.0 AND OpenSSL-exception&quot; is not valid), which our=
 license expressions do not support. Also, it&#39;s better to keep the lice=
nses and exceptions in separate files so that it&#39;s easier to distinguis=
h them when parsing.<br>
&gt;<br>
&gt; Regardless, I have been working on converting all our license expressi=
ons to valid SPDX expressions, but it got sidetracked by some SBoM work. Pa=
rt of that was somewhat similar patch to fetch the exceptions. If you would=
 like to take a look, the branch is contrib/jpew/spdx-licenses. I hope to g=
et back to working on that as soon as the SBoM stuff is sorted out.<br>
<br>
A related issue is that lack of support for SPDX exceptions holds up<br>
correctly specifying fmt&#39;s license terms (which is &#39;MIT WITH<br>
fmt-exception&#39; if I understood you right):<br>
<br>
<a href=3D"https://spdx.org/licenses/fmt-exception.html" rel=3D"noreferrer"=
 target=3D"_blank">https://spdx.org/licenses/fmt-exception.html</a><br>
<a href=3D"https://github.com/fmtlib/fmt/blob/main/doc/LICENSE-exception" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/fmtlib/fmt/blob/main=
/doc/LICENSE-exception</a><br>
<br>
The current recipe says simply &#39;MIT&#39;.<br></blockquote><div><br></di=
v><div>Correct. In the short term, you can make a new &quot;OE&quot; licens=
e that is &quot;MIT-with-fmt-exception&quot; to capture this (we have examp=
les of this already, see=C2=A0Apache-2.0-with-LLVM-exception), and then onc=
e my changes are in you can change to the correct SPDX expression &quot;MIT=
 WITH fmt-exception&quot;</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Alex<br>
</blockquote></div></div>

--000000000000b855ff065568a3a2--

