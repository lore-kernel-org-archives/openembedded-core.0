Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFF3CD040C
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 21:30:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75672.1767648616525128767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 13:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lef8wMcL;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so3037885e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 13:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767648615; x=1768253415; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oao210ky5Zvaay9euDeGmtMNrHATHx7LGqdW4cqqFLI=;
        b=lef8wMcLXTCfjPfnuGaMF/Ai/dtQFY2QPeY+9stWNSJDlbRf2iQvB6GYiTlK6UKMwu
         WkiSwXzgIAGQzIhEM8urfnzZrpmJKZw4dHszE4XMfppsm3BScerXpD0e5qgDb9oFcUXQ
         xWFaHc+Q6x0Wm6hLbnrAkR5dM1K3nhwPM+97Ad+c180D+V3lsXzkSoWSTJ2TYju/ntx4
         zg2CVQ6XTuPmhIxVM+8RbZuwJtoJ6EV/yTNtoU0kZCv0InCGh2cQgPdMmNwzwwPOayt5
         8E+Z/+xpz3cw1V/VAoihSv9yROBaQKW0TRu2+tZNifxdDhy93E7z5UDYBOAajDAuxa2a
         bZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648615; x=1768253415;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oao210ky5Zvaay9euDeGmtMNrHATHx7LGqdW4cqqFLI=;
        b=lLPGUTtvqD+ak30+gWZx1bCl/09c+jFf403U3pxey8QMG151LycoWkndiu8FYhzZrO
         lBPzBPHzZMCS1s+U9iG4KUM6/6ZBGK82T2UbAe9KGxlxPeJq1T6yRBcCEDmCwl4XIzMC
         HlDcTmGX7qmKe96dzL1hcF80GnGOEKpIeC2rpyN6llBh5jc5v67YiOalnPUApH7utxtk
         BlfuM/vNS4b1kZZ7w3WCXexS6+lm4A6Txy/LYcVELQTNeXrqHtE0wmcU4KLzX/PXD+jc
         HeWiyyzAylkvPTTBHHFadR8iX9xzCNxUeZXfOGcGP595klb/ZbD1SdZMS+55EhvscU6j
         Rjbg==
X-Forwarded-Encrypted: i=1; AJvYcCVm+1FxUAYreO56AOfVdy8ooBU+G/MSSoO/VjOx4x7qH2Gc7Bu7Y+qGEfNd2I+FdRfEpJn66AfWQs1/ZnE3AeZ7Vg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYW8Efuk6jnqMCz27XY2G3Z2v0Q3C7C3gABQoBDPNvaRHebE+T
	4BRxTP6AfnP743rqabUUXbDwKS+BF2NKFcevmG7EdcKNMdCOU8MMVi/o
X-Gm-Gg: AY/fxX6Va++9yhQqj3Q8royodsLTX8mw/ALsyPE27agUrrfA3MFWhsJp5QXS/bwtDFR
	pHfXBldpwleF5U9Ebs37jF8FP7D9JiA9fRrUI0B55VOVkePZEePbM6tOSiAlDDpAcxR4WA54K9p
	Aa8oCidrxP8XvyXJOKfVZGQ8g/ma98Zd6YL85aAAaX1UFZxKAwPs3LeHFycs0LnY5FHL5gskPJY
	5w2uNeeH3ilruOwEV+JYSujiQLJ8gV2jjkKOwJ4g+UCTEluF3g9sR3CaXsoxzwZQZBuCX+RgnNj
	PumCjQdzpnFwyKT3ZhvNVQz94Euc00BL/hvUOIZH9qYZ5j5FiTPJ0viioXU2Uwusv02gUqVC3Tr
	rbUvE1oQtUDmHpj2S2lah7UNosPsIhB9gKuWX7F+F8g1o0rZ6k3d4BH+fl/t8ED8ECmqeJNdcUb
	mldpi9d0q4/CFnKsYGahAimovreuMrbRel9k6cZGus6nAUk+T+EpZ6nDsg8q3/
X-Google-Smtp-Source: AGHT+IFmf/eCirbKl280MQbM5C14h4um8cvXyN1UM1gXNQHleQvSlT3O31dQvVqmEbN0MEovQtYCpA==
X-Received: by 2002:a05:600c:6305:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d7f0a3683mr8096815e9.35.1767648614695;
        Mon, 05 Jan 2026 13:30:14 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16d2sm685872f8f.13.2026.01.05.13.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:30:14 -0800 (PST)
Message-ID: <8de5abb6a9506f76032d2427e8a3d62a1e18ed23.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v7 1/6] distro/include: rework debug friendly
 optimization
From: adrian.freihofer@gmail.com
To: hongxu.jia@windriver.com, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Date: Mon, 05 Jan 2026 22:30:13 +0100
In-Reply-To: <20251222145403.3688113-1-hongxu.jia@windriver.com>
References: <20251222145403.3688113-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 21:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228878

Hi Hongxu, hi Mathieu

I guess this series is not complete. If I do a git grep on today's
master-next branch with this series applied:

openembedded-core$ git grep DEBUG_BUILD
  scripts/lib/devtool/ide_sdk.py:
    self.debug_build =3D recipe_d.getVar('DEBUG_BUILD')
  scripts/lib/devtool/ide_sdk.py:
    'You might want to add DEBUG_BUILD =3D "1" to %s. '
  scripts/lib/devtool/standard.py:
    f.write('DEBUG_BUILD =3D "1"\n')
  scripts/lib/devtool/standard.py:
    parser_modify.add_argument('--debug-build', action=3D"store_true",
    help=3D'Add DEBUG_BUILD =3D "1" to the modified recipe')

This breaks the patch from
https://lists.openembedded.org/g/openembedded-core/message/228633
which tries to add a test for remote debugging.

The issue looks like this:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3070

Breaking scripts/lib/devtool/standard.py:
    f.write('DEBUG_BUILD =3D "1"\n')
is at least an explanation for this issue. Since TDEBUG_BUILD =3D "1" is
now without any effect, the compiler removes the code where the test
adds the break point.


@Mathieu: would you mind
- dropping this series from your master-next branch until this is fixed
- bring the patch from my v1 series back?
  (v2 seams to be worse than v1)
https://patchwork.yoctoproject.org/project/oe-core/patch/20251230084720.237=
1227-14-adrian.freihofer@siemens.com/

Of course, I can also send a v3 if this would be easier for you.

Thank you.

Regards,
Adrian


>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228304):
> https://lists.openembedded.org/g/openembedded-core/message/228304
> Mute This Topic: https://lists.openembedded.org/mt/116902148/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

