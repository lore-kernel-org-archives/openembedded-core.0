Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6511FC77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:52:22 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.16308.1681224741213494724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 07:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=CANPwVBy;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b33so4426247ljf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681224739; x=1683816739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/Ol0iE6rDId3BlAJ5FS7bTeB3L5KttG92n6fNZgK7E=;
        b=CANPwVBy8zT3ks2Bp+aClzELJdGiIE76I/xxbdBRw3iG5dGwT8L3sqFU5LGcpFrrAN
         23jc9M9xdRPgt8cqWtrlf8Uc5yUGynLAQEMy0yeNR9P451DDb3Ai0jJp3AjJ5FX567eL
         5OobSY85ourypo+7DnWIjSLYws+KeqkSwlvEnn+LCeEsJF6d4e3hNn7LF77X+Q3V/EfP
         rXNnbHF6ZZN43UFkhv/bFPnumzQnh9oL5uNZrqBEtvk0IKfJ5vUmvaMv/pQoJzoh6uD2
         TFYfdJiuhNwIDc2ZBD79aJtZQWYCByqbsmxQWOipJZBoSjf3KAigKG9I9bJKIFvLXhRn
         VHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681224739; x=1683816739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/Ol0iE6rDId3BlAJ5FS7bTeB3L5KttG92n6fNZgK7E=;
        b=bvFsKW+l7yvobscpClq19qxbY48LN9gyLFMMsAL+IY6856TH34bBQUt54YqYihB+7a
         CSUpYklYPQW4wh0D7iKeMdBQE3qF99OroiJZBu2uwwHNXXQK7vCyLnpG21zMzFIZ0iII
         N+tYHB9VX8t6sbFXle0gX9M36BoZ/iJ3Il9t0x2tAr3MLBMbkUUlDMMYkjxY8wG9XJF6
         1dQoEFy4vJNCfs48qk4WtgcR3wCWSkUCddHmynRC9nhh/BQ3KIGhhvyxKAYNsEJRxj+z
         celfll0NKQvjopXMhH0pNPF6q3FxFp6zwcOuoIuMfAFcoQZstuXmIFOyX9rxM20UYF6z
         SdnQ==
X-Gm-Message-State: AAQBX9dgZ+xlK0o/VooyERsUBSULFo/Pj/S5WLXJ9eYwbcfv5GlO/Am3
	3FPG8W5UXBHQAFxpydSbvYlm3y/0V0Ua9PQreFc=
X-Google-Smtp-Source: AKy350ZErfQRPOPCTnH8iDeZdVaWGKlIEw3mwYUTcoghAz70RpyML242BqKM1xRLy+y1jPo4BJOj7RH3etDS1qAE/C4=
X-Received: by 2002:a2e:9b98:0:b0:2a7:8295:cd00 with SMTP id
 z24-20020a2e9b98000000b002a78295cd00mr1539702lji.7.1681224739379; Tue, 11 Apr
 2023 07:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkepjPjqTHHwxkKv-9xJHZMoBToUpAvg+tyGKQo6KDN-89A@mail.gmail.com>
In-Reply-To: <CA+cAkepjPjqTHHwxkKv-9xJHZMoBToUpAvg+tyGKQo6KDN-89A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Apr 2023 16:52:08 +0200
Message-ID: <CANNYZj_dRQx7FDSrbP_F-g9vgSpg2GfASZjLvhxk7PR8iwNXNA@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 14:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179925

If you read the code for the test, you'll see a 'bitbake world' in it
somewhere :) Tweak that to build only the item you need.

Alternatively, you can set up two separate build directories, and
avoid selftest altogether for investigating and fixing the issue.

Alex

On Fri, 7 Apr 2023 at 17:21, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello,
>
> I plan to work on https://bugzilla.yoctoproject.org/show_bug.cgi?id=15090  in the coming days.
> To show how things are tested I ran "oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds" but even on a strong machine, it took several hours (I waited for 6h and it is not finished yet).
>
> Does anyone know if it is possible to test reproducibility on a single package (here, zvariant) ?
> Should I tweak the python test class or is there a simple way ?
>
> Thanks
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179826): https://lists.openembedded.org/g/openembedded-core/message/179826
> Mute This Topic: https://lists.openembedded.org/mt/98126404/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

