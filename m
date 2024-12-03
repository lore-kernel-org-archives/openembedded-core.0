Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E27E64AA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:44:44 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.19727.1733233481749173008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f/qykmJe;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e398484b60bso3866076276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233481; x=1733838281; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPvvO7ic5PGT66SKXfMA8h4vPLHwIvnJ/IFB2dq6f9Y=;
        b=f/qykmJenGNSN1W3mXEBFO1bvTgXigpoi+t4rvsjQ2axtCprWRm4kyXi1NAxofVAzB
         1zaUBSrDm9LQHg8aKizCcEU79lfhBHAt5xCGcoez2AJkCogMxyDe5poExdmQGXowwxuv
         x4MRRh6m1pXRq2KdPAvfn6k5svvtQt1DFpOD5NcFWU2ETMeHMsJ8aulKfYY/nBeC+7Wn
         If01s6plhVINZhu+0PB1kKy6eNTxsQbeYCkLHFvRbEQ3eTJgQ/o/DlXxwNVUL8QJYeTr
         eTlNqWg/ViPU1bG9fJpEVF3ixtPZmO/FCp9/LOUjh9OsWNyhXMrmAQUbkJalQrZo6cga
         n2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233481; x=1733838281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPvvO7ic5PGT66SKXfMA8h4vPLHwIvnJ/IFB2dq6f9Y=;
        b=GMPLzC5kzKBAB9GRI7aqwRdG20jNMPefb441lmceUkOY0wgdTkztAg1G8f1CE5i5jK
         SJzeUkiMb+n741VkthQFM6KtklI3ozerkYWA0zhh2XZD4Jha78XjKkqBIgQmrknS/a2y
         rQYkj/51eTt1Qcn8+VKEhFfoRrPbLbLbvzSTNH0a5sapoPTF4yJSCEiNvMCNZriNOc4l
         E2pcf3DrErPZGupWGHivDLsswJqgzvg45GvGrSoBwR38wPfJkpfEV/LuDLxP0Z7kzj4W
         kGqD6a86GTzFcmibEHGOXMrurmsHt4G2h5nw6JsafZaPgjQgSd/zx/PhiEnU92FkYpuJ
         AlrQ==
X-Gm-Message-State: AOJu0YwSODx9oH9HmWVTxysOTo64xkj1sjwXbj/pN86NsSPeF8HtYLmC
	2z7l3rendKSp2lg35nxXasG+hDMXANa5Xah0OdSftBI9kult1svqhWrhDTlg47X1ugxhK+QYv10
	qkSDp0Et4gMamiQJg9zsoV9Yb+w2Up2+PJ/EtkYyCjePsuwqY
X-Gm-Gg: ASbGncsqfj7wGxrxQGJbv97sge0CymfMqQx/nmu2i5iIyp7AhB3v0Og347YWOrjvoh6
	T92x4uvEbMgGw6Fs9UpzjYbskLZ6JUVA=
X-Google-Smtp-Source: AGHT+IGovnSQn6ZVJEAWxvqt7pUYOzEyhUYmLGaOlbK7pKlOn8zun6eIyQ1vXKSzqbZFgGK+8EcpAEgzfykuMrv9chY=
X-Received: by 2002:a05:6902:1b8f:b0:e38:b0d8:8972 with SMTP id
 3f1490d57ef6-e39d3e1a8ccmr2370192276.25.1733233480858; Tue, 03 Dec 2024
 05:44:40 -0800 (PST)
MIME-Version: 1.0
References: <87mshdgmcv.fsf@requtech.se>
In-Reply-To: <87mshdgmcv.fsf@requtech.se>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Dec 2024 05:44:30 -0800
Message-ID: <CAOSpxdZTVsmLg+=eGVzwsBNRbZF424V-nvTZPZ-gp9PQ1PcPnQ@mail.gmail.com>
Subject: Re: [scarthgap][backport] Fix packaging of stale externalsrc recipes
To: Marcus Comstedt <marcus.comstedt@requtech.se>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208207

On Tue, Dec 3, 2024 at 1:13=E2=80=AFAM Marcus Comstedt
<marcus.comstedt@requtech.se> wrote:
>
>
> Hi.
>
> After upgrading from dunfell to scarthgap (due to the EOL of the
> former), I discovered that bitbake would occasionally package versions
> of externalsrc packages that did not contain the latest changes.
>
> The details are in this bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15646
>
> As Ross Burton noted, this issue has already been identified and fixed
> on master, in commit
>
> 475759fdab7200488b2a568b2ba1aa31a456d113
>
> I have verified that this commit can be cleanly cherry-picked to
> scarthgap and does indeed fix the issue.
>
> Since this is a rather serious issue (at least to me, and probably
> anyone else using the same externalsrc recipe in more than one yocto
> build), I would like to see this commit backported to the scarthgap
> branch.  The only alternative for me would be to fork openembedded-core
> in order to do the cherry-pick myself.
>
> I believe the same issue applies to kirkstone, although I have no
> personal stake in it getting backported to that branch.  And the same
> for non-LTS branch styhead.  All other affected branches are EOL, AFAICT.

Thanks!  I'll cherry-pick to all of the stable branches.

Steve

