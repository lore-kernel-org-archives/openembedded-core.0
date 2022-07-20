Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF36C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:28:25 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.51810.1658309303512351183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RTZXR4tr;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id m9so17793117ljp.9;
        Wed, 20 Jul 2022 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZNmxSusRlSvz1u+Z9klggU4bhzZu0U2uBmAXgyZna5I=;
        b=RTZXR4tr5r3fliUSuHrDmF1Nvqoq3AQEfssDX0pae4VnlpUeIXb4a9DaYuw7SVUdL5
         4nC6dWyC/zPOcuMDOowgdmeWNvNuuA3M3hvKsdb5ZBnoKC5syRzyNdNiVjxhuS9L77li
         4FLgWvkNPiDPKztgysI/Wg1633SfZzTRg5BwUCNITdmP+Or9zkGwS6+wfa/NuL3NoACA
         TXWNUcjTvVHTCakI19QqWd6WlhRhRcBiuTBKJ9pi2Tx0FsE3kgXq1rLI3Z4SHntb49T6
         agA0Wa+8Z+jEqA7z+M+oAt7YDb1tHuXyKkYp/4ER+heVozRe1cNgY27EERVVsWnLFvyd
         mxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZNmxSusRlSvz1u+Z9klggU4bhzZu0U2uBmAXgyZna5I=;
        b=lo7FEQq+MpFlQyEeVvd8QnKIEYLdQdhytKxN/Lmon5WcpBJ/KZ0ghsRGwPUBWqSxQY
         lIi/WkbQK7o9toT0R91wJba9dICuGwl//jHquURU5o3dJQkLxzP54aWzgb/Q8AcP2YT/
         k1eEFxn8Pwv+UzJie5uufq07X9CspaFY3dC+xJCdzkWITjNk+2Gip1QJsAYglhMPaJt6
         hGrHPB5Vyg8D/SaoNMOKmWyJpfsKqamsaaS167W3cK0SuvcytwMmdBRlyHQUKgpssSX8
         RynAG+swCYEt1lMc4WvIqJvczZRGidEi/MWZmTH0rhHJJ+2oDFGtNUA62thw23QXVww/
         0QiA==
X-Gm-Message-State: AJIora8fnwAlC75OL2bEx1gOB5txiydYTfalRdyAgGt+GzZgiCtyQ8Ni
	Fx4GqQ0di+tzy+SGAjZgyEN29Jv9Qdjb2F45x+g=
X-Google-Smtp-Source: 
 AGRyM1uijzmMywkVmpEN0/mapJPmdilocg26YNDvHCARQ1fpvxGSWpQ1dTx3OmC0NzelP/VFfePHcRu1mB5Op4Lgd3c=
X-Received: by 2002:a2e:b6d2:0:b0:25d:6849:f7f9 with SMTP id
 m18-20020a2eb6d2000000b0025d6849f7f9mr17068258ljo.41.1658309301620; Wed, 20
 Jul 2022 02:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <17037D268C38CE83.21682@lists.openembedded.org>
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
In-Reply-To: 
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 11:28:10 +0200
Message-ID: 
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168349

On Wed, 20 Jul 2022 at 11:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> That amounts to dropping x32 support because as soon as we remove these
> tests, it will bitrot.
>
> There is still some value in the project being able to support
> different architectures and different type sizes so I do still lean
> towards keeping this alive at a minimal level.

But then why not replace x32 with riscv32, which as well has 32 bit
pointers but 64 bit integers and thus trips over the same type size
issues?

Alex

