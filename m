Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8BDECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:42:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.3953.1663144938816481518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UyeEmE0J;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id k10so24025404lfm.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=K1RnX1jyuOoc8tc9S2rxG4qYjib8JThPhCnpXKyBRmQ=;
        b=UyeEmE0JLiGXHeRjtHH4KF7n0cuREvpokHdm2uoYqLHrTRVhQeGfrC6+YeBaS4Ap1w
         Csc3luqanI+ezvndqRWrrd9RHwM/qxD+CQL4swzHYq7OscYRZ2DJTBxMy3Vo+7YGJ7SU
         gexI0lzW5qnL65V/oRsclUCh2vUt42xEIFf4esrhFCbp9OZ7VLrv8pWVWPZyju5aVXv7
         7Cut7pFe002Y4oc3b2MtIyyXTB8K4k/dPRzc05ByffKxOzup7bkR3pNKkNKxGuV0X6kB
         RSfa64RPfdpvZDHcPd8sgpJlnAIpsfe6E6Zn+fdfa+JnXkUF+mCKzaVatvixXKTIXgME
         m5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=K1RnX1jyuOoc8tc9S2rxG4qYjib8JThPhCnpXKyBRmQ=;
        b=mMvaCXeX2GtFj3CG8rGQMnV5aj079jklpaVzUpPhAMiqqADAFZxgsGmf+Bh3jWrQe9
         0Ewz76+/MUvNSS69R6ZBb/Og599IISUvToOQgs0Lz7f5Yp/srfXRZC3RCuUmIDE8tuK0
         0c89pYuExhnxvG1HOE2u1yn5ucyRuvL6hqOMAuvEmDcluTYPKL3zFmijD5phrmNkVGn6
         YzFWLs9PQS6Vbz/6teMn9w1YbKkY1E2czZ4I5BL6aqvs3VqnkGwfPmMlYaE1f/LJ2WjC
         EJ61aWHr8SbfqPkV2lyM6uYhOwPPF+Wgh3rPAes3IMqBTlrumZilsQPWQIwc+lVNNXyV
         l2Sg==
X-Gm-Message-State: ACgBeo0bYddKG2jz351Kgs/2p49TVJgmtCC4R2q/vHRqkzVAG8xQmmEI
	7PpDvIAZhGTIfHMa4r1Uay5+B32V8adAvV917YM=
X-Google-Smtp-Source: 
 AA6agR42l05dFKZLEBaf8g0DU4n+xJBSKSzCWqb1zlGpZQ1xzhptfhBMrSv9LjGZyWHnlaObadpiQEehBtdRdcpJI3A=
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id
 u3-20020a056512128300b00499d0a33ca8mr5950447lfs.665.1663144936755; Wed, 14
 Sep 2022 01:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
 <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
In-Reply-To: <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 10:42:05 +0200
Message-ID: 
 <CANNYZj9nK6OXGEb0qHHSUz_UYn8QZt9ZSk5e_i-A76RPqMG8kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:42:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170643

On Wed, 14 Sept 2022 at 10:17, ChenQi <Qi.Chen@windriver.com> wrote:
> The codes are in: https://github.com/WindRiver-Labs/wrlinux-x
>
> e.g.
>
> ./wrlinux-x/setup.sh --all-layers (this pulls down all supported layers)
>
> ./wrlinux-x/setup.sh --all-layers --dl-layers (this pulls down all
> supported layers, together with their needed tarballs/git repos)
>
> ./wrlinux-x/setup.sh (this pulls down the default list of layers)
>
> ./wrlinux-x/setup.sh --layers meta-xxx (this pulls down the default list
> of layers + meta-xxx and its dependencies)
>
> And the final list of layers are in
> <project_dir>/config/bblayers.conf.sample, which will be updated if
> needed when re-running the setup.sh script.

May I suggest that the tool skips the bblayers.conf.sample step
altogether, and simply writes the desired layers directly into
bblayers.conf? It can do this with 'bitbake-layers add-layer'. Is
there a need for doing the intermediate step of generating the
template?

Just to be clear where I am coming from: anything in TEMPLATECONF must
not be auto-generated during build setup, and must be under version
control. We are trying to standardize layer setup and configuration
handling, and this would be a necessary step towards that.

Alex

