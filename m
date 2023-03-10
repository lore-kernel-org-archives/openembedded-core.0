Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D23C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:29:28 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.16003.1678444167725068848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eqk0Ud9m;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id k14so5977264lfj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678444165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+j7i1tfOupPW4n6VcEf5K4W63YiFyn56xpEZYHBRm18=;
        b=eqk0Ud9mDdUasHcuP47dUc76EzxKQtpR6uQDjj8XbCLPnoaw9DZ1Yy+4L+/3x47PxK
         c8De8AiZkHhZOC0MzoIymiGj5mVSAdAqAm6DL0xROseXB5HVkrhBTQKDtKDkC6H96O5P
         QI7I+iIse1t1yxs4GfyXgq8uybib85yBupE4wMD6auXtwncevf/65utxrj/prG/0K16J
         KK4xIArGpMTrghoKbuwcQCjs0rJeBDWy+fTp8+MvSzPBsm9gs6g/xynUss7zJM6BcGJe
         ZISFi3+9TA0N3l/U2eUA/tdWcSQBRyHIeWaMIht16l9E/4VIM9380li36To7X2MR+29G
         JzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+j7i1tfOupPW4n6VcEf5K4W63YiFyn56xpEZYHBRm18=;
        b=rRx0TAqpRDsc1x5mLmdXYX+KmgHoryBUE2Uw50KE8fa0HryfAzJjqslZLP+rPN0aSd
         jga75JnM+N8HvvCzt8j6e4f6UeGUxAtT7xKhytR8nm2kc/Rf4NRMATjB/NV37vf6OSrL
         R6RC1H6N1fsLKHDBbx5X5LMf5WaaOtjCssfpFE9pAB3Jfw4Y04Pk6gd8Ev0twJybi+nq
         b7Fn+QhZDOzXcLapdWefrnTs/fpTg4EmtiS/dn4yX+g71ZfeYtoQiHIheb3xfhWyKiYk
         vKIjxb065U1Dch3tp5pSt69Z2WN2WuCw3FVtt1a4BBV+OuesAoqwu8tjeobdJ2EY7v3i
         EquQ==
X-Gm-Message-State: AO0yUKXGQhaQi3E1RlA2Yr2755FpTW2qD2YZklRi5CY3OGcfjMRnx5FR
	3zwMhY2uhzVHf49GrgegXOa4BmcafyzTWDv4ZmM=
X-Google-Smtp-Source: AK7set9tuJ6TV6ATg2zwDfb2Uli2k3mmX4UdefdpxY2G1EyjLW7tyLWF8qUqv/0dxX8CFyWdJWYJAVtA2oSQrZoDJdI=
X-Received: by 2002:ac2:4827:0:b0:4e1:dbbb:493d with SMTP id
 7-20020ac24827000000b004e1dbbb493dmr7881219lft.13.1678444165228; Fri, 10 Mar
 2023 02:29:25 -0800 (PST)
MIME-Version: 1.0
References: <174B040A85AB843D.27660@lists.openembedded.org>
 <20230310095419.3487056-1-zboszor@gmail.com> <CANNYZj8S7WnPM265Z39fi-wjqK_1r6XJK87DAfkTumesj8qGMw@mail.gmail.com>
 <2aa71fb1-68b6-4809-0004-8b3380cef757@gmail.com>
In-Reply-To: <2aa71fb1-68b6-4809-0004-8b3380cef757@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Mar 2023 11:29:13 +0100
Message-ID: <CANNYZj9qRTsH5mJK-h+aXJofM+eEoL3Q=nRxFB9LUzrLWNxvGw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] Add new python modules for building others
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178327

On Fri, 10 Mar 2023 at 11:21, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2023. 03. 10. 11:15 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > It would be good to actually test that these new recipes work
> > properly; if they don't have consumers in oe-core, then such tests
> > will not occur. Maybe meta-oe is a better place for now?
>
> Can you still take patch 1/4 into oe-core to avoid the clash
> between cmake and python3-cmake if/when the new
> modules are accepted into meta-oe?

Of course. Alternatively you can fix the pypi class to allow setting
'extra parameters' in SRC_URI - I don't have a strong opinion, but I
think cmake recipe has a stronger claim to the tarball name.

Alex

