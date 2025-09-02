Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B27CA1002
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:46:54 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.67638.1756777609850774342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dI75x9mj;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e96f401c478so4477056276.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756777609; x=1757382409; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUPcqp210T5Xpsysfbro6SjCsr1ZR8gAg9E1w3sUwUU=;
        b=dI75x9mjbdUjq6M+tnXCNFLfynIJufbBZpzi+WDSoWxvbyByYDtHxPTU9WwXt7alvr
         wwU8i3fsqrdCd7mH5dBjE1Yk8EDz7CEzs4eNhj8Sj/opIXKbjAJphxQB7+J1/Y35dcS+
         Hipm5Kuqt4LzBdhHc5ETA118GReFABoP8Hkcfiso0hvLlMX/U0Hh9G06K32wWmvF8SEN
         /U7hYR7BTqscAMW+RU5JgPmxjWJz/24MDEakwv6ZcBFx2ftlJjy/CPNbrEDWGOu25aNH
         gD1kCp2SxtmEbGfYinCvpTWjjbJlFwqjGTLsqS2Cx6F1+94U1aVuyVVs7hkBLZqjuOra
         Ux2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756777609; x=1757382409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUPcqp210T5Xpsysfbro6SjCsr1ZR8gAg9E1w3sUwUU=;
        b=cc8CJGw2/aGBGtf0MpmZ4AX77q+nkHB4sLlgcr9AwgzQnuqAIkVoH6tGHB+lCiniHq
         9s8Qr2SLHy68cq+weQBHutVKinwBmhpsbHqN/FKHjRG/EUQ5PtalPivrHX0KFYuaqJK3
         h1Fj3mCCVRbUY1VFd5iVWI/vgFdZZT1ILclE3MrszIW9JneCjR7mmLcHYou7LoJoCfHS
         pWBzz4wvKHfzvtRLu9+JRzfXx2HEo4WJ7HWVeqvPkt61+6rbSyaQKBBE2+cwlATku8fq
         FqgnbqdWwCDoNx229Mmr6GkO4kjkF1gqDjIXzPFqtuipyCOFfWaJFGp7HqsPr6Uyb7Z/
         i1pw==
X-Gm-Message-State: AOJu0Yy6umMwOf24/iMinK+9bXwqsDN6iVC8kHPsRft2ngCgyX9s8Vlf
	uIky2470WOPQoV2fOSRpImWf9813+yvSPwY1/NhZEV9xD/ib/29ML0SWFIekFjubYNU4JMc7Jao
	vXc4r66iHnn2zFfLiLYSwFMSKsauHOPsGcszQNeI=
X-Gm-Gg: ASbGncuds6Bdm2fx/sD5lxt6M0hTUe7Xd95Fykd8ACsiKBCGnO+6VuzVF6vxGWzJSLe
	qITVaT/wAx1lXXzzPE6rfklc5Fp/by6XwwTrnw9vjTvamYdDMNeLMMCe9LdziUPcQcq2beTQThk
	S41m855pnOdNV751bH52DS6WMPtDcFZ85Ow6LigwQwmheITxmtXdaiSrESu7R5GsZBhF8JDIWYu
	Jq9LjZenysoMgBlm+uX11osddj2kZzuuPTIJZcIaGLYGzueXSM4cql79VRmL01wopZryzw6ZQGy
	34P3pOXNiYOpn4tJyqrVsc7s1ZZZ2GObjT/2oNvusMogfVhNQcBo+RUk8A==
X-Google-Smtp-Source: AGHT+IE3zINDmwJq7LUv2G8mCaKtj7Z7o7t4lz2ii1O35CGD1jhYM0vXW8EzjNh7NwPKrTh0FQey0+VnzfD+vZgvKIk=
X-Received: by 2002:a05:690c:9688:b0:721:67c7:936e with SMTP id
 00721157ae682-7227658a1e4mr111293037b3.50.1756777608772; Mon, 01 Sep 2025
 18:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250828025134.3747161-1-raj.khem@gmail.com> <ADF4E6CA-F16A-4F7B-B3C4-114FEA7E673F@arm.com>
In-Reply-To: <ADF4E6CA-F16A-4F7B-B3C4-114FEA7E673F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Sep 2025 18:46:22 -0700
X-Gm-Features: Ac12FXzQSfJSDK36g34zpJv6nmoQdfAicSSOAUWji2SojlxqGxIF1NU38wrM01E
Message-ID: <CAMKF1spGbZjXaTzEqFSUABR+n98+FJ-vE3QoWnBuJwAPx2W5VA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: Filter out regression testsuite on
 musl systems
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222682

On Mon, Sep 1, 2025 at 10:09=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 28 Aug 2025, at 03:51, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > regression testsuite does not run to finish on musl systems, some of
> > the issues seen
> >
> > * python is OOM'ing which is fixed by asking for 8G memory for qemu
> > * It hits the timeout limits of ptest-runner even -t 2400 does not fini=
sh it
> > * Use make -j1 and running run-ptest script directly ( outside
> >  ptest-runner to avoid timeout limit) causes it to run forever
> >
> > Lets disable this testsuite for musl systems for now.
>
> Is there a bug filed upstream that we can track to know when to enable th=
e tests again?
>

Now there is https://bugs.lttng.org/issues/1432

> Ross

