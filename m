Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DF7C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 14:52:14 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.204.1744296726554632793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 07:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LOXC2xjn;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8efefec89so7619316d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744296725; x=1744901525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yArNtupxY3zfoqFNHtb3BtoaJqkQJyPavsbwoQfeZTo=;
        b=LOXC2xjnB5SuY+dz6OUJfKLRcbfh9qSecl5t2+0c229DhbTjDBh1+Eiu2StcB9s2aD
         J0evo7s3xpO/DLE9Qpv1NSTMDS5EObo6/y0psN3eEAdr5yBeeMsvo6CkIEdj9HEEVeLx
         7a9QNIduTM1OBWL00czjEl8f4Qi6na2nqZKjNunxzdFaRI5D0CwnI1Y8KBl8rUHTQOF5
         8Dt89HZEJs9CU5gNHQlse+ou0CrfbUJkbz1UmuTO8UG/rKtMEqzGMKIs0GdINhdR3uMN
         W2SDrte8iu8Ug7D6f1uiPEoarRtYHWOKzv+fBpajwSfgd05iqYACry821BbRGwHzt5uu
         UMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296725; x=1744901525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yArNtupxY3zfoqFNHtb3BtoaJqkQJyPavsbwoQfeZTo=;
        b=Hwak6f8P8fJP5iPYeiQX1Qnbi646LjSJUa6kIRSMu2I7e51htdU9UCsNtRX1+dZ4Tz
         Hf9MBJYxy0X3fvt/tOhXm4dLdkWxJQ6hiFdo+Kv5afUG24ZQKx7intl1nqGtb7fHZUqS
         vx2xY+6GAUUD5gmXZa1QBKxpXlR+eUondws6OZ84frU6gnWfNQfdWSVHTFDljsdPX/be
         dq66xQQh5c85mAWOB6SdOsHDuIAKgdXUU4zTTxSms5eLJxQpPOWD9NXOx3BCj32eTaPS
         6rRUj2GppMomlhPrKAg7mtil18GaB/zt0Smubv1ekscx3z+POtSTIlTqYCFiQtQjOraV
         eMRA==
X-Forwarded-Encrypted: i=1; AJvYcCX/2g9pYO8IPhN6Wpt4vO9y/DmJs4UeKEsO+ZFWdwXsRjx4T/U9PTOa9vBoRm3Ubc/fjIueFi747U6ysxDSQtSeiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx57n6J+KeJv4C4F4MA373FTkcn0ga7ocW0Ky0dfrZ/kcvD/4MT
	rfIy2uOKmLg5EIqeEePCDf5qRVjKCWneagAxvJOlext0/t35GJfA3k3eHu1Idlet4CLAgRXtbAf
	hIVbhDuGg9ToTfhWFszTq/glp7wI=
X-Gm-Gg: ASbGncuiX9u1Q7rD2TjFiYVbJwKB0AqpM31rKwlDf0Z5ExuNjnq3249wNLofB00pAZ0
	DwVUOGGh2raHWeT7x+5jiS5YETYeJi/g0qr32BFB63/uRFt6agJmZLg/WWK1gDDsbm87neUXKQP
	L6aQesvSUWSwMw4ENoA9hhOr9OqhB18AsLNvprqUYJOZh4yGKFxBPtV6hY
X-Google-Smtp-Source: AGHT+IHXdj1euXjpos2gYhJt0L+b5fV0PDnqV0Vita2yCpArf6Zn6GO9tbLN/qH7DYSxeA42oI5ad76N1dXWyl2AjE0=
X-Received: by 2002:a05:6214:238e:b0:6e8:f949:38c6 with SMTP id
 6a1803df08f44-6f0e5c30819mr41368286d6.33.1744296724732; Thu, 10 Apr 2025
 07:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
 <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com>
 <CANNYZj8rsSWX7GL_mqQz3h==31wKsA_myVAHbGXdUDv+O7YsXA@mail.gmail.com> <CAC_iWj+vw=wUJYb4MDWJ3KoPrECwzr4wNbrJNpDvC=o=QWFJqg@mail.gmail.com>
In-Reply-To: <CAC_iWj+vw=wUJYb4MDWJ3KoPrECwzr4wNbrJNpDvC=o=QWFJqg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 16:51:51 +0200
X-Gm-Features: ATxdqUGj5LgQtg_bOnCyv0GddE_VIzHYcuoCgvD_6Ci_uQ0LY0-hxoTaCvf9JiA
Message-ID: <CANNYZj9dJyOavS3ag-jbfyTd8q252RFU3smmFtFpKa_yEkKsqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Adrian Freihofer <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214678

On Thu, 10 Apr 2025 at 16:39, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
> I am going to assume that by 'boards' we mostly target embedded ones right?
> The majority of those work with U-Boot which has a pretty capable EFI
> implementation nowadays and supports a variety of filesystems.
>
> P.S: I am pretty sure that EDK2 and servers support more filesystems
> than just FAT, but I can double check.

We're talking about UEFI firmware, right? The thing that reads the
bootloader from ESP/ on storage and runs it. Is u-boot or ovmf used to
implement that? It's that firmware that I have scepticism about, not
the bootloaders.

Alex

