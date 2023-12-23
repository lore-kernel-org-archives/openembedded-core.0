Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E5DC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 19:32:42 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.13166.1703359961460393619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 11:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HtFB4fSQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e39ac39bcso3125456e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703359959; x=1703964759; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMXN5pEImxxNBVP0PqORU5R2WGI8mdiLkk+rPAAobDs=;
        b=HtFB4fSQuLDegppX/WKk5Qwtl+/4P3k4iiCudYTMaZXNtlRc3BDe1m6//ZcBstK+Jg
         azC9c8ynKNOBzyD94cydEMFxyL6ZiyL49lJETDxCb5yGBYILKwNIDOTfgU5XbjZzRm+t
         5zr8IADsVaR9CSnia2rqIws7xN+361KLEDrm6XLuYxTOuU7eZbPhjWJhlRVEc5Piz7VP
         QLoenkzV+x5vMNxl0F+DwIlnZDj49UtrtCYkACDlzL8eyCAivzjy6iiptApFMtTfaiY/
         LmULfhTULZ8li6TJp1tEdheXQfCdx1krVP0FkGOkUW1zyY5V1Zp98htMmk9M2bwWANXc
         eHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703359959; x=1703964759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMXN5pEImxxNBVP0PqORU5R2WGI8mdiLkk+rPAAobDs=;
        b=TZ3E/sstOxyP45NbSgsW1GTFzxpKkTdnurzy60wW/Dofa2uqh3GbbhSyNxn3mLWN9C
         KxnJCdem4+Ar56H3wQO+zUTgbDRJMEZgJrMbVQlYpB0W2Ami0un5bDEMkGo0wAiyFZs2
         J8qsxiJKUVRRM35KoqLEIxqGQDdSPq3P50+L+aR7foBiVHP6rO+MrYMghcf4g/4MN21S
         TvMQhHnu1KlmbCmpqLtW0MoLAlxcPCVW/pvo2XZ87INR9UUMj1Hq1Znbxn/hriLdyCu6
         JnaoRDoemtfEdhsY6QRyLf6dYEXKV+Keq/reJ4TVI8oj52AvFHaHmqs92ai+elpPHI/E
         YLHw==
X-Gm-Message-State: AOJu0YxZbnTVekB9L0OGuUYe+Vw7LuJYSfTblBvPfpJlHEDzAShPoYvq
	YClqHGwkuZ4oznFXWbZmu7k7ZJH80Us3kO2ySpE=
X-Google-Smtp-Source: AGHT+IHDcH/0oDk2HlakP6dJGozwqwRluhcwnxHGnIVzqPBfqDbvSuAB488eprZDmMWfwsp9BrunHBCiixN22aYwJkg=
X-Received: by 2002:a05:6512:3992:b0:50e:74e9:69ee with SMTP id
 j18-20020a056512399200b0050e74e969eemr164765lfu.220.1703359959401; Sat, 23
 Dec 2023 11:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20231213094113.3981-1-alex.kiernan@gmail.com> <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
 <E29D8825-5868-4FB2-A0ED-B01299BBBF4E@arm.com> <CAO5Uq5TZfbe5HaEuV69T94WC0F6gytTkp-RCpaTKwtO1SoHKrg@mail.gmail.com>
 <CAMKF1sqoiM_dTGO2_J7za+OnsCX4F7i=rzUBbnhZQ2rRBFYyKA@mail.gmail.com>
In-Reply-To: <CAMKF1sqoiM_dTGO2_J7za+OnsCX4F7i=rzUBbnhZQ2rRBFYyKA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 23 Dec 2023 19:32:23 +0000
Message-ID: <CAO5Uq5RHiM_nKHZZVMKW0Dugepkr=X9ezofLcNXoaw-zd0ABFg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 19:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192886

On Fri, Dec 15, 2023 at 5:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Dec 15, 2023 at 4:41=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
> >
> > On Thu, Dec 14, 2023 at 10:28=E2=80=AFAM Ross Burton <Ross.Burton@arm.c=
om> wrote:
> > >
> > > On 13 Dec 2023, at 14:06, Richard Purdie via lists.openembedded.org <=
richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > > I've run this with this patch included:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/=
4082
> > >
> > > Same failure:
> > >
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231213-=
s13b67oz/packages/diff-html/
> > >
> > > Ross
> >
> > Thanks both.
> >
> > It does look like its just filename churn, but I cannot find where
> > those names actually get generated :| Suspect this will be a report
> > upstream and hope someone helps.
> >
>
> I think its the cmdline options passed to compiler-builtins crate. So
> looking closely at this crates build log can reveal the problem. If
> somewhere we have builds
> done in two different folders I can take a look
>

I think you're right... I've been looking in completely the wrong place :|

--=20
Alex Kiernan

