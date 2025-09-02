Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F8CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 09:43:07 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.73102.1756806181664730077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 02:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gT5P/ga4;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7211b09f639so5134816d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756806181; x=1757410981; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw9Vmf4lVAB7O6Hz9LRRBq90TumLmFBhDliH2YoXFuY=;
        b=gT5P/ga4EjIt5XF0qEQP7WHjsC2B9AdHA6hdoKEUFI3rQgaCaHp5UkcLB7LfECDoAb
         JrNSMa39BfOpKg7SxWap80te1CyLUFNq+ViM0ixYAWTgLFmmjoPWc4hzrnBZJVLQs9aT
         B4qrlNnZvlvHYiHH4kV7ZXr26Mxq0dPu2upAKW1MfpCxZZjEkVaO18AmaNCI8KrZ2v74
         JCTDQG+A6yIAkQ2tZKMNYhc3tXPnpEG923WvzO0VqVH9yavgJHiIoZLaxbKedT7apB6l
         xBBwX4UCP7wVISJ0R0YaRh9sCnKMl6pCn36rdimclAeTLSrrcjiOg0fne92xVocxGAmF
         +fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806181; x=1757410981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kw9Vmf4lVAB7O6Hz9LRRBq90TumLmFBhDliH2YoXFuY=;
        b=ry7kxmpoYvyuREoP/3vmlvLuhYwg24D9Vwt2gCe7ymEKlfnFmUzIm02D0iAaMsZvzl
         COq4G8bXOsTOUaVwj/vApeOxNP/pzvMb7PqVpCqZIW1B6m/4Z6pLrqVJdddlCrx8/IK5
         sl9/v+/On+iQMkTKgYQdo678Qh5spYDhwu/V9608ENSQG1p0YXH1FXbFr/I9pCF5rWgd
         PIak7VZS7mWlEXpCN0OGrpotCulcUErFFVRPgO/3h7PUQBrps7IS3VYyvl5MtS1u+4Q5
         ubCt+Kb/TFKqrmok4CXoJ1cWTurQAQEzFkXUMDXHeSbtcbVopUscDcaOUNtEFrxU1Rd3
         Z+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCX39nswXaTJ+6OaJmsDXksuwvmClMnloJVv6tkXsmOtADdvwR7BZajYzBtboFRvjMgYLXjo/dO1OSA+BvvLnWXHQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwnN+M/GcgJk/cUtvjGgC1XTEmf0+N8xxW7XGJyKWKvfxbfsja0
	BDRJqubhwMjU8T//VpoEoCAd4ktvBP4KKEfvGJWMQtfRisLGEHsYU5QBNFwEwlzswkY1vTGlCVf
	4mZVIWdGPMsevNJ8qDoCnkbt8svghNys=
X-Gm-Gg: ASbGncv92mxXn/JuVLGDuSsynSL7LdUaHbMLALMbGNjkFBJX6oVlYeBAoKeMDMC2Fwz
	KlilPi3ko3kIihopEdhy7lKby2ABxmakmubYkDGp7lIYC2yDdUYjUHcxBt1zi3fEyJqyQFdn/I1
	UYTf0A8df1inGvYiWdAii5YBe4XPBA5Hi6+9wIGw6Ys+/lcEiQmtETsNdpFFMm1MOtMyuP025wI
	xz01q2JbjdZ8YI47PjEnWqkzpLpjbtmi28fW9lUJhzBQ6zWT/tNiKT6rh52bXXd2wmmfRH17WJu
	mZa8qOYUatAi2g==
X-Google-Smtp-Source: AGHT+IElAK0RLV2gm6zabbaDIwrwc9qzF5QdOYl0T5f5Tpbbl1DeyV5znilwGrZne9fdZbapaVCvjZO558OiRij5BwQ=
X-Received: by 2002:a05:6214:1256:b0:70e:1cd1:238d with SMTP id
 6a1803df08f44-70fac89406cmr126526606d6.39.1756806180424; Tue, 02 Sep 2025
 02:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749554012.git.liezhi.yang@windriver.com>
 <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
 <2420FDDE-F7F7-4A02-8696-66554E56924A@arm.com> <b38d42b5-c6df-4bcf-bdeb-b3cc32808e1b@windriver.com>
 <87a6b6a1-c221-4d26-946c-d9c7deb5bac7@windriver.com>
In-Reply-To: <87a6b6a1-c221-4d26-946c-d9c7deb5bac7@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Sep 2025 11:42:49 +0200
X-Gm-Features: Ac12FXxT_eCVschf3mv0zJLonkbmwAaHB21LYCHQma42o25NS6C6mlRQRANlC0I
Message-ID: <CANNYZj-yPFRibYvBsz84hv+wB2VG2yjU_MQoUU_W73+D14KHqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] automake: 1.17 -> 1.18
To: liezhi.yang@windriver.com
Cc: ross.burton@arm.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222721

Robert, can you rebase to 1.18.1 and resend please?

Alex

On Mon, 16 Jun 2025 at 17:38, Robert Yang via lists.openembedded.org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi Ross,
>
> On 6/10/25 19:32, Robert Yang wrote:
> > Hi Ross,
> >
> > On 6/10/25 19:21, Ross Burton via lists.openembedded.org wrote:
> >> On 10 Jun 2025, at 12:17, liezhi.yang@windriver.com wrote:
> >>>
> >>> From: Robert Yang <liezhi.yang@windriver.com>
> >>>
> >>> * Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patc=
h, it is a
> >>>   warning not an error any more, so just drop it.
> >>>
> >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>
> >> I still request holding off this until the rebuild problem that I=E2=
=80=99ve seen has
> >> been investigated properly.
> >
> > I've replied in V1, did that address your problem? Or how can I reprodu=
ce the
> > problem, please?
> >
> > The automake before 1.17's mdate-sh couldn't update libcheck's
> > doc/version.texi, so the doc/check.info wasn't re-generated, then we co=
uldn't
> > see the build error before.
> >
> > I think this can also address Ross' question about rebuild libcheck fai=
led
> > with automake 1.18, it is because doc/check.info wasn't re-generated
> > with automake 1.17, then we couldn't see the error.
> >
> > And for other recipes' rebuild, I've done the testing with:
> > $ bitbake world
> > Edit autotools.bbclass to triger rebuild
> > $ bitbake world
> >
> > All of them worked well.
>
> Ping.
>
> // Robert
>
> >
> > // Robert
> >
> >
> >>
> >> Ross
> >>
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218830): https://lists.openembedded.org/g/openembedde=
d-core/message/218830
> Mute This Topic: https://lists.openembedded.org/mt/113567518/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

