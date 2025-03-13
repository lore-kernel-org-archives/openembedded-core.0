Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57E1C282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:31:41 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.16356.1741876291724836141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WvC6INYR;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1231250e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741876288; x=1742481088; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/+btpb1dQF/8ajlbPwNbfpEHevBtCMpWKFVJPZJFa4=;
        b=WvC6INYRBo1j8SDMR4XkqQ3YTHU+RcbQ2MgPm1Wd5AQ+GoGGH1gfPBFISI3AOPUojj
         cLbEaELxZ7eDzLirjZsAl3q6bgkO3afiwV17hTDx9Ua/OttL30yDrIyTT3/7MTWQlM2o
         RKP4xVxQsTZo9ULUxbSbdxur/axeO7hS0Iq6biAyMhQLwAeoKDDxj1KUOcAzYb1YUbyV
         IResC3dn82TfmO0/7BT4xt5K80mvvKu8LgF3psnHXE+iGS+FNcVKMYJjiigZ9AUIO2ie
         F9l2Yv4ry16kSKTbU52XhK8SlNfeQaYOxg5/W/XwBDZDGSnzxJLedFT4meIHBd5kwXwx
         oe/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876288; x=1742481088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/+btpb1dQF/8ajlbPwNbfpEHevBtCMpWKFVJPZJFa4=;
        b=IQXfmPUsMCWJtiuAxfF/sMlpmaC+4I6QScalW0BN3xKLZspdu5OReF71gcekSYbjfH
         qJlHoS7qPoR34uP14qQdAT6ZQQ0z89ZEyEoqOEncEqcL6GZ4kpfifDiIdXjEm9tJgnQa
         p1gIbEda9mhw/KKuh+KebgD5W05OddyWQ9kKqrElJ2JOuwmgtSMSZqPBSH94Hp0inJg/
         +mdMtelxXO8o8ui3KALZLj0N7+kZFzawRRDHyCUH83E7J+Dud7JByX4ZdTbF45ODwncX
         ZE5m1MFXm4Lx6Sh+i48bZEWfDqI1lWFFnIyT3XvCi/P2KG3zySxwTTqwFcZDE7wWLYpT
         C/Kw==
X-Gm-Message-State: AOJu0YyZ8UALJI7yJoTaSthh8TJ4zom7b3MPFPNT/c/SHIoHDsd3YgjV
	Z68O4CtWbg7AYkG4iZTmOI1GN3PW374rJRQocsoEysEEf+P19Dkt+fsPGqzIfTyXChTgtdAwL6A
	yccJytU6UY+plARPREn7mypd4BnVOTdbL
X-Gm-Gg: ASbGncv3GwqyxjQ6zQJaCcdoB4Z8KHU5QEagJlLkZscXlyonGW8tQieJ5xq2Qcl6ScY
	kgFoPosswhpwPyPRwHf/2FqArPv+9h39swNPl0qn0UijW+RupLn9nyF1J7ADcSfcayPmtnJMlxq
	m8PJzn8xGSIigpyQ0klFRMA8m5nLAuD6wZ+L52cXiYaKAnB9Hx9bo=
X-Google-Smtp-Source: AGHT+IF7hhnq3KNLaYXhjycDJ51bBzJyyDxfPkRGna/ttYhbs2UqvbDSUCDoB9Yp3n+iytOhgxNNY/ZZ+EipOznluKI=
X-Received: by 2002:ac2:53a3:0:b0:549:9143:4c5e with SMTP id
 2adb3069b0e04-54991434cadmr7761631e87.11.1741876288094; Thu, 13 Mar 2025
 07:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJdd5GZNUAHKx1SH-8HCkRJ111zheEA_aLPJg3bRkt8==niqFg@mail.gmail.com>
In-Reply-To: <CAJdd5GZNUAHKx1SH-8HCkRJ111zheEA_aLPJg3bRkt8==niqFg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 13 Mar 2025 08:31:15 -0600
X-Gm-Features: AQ5f1JqaPkvEW6CxJrUPzkp6ca9cfREGwx2yR282kS05gnwLLGwRqp_x1XaAekQ
Message-ID: <CAJdd5GY+5s8wTaHd=1S0P3HdtcQSBRBYi2W9GLSxzF4csEhnXg@mail.gmail.com>
Subject: Re: SPDX 3 Improvements for performance and VEX
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, Colin <colinmca242@gmail.com>, 
	Marta Rybczynska <rybczynska@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212782

On Thu, Mar 13, 2025 at 8:28=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> All,
>
> I've push a very rough draft of some proposed changes to SPDX 3 to
> help with the performance and also the generation of VEX data:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Djpew/spdx-3-improvemen=
ts
>
> Richard: Most of these changes are pretty straightforward, so I'm not
> worried about them. The only one where I fear I may have committed
> crimes against bitbake is the very top change ("spdx: Add product SBoM
> collection"); If you would mind taking a look I'd appreciate it.
>
> Everyone else:
>
> This change basically introduces the concept of "product" SPDX package
> that describes the upstream source and everything our recipe
> "statically" knows about it. The term "product" is shamelessly stolen
> from VEX, it's probably an awful name, and I might change it, but I'm
> sticking with it for this email.
> The product SPDX package has a number of advantages:
>  1) It can be generated by running only the do_create_product_spdx()
> task, no building of any source code is required.
>  2) It contains all the VEX data (so, no build is necessary to
> generate the VEX data)
>  3) It significantly cuts down on the amount of processing for the
> SPDX VEX data, because there is a single package that the data is
> reported against, instead of it being reported against each runtime
> package. This significantly improves SPDX task performance for
> pathological recipes with a lot of VEX information, and a lot of
> packages (I'm looking at you linux-yocto). Guesstimate SPDX build time
> reduction for linux-yocto goes from 10's of minutes to 10's of
> seconds.
>
> With this change, we can pretty simply generate a SBoM of all product
> data (and thus all VEX data), with:
>
>   bitbake -c collect_product_spdx core-image-minimal
>
> This will output
> "${DEPLOY_DIR_IMAGE}/core-image-minimal-products.spdx.json". I've
> tested that this can be converted to OpenVEX using the tool I wrote
> that does the conversion [1], and it all looks reasonable. If there is
> additional information that is not captured by standard VEX, we should
> be able to augment the SPDX data to include that quite easily, since
> SPDX is quite extensible (we already do this a lot internally while
> generating the SPDX to make it all make sense when we assemble a final
> SBoM).
>
> I think with a little more work we can probably also do something that
> allows generating a report for `world`, but I need to figure out how
> to do that.
>
> Feel free to give the branch a test drive and let me know if you have
> questions or comments. I'm certian that once this is polished more
> we'll end up doing it for the performance gains; I'm hopeful we can
> leverage it to solve our CVE reporting also, since it basically comes
> along for the ride without much additional cost.
>
> Thanks,
> Joshua Watt

I forgot the reference link:
[1]: https://github.com/JPEWdev/spdx3toopenvex

