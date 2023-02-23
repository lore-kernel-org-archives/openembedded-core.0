Return-Path: <joel@jms.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AA6C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 00:14:13 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3710.1677111247621715528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 16:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jms.id.au header.s=google header.b=c6lZSG78;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: joel.stan@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id da10so38523985edb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 16:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v2L6ODZeogHESJaKT7DcersCTAAwp21ooIfT3eqQbsI=;
        b=c6lZSG78KS0ckWZCooaBWk32M9FC9iwTuNkkWYJFH0NQYCqUddw1SOuKUhkEWZmpKV
         3mTOFJRp8IwBXjlNeGcCGW2tWNv4gDgBKzbOoMYbZfD2a2svtHR9YOvmoDK/JLijSLn4
         kUvgFXzsH5qyb2SdQbNejKjjqRQxzix0jhzSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2L6ODZeogHESJaKT7DcersCTAAwp21ooIfT3eqQbsI=;
        b=7B+VQgyVSARvlYmZLEJTAQ2ZwN0wi9i6+0PxE1CgKK/uAhMUZ8FDoGrYAOmBTyvS9q
         Rh+1rolJZG0FhTbMQphbtMFUhIN+8dKnjFfEgYCjs7a6WI+9kXyk79Y9yTGg/summof9
         M89peOl4hwekSFXO82F3wL8F6cXiKtqj1kITt1I4UqM1tBqJuS0vkArE1GkUkpHULeoW
         aJ/XmXS+jk5ueyAvuzChf5/X0aziFlBT9PjAXmGaM0phIaS1CCT1LxXhyFx+jLNpceyE
         HRp12JYf1suVtmyy8qC6T3D6feEeHSbJc81ol3pw/otpeeSkZDK/cd4FO7l8tYWK4mM6
         IRXg==
X-Gm-Message-State: AO0yUKXzVRrXuHANFu/nh9IkbjufUsIw2n01MXNWXTCLhjDZD35h7OAs
	GIHAl3kUNTs2kjUxGIMrwU+cGsKAznQCJn4+K+M=
X-Google-Smtp-Source: AK7set8rNwn90XnnDofJhOqOmwuZuH0P8VVsLhQtKzOh40gmz3CsztyUVQpNvVda36GvW5ne4ZzSZGI91O39xJjQLAM=
X-Received: by 2002:a17:906:5a42:b0:8b1:7ac6:318a with SMTP id
 my2-20020a1709065a4200b008b17ac6318amr9827813ejc.4.1677111245869; Wed, 22 Feb
 2023 16:14:05 -0800 (PST)
MIME-Version: 1.0
References: <17462D99D28A7B3C.10470@lists.openembedded.org>
 <CA+chaQfpOv5J3OFjq2+OEdfth6Nmk34FEq+aPVAj+9wsaYc58g@mail.gmail.com>
 <CACPK8XeVKuBLLt=_T8akncOMH3UO+HFwmRMxiawuOuhj94w7BQ@mail.gmail.com> <CA+chaQdzHV5kah_SXhTOfLo36tTZ3bW7oaYY2q4faZnEy0H_dg@mail.gmail.com>
In-Reply-To: <CA+chaQdzHV5kah_SXhTOfLo36tTZ3bW7oaYY2q4faZnEy0H_dg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2023 00:13:53 +0000
Message-ID: <CACPK8Xdt_+tQDdMV0ujV37JkMyiaaFG3iPm9kBN7mM7vZyznEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] qemu: Fix building with latest glibc 2.36
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 00:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177594

On Thu, 23 Feb 2023 at 00:11, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Thu, Feb 23, 2023 at 1:08 AM Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Wed, 22 Feb 2023 at 15:28, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > Hi,
>> >
>> > I've seen this build issue on my gentoo builder today with qemu-native, so I've removed the stray cross.patch and sent v2.
>> >
>> > Then RP had good question how to reproduce this failure and I've checked when I've updated glibc in gentoo for last time and it was a month ago (and I've rebuilt qemu-native few time since then).
>> >
>> > So in the end it was linux-libc-headers upgrade to 6.2 from yesterday (sys-kernel/linux-headers-6.2 in gentoo) which caused this for me (if I downgrade to 6.1 I can build qemu-native again even without this patch).
>> >
>> > Joel: Should I send v3 with updated commit message or will you do it?
>>
>> Thanks for picking this one up. Please continue the good work.
>
>
> Can you confirm if it was related to glibc upgrade for you or it might be kernel headers like for me and it just looked like glibc related?

I pointed the fingers at glibc because of the comments in the qemu
revert, but you're probably on the money with kernel headers as
/usr/include/linux/fs.h comes from the kernel.

I run Debian testing so while I'm not sure what I changed when, I
would have upgraded the kernel headers recently.

