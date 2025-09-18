Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E73ACAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:31:53 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.13072.1758198710065448727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=SN3ItiqG;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.208.54, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso3875120a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1758198708; x=1758803508; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djOk2/QgqErOXnd6RaUKB5QmJw6vn2wPD1rGEO0tuYs=;
        b=SN3ItiqGFIQTYCVdL128DLFDG2RJ38L7t6jY8dmu/m26Bh146P3mHDiOiN3HbTJVUM
         yZm8tpJv1PArlxBt9rXBVZzajjWNTJqFihtIGl0aIwaM7xmanl0Co5UMCZT6Oxheb4dJ
         w9zid3tLJ6W+KlFBEClnMhWu4xMkxFs6e+rjzg/iy/HsiqZ5t9npLMKi2tChNwk64C37
         OuLGYRyUBiY/NwWMpnqiKC5rtnFdtunH0B5gZT+f9VyQ90uS6Y4UwqnNWLzTLd+WCvLo
         IJ8jvlUAjaHHVDx4DAIBWKTMIApmf0JmYKmhDyP7BH49pfqwUD9pQPCDOibjKGM4cl6i
         TIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198708; x=1758803508;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djOk2/QgqErOXnd6RaUKB5QmJw6vn2wPD1rGEO0tuYs=;
        b=ScijNWBCLKF+n8SE4icY2La9Zz4IyoMf52ilnNi0QqGG78hw360PWDR4xyZUGRRW3F
         kDhOK72FgxhSBqXruyWgcu2hnUSHwemR2JsYqqlUaUfdN4n/mCfQMMcmWLIjT+Wn6Da/
         OMAVr3+PuBmo8KftNDvW3MQzOsrDRvlwaqOh7unbJPHaZ9yBOmjG5euk2Veygc+YVeWa
         iDN6YcF/mTcxSHxltnGsXM6xGTa9zV5kOKi8fKiRJ+Lgd7apm03QU4iaKjBEWObFII85
         nvo1MKTadoHfBydG+aFxZYBbz8hxQaXyiATTGvDf/65/aAkHA+9k2NtZOOqqgwy6Dx+q
         ISvg==
X-Forwarded-Encrypted: i=1; AJvYcCXQw5r5ZIcrywpMk56GQkv2x+2WL/R7euEdrjp+Yyyc3bbiM1QHkLbHKBNMbLWfVFUw/0Ycw4maoLHXSR5fjjzubw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJ0t05+Qwpz05xbamI9QDi9mwXON4MoMLCMOhDBDnKsw6HsNct
	aAv8Hd8nATbuLCT7MOjgxlcDdOH2NEV/5rhozf8gRS/wZq6/9fH2s3sJFljQEMWQUzhR7kPOKKZ
	YeQQVqiLtf4VcC9SzE/aR6daLTvxnHe7/6TdTb8UAcp8Ap85wsrIfiSg=
X-Gm-Gg: ASbGnctb6YohhYVYdKFfTER5LYB3SsT4UA+E3GdN7DJrR6iHiESVFJ41+Qa400Edg8V
	AtGbJCckMXb2JitP4k6KbNs+Ejqcki/MKanuDdw27pUV6upnYd0iDSwDWJa1yhtRPwMQfulyiK6
	47NWRebyrRA1ynBNxlTs+fDD706uR875Jv8Zg48FfRTzG+JJrSzFXEili9Ly/D3fkBfEImdBIQV
	U9LXE9AtcBWABepwUKMXs34X0QbIgwf2G8=
X-Google-Smtp-Source: AGHT+IFSFf4DKcR/TV1fSwQ85GM9aJGvFwg4hB/lkfie6z8m4+Ld7ZCspd+dXhM0LIGirF8/3rW8fA9sBxAQ8znH1RU=
X-Received: by 2002:a17:907:d7cb:b0:b04:1d85:7106 with SMTP id
 a640c23a62f3a-b1fab24299cmr271191966b.21.1758198707717; Thu, 18 Sep 2025
 05:31:47 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 18 Sep 2025 14:30:00 +0200
X-Gm-Features: AS18NWD2JIG8TKyFRFE8XaH0EL5A94YNASpA_0nNM_gdDbxzwzenLAB4Qa_m2UI
Message-ID: <CAEt6NwpRTafz3+NVdraQFDtqb2xgPAnKdSVVRc=pCr6=1a2QQw@mail.gmail.com>
Subject: RFQ / job opening: Yocto LTS Maintainer-Contractor
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223636

Did you enjoy Dunfell daily? Step on a Kirkstone every time you left
home and never missed the Scarth Gap?

Here's your chance to *TOTALLY* have a Wry Nose. No kidding.=F0=9F=91=87

The Yocto Project is seeking an experienced, community-minded LTS
Maintainer to take over maintenance of its Long-Term Stable (LTS)
releases, beginning with the upcoming Yocto Project 6.0 LTS release in
April 2026.

This is a critical role that ensures long-term stability, security,
and support for the Yocto Project=E2=80=99s LTS branches. You=E2=80=99ll wo=
rk closely
with the current maintainer during a transition phase and ultimately
own the process of delivering quarterly (or more frequent) point
releases.

If you=E2=80=99re a long-time Yocto/OpenEmbedded contributor with deep
technical skills and a passion for open source sustainability, we=E2=80=99d
love to hear from you.

Find the opening at
https://jobs.smartrecruiters.com/LinuxFoundation/744000081384375-yocto-lts-=
maintainer-contractor

