Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B951EE498E
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 10:22:03 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.18637.1726050114226518514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 03:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPDTqQ3e;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365aa568ceso6633368e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726050112; x=1726654912; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+g0BhqpAk6TbTBZNkdfn9v8Hr6lwWY8pypOsY0DtH8=;
        b=XPDTqQ3eW0yRT2WxZ5ydTqFd9K3OYzRWqY9woDo/zIW0jYdqb8MfWh4obcVR1C/gRv
         R9I2tHCE44CCXOk5I98jX8Yp7cSGTGVKYu9F6wAETO+fjXFfutPOsIbr+/h07PzLRe5I
         l9t5JZwXBez1Lqgcs5L1pRrng09Z+YQhHn+wcDxTjjk5W239UVsZ1J3Vas1fuYNdv7kU
         BaDaTArp4VoeSO7oNo5bET/VCHJcY/ejidNGglqrm/FZ5OOZ5WjJPKM9QDRCHWcAgpTO
         v7JSYRkk2Rn8wVwvdc64IeCCCzHRyT4BH8fzEVPIRU3nqxlgiRsjd+3UzpP+0O0AjMgN
         qWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726050112; x=1726654912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+g0BhqpAk6TbTBZNkdfn9v8Hr6lwWY8pypOsY0DtH8=;
        b=r6IPe5nlHETcgid385tbGFKVkx+c0aplYoOH8X1KgE85HxZ10/2oluai8UMylT8c7x
         5eLS0hdPRbM+u9NGB1K/RhOYUkz+m/ObZtXs1LcCV5Q8X6VFfGrLpj4tsHAXfIwQRSBN
         eStdHw4iQd9wcwtJ6yHK9bv+BRDcMjV6C0bvt7v5vCQ3MPhv6jPqA3KqJQwJ9EpAxPul
         Pb7S+EFw7p/NzcJtf4l32IR6wx0EPR+dBZ2r24Xv4JD8hY7yWRqzKsdgFiw8a79OBN1J
         Oxju3T/DVyEmxwGh4stwFC6EFkQh8TnMtymo7IF8XU4WUJVqZByKOQBqhWlHOmU3cnjv
         ZULg==
X-Forwarded-Encrypted: i=1; AJvYcCWj42atRtT1FD8BkaxfbV4Kxf48+t89ppGLNMC2RvQ/Zw12Wp6Pz8xfWJeTSs3Ij70ForDrhsOJ+bnEF3VFoiEzWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9BOO4a9yB4g9CcYfkPV07pzmjgtXC+flO7+Ba4C1dannlUK8J
	WTlkHyVBv2lhHmyMTzMSKfjUTTJk2OP+wybN48MtcMjl2GfuHWrnkhvhPcXqCAlnj34NEaRquE1
	vZk2R2Dhq8UNMXJPIMdZ2qXyBf5snVyZS
X-Google-Smtp-Source: AGHT+IEm6x0KFByVOMdNCOcQqsUMwaB4hrEidu8sSB1P73xm4BLKzXrJT8xYiheoroh1uo2PNiGJdtB61JhNUeMdcX0=
X-Received: by 2002:a05:6512:308f:b0:52c:dcdc:f186 with SMTP id
 2adb3069b0e04-536587b96b1mr14270740e87.27.1726050111275; Wed, 11 Sep 2024
 03:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
 <1725352379-20334-6-git-send-email-wangmy@fujitsu.com> <42ac587c4e691d9c2526e9088de9bc27bb92b0b9.camel@linuxfoundation.org>
 <TYWPR01MB11861E7CD3D6346AD5F7A1748DC9C2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <cb42ff87d8f75d838619c9073dd9e1e9781d7235.camel@linuxfoundation.org> <TYWPR01MB11861E1ECD39B7393DD34BF27DC9B2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861E1ECD39B7393DD34BF27DC9B2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2024 12:21:39 +0200
Message-ID: <CANNYZj8vQHCH+nB3E27cEVrJGYV8pNmkDPDxkf_Tiks6Vkzjqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
To: wangmy@fujitsu.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 10:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204379

On Wed, 11 Sept 2024 at 02:57, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:

> I have considered two solutions to this problem:
> 1. Add rst2man and rst2hhtml5 commands to HOSTTOOLS in bitbake.conf
> 2. Create native for rst2man and rst2hhtml5 to provide support for other packages that require them
> Which solution is better? Or if there are other better solutions, please let me know

Both are already provided by python3-docutils-native. Add that to
respective PACKAGECONFIG options in json-glib recipe.

Alex

