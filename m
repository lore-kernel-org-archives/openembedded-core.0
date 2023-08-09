Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2418AEB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 06:47:25 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.82813.1691563639293513012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 23:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=A7VCu8Qs;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe4f5290daso10099914e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691563637; x=1692168437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rrxFMTMNpBAzdTgk+HNa6jgfUooqOyjBIuqIvdyKWGs=;
        b=A7VCu8Qsq0gs+bJ6K67gEHyfpPKjN+DuSj6syWCVTA5YsLEJvJBRRoBx1FzAHku6Qs
         ka9wPNGIKMqrT/qXfBndAELVeaRy/cAaKoH6alwtomVCFTgF2plyEA9j9dsMHjYrTJlB
         5WqQu0eSOvKZ7npdVndnvhAOKX4Lei0x66mGPQyv4lOJV849cCScZFyicKVMNflChJIz
         AN1Dx+HBotGNm3YUkwdUbJDm86GmRTW79Ee179yz3z/XaxfsEQf2hXbg3ga8TZEGGwm+
         SgB5OjAhO7LkJ1/1ETpyPGdvZvNIvgvTI+QWimj//jT5YlpeZSmPE9/7KMESBBkdULJo
         OT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691563637; x=1692168437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrxFMTMNpBAzdTgk+HNa6jgfUooqOyjBIuqIvdyKWGs=;
        b=XL+Hcy10NgvOQncYBVfSuJBufogbSD3/PAhAK0XrwldFhfQpLGzPGB+UFER+WSrbkY
         TfArKXAFt5BPRRXQFrcbQCq7kfhvHEc4KzqvrZizxWISgpcgyMexxAGze4xd6vUTiWSJ
         zsSIL8L73rxSBc4GhDulxag+m26bhHLDOCPaKwpCzufifkduqQzBtOG8D0x+A0Eoyy0U
         Xg91UcSyLbfQ1TLctq8EQoePmKjNDlAvHNOaiDP9jB0nauPehWZUGoz5nLlhPH7rNtiI
         TxD6Xy9W1Ih0/HMbliQrpvrY/pD0wPY2WmI3rb3CVEHq2r/GmkLpgoZXQaqUBvmmSUNm
         81Ag==
X-Gm-Message-State: AOJu0YzTn/YxkOpVrR0myJbVe54+u3/o2aXq2t1KSqFditKBAIQ9qoMb
	xcHmxte1iBraSlPFjeVtv10SR46yxRaAAWn7P+s=
X-Google-Smtp-Source: AGHT+IEyXAMmQh/4gt887i+oGmgIC6g3soR93NxIZzeY9j+5HrUPJ9Zdhj9vIhzJvDgc4vWEazltONv7q+iEj9pdYrY=
X-Received: by 2002:ac2:410e:0:b0:4f8:70f8:d424 with SMTP id
 b14-20020ac2410e000000b004f870f8d424mr979079lfi.65.1691563637135; Tue, 08 Aug
 2023 23:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
 <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com> <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
In-Reply-To: <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Aug 2023 08:47:05 +0200
Message-ID: <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
To: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Jose Quaresma <jose.quaresma@foundries.io>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 06:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185687

On Wed, 9 Aug 2023 at 01:06, Khem Raj <raj.khem@gmail.com> wrote:
>>> I think this is only useful during debugging. So perhaps a comment to
>>> enable it is better than enabling it always.
>>
>>
>> The meson bbclass also compile with verbose so in my opinion it is better to do the same
>> and make it consistent with the main systemd recipe
>>
>> meson_do_compile() {
>>     meson compile -v ${PARALLEL_MAKE}
>> }
>
>
> Ideally we only want the verbosity when something goes wrong and meson ninja etc are good at that with their defaults perhaps that -v should be turned off by default as well

Absolutely not. As someone who spends a lot of time fixing build and
runtime failures across all of oe-core I beg to differ. I want
verbosity all the time, everywhere. I also do not want to spend a
second figuring out how to switch it on (it's different everywhere
too), or to run another build just to get the verbose logs out of it.

Alex

