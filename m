Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F661D6ACE7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:10:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39473.1766056215266317503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 03:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xe/4RlR7;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so3692045e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766056214; x=1766661014; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvjI7ZVwQy63LIShq6vPbBLy73jrydK8zQBts+0OMDs=;
        b=xe/4RlR7yiZ6+m3bji+7v7g5+LRXVQShNeE3s06IWyYECI8TMModXOJZt8c03vrBb+
         4frUNzm+dGMzNb0yMdqW9XM+0kd7sxTThuUCjewEZMrku4CPUk58DydVPHAcC/1IiqFW
         zVK263gG/2UZ2sEN6WXrbcib5ZufvvE2uzLuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056214; x=1766661014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvjI7ZVwQy63LIShq6vPbBLy73jrydK8zQBts+0OMDs=;
        b=w7HG1kVyUEGTDDt1tRRf2WZplVXUOaJ1rpa9wXJsUJcT31SnRLRRtDM0uMEDk4EDgJ
         4XovZpNEIvI6Zqr2AijtxGQxpR5Lj7UOVDsD+CivGGdHzFZInaEFtOU+uQS1HXenSJVN
         zIYT11b7xSxlA/e2yct/qcE5XbD1yD5dwcy5By/G5+LnXOIOTuN+6ZDrJtbZz1MjCHaM
         RxbeZ7+66hnefPkrEpPsJ9cpukuiI07eNZEs0focQE2Tzsu+nsF/EIWP9c4wyRVjQ7U1
         jYnnNFpLCCImDQPgRxWGB+zeQlY+J5EJwQl5P2FU6oGvcDgdU2Yp2hknTB6z2Py0S0ID
         1qPg==
X-Forwarded-Encrypted: i=1; AJvYcCVpUkzTyaD5yNoMEyeLvT8fqquaEykUy7qXn0sH/hrBV0KBcpr+UhuKvW1qyEki9+R0yirC7qTiNmCcjYp7nldHIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTZ0BSPb/3ff/g/SVund9wpzEIuAry6hGVrcaPsvQd1PB00bz+
	6WPLjwFoelMqX+kFQpDXFRMHIdGpimsHc8MRr7YzJZrWlsmiyab01zTYaj3/LV03T0ZgxARMCH4
	xRwsvcp1mpLjy3+I0DjRcYEOK72hx9WdksQ15LNPQIA==
X-Gm-Gg: AY/fxX66IOlUd/jUzvWihm9usWax8Gliwr+BhC1hD7qGe1wByJV5E2LK/csUm7QwOq5
	+QOARiJhrU0dWtt3BdBN2MzUUYmqqXrTLyRFB6hc+aikNNJXAulhL6kH6Kf4rfrZ4jwUatJiGwM
	0azxundQKq5rX0ZKktnPYC7hP8MLpZR0dAN0m9Tuljz6ckiig+DujHks4QWJkbVhcQddD0XnKSf
	AZ2rDGAdj62VeMfCTrHbINrSXDQNmf+ReY6FsmK9q5JGES2UxHQPCUXni0NvuM5v90NiLoqUF11
	j0B0XxknqCk+vI6XzfkC59FxDebm
X-Google-Smtp-Source: AGHT+IGRpwx+M1JWkFNabk+pk1pi5MZX7BROvKDyyGseaJ5KLVnq9YGzZHHydSetScbi04z6aZ+LrqUkWJ/WBCjzUBY=
X-Received: by 2002:a05:600c:3104:b0:477:fcb:2256 with SMTP id
 5b1f17b1804b1-47a8f906dd3mr223401355e9.17.1766056213637; Thu, 18 Dec 2025
 03:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20251217094747.3217558-1-Qi.Chen@windriver.com> <CANNYZj8zzUB-Q7LyhsD=MaCZPc7BYhb2cEbYDciOCxz8UaGidQ@mail.gmail.com>
In-Reply-To: <CANNYZj8zzUB-Q7LyhsD=MaCZPc7BYhb2cEbYDciOCxz8UaGidQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 18 Dec 2025 12:09:47 +0100
X-Gm-Features: AQt7F2rN2dXbYMEMzA-yWbTvim2JxGd-LEiYwkeVdsC2U2nvdzxIAFfL4B5ToVQ
Message-ID: <CAMSfU+5_2MuDXMacdiVsKEmA7uEr3TianPFQ4V5ybZ2n_33eKg@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] insane.bbclass: avoid unnecessary rerun of do_patch
To: alex.kanavin@gmail.com
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228110

Le mer. 17 d=C3=A9c. 2025 =C3=A0 12:02, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
a =C3=A9crit :
>
> On Wed, 17 Dec 2025 at 10:48, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> > When toggling ptest for DISTRO_FEATURES, the do_patch function
> > gets rerun.
> >
> > The dependency chain is:
> > do_patch -> do_qa_patch -> DISTRO_FEATURES{ptest}
> >
> > Such rerun is not necessary. And it's kind of annoying because everythi=
ng
> > gets rebuilt, including cross toolchain and recipes not using ptest.
> >
> > The ERROR_QA and WARN_QA should be enough to trigger the re-run
> > if unimplemented-ptest is added to one of them.
> ...
> > +do_qa_patch[vardepsexclude] =3D "DISTRO_FEATURES"
>
> The offending code is this:
>
>     if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
>         pass
>     elif
> (gigantic list of elif checks follows)
>
> I wonder if we should rather drop this first check for DISTRO_FEATURES
> instead. These are recipe-level checks, and the issues reported are
> valid regardless of whether ptest is in someone's DISTRO_FEATURES or
> not.

The idea behind this check was to not make a user who has disabled
ptests pay the performance cost of reading/exploring a bunch of
file/directories.
But the test on ERROR/WARN QA should largely be enough for that goal.
I agree with you on dropping the first check for DISTRO_FEATURES.

> Using vardepsexclude is problematic because do_qa_patch may have other
> uses of DISTRO_FEATURES in the future, and the same reasoning may not
> apply to them.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228024): https://lists.openembedded.org/g/openembedde=
d-core/message/228024
> Mute This Topic: https://lists.openembedded.org/mt/116824171/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yo=
ann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

