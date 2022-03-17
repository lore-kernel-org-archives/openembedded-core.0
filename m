Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AD7C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 13:48:15 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.10387.1647524894271168206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bUmeKgGM;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id b190so5546634vsc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TnE984NnZoXwEKcZg+uBU3CSUI5Wl55wkep/2B/97ug=;
        b=bUmeKgGMpupJ3guIKxNAKhqtZcEbwswFBSAkcdqyk8Azx1lK9ouhF9sKqO8tmPWX+3
         ttcRoiMeOMhuYTw01Y2X7lL4w3TqCMinSgmelTw4TCnacyCJ5T30UO225a3S8FqEAcyK
         pD8ieIAcc/EPskcx9ByhnN3qwmA7eaYNACGtLHfymOyc6zrRY2EOim9VyDX++E759sFW
         rvYpdTQQD0f+TA4RXlAQ7PdX17uNbtg4QCk11x2iTkyIWGEu7CCwzL/MfNd24HAQ2rB3
         Z95btmevhiyOyJKCmzHO8ayKbkwZ7EBZbuB487+cuyS7/3BDpjNe1NX3zvxSMhVmdAtS
         8Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TnE984NnZoXwEKcZg+uBU3CSUI5Wl55wkep/2B/97ug=;
        b=vQOuWydz3if0vcnhq4+dj+ddjUE69/6Ug++UzE5mUeUWwp0w4wBJyH2bci2zugVXDT
         NVhTg36Zduurfm1phDafUQMh/ZiIvHyfUkOxpYfgxfMm96urq5lZ75MucqrE8BNbuXX0
         lJWJ6vMPVP3/t//ItN20kC++XLdW+rLLBiJe111fR1e8C/aie55OxJjdHX8dYfgbhBgH
         VUn8T4UmIuTpKwZUPtGXzZWDCsMN5KQLvESuK7hweCuNGgMp8aem8Prh9kH8ND2kk6ah
         Xypwskq7oOzR6/QCRS57fJsP2hB0Mt30Kef5O9p4gZNQkEXjDawL7YTRfXiFjlneY8CF
         Xa4w==
X-Gm-Message-State: AOAM532Jo0IBYEr4+sMIZn1bBPAVAhL0fllUkfZNUTKBH1jV4yexGtK/
	Qij+emNf2CAQ1yNt3XJ7IPCA9u/X/lrcnsyNGEENKWbb
X-Google-Smtp-Source: 
 ABdhPJwB52lXbYDEKx5xewbzyajHPQ807O2pGwShebrT/L5gYLed42kJPlAph5Z92ZM/dT7n0+eQipB94KCW9tMEnvM=
X-Received: by 2002:a05:6102:cce:b0:322:c483:76b2 with SMTP id
 g14-20020a0561020cce00b00322c48376b2mr1835472vst.45.1647524893428; Thu, 17
 Mar 2022 06:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220317030519.1423570-1-ricardo@foundries.io>
 <CANNYZj87yUzr__GtYtsneOGdESX6EsfLCSbHnUdAkme4tAHCzw@mail.gmail.com>
 <CAAaKDhGq37ye6YNGOqJ+FDCqgR-f=nUuO7jLg6-h6EjUpP4kpw@mail.gmail.com>
In-Reply-To: 
 <CAAaKDhGq37ye6YNGOqJ+FDCqgR-f=nUuO7jLg6-h6EjUpP4kpw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Mar 2022 14:48:01 +0100
Message-ID: 
 <CANNYZj8i79ps3G9gzXAxdxi-zJAUrzJYSrTx0TTDpgCNf7Eppw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libpam: use /run instead of /var/run in systemd
 tmpfiles
To: Ricardo Salveti <ricardo@foundries.io>
Cc: daiane.angolini@foundries.io,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 13:48:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163416

On Thu, 17 Mar 2022 at 14:44, Ricardo Salveti <ricardo@foundries.io> wrote:

> When using /var/run with systemd you will see the following message,
> which I can add to the commit message:
>
> systemd-tmpfiles[340]: /etc/tmpfiles.d/pam.conf:1: Line references
> path below legacy directory /var/run/, updating /var/run/sepermit =E2=86=
=92
> /run/sepermit; please update the tmpfiles.d/ drop-in file accordingly.

Yes please.

Thanks,
Alex

