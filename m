Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDFFC54757
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:14:53 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.9308.1724836489037142507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H1O5QFIA;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53345604960so7035777e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724836487; x=1725441287; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14/TlK3UFk9QWWe4iEb0Gz3yCy1BIvkjnywAnXcmRJI=;
        b=H1O5QFIADbcAE0Bftr64eCBNU4nexL2ER3zSeFsc4QsqQs06R15LoQ0d0amTdsEzck
         3nVPQKMHFKZUMBwLrpZfOwcwpHGw/GPw5FznlayMMc/iBYk9v3wRPLh3/5bo95Pw772k
         oNRTDZBVDN9LHyV5alPFcAuwn0dOH5lcJ/tm/8Pga0KimzzC75pQcpQ+rxFdRAo4lpKl
         RQZd2PdHq67Zc0J3pwZwZTkeQMZuMllgD66fO7O1571dHD6gH0AHenmp8rVuhTColuEo
         RL25SpfcCUhRMDyG9plIUO89sbMJins9IjfflhAEnFIHkhoC4jTr6r92vMolqNqw7XM/
         iIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724836487; x=1725441287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14/TlK3UFk9QWWe4iEb0Gz3yCy1BIvkjnywAnXcmRJI=;
        b=LxMeU+YUy0kMxYdnO4ALuNkoyLpKSr+ixavyTrwCrQ1sRspdwKyl1Aka1h33JCLDTS
         IuTsJKqsUQlUwFYWA6urKSeoiMi07T1pnBAmfjj27s3D36Pu+0L5lzxKHCr1ahDdYSUj
         hspQ+je/7DAU8SoxRR7m6BLtxsKp+nehvA42cmxkoKxm8os1s8k2YypBpn2/QzXNpDLq
         QSAlYcbz8sih12O9EdqUGBlUtQsjZZEP57mimebbVV1/JDYS699dzOxXNrRkgrqm8bvJ
         8C878c+CESUg4eoenuv71FbzOB4+Fv7EFPRmT242QuRPP0cHWDfDJ25q7zStNCMkCVdT
         KXKg==
X-Gm-Message-State: AOJu0YyrkAmxVYLO8DwLBPW8YkKYqL1lCypgLbg7qM/TAFLM7EbWDARX
	iYSyoTHWfqgSI69V3DyY1R2XiQ/uRFZPo+A25JatcQJUAArC+Sv72cURF9VvaJzShoVIgJWpxJc
	7U2JZy0Kl7DiDM3OCIJ7w2Wh/2S8=
X-Google-Smtp-Source: AGHT+IGoEnjG98p42NxWPv1e4jJJZEpZg3GIPRNNEG5c8anHa8pWpjrhnmDIf5zHn4cuQm0MktSxq1tEsflc6Z0QMPA=
X-Received: by 2002:a05:6512:b0b:b0:533:4b38:3983 with SMTP id
 2adb3069b0e04-53438773dd4mr9081352e87.20.1724836486660; Wed, 28 Aug 2024
 02:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj9KSfNg=VOBHqFAFOHpoGTPJe7s8rEii-gDxp-t5K=Uig@mail.gmail.com> <TYWPR01MB11861DF67DC120A05FD4373A6DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861DF67DC120A05FD4373A6DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 11:14:35 +0200
Message-ID: <CANNYZj-hhrupgJeDZim3SbDsEOXabPUJ-mqs1DBye0x4BzFF+Q@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 09:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203876

On Wed, 28 Aug 2024 at 11:04, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
>
> The name of /usr/share/polkit-1/rules.d are the same, but the files contained in the path are different.
> What methods can be chosen to solve this problem in this situation?

Are you using package_rpm and dnf to compose the image? If so, you can
look at the spec files used to produce the packages in ${WORKDIR} of
systemd and polkit to see how /usr/share/polkit-1/rules.d is specified
in both. It might be that permissions or ownership are different and
dnf can't resolve that.

Alex

