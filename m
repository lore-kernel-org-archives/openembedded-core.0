Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CE2C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 14:08:40 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.24569.1669298917100631855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 06:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LiYQWZTV;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id u2so2120660ljl.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vI06AAiO1CS2oah1UT3OyTt6MYFiKobHExCPYYHdy/E=;
        b=LiYQWZTV4NDHqUENI5f4IGyUTsYL4oHNbdkC1ody6LkSdElGxooUXLtKKyfqRHVhq6
         Z+v9tyCIB5XTHpqyDRy2a75HFu9KXgs/xfZBqHmoJoYZfLG6eh//fdeSWLm2lg9aAuIG
         mC+d16QiUfuozw5J5vE/BsOq7hlk8pecgWTwKhWq043ppjs6c9xlRka+yrpMEVixXQCt
         lr5VO7dF4IcjsnDjH4eo2B6mKGkMrDG5HKUq3Za0lHkInBDxhuRqxZ40gMN5ZwmiGALd
         nBcBfj5gUpCqwKM2uBua8u4Hnc8e56DgArr8q+ZIdjWsYNNn6luqO7dx7B3dEaXHdCjZ
         R9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vI06AAiO1CS2oah1UT3OyTt6MYFiKobHExCPYYHdy/E=;
        b=DisxdL/eJ5XJygSzfwRJmbJ50LjG3M0vrJvh88i1sy6x/T8uKz6DDiwgVVl/JOvPcE
         BiGDdiuaOgyAwUpLknsQgGvo2L21dlOZyGbVGa4y59boemgnarDeEWYbMWHt9iviqrho
         jquY1oFA+hl23uSUsLJQ0de9QhS9oJCRrjAAUb9q/6JkSYFNVxG42q2xwQPEipLeojN6
         Ry8kNN2YqmDN9ORsOxOtRA9JzckZsghNPtFYIdXI5C30e7thqDpxWxuxyHvL58IvaaDz
         3q6VIhZ8Mg7G35xP/Iye+SfnMtHJNIFQiO2qDMr9OJlk0BxVYo4bXDmPoFWJF3xAdy0A
         Tfsg==
X-Gm-Message-State: ANoB5plsJZi7jS50/CBcs+McS/FuloZisf9qCVMpGxLhIcYfDbvcbrRN
	Nmiu9EF967XqFBonZpkE6HBswYf05DGTP7uQE18=
X-Google-Smtp-Source: AA0mqf5mcoJfAazlxMiq2OBQYa14vv36MCAE2o2apv84dvkCHC1TQbSVsoaTGJsfR9KSD6eTyZWKnMpLHP7RVtXlUhA=
X-Received: by 2002:a05:651c:c8f:b0:26d:d196:d04 with SMTP id
 bz15-20020a05651c0c8f00b0026dd1960d04mr11084451ljb.403.1669298914602; Thu, 24
 Nov 2022 06:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-5-alex@linutronix.de>
 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
 <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com>
 <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
 <CANNYZj8DcqqBFjBeLNsvhS-KbpzM1=hCeR=XL=FNwQV7=bBEUQ@mail.gmail.com> <860e71c1edb0e530899aa25c00722e7dc04acac6.camel@linuxfoundation.org>
In-Reply-To: <860e71c1edb0e530899aa25c00722e7dc04acac6.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Nov 2022 15:08:23 +0100
Message-ID: <CANNYZj8s762rRv=noRyH3h-dU6a7nM04H2zFWRqpHkTsK-rDSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 14:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173753

On Thu, 24 Nov 2022 at 14:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Do we need special privileges to be able to run that?

No, you only need to build meta-ide-support as the scripts take nfsd
executable from sysroot of that (could be improved and available
directly from qemu's own sysroot).

Then it should simply work if you give the rootfs tarball as parameter
to runqemu:
$ runqemu tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.tar.bz2
nographic kvm

Alex

