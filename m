Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA52EB8FC7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 13:04:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.8132.1694005447614604805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 06:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DNDzyQZQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.46, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-500913779f5so6108380e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694005446; x=1694610246; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87altraATVq1aB9gHPFz3Rjpyv4xKiBR4HtBkMUHGrE=;
        b=DNDzyQZQynNqBqhjUJN3LIs43XMGrp6vhsRzvJKiKyIUzpMepfE601cZlJ6/wEVNh0
         BhiKtagRKR6rX8GWZXK6E+lE4Vfgol2v/BS2FRU4H04wH71AkOtjWU02HWpEhm9MzS9L
         WUVOwAy0P0nezG9D8QJCq2MK8wUNpc04hWFwe6gPPh5tIQJPiPOMbu2zuf8hjDjDQtQw
         FXvEn1pAH7n/Z3eE8eCGipYvYGIV3J1EVS+37zcaM0ACK9fhDR6DDB7KFc7agebsr+QI
         g3RsDgfbDaUZxkW0rnxIJbQYxK7KbOambr8iLgd+P6ls/RWPq0lEEQvyR5csWYE1lvXx
         J0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694005446; x=1694610246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87altraATVq1aB9gHPFz3Rjpyv4xKiBR4HtBkMUHGrE=;
        b=geoWAueLG7ap0nGzz1DYyCzBtnkMl6Z6Dej+BPPX5lv5MGP56iSVv+6ge6SIYalOzP
         hwfUTp6i74FfHr6CHD2xXGPVKFQUb05yWyUJ6OqWSKLYsvc1rkf1tSpE3mfsNh9lXVId
         sJ01s5YIDu8k2qHPT/bB88Tdk/tR2jHtnO/teDB7YwMF+LHw2cgb0POa60xbdY89HDBu
         WWvwL9eLi6+bjokZ18fD4g0wRbazRrpp0yOvLBspQZxGjxhXmNp0AUfITjCSPfr/C0Yr
         Y/ehdgJ5vrnnrC5FvRrIddka5Kwp9sxs5jD0Mz2fjQT3lVkkPZUZtMb2Tbf0+83ySrQ4
         nAKg==
X-Gm-Message-State: AOJu0YwKh1WUyMC067wfk8BRo8xbdm2jQkRjshUUZDEswri/40LMNbsE
	elKyimzLTT5Naydn1nq4rtspmvA9FcrSU7fIu1PxgQ==
X-Google-Smtp-Source: AGHT+IFpKAuDTnk3ybYKSQ376xQT88uQkwCVIbUcTsEpWjGm4iVzPMMtNDxyoP4TGAYlqPC0PJ4yu2ntMH2dBO7/qnA=
X-Received: by 2002:a19:6452:0:b0:4fe:ecd:4959 with SMTP id
 b18-20020a196452000000b004fe0ecd4959mr2230098lfj.32.1694005445425; Wed, 06
 Sep 2023 06:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <CH3PR11MB8093D7EE35C56F96C8EBBE6CB9EFA@CH3PR11MB8093.namprd11.prod.outlook.com>
 <22222.1693993559459898022@lists.openembedded.org>
In-Reply-To: <22222.1693993559459898022@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 6 Sep 2023 03:03:53 -1000
Message-ID: <CAOSpxdYz_84ehfqsnL44-99F7rdSCEKGeyKXfcA0TY+-xTH5bQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2022-47008
To: Deepthi.Hemraj@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187312

Hi Deepthi,

Thanks for helping with CVEs.

In the future when you submit multiple patches for the same recipe
please do so as a patch series.  That way I'll know what the intended
ordering is without having to examine the patch content.

Thanks,

Steve

On Tue, Sep 5, 2023 at 11:46=E2=80=AFPM <Deepthi.Hemraj@eng.windriver.com> =
wrote:
>
> Hi Chee Yang,
>
> Sorry for missing out the patch file.
> I have sent a separate mail that contains patch as :-
> https://lists.openembedded.org/g/openembedded-core/message/187288
> [kirkstone][PATCH V2] binutils: Fix CVE-2022-47008
>
> Thanks,
> Deepthi
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187290): https://lists.openembedded.org/g/openembedde=
d-core/message/187290
> Mute This Topic: https://lists.openembedded.org/mt/101188282/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

