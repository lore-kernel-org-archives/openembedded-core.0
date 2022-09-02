Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CB0ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 15:09:20 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.7670.1662131352368239631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gZRZPdrW;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id p7so3744240lfu.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ss+iCy+XkLhtoBwb4DReM1rZUoixQwqSRsA9u8f/O/U=;
        b=gZRZPdrWyHhVMlVkZNeaa8RVBofoEL2QRn8HxtmCmdu0uhQE2ST11w1+frYM17INOw
         va4lep+9RYDemLh8vwEl2dpIkflvKzqkoSIZHrP+3a0CLHJHTzzDJU+Y9dtZ2w6rwWZu
         DHc7es3rEn4NpgwoTWDCr9qbh5YF95SPtr1h1GXr3Y9l87v36uvYuoeUxovGP857wRlV
         TuFRKm3EqEFh84vg1th3oym2I01vRdUUyfX6wrvII1G/JTaoCACAAtAcLz8592vuTDm8
         d4xJRfTNttuGkuHZHvrfMAvh370ds8BF5mCd0UYT00D1GSFYSOr/03syXHupEk46uBR1
         o0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ss+iCy+XkLhtoBwb4DReM1rZUoixQwqSRsA9u8f/O/U=;
        b=DvCFo27LxguFuY0dzsZK/8uu/+wcOiqJhxaCmOV7sXUFeLFg1pMYH2Za6C8xjE4uMg
         HKvWLPh7a1Kk1a+LS9nPT6h06kp9qBk5HH/wQ7JRRICQVxdOrh8gnEQ2kEI0sl+NQOPE
         YQUVCFmQ0fSTWbpx36lc6c2H7G57BQcNcsWCtHvJbnpg4sMKQGdxmBamHAVKnVOYtW5i
         dt8ajvICNyJBjZUkeLV3kz7H3Xo3l7yfrLFF6+p0vr2Cxv5Og21BdDcY3uTtMHcIl46S
         KHHZthlpeqwECLgT6CmwNNxcJ0NHTt1Z0mcMjS43XRcec4XIrSsmn9pFZfChPydkIyf8
         4bRw==
X-Gm-Message-State: ACgBeo2QCmWI1mf/RiOcbtWkJg9PEcYS0rZdzXlye+7963Ccc6peuQJ6
	tOOY/u+RlBj0DSxxQEaYEXvzIqkCK0DXiPtxhHQ=
X-Google-Smtp-Source: 
 AA6agR7vQmDSzGenvbBTyjFxQmn4JaemLEoWzWRRn3QGeULyC5xx2SVv9Wkb9qr3WBNsDyOfHze69PLXzKxQ9YA3JuQ=
X-Received: by 2002:ac2:5d26:0:b0:494:6d31:4c5b with SMTP id
 i6-20020ac25d26000000b004946d314c5bmr7860974lfb.358.1662131349376; Fri, 02
 Sep 2022 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <CANNYZj9cXbFogXaJdTeb2r89-AaPyL3txoJ4xn3ER=Dq7jy0mA@mail.gmail.com>
 <813962d42b7c46c9a0a8565de787d981@axis.com>
In-Reply-To: <813962d42b7c46c9a0a8565de787d981@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 17:08:58 +0200
Message-ID: 
 <CANNYZj-rx80UFnEAEiVux7Wysvvj2PK05CC6hbosm5=6ymr=xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 15:09:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170254

On Fri, 2 Sept 2022 at 16:47, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> The expectation is of course that if one has one's own .templateconf
> file, then it will of course have to be updated to match the changes
> in OE. Nothing unusual with that. But that is something I do as
> maintainer of our environment. For our developers it will then just
> work.

Please consider that there are three different ways to obtain the
location of the template, and they must all work. For those who have
created a build/conf by supplying TEMPLATECONF on the command line or
templateconf.cfg (which I would say is everyone, except you) the
suggested code will only make things worse, not better. It would take
wrong but helpful value in templateconf.cfg that points to a custom
template, and replace it with meta/conf/templates/default, because
that is what they have in .templateconf. Then all trace of where the
template came from is lost.

And as discussed previously, you don't even need to jump through the
extra hoops with generated template configurations to begin with, and
can write the dynamically generated configs directly into build/conf.

Alex

