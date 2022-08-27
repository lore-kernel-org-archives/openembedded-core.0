Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D923ECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 19:21:04 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.52399.1661628054867891280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lr0EUMQV;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id m2so2325513lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=IvPAvy+N3MLSkLJ/mV30zLhEtYVmONRshyRYHAadLD8=;
        b=Lr0EUMQViIlmIo2QJxm5Y5ao3YZdHoEnvjrqlLlSphAd5sihRWI+SuuaFc3A3xNdAh
         jZePRumDKCi3rNnvRQ3STouWdRPvy+nArOvxcU4JHu899/uRnBsBM6jCII/RtS/fYZ8s
         1IS+r26l8x5qpDzMZtNpk6hX2oYY/URVjZIXkKOWOUfevAMjq3jBLJEJAC+Ehz6tapqR
         zVZTM/CBke69LklPFAajHQRlZueEsDbIOSrELX7W563XnDaMyRa0P54ztL7PZQC/5PQ5
         eo6Jvq7hNdaYJ+GM56ORYKIxpAyE5BS+2dyVcOimoIc7/oU6H9cKuMrG4SoCUICsKzDD
         /aiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=IvPAvy+N3MLSkLJ/mV30zLhEtYVmONRshyRYHAadLD8=;
        b=nF5yVRHPSez3VlGYolNMjcob+G7BynFnkaMBzO8fkLg82ZOmBX+cGdJDtAiEPPZ4d8
         RFogxEKDMgiwx3HHOjh6I3ZWBvgUu2kG/M35at0rNTsf6UxtfF1xp8bMKgc/TDf3YvQT
         OiVh6GAB08bnBRv2YRy2P3wepV9tdhoJcCZS7FgBOxs3PMvOiRVf6YQKaNBGHrdFCY/7
         S0OdsRIXQB9vMIAVDqC+prjLe3XbYXToxyEYQ/VMBkXfJYYr0ubJOB332vsY4VJrcbbU
         Ge/462FbpAzWf0QdSvZJXl9coy2NsOBSfJvQl9isrbdKGxZBqiJ6s2voULv/it8ZqCRk
         zlsQ==
X-Gm-Message-State: ACgBeo0jfdo78QrjjiDgXWTQ3RRp/Y8PC/L+Xq8QjdwLUtqAz1K3vy/m
	aSzPU5ErDZxSxx8CfccrkTTruSvikblS1z5em2k=
X-Google-Smtp-Source: 
 AA6agR4Gr0ToQhsbhVo5ModHuSARaKVobPHHrHYWlnt2kfvEDk/A++29GXg4RnE5YjVy6iSsZwq3Y+kmRbSHyCr1xkw=
X-Received: by 2002:a05:6512:2511:b0:493:50c:ec3 with SMTP id
 be17-20020a056512251100b00493050c0ec3mr4002810lfb.665.1661628053045; Sat, 27
 Aug 2022 12:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
 <e40af25a1dedc9780f107df17cfb81320235653e.camel@etorok.net>
 <CANNYZj8Wa7-u08yzSNEYUOtJBMYO5hNEiWWjAPjB0ieytSBQbg@mail.gmail.com>
 <2e91bec4aeff2002d84b96f4c7f06b99119f948c.camel@etorok.net>
In-Reply-To: <2e91bec4aeff2002d84b96f4c7f06b99119f948c.camel@etorok.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 21:20:41 +0200
Message-ID: 
 <CANNYZj8GJgtbDHan0jpNXswe=A4iRq854c5N5JCHhxzPeHp3Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xz: do not OOM with 3x builds, lower memlimit
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin@etorok.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 19:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169970

On Sat, 27 Aug 2022 at 21:15, Edwin T=C3=B6r=C3=B6k <edwin@etorok.net> wrot=
e:
> If XZ always uses 50% of available memory then adding more RAM won't
> help though. The only safe value would be BB_NUMBER_OF_THREADS=3D1.

But does it? I wonder if reducing XZ_THREADS will actually reduce the
RAM consumption as well. If the problem was common, it would be
reported a lot more, and yet it's not. So I'd suggest you run
experiments with XZ_THREADS first.

Alex

