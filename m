Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5940BC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 11:07:43 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.8556.1743764853548907073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 04:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVm/H0Gy;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8fce04655so18699556d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743764852; x=1744369652; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSFk5toldnmITzw84v1NSb19NfgQzPeeG+odWAseTYY=;
        b=UVm/H0GyLFqxQnFAaEhgqY+94JMWz1KOY3vEsIAC8LpBgaOMtTqyXL/g+UGKmrbZnt
         qsraSaWkd5JUF7ag31wbEEBNWOZnJmFe5/L2I3T3gVczt9PvCADZyNvgwQgsGeDvd9jo
         /9br3ic15vkL3dS87/P7JabrHW9jv27uXpttTQR1dUNYPuRuywR+z/+md6Y18K7t7vZ/
         czRyZ5mTQqLk97IeEB7VJDy6c4p2hnzdvZk4J7ITGkBPUI5xEesymCY+TjnDNN/AX2Yu
         jJYRvHsv8tAbRc4HdmA0CZKc5+F4xi8CFhFwNW2Q5ufmJMF+i19nuoh7vjgDf8fHNGb0
         PApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764852; x=1744369652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSFk5toldnmITzw84v1NSb19NfgQzPeeG+odWAseTYY=;
        b=nSOzX5OFS7I9vYuyWNEcgWidvP2sUesPF3BCTD4EiOHJQpnHMbfKwU4Jo00v6SFUfi
         4MOvoE7HStpMXXlWwrOrTjsMcmCwLoC7K8+Dt/Tp3Z3mSb0MPZNUUvjlSClz8k1xzYwP
         Mzy0XoQAMMti5dn7YsmvWm3X6XxS57jbqzDYYXUPGhpz1VUmTLu1QtoUlmDeJ+yaXzi6
         TDX5xCIJ0D/6b0Pb4JenTcG4lLrThijrMGdACxmv68LSnA2xEiURbb0tImDqxTCs2c3V
         qPRDe9YlTpgI+zev7Cthuh2fLUVBgwTwjEjwvVFviUfVtKY6fTM82XOpYXpqcuaEn3ZM
         9V/Q==
X-Gm-Message-State: AOJu0Yxno4ImjcuUefi2jKDz+sGBQppbqDcUtpb8REDEOGdbqnZG1Qxv
	hgA2EV9EZcZvtaWdwhzfqfA3ZHQH1pAA18gBUeSvYdz4ENfVEqxpDLk11VkYVFPbCIHVvCuBKzb
	ZgTYl1Ru/l97gQpYASWis9xja1yY=
X-Gm-Gg: ASbGncuhWeh47RMlHuKB4gZzwXZ1jo0GmGNnyfOcoViIOZQj5a9TtcbkUuTOykji2Qn
	3Ri6p99DuATN/3uycztvFOPUpXMfp/adM+5Yh5eu0g0ppfmWPp8Ez0Fmg45o0X3LF/sx4lAezXq
	RsXpIJIpKrDlmOXJgSJI9ak0QzJUqOQ83QrWmzxOUAumnz5KduwQxL8gukAw9I
X-Google-Smtp-Source: AGHT+IGM2twNynKd321f65J9+ovSF9/Nrvftig1pxoiAC7+btzUNM3C/kAYPqG1bQAisQhrrWX2Sdj1RBvKag6e7vRY=
X-Received: by 2002:a05:6214:20c2:b0:6d8:9ead:c665 with SMTP id
 6a1803df08f44-6f00df52da9mr43701926d6.27.1743764852578; Fri, 04 Apr 2025
 04:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <18330E36E620F155.22125@lists.openembedded.org> <Z--6O076mTdeC9JX@nuoska>
In-Reply-To: <Z--6O076mTdeC9JX@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Apr 2025 13:07:21 +0200
X-Gm-Features: ATxdqUFECrSaNkJJMbZzsrGJz6WmHE4-l6rbviHzXLu68yCm0TuVh5OoZulFt0w
Message-ID: <CANNYZj_rH+zUJ1gVGPQ-MvkAnX6941bWUSKKpYLtOnDboJqgoQ@mail.gmail.com>
Subject: Re: AUTOREV with SRCREV_module? (Re: [OE-core] [PATCH] u-boot: set
 git repo branch with SRCBRANCH)
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 11:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214341

I have to note that poky-bleeding is not tested in any way, so you
probably first want to stop using it, or otherwise propose a test
plan.

Alex

On Fri, 4 Apr 2025 at 12:53, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Hi,
>
> poky-bleeding.bbclass only changes main SRCREV to AUTOREV
> but not SRCREV_module etc variables.
>
> How could support for setting all SRCREV_module variables
> be implemented?
>
> I tried to grep for some clues how to get all SRCREV_*
> variables and change them, but didn't find any.
> I think this should be rather simple.
>
> Code only needs to find all SRCREV_* variables
> and change them to AUTOREV. I'm missing something to
> find examples of this...
>
> Cheers,
>
> -Mikko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214340): https://lists.openembedded.org/g/openembedded-core/message/214340
> Mute This Topic: https://lists.openembedded.org/mt/112082024/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

