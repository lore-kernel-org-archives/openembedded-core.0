Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E493C54EF0
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:09:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.14944.1672931389422768487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NXUJaub3;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id m6so45050010lfj.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ECkTBUhhIpG17Y7FDlw7Idu7jUHDS4zYkBBZFc04VPQ=;
        b=NXUJaub3D3NuHIwvPuuVFY514Q3fDLpuCxvHeYzWCN5F/nRg+TkX3Vz1R3Tgxtg1L/
         7XEp2mWhoFJXU4WKXw1VkFAG96L4CS6z0noac3dtNoHELVuxLd9L/KBqMbHfmLxIJc4u
         igJsJAF6eTB2gRRmRwdRYaik1S4hllJzbGqb9GzxUvEHNQx05VP+ZpbhicubxfdzOSNi
         IFsj1V7+GByyTRJjcdx2wdABUTys8hzoj6KI1+qkdyh53SG41QW4SoDGnumfX4y/NVD4
         7yLPzWzXvTWWqkMXoig224dX9FHNX+IhdfbXU3luN1Sn/PbmrZbnoQg7PN2q6XeDBeYE
         omTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECkTBUhhIpG17Y7FDlw7Idu7jUHDS4zYkBBZFc04VPQ=;
        b=l70soOrgcPlQEStc/ugKjkC9OwcUDrvu0r5Vd08p9/leBucqg3IEEbqI8dW+CrAplL
         7ufKitj4WaCLQ/fQxnQ89dcCr/RsN0stG23yZTZjX1wDrZTEXIf/S5LbO3YOKHe4kS6H
         ZZsNaAwZms4hcKVx50XGtdo+eD7YmV/iINs++JJBAyX4lIZhh8mp0NhNo6pHdLTTbDA9
         5g18VKifOYgkbfBntVpneDUHy9JKHSgYQZes8mOwlhcmK+tDRHlDOsSJea6pBh4OOrtB
         55jrTF/yJFqA1meaZ07uZvw/aspEeL5kfi7lEtiq43hqnoYJedlOSpQdnovZISBtaZH+
         Yowg==
X-Gm-Message-State: AFqh2kq7h7Mjipdb3TA8CkDISOY3t3Ibk0/OR1gVz1iCpLpjSGf69BEs
	SuDa7j4JhCjItvor8pKp49S9r5yvqeBSnAj4y3A=
X-Google-Smtp-Source: AMrXdXsBGkbySK4vMjgWM150/Ak3yEPel5upVkEoQajgfkhZkwX9sGmX2zIZKX6T1i89ttjGjv8vy8IW5npkT1iwQ10=
X-Received: by 2002:ac2:4bc9:0:b0:4b5:4502:1323 with SMTP id
 o9-20020ac24bc9000000b004b545021323mr2957209lfq.345.1672931387271; Thu, 05
 Jan 2023 07:09:47 -0800 (PST)
MIME-Version: 1.0
References: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
 <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
 <1736D38C7177CA6A.6604@lists.openembedded.org> <b725dbd2-3825-1eb7-3f71-a19a17c2ef7f@bootlin.com>
 <d92b4751144e16c0d97823b7eef1b88b3a20b760.camel@linuxfoundation.org> <c39c062f-44d2-7b84-9b22-3b52957407f5@bootlin.com>
In-Reply-To: <c39c062f-44d2-7b84-9b22-3b52957407f5@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jan 2023 16:09:35 +0100
Message-ID: <CANNYZj_qBzHoTTsa3GeW9eUKoL+XHv+uiyoNmq9=z+78RLbvmA@mail.gmail.com>
Subject: Re: [docs] [OE-core] is "poky" distro defined to use "sysvinit" as INIT_MANAGER?
To: michael.opdenacker@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	"Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 15:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175538

On Thu, 5 Jan 2023 at 16:02, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> As far as I am concerned, I tried to set INIT_MANAGER with "?=" in
> poky.conf and the set INIT_MANAGER = "systemd" in local.conf and the
> resulting system was booting fine.
> Shall we make the change in master and see if autobuilders catch any
> issue? Unless your remember was the complexity was about.

I think you have the privilege of running things directly on the AB
without having to ask anyone, so I'd say just make a commit and toss
it into one of the master-next builds that bootlin runs :)

Alex

