Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3881BD591A5
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 16:50:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.26174.1732034996291665187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 08:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8bluPMm;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d382677c92so25012836d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 08:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732034995; x=1732639795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JI4cOqEw0vn9OTNDQy001ze7oscmZusYCfvMJcZOuUI=;
        b=Q8bluPMmzrjfiLrHUF3JC1Nyde6wwPK5XRpxcffJMYJ5UwcA/t7fCHMN7qgkLhVhMH
         J3o46avsbAtgOXXb3rFpWuBdMW30+1Xz/C15ZmlGENaCBW072umWKmQt4/gn9eXGDGHK
         a3jdZoWrN1gImzsINO1my6W/uaSriO09c079EbhvPP7RN4dsI1SLu95i/Ep7Vz37XEjp
         Mv6PGGgIFTisFZV5QQ7qitueDjsa3ZbiL8g24qNknJxmtUbFBFs92PVA2AvpJsbIuY/n
         A85aWXZeZiw7xYdcDNlkLCMx5woHusgQkKCCcu5qvl+V+LaNf1QklEwL1XbzXPcGMR0Z
         sDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732034995; x=1732639795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JI4cOqEw0vn9OTNDQy001ze7oscmZusYCfvMJcZOuUI=;
        b=Y+Iwx+dtl3GZ6YjHpRuUOnzW9bA5WaEN8QCEWadhBldgsQW3QUUHrk9XQzO2ZwUFpp
         J2DhPxMmCzk+cAtLIkXsXOfa5ZpncN0r3izLPtMSYN9jGGUQPVI7WxAqUGuHhmkIf5v2
         ruy3AVQRSnyYra3egjnCzwvF0D1fpfkD9WGm1EG0uRQ6Fdg/oTWZyuttir2uLTC2BCgt
         DIBjwBZcZ3gfZzcYK9j9agiYgGPNjXkGyKiXcJLtjDcLUIqE4idvasN/8ljvzxcuoMSv
         CP9ZHJRAxMDM1Kf4RipLq09mA9fUpdghqavSwSDgF3u0QYel0ok08vd/J+czaOmdXW8S
         /nKg==
X-Gm-Message-State: AOJu0Yx4Mtpb6jsWW6hBZ5Vn3mtIFFPeiyvaMkPakz4GncbenyfIIcx+
	yazZ2rS5Bj+wXQUoJSiSPdZWwRsJpQBz3K4St/gUtN2Gh2cfeo7pvDyD7bKVUPqte4tKcWOj0lk
	p0xVx6vCOYjVMHYAiTSLGJZyKCDk=
X-Google-Smtp-Source: AGHT+IHHkHcmMLPeTn2wkE1d5wUo73ukM4dOBeZxCPEh5GX1jx6YEpIIY5BZnped+aaVOGazmCABSC1d10A26835H58=
X-Received: by 2002:a05:6214:19e7:b0:6d4:8ef:1514 with SMTP id
 6a1803df08f44-6d408ef2004mr272097226d6.47.1732034995138; Tue, 19 Nov 2024
 08:49:55 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb86fozR98DkvKZAaEu5Uw8CzeF0NfA=xJgRO1fx7rDFzA@mail.gmail.com>
In-Reply-To: <CAK5yBb86fozR98DkvKZAaEu5Uw8CzeF0NfA=xJgRO1fx7rDFzA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2024 17:49:43 +0100
Message-ID: <CANNYZj-ugVg+GTa0O7x45jjwQvCg__Lz3eaQ6HTR+deJoEWYyw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 19 Nov. 2024 (WW47)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 16:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207395

On Tue, 19 Nov 2024 at 16:46, Stephen Jolley via
lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:

> Patches in the Pending State: 178 (17%) [last week 175 (16%)]

For once, I don't have to tell anyone off :) These three patches were
copied from tcl 9.x into tcl 8.x recipe.

Alex

