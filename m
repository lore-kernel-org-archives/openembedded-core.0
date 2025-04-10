Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E796C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 14:20:51 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.35815.1744294844862675849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 07:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgbI9KFJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so9121176d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744294844; x=1744899644; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fts3gAhD9PjzJ46tmZ1T8LF/MhGU44s5dRVni4gxCR4=;
        b=CgbI9KFJWmhK6wseL9OBh0fo0dGUHDlclWew66ONegxSMzKdZYNzX4PaeTT7CCD+Pc
         XWkr96MTjZgAczvMR6P26ZXmIJc2DfQEoxLR8QbTnXjmMsZc4wu10lOasj8E/1gwJP8r
         PogDtBoDb43tVDMhbNtssJ+72NtEg9o9gfjz5cxC+iWp/l9z/ppvpqCa3nOSIg+ppE/T
         GH4yKH65PG/cRNT08jHjG/qoVB7kT0BYT4GMIAuciPE5Qseye9/MZmDJ8m19Y5COG/a6
         Y7RAmFHa2VkvsJnmT3IWgnyKXERK1gki6CqvA9r0lDGTy4hOQisQiMbBHmxbCg/Y07ro
         S9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294844; x=1744899644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fts3gAhD9PjzJ46tmZ1T8LF/MhGU44s5dRVni4gxCR4=;
        b=P/fw1u6pMTzA0jV5kAAa20wjnkxTKG5kJgPsckSfbW9TieFz2/TgDy6NVP9Hwft1p1
         pMrkee4pQEZ9P84jygnnZTnYLLXsq+ClhnvZ135IUODSb6C14sKvWKSAjKuSR7T2aaWT
         1kyzVIIXglUSRfQvUitS9LFm4kPGoPYA4LYJyqOQlRXAsEYqt+2SAOZELetxL9X7mqC+
         9uwPR+d6KvZZ4VxjboHow5/x8of+Y2/ikVdeuQ80NYFGIJHTBzr+UFp9lbbdiue6RWPo
         +uuvsKuKiy6mulwUbf5dqU2flhI+6COgfPWobSbKLZbuDT1rsxGO/EGQtH+VkbUWPK1d
         9nOg==
X-Forwarded-Encrypted: i=1; AJvYcCVzHDqCI/RK3LHjniIjSvfyqy5HNh8WYwoSS/IWAzwn7s9PsHjpI3Sc9KurOaDneRT8CEzTxSr/ipBda5P6Crjk9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzY1UPxjvylUUpyU0FNtOaxXLOmzySydLgSCpeJjJI/9+PJlyCI
	n0RFhXQYmCKnZSROkaFkNHz3BFdoUTztJcJvUvJGP3liXRjqfie4zi68Kt7X321RtOIkaYdnEPf
	EFGZJyH8ImN22QdjVdtFbHj71r+c=
X-Gm-Gg: ASbGncv+O82OFm3r66Fh8RedCfeWSAojFJUeXMcIS9seBWNYopfYO3QvWJNopNBQVKS
	1owjgkkX/t5Z5ye9WqC1c5tAYm/1CjnKHcH79Um4708mqPNZpNomwaAUs2wWZRgJPFCN4UpGz5u
	eKHefqn/IzT/pPvNmxUxShOaGQpj4TeiDcD2Xx4D2alLxSN6nhBjntUAFU
X-Google-Smtp-Source: AGHT+IEbU1lLVUF5Bqtnmdub94enFR3+XTvZmg28M1CqVi+hY9LBYG0n+wjbBr3zPCQN7KPwoJ4bL1a0RX0JxTMSayA=
X-Received: by 2002:a05:6214:5191:b0:6ea:d6be:215b with SMTP id
 6a1803df08f44-6f0e77c435cmr37028926d6.36.1744294843555; Thu, 10 Apr 2025
 07:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com> <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com>
In-Reply-To: <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 16:20:31 +0200
X-Gm-Features: ATxdqUFK9sWchJB9JdmOAOyeIwC434qOcbCzD20CXimhDL8X1zXeOs2GBok0bKg
Message-ID: <CANNYZj8rsSWX7GL_mqQz3h==31wKsA_myVAHbGXdUDv+O7YsXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Adrian Freihofer <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214676

On Thu, 10 Apr 2025 at 14:55, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
> I think you are misinterpreting that. That paragraph says "The file
> system supported by the Extensible Firmware Interface is based on FAT"
>  -- IOW your *firmware* must support FAT.
> It never dictates that the ESP has to be FAT as well. You are free to
> format your ESP to whatever FS your board supports. For example, x86
> macs use HFS IIRC.

But are there any actual UEFI boards that support anything other than
FAT? Or is everyone taking the path of least resistance and cheapest
R&D costs, implementing only what the spec requires?

Alex

