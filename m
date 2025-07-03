Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9649AC83F03
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 17:04:27 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.28266.1751562259459222363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkQVdAt7;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6facc3b9559so2040856d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751562258; x=1752167058; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaDSCSL602+gaUgN3cGG6W/YKwajigHMrXmfWFaXcpA=;
        b=IkQVdAt7UT3XkPT4viXksBY/zYtuFuBMjOON2FIzL4QhEsXZeAsGDlXzr+sWlzC8CO
         tyjC6XEeBlWcE/SlXMQw2hNUyUT9JlhoNdbfpAFkc7nuQtq+cD8PgWRnWe23RC2kHJ9h
         NStc2XR4QovWIC5PZ4E9ggCQpqYpoLhbpPydr5EK/TJpI17EClkeTsWuCquO981LT4tQ
         v+oFDUlLAp23WJGrZliAzAHgwoZT0fsdJ2xZeKWrRSt9SUkvE4n3fiIeKeQLLDezF5xO
         j6rYenU7tSs+IWBTmhG/ubmYtNaphp+fu8r1UXhmFbYECDkJjUYCN/OiHITkV66tSf//
         +Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751562258; x=1752167058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaDSCSL602+gaUgN3cGG6W/YKwajigHMrXmfWFaXcpA=;
        b=uphdw4Tbq6kjitO4lm0OIU+ggLoxCnUkl+YFHXW3wTbmR53iRFbrCS9PxuBxskRBwI
         Tijgcyob8rTwY763KD8cnzT8LWcKyL//x1oCXTUu5lIQVym8V8y25KXXlCMVYcHKJPO9
         PgkvkVvWTNCQWjLOcQQn6ihXGVU+5zZEVTQau0Nhy0jWHbICwYXp/UdmE2uKjligc/Lv
         sprNL8gWmCva+q2MZW9ZickNciEKNcWZKerfUy4+DZVxzmjJ3fj3RR/CTGb96E2kxHzc
         pJsKJlrHJhtrS3L/5lQIicCshcWL3NvqKE8ajSXozfpiUFtXShotPtyHMznANS2XfqOL
         oNeA==
X-Forwarded-Encrypted: i=1; AJvYcCVUo5zEIPLM23NgoIYrpt2TAbnM/xM37qaVSMnAcRB+YG+DWXVILewJ+d2hQaCLC4DEZ0+hyomwCIImsiCAT83d2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfHXj8nvoOHTDdciYjlcy7okg7Q8vV0c4wyev4Jxb/0upLDba+
	BofrU9CDItTdtrEjZusToBPaTv8Ul9TJ8CGMOx+WgkUYkR6gpzgA5gvHfowaX0wXWICx1vjyEsp
	Et30K5bvEVUZDik4TplxHhfvh4q9iOdU=
X-Gm-Gg: ASbGnct9PFWTbBa8gLqK3byj+mjsnfkpPlcN9OiJ1qioAeLX3opoLOoKFGnHAPN88jq
	oGNsBGVEPzhA1umrFF+xSXy8Ssv9DAi8b7D2Jm3CBW1UP6C5DAbRf68Yvl3/9FXs2SfXydwhXIv
	QOvwJWJVKnIkPuFHBmyW+63b8k8odZiO40YXNhb5N/Wer0R1cLgYfx+k8sYmoU/GFJzNomJaNHx
	b8RFRrMCwFa9WM3
X-Google-Smtp-Source: AGHT+IEGGS6TGMPtiCqAJ90tRJa0oKR7R3+PRJtYEPLHvwx9zR1iOK+pQtZnI+rbwUoiEF0Fjnl7rOBYuKT8RCh0pcc=
X-Received: by 2002:a05:6214:1d2b:b0:6fa:c67f:5e66 with SMTP id
 6a1803df08f44-702bc949556mr65236466d6.39.1751562258379; Thu, 03 Jul 2025
 10:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR11MB5653BDE89A4EFB219A90C7E3EF43A@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5653BDE89A4EFB219A90C7E3EF43A@DM8PR11MB5653.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Jul 2025 19:04:03 +0200
X-Gm-Features: Ac12FXweNOAjNd79LdZWsrRzaYivyZlyqXTRZdM93s6Gqc2Mv_0CCm6QOQZz-yc
Message-ID: <CANNYZj9UyaxakeB-CS7YZB+VRNsLkSz7vmv2Z78R6dMi26j=3w@mail.gmail.com>
Subject: Re: [OE-core] GCC Patch removal - 0008-libtool.patch
To: Harish.Sadineni@windriver.com
Cc: Khem Raj <raj.khem@gmail.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 17:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219891

This was written by RP very long time ago, Khem's metadata was added
on version update or otherwise later.

Generally removing unnecessary (or poorly explained) patches is welcome.

You can send a patch to oe-core that does so, and if it passes a-full
test, then that will be considered in patch review.

Alex


On Thu, 3 Jul 2025 at 13:38, Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi Khem,
>
> This gcc patch https://git.openembedded.org/openembedded-core/tree/meta/r=
ecipes-devtools/gcc/gcc/0008-libtool.patch?h=3Dmaster modifies the libdir f=
rom "/usr/lib/../lib" to "/usr/lib" in the libstdc++.la file.
>
> We removed this patch and rebuilt GCC using bitbake. We did not encounter=
 any build or runtime issues. We tested building gcc, gcc-runtime, and core=
-image-minimal. After booting the image, we also tested libtool and a simpl=
e C program with the following commands:
>
> $libtool --tag=3DCC --mode=3Dcompile x86_64-poky-linux-gcc -c hello.c
> libtool: compile:  x86_64-poky-linux-gcc -c hello.c  -fPIC -DPIC -o .libs=
/hello.o
>
> $libtool --tag=3DCC --mode=3Dlink x86_64-poky-linux-gcc  -o hello hello.l=
o
> libtool: link: x86_64-poky-linux-gcc -o hello .libs/hello.o
>
> $x86_64-poky-linux-gcc hello.c -o hello
>
> All tools and the generated binaries are running fine. So, we believe thi=
s patch is no longer needed with the latest GCC sources.
> However, in the commit message, it is mentioned:
> "it shouldn't be passing this into libtool in the first place but for now=
 this resolves the nastiest problems this causes."
>
> Do we need any other tests to perform or is it okay to drop this patch?
>
> Thanks,
> Harish
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219875): https://lists.openembedded.org/g/openembedde=
d-core/message/219875
> Mute This Topic: https://lists.openembedded.org/mt/113964150/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

