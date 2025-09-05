Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C832CA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:52:26 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.18672.1757069536560743418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLjW2QQj;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-726ee1a6af3so21225826d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757069535; x=1757674335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e2DTf1fkJUdA6kgu+VpQqgVxKmGFQB89sWi3P1WT7CQ=;
        b=fLjW2QQjp3yQrtwSwI97TOLrO26eudH7Bgi36q7JYXcowZOZEev+zBV+EOxudENdSQ
         e+anBqRyVKReU9JglMSQ67JYHFK8By8Zjkc6v61uJPx9B45vz+FHGWzsq9PgltGkAQ/i
         6iG1XdFjI9mPvu9OUaStKdcGCmepPN+LVcROBBu83rZ5RcOrRom9EYTl1Kkj4OW84TTf
         hVw85R6hnvbftCZiTjUFJjBVIer6NdIbeV0Q3PMi2/P+JYDcpJfl60GBEdMRm1xxTJGc
         g8+sfewj2b0MlpEd47D8/Wb3w5ZP1EpLboHM2a6WVVVHOkQOim9nps4u762zpXQt227Y
         0AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069535; x=1757674335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2DTf1fkJUdA6kgu+VpQqgVxKmGFQB89sWi3P1WT7CQ=;
        b=fbyEg4JmvoH1SdVmIHqtc7/kKhgveekiPwh/uBm2WkQ2PaSosSAAou2mOicaV/2Aiy
         8UPG3UAlM5eUS91QnLSr4zoc3mf8c/+i0CjiAvvDvpbk9qILGeqa5dSM42IVYw2JwfVq
         Mb2k2dwL5IIBIQALfZw8gejWitznkuOEftZ9shIX5K44Y+KkH2MzO5IEmOqW4SEitoob
         ysojPAT+rvlqD3Ex90HnWvZtXpOQiC1jP7SFIxU11EUo/cbDQR5gxRJyJoBmPuR25nVb
         RwOELPWqiygIJ1xZyQkYjvi5YoPpA65exwQaHQphHeIVpSznabKxbfNVqNed/AtV3ySe
         ydIQ==
X-Gm-Message-State: AOJu0Yza/bDnHbZyUu3BGa1BcL4ydwy4fF06Ygeh5TotoCxce490ZbZE
	lZBCO787g4JwQZHasRmmRecZDEq0eN6frivcYb5mnCHLiWuaSjhFrOC9k1ufV92gm/DGeoAm/9k
	po/Rt2erBuZqe/UPj4qerqScnmtJ+vwE=
X-Gm-Gg: ASbGncvuHz0+WMtSqHVuFstRsUX78G0Zr5+QR+lKIaBOXlsP6emPZ8leBePKo0tEdHd
	vXNxzPrCg4tEzd51Hb/Q0EtCK713pZrc9zEpimLnaHqlxkTj+UYpUroBx0Tb2BdQW4A7ECbNCrK
	i2hjyAaWZb55fJRp7K1YPWyqSr5rDdKziyZLh+nnb3djcfyvW15geXdRYMCmBoIXtkg9wkI81NG
	AoSit92FhdsB9iB9zg2HRfGScecfyFAWzBjXjt9R+jE0vJStCCQp5cAmxwCOGcEeUikxEyiyZfw
	OApBQvDr1g346lg9FlmhsBykf08Y+bfyeaCoSEqOJ+G3jeUSO4Y=
X-Google-Smtp-Source: AGHT+IH6ZpqXqGgDFScv7ht45Us6m5AeiyXYky0Due0eDlVe5gxjKZYEJtB5Vd+7Ab1TkYxQXnYaNMQyM/ZqY7V6Wp8=
X-Received: by 2002:a05:6214:1d05:b0:70d:b2cb:d015 with SMTP id
 6a1803df08f44-70fac97aac6mr291399956d6.67.1757069535470; Fri, 05 Sep 2025
 03:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <186229F4B4DD4221.5335@lists.openembedded.org> <03abf8f0-89f7-41b4-9fe6-81072b2e6d87@gmail.com>
 <CANNYZj9GbpFEyyj3pWdAvXCpyNXrnso6LYL_g4HdPnGw5eyY2A@mail.gmail.com> <73f6c7ef-b598-4d1b-898b-ca6a18966c38@gmail.com>
In-Reply-To: <73f6c7ef-b598-4d1b-898b-ca6a18966c38@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Sep 2025 12:52:04 +0200
X-Gm-Features: Ac12FXyVvuBb2G_I3PLXF-95oEqLQIbyCQQomY3rJXFvl1dsOVKW2W-xBr3Era4
Message-ID: <CANNYZj_W=wCmuG1dtSobvLQzeJDWXXieu6V2hZwHQjTfqDGcmw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222989

On Fri, 5 Sept 2025 at 12:49, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
> > So is v2 still being developed and will be sent for review and testing later?
>
> I have sent out V2 already[1], feedback of all kind about it would be
> very appreciated.
>
> I just received some feedback off-list that the first version didn't
> reach everyone somehow who wanted to review it/compare it with v2 -
> that's why this was resent.
>
> [1]: https://lists.openembedded.org/g/openembedded-core/message/222852

Right, but if there are no known issues with the patch, and you think
it's ready for autobuilder testing and merging, then you should take
away the RFC prefix.

Alex

