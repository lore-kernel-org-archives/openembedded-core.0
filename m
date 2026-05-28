Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA95CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:56:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11566.1779976571209450061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cnt6WQxN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso39489435e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779976569; x=1780581369; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OVY0s+EYK4FR48HbwtiH5TFB82HZl4dUSxch+o/tgOA=;
        b=Cnt6WQxNeJBVRUVpbLWphfadscl6dqSUFvyvNTBGSp7mXZr2E9yObZFF6dWsvZZacw
         ngsFdCG8+J6PSlpEcbaBkjD3BvqbN3hUd+rhdpuzk16TDmjPOcjymzciyHzG1XeTdy6U
         1cIfyzPNaxWL5fkk4jpXi8+axJGdq6ydIFwh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976569; x=1780581369;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVY0s+EYK4FR48HbwtiH5TFB82HZl4dUSxch+o/tgOA=;
        b=q1/mVWneEuCmpGa3pg5LrfhKsuxbVUNOtKA6NC6Dxy00eTmZ5RqmpmVKwESrizymLo
         WCR7VCH3w8shXhZNm2Ltn5HVdg10L9nRqSK3++OMlKt35jLgqimQLEPld9pE+tN2jW5h
         X+wxt8mVU7Nz9f/BnAzUA52QfvQVvKFYGmy2tbEmfn7kOUw5ybp+JSORlVAU27AyaTkl
         gyAeLIqFfq6lNAC+773UrMXtsbAN8Dhmmaak4vbC9D33wYNuU9g6N87iMfLC1yLL8s3W
         q8RIkzx/mF+8ycz6vU/ITwkunn5GQ6RFoq1WJIJ2OeTCJbyqRu3vAIZQAQW2amrpYbFT
         RjNA==
X-Gm-Message-State: AOJu0YxjMVlRlYozBk/2Zh0jt0yQ3WUQYIGEbO00gJgkSS7ud+/QkqHQ
	E6/7nKJ/L7iIZb8kJsSM2c3yz44FExE0nzucGOHGCcCXBNB8rrzHETNi+nki207clE4=
X-Gm-Gg: Acq92OFYIarlAuAuJMb32QWELq/IfgWFqhUz86QfqKWbjfIntGL4G/+OQIrgQ2iwNNY
	NgkpcR/PFWHO+sjgDsFsXRnQ9GSL6Jvqw968h+RnMcwKvhoxchsWtwl6G6PZiigJDVWBYAS7lZQ
	CEecvK5/SXLiwJcMgLv66DfiPSQkOKG2Wqlrb7DfWWjbKEr0Xs47j7NgJXk/TCFtKF7zS7vVck+
	F6qruyi2mXcRhd0qaY/Lye32rza6awydJmh42XbJ0XghYNSXo2pc9FCW5RJy431xMygiY2mkVVH
	SNFu9SKiLzSsn7+RiFklmt9dApn/BIs+bo7VE92EFM6fpWpeRTQPtDe1MZ0kYReYj9Q5JEOn2lv
	kd+uXQLkfjq86at2krAQ8uJGcBxkdEe1KF8HkcOlGaZvd+LZAHVwgaCI1h7MoVnycV7JYPduNZj
	Xr4GAQuALQEIPVt2ugk8yVxZW3ysAieAZi+V8XAFw4hFlXSU8KeBBOrLGauECKZnKPAmxHAWOkX
	6N/0SA/ylQxRQa9f1hS094Z
X-Received: by 2002:a05:600c:698d:b0:490:601f:d77b with SMTP id 5b1f17b1804b1-490601fd94amr357248125e9.0.1779976569365;
        Thu, 28 May 2026 06:56:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908e9b0c57sm23823705e9.7.2026.05.28.06.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:56:07 -0700 (PDT)
Message-ID: <0530bfa657901d5b47f0a645cb1f220c502a8da2.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2026 14:56:06 +0100
In-Reply-To: <CADkTA4NYJckE+4eLF2ucrK8h6iDipAt-ynCsVXWYfrOAQSRzhw@mail.gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
	 <ea78d370348fbc117e23085ae59791fce6c0b404.camel@linuxfoundation.org>
	 <CADkTA4NYJckE+4eLF2ucrK8h6iDipAt-ynCsVXWYfrOAQSRzhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237710

On Thu, 2026-05-28 at 09:25 -0400, Bruce Ashfield wrote:
>=20
>=20
> On Thu, May 28, 2026 at 9:00=E2=80=AFAM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > Hi Bruce,
> >=20
> > On Wed, 2026-05-27 at 22:37 -0400, bruce.ashfield@gmail.com wrote:
> > > Here's the latest -stable bumps for OEcore and yocto-bsps (again,
> > > let me know if the combined pull causes issues).
> > >=20
> > > I've also moved the dev kernel to v7.1 and fixed lttng-modules
> > > along the way. Hopefully a new point release will be available soon
> > > and we can quickly drop the backported patches.
> > >=20
> > > Also note that since ross removed the CVE exclusions .inc file in
> > > a patch (which I think is still pending), I haven't updated the
> > > exclusions for the kernel in this series.
> >=20
> > Thanks for these. I put them in for testing and there are two weird fai=
lures:
> >=20
> > qemuarm64 musl python3 ptest:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/460
> >=20
> > which leads to:
> >=20
> > https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemua=
rm64-musl-ptest/python3.log
> >=20
> > test_tracemalloc_track_race (test.test_tracemalloc.TestCAPI.test_tracem=
alloc_track_race) ... Fatal Python error: Segmentation fault
> >=20
> > qemux86-64 musl libc-test ptest failure:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/444
> >=20
> > which failed in functional_ipc_shm
> >=20
> > https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemux=
86-64-musl-ptest/libc-test.log
> >=20
> > FAIL src/functional/ipc_shm.exe [status 1]
> >=20
> > --- ptest result ---
> > FAIL: functional_ipc_shm
> >=20
> >=20
> > I'll rerun the tests, it is possible this is some weird intermittent
> > issue, I just can't tell :(
> >=20
>=20
>=20
> ack'd. I also took another look at the changelogs and don't see anything =
that looks obvious or makes
> me think it isn't a race.
>=20
> test_tracemalloc_track_race segfault (qemuarm64-musl)
> =C2=A0 - v6.18.32 =E2=86=92 .33 has 55 mm/kernel commits, including 1dcd3=
6420af2 futex: Drop CLONE_THREAD=C2=A0
> =C2=A0 =C2=A0 requirement for private default hash alloc and several sche=
d/fair tweaks that affect timing=C2=A0
>=20
> That=C2=A0 could nudge a race test toward a fail, if the test was flaky b=
efore.
>=20
> functional_ipc_shm (qemux86-64-musl libc-test)
> =C2=A0 - No ipc/ changes in v6.18.32 =E2=86=92 .33. Kernel-side SysV shm =
code is untouched.
> =C2=A0 - A quick search found me a few hits on.libc-test's ipc_shm has wh=
at looks like known intermittent=C2=A0
> =C2=A0 =C2=A0issues in some emulated arch + c library combox
>=20
> I can try a bisect between=C2=A0 .32 and .33 if we get it to happen again=
, I'll get setup for testing in case
> it does fail again or becomes a common intermittent=C2=A0issue.

They didn't happen on the second build so it looks like intermittent
failures and that should unblock these patches. Given the bug Yoann
referenced, and the ones you've found about shm, I'm thinking we should
get more strict about disabling flaky tests...

Cheers,

Richard


