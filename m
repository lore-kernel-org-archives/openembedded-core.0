Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7F0CD4F33
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 08:55:15 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17298.1695372911823528536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 01:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=P0Nx3/Lp;
 spf=pass (domain: baylibre.com, ip: 209.85.208.49, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so7091890a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695372910; x=1695977710; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8iD3kbTPrHfS1xeU1dFl8PMMYQ8qUtH5eJkuFdwrqYw=;
        b=P0Nx3/LpLB9aaBACaS3t3kfIBB382qRkLYZT+1106j1loPgsmXSGxTKYuNh2pTgMWs
         pdzlH3OoYB6G0HYBn5YsE8HUabeJMKJc9qoKXj4Dw5MOjJ2Yw95cMHjKhCaZuRtM/DV1
         75SsK1MzvS4xTkrlckd6A3mdSuAejjy2DlgcXKn/CKdEyb1usk4DercD+uNpMcKNXv/W
         tajWvSZbnMe0db6qD3rw7DZaS6vJd/Fz98w4Fmoq+u3po/DcWviIypMWdeKtPt2wkn0r
         QWuSUZkRAbn9FJux04vG33E58osWWRcM1L2434EVAHRceygqsR5ewir+NigDBVlg6G4h
         sBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695372910; x=1695977710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iD3kbTPrHfS1xeU1dFl8PMMYQ8qUtH5eJkuFdwrqYw=;
        b=C0jLvQHaCHsfGiSIJQUvmbOJmc0CNsgBxq+hU3H9gHjSfQrtacRaYV23/wbs6hs+j1
         6/upDrlh3Tv75g8YTUXSHQYysalio3j+//M4xEdddJT7+7JLRri8Em46Ir24FE05HIhj
         hXPqofgKJcr5Tr53pyCexKYJRJ7bsQZDorwEI5OK+ff+Z8KhdODfIeiikBXs5xRpWSfg
         fF/qg3cn7OyMkm8aAJLY2tG0Ygn/1WnmhcL79/PsC8ajAzQZ8IbpNFdUsetVAAtR33P3
         RUKE6n0hT2hqnsRFG1T726So1Tnz9rFtewXD6XUA33cqz0m1HoYkRoo38GgOmhjUI4Q0
         WfWw==
X-Gm-Message-State: AOJu0YzrrfYkd92jC/UgmNPbC20REepeQr/RIkgIAezvDZHf/ArFDkHt
	IaEaID9P1xneyLSUT5oMIWcjgPLb0+INdDrP91TfvQ==
X-Google-Smtp-Source: AGHT+IHD67GuaP/R5eZ8m3K7yRSoUZdX0jfTjQGV+v+MnHeWp+1C46aTCVgByMp6eLIHD9tUnoq7mkmuK7MgZ+Npbqw=
X-Received: by 2002:a17:906:4fce:b0:9aa:206d:b052 with SMTP id
 i14-20020a1709064fce00b009aa206db052mr2938565ejw.27.1695372909604; Fri, 22
 Sep 2023 01:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230810132113aee9ceff@mail.local> <20230811080027d7b75a14@mail.local>
 <202308110845568593abfe@mail.local> <CAEHHSvaS6cuNeu3gidGmOnnRiDkOY-ST7M1+NS6BNk4S1Y0BJw@mail.gmail.com>
 <202309211311328bf3a025@mail.local> <CAEHHSvZ1aiq0hMV18xSmtib-pQaQ2o0ETDGkMGJbjwz9RHTb9Q@mail.gmail.com>
 <2023092121584606cdad6d@mail.local>
In-Reply-To: <2023092121584606cdad6d@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Sep 2023 10:54:56 +0200
Message-ID: <CAEHHSvbv5zE5E-s9sMxmRkd3KMdK-r=D76ym_hYM-OpH1DnpkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188088

> >
> > So I can see two possible reasons for that:
> > * MACHINE=qemuarm block quilt -t compile  is not using the machine I
> > give on the command line, but why??
>
> As I said in the call, look at this log from the build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5785/steps/13/logs/stdio
>
> It tells you that MACHINE = "qemux86-64" ends up in auto.conf which is
> then used by the build so overriding it from the command line doesn't
> work.
>

Hi Alexandre,

Thank you, I managed to reproduce it locally and fixed it properly. I
just force pushed my poky-contrib branch
(https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/bblock) can
you start a build? If successful, I'll send the v5 today.

Cheers
Julien

