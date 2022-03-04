Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B7CC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 21:11:21 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.1962.1646428280493505660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 13:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=csEtI5tO;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id c4so8534566qtx.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 13:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f3m+mp9hHodhXZK7cYEYpC372ylPl5vowSrgwQEKrec=;
        b=csEtI5tO31GOemr4jz2eomZN88lswwYCZmK/aFUGoM+K9/G53q35kl4LJ3UoYHpmbN
         u0kMIuC0XSsbo4zwMdQxP4LRzjI46rHsNctQO7cMjH/fZ+9AjCNOxrbpUb1Qg9TSdXQx
         acmu/1dpHxBN2TfrlADYrSY5gowt1nbu3z0aTSTf528YaYLhXW2VRKGZ/kdNRxhSlGBF
         /IaawGnexsSPM723LNkzNorNptx+/mlAnmhwBzH1fVXE4EP7wI7Z4yx0VIEnxCNstLMt
         pZfzj6AFIVLjY9GrzzD0vIhQNhLogFtsehv0Zd0fvUYhJEKsbG5hNHfuZh9BvsAPk2c/
         COFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f3m+mp9hHodhXZK7cYEYpC372ylPl5vowSrgwQEKrec=;
        b=2b73F41XoGLoE6Be+BkQ8Bod6LRJJWP1t+hkpng8sjoUy2a0lXTB84GIY717HJ3N1D
         /E05ELbe7uYmBjOjMw7D3UWBOk4g+iI91cNyELcljxysVd2UV3QQ3c9zXYRHmZmlbayr
         tzhBzJfAh5nlvS+HsWYldMI7gWqKLD2Ozi5sabBcLc0yJdG847JZiOL6cbtVcl3QdJTX
         Iq14KxxTKQw+WUsWCY++/TgxzPqpxo7qRg8PKYjXXbjiCW58oqQGK9WP3odlnqdv69ep
         vkjJGTc2Uwo31J8jtOUoCzKpArHfS31m/9vzIVXAs0TorREoicR0pnSjr+Q85ir2FkKB
         bSlA==
X-Gm-Message-State: AOAM531eQqdBdYMriNgQnzU+q1ccxpREI2yKe6Kk1PE+/NRYBwtUDV4K
	1tfaDFBn5pfmK7Wd23i6/+YcX1B8yj5KyROEO/8=
X-Google-Smtp-Source: 
 ABdhPJwVfb3wYrIyCpUjk0jmdJHIWZG9uriZWSeRKw53AarrkU1CXmWWr0acFRDqtF56pH8P3CS3R2a5YqFPDZNY6jM=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr647626qth.330.1646428279611; Fri, 04
 Mar 2022 13:11:19 -0800 (PST)
MIME-Version: 1.0
References: 
 <0101017f50e03108-050c414c-790b-4c05-8b8d-daf41cff5a1b-000000@us-west-2.amazonses.com>
 <ee42785d-ef25-fcc8-1b2d-c1dffbc0cb6e@windriver.com>
 <CANNYZj9YmuQoMUgskuxqOqk=QRBpMWAGxj7soQtZvJ-uwtA1EQ@mail.gmail.com>
 <CAP9ODKoxHMbmLnS38f+9TO0edcwmpPJ+MFDmtgskZG3iAJiWtg@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKoxHMbmLnS38f+9TO0edcwmpPJ+MFDmtgskZG3iAJiWtg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 13:10:53 -0800
Message-ID: 
 <CAMKF1sqXH9mQwbR-HrcQCadL_U14KZz4B5q3iHyBXpS3aBtVtg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.59.0 FAILED
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
	Pgowda <pgowda.cve@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 21:11:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162758

On Fri, Mar 4, 2022 at 12:56 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
>
>
> Em sex., 4 de mar. de 2022 =C3=A0s 15:04, Alexander Kanavin <alex.kanavin=
@gmail.com> escreveu:
>>
>> Rust is a low-risk item from feature freeze perspective, so I already
>> queued a patch. If a-full is ok with it, there's no reason not to
>> merge it in my opinion.
>
>
> I agree; it makes sense to upgrade it (even during the LTS lifetime) espe=
cially because Rust compiler isn't long term maintained so we should consid=
er it.

Its not end of world even if its not merged, given the rust compiler
cadence we perhaps will have a mixin layer for
it for kirkstone few months after release.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162757): https://lists.openembedded.org/g/openembedde=
d-core/message/162757
> Mute This Topic: https://lists.openembedded.org/mt/89530593/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

