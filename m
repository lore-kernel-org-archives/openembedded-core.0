Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5395C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:55:32 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.18099.1706280922368938633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O7ithn8R;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5100893015fso479953e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706280920; x=1706885720; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wZtY89lLYk8d0sow2zEQw/UYsIvZhYt6S4igZ4lf4xU=;
        b=O7ithn8Rgs3/y04ddKhzuVfk0+yfZT/xK3rEsAcu9Nl0Byj+lBudBq5nSNsgStH6Ef
         FFcIjmfvQuKigUUtUSrwim3En3j49eDVMFXbhuvrUZAKB1vEClIP6IONHTSfmEyxB99Q
         J/qArzvSAD63dbMJQVHojfCvXwHQQ2j/6ena7+u2qeX8HFTCifFKxQAPRvpV7BDCzmGh
         S1MiW2apnyTWLwO/WwtxevOLShwSz8f17dihlXXEm3QEAanxcUP5p7IyhxoCZBB0C43n
         ZrAhhyhUfGME1r9DINu6CRH9IV8/23rO3TyNhV7S2o3tjRTMhJ1BccjK8DnaMXiX8v3u
         EFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280920; x=1706885720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZtY89lLYk8d0sow2zEQw/UYsIvZhYt6S4igZ4lf4xU=;
        b=FewjMG5wT6/Znb7HwY1d6TdkbxcxTa8UkLcdt40hMCYwRf1FycWqS+SKhCSM6S/iCL
         YEJz5uKKTqrKMO6bDVBFEZUiwEvs0Jkg8lzvrSjGjMEekKSq29UHEGhAH97zs09OUmmW
         FekTWT5OkwC4Fc59kzPrxdwEWIbpWaG1GPpMaeYjRWpsWnMokzB56Vez/JNfcvSMQf6e
         kfHJD6Ibk+OLltYoIQfV1BcZk5CVFc8qECcCIhTPR8Lp/QVfnOGZ5DVPgp5B9k1QvwB/
         iQkE+0k6TbKWsUcjgIumEvZpRTlGjdxBEXTRbNB6C7N+BBh7N2ZEF3QRWDwqY/P8WDA+
         h/sQ==
X-Gm-Message-State: AOJu0YyKiIozQMucII35HCQDgA8UZS/ABp+HT37gCx5lQywJk6fn5Nnz
	1KzJaEEIyC0tBHiF+t3fiwD0cllqSicZ0UBCdF/j6x9r/89K/Plf3Z9O8rZhv922RKsGV+nErqa
	/EA7uFkg2oytNi0zPfP4hqOvO1D0=
X-Google-Smtp-Source: AGHT+IHfxSoTv0XLo+SD1g38X3ykCNsnhsurv6tIE6KaUKd6EGOXtE98XAKxkbo0p5o5rdW2jcGz79jZ4TJEcpZbkXE=
X-Received: by 2002:a05:6512:4026:b0:510:d4a:d360 with SMTP id
 br38-20020a056512402600b005100d4ad360mr637633lfb.2.1706280920301; Fri, 26 Jan
 2024 06:55:20 -0800 (PST)
MIME-Version: 1.0
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com> <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
In-Reply-To: <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 15:55:08 +0100
Message-ID: <CANNYZj-sad7Cb8iVae=mACp55vYu8b-K9Gr69jTFpWaD=fQgmg@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
 appears to hardcode important tunable params
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194387

On Fri, 26 Jan 2024 at 15:52, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> A thought just occurred to me, these vars(SANITY_TESTED_DISTROS, buildhistory etc.),
> do they need to be off in the original machine when building up the SSTATE ?
> I figured they just needed to be off for the repro build(in xxxx-st dir) but
> now I am not sure any more.

Machine is typically understood as MACHINE setting, please do not
confuse it with a build from a specific configuration in build/conf/.

SANITY_TESTED_DISTROS and buildhistory do not factor in sstate
signature calculation, so turning them off and one will not cause
cache invalidation and a rebuild.

Alex

