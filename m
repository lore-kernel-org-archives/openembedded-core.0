Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2024FC3DA45
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 16:13:49 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.83965.1720455224304442893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 09:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SpwqE1Ru;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5c651c521f2so1807186eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720455223; x=1721060023; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaGheH0tyuGub1G8jS+Zz90UyOhWoFkWXbfDpR/19sc=;
        b=SpwqE1RuBX7jx0yvz8jp3Qc1XTNslygRuuUUVmjVaE0l+NvNZX+wc0UyMEEU21rEwf
         7elaTMDLZVe/IU4HfLPdOzP1jX+hfEiYHIaWJgQHj1rbKB8ecdfOmCv9kYLO2UjogVNF
         u1CvC0tGgDFVvym18vXt0+GlSg5N9GZiJx8I98ysLpfhjhmUC7vdY1nGWoGBvOW/xeBw
         esTo9Ep7ADhqNm6kDnGmx5k1hVeMfbEQcw66dhHXRkEGuoGGETCBmVeJrHHB39U68qDp
         6CDBsQnYxpGqOTVfgagNj0I0LjDPmmynebhVudePsgTfhLTH72fTnSx8XqqxeqVfYept
         YeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720455223; x=1721060023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaGheH0tyuGub1G8jS+Zz90UyOhWoFkWXbfDpR/19sc=;
        b=GifvY+fPstiRsKwrzb8nXeGuwcS28p94vl36ds8SLhYd5JAPHNKVAotkN9aYKP/YPK
         ZnDChShvnTjfj8/Huv5FTP9cOnfBcSRpMCow980hORTP8jixN3sm/U0mrxL41Agzcy55
         dIbC/T+gJHtAH7kZAmZgFYo8E+XiumtYZK43j8qpbbPg+OWJNs7qVAb1/IugoIvkfOzK
         NvDixFhPUPlnWrksq+URY4+SQ/Y+/BXvxXPOnS/E53YIV1yByvyZF+2yqJeJEZPVUZUw
         HBhOitPePLYpIZqtTWoM+tddfL3lHKylLhawab5oTuva0cnzXlX8vk0F4kfERn5oJrA7
         7XAw==
X-Forwarded-Encrypted: i=1; AJvYcCU50lPcTY+Rzq+7QVNWYgD70h5HFKivBTXnABM/QcN/W2BSOoJky2sDPvHjrYid40iKIpxAUrhrvEk+JbCOM4L8xcwk+VjQFcnT5YjGITbu91jZqlv1JwqZ
X-Gm-Message-State: AOJu0YzfRHQ0LF5woz1xyyZresZyFq7dXVL1oCafgVS6T77TY81URaNf
	GEwUWRetJQf5OHL8fjmHCw+azJOFs3sQdBJNkYmGVdhJjGTGyX1SxAJzmfy7/33kzeznPCzM1Lm
	GRB4Y/MqIJodwtdbSrSP/Dx4O+LkKRQ==
X-Google-Smtp-Source: AGHT+IGen8OjPpDxpwCQxn6Nj350QTzs0dYZn20nskD/uV5hi+aUo6l7cIGdrpQIsOkX5kuZ/jD9pB3Rz2r+2e1zqjA=
X-Received: by 2002:a05:6870:1c8:b0:259:8420:8e3b with SMTP id
 586e51a60fabf-25e2ba212femr10317972fac.21.1720455223383; Mon, 08 Jul 2024
 09:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240627070339.2066255-1-mingli.yu@windriver.com>
 <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
 <7e47a093-f395-4413-a069-4435942c84bb@windriver.com> <CAMKF1srF+BXye5k9dGNVEvAj1D8Y3d9b8FXcU21-vCmWCC+31g@mail.gmail.com>
 <202407011633012c576264@mail.local> <D541F29E-5518-4F7C-98C9-AD05E76E1F2B@arm.com>
In-Reply-To: <D541F29E-5518-4F7C-98C9-AD05E76E1F2B@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jul 2024 09:13:16 -0700
Message-ID: <CAMKF1sq5dPt6ryo6-dcq_tFg4CnXpmrckxexMznNa+-oaSfrNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
To: Ross Burton <Ross.Burton@arm.com>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201634

On Mon, Jul 8, 2024 at 8:56=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 1 Jul 2024, at 17:33, Alexandre Belloni via lists.openembedded.org <al=
exandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > On 01/07/2024 09:19:50-0700, Khem Raj wrote:
> >> On Mon, Jul 1, 2024 at 1:25=E2=80=AFAM Yu, Mingli <mingli.yu@windriver=
.com> wrote:
> >>
> >>>
> >>>
> >>> On 6/28/24 02:21, Khem Raj wrote:
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>> Do not click links or open attachments unless you recognize the send=
er
> >>> and know the content is safe.
> >>>>
> >>>> I am seeing two XPASSes which is ok but the test runs reports failur=
e
> >>> back
> >>>
> >>> It is because the two cases defined as XFAIL_TESTS
> >>> https://git.savannah.nongnu.org/cgit/acl.git/tree/test/Makemodule.am#=
n1
> >>> and per
> >>>
> >>> https://www.gnu.org/software/automake/manual/html_node/Generalities-a=
bout-Testing.html,
> >>>
> >>>
> >>> ```
> >>> In case a test that is expected to fail ends up passing instead, many
> >>> testing environments will flag the result as a special kind of failur=
e
> >>> called unexpected pass (or xpass).
> >>> ```
> >>
> >>
> >> It=E2=80=99s fine here we need to treat them as passes so the return f=
rom tests do
> >> not confuse the preset runner
> >
> > But if we don't get the expected result, isn't that a failure?
>
> I just spent a few minutes doing some git archaeology, but nothing useful=
.  Both tests are marked as XFAIL which could mean =E2=80=9CI wrote this te=
st case but right now it doesn=E2=80=99t work correctly=E2=80=9D or alterna=
tively =E2=80=9Cthis test is meant to fail=E2=80=9D, but there=E2=80=99s no=
thing relevant in the comments or git log to clarify.
>
> The patches look like they=E2=80=99re fixing actual bugs in the test case=
s, so I suspect the tests were expected-fail because they didn=E2=80=99t ac=
tually work. So these patches should fix the tests and then move them from =
XFAIL_TESTS to TESTS as they now actually work.

an XPASS is like a failure unless its is reviewed and deemed to be
correct in that case it could be moved into PASS category. so in this
case it seems they
should be marked PASS after the fixes but maybe they were still left
as XPASS due to some corner cases or simply to be baked for a while to
find more corner cases. We can patch them as PASS and move on perhaps.
>
> Ross

