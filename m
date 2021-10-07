Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CD0C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.9628.1633601617813514817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=UDN4ypjG;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id o20so17402345wro.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SeCs8kyAMqso+MLnG0T5EI32klaRVJcxXy52nPZPJUc=;
        b=UDN4ypjGLiY3IsWDTutI87m9UbGuDZrjD4yBgHvvahePjgLXYOvldD9XbHoYBoniwG
         pLqQrwjJuZvC7x5yKm7d7nrucmTn+6dpIRJPh0g3fT1d0btZXGncwPlCqPI1xkXO0/j1
         z0JUFV2DAEUQbiJ3pb8aMS6n9i7WPJxZIKC5a0259zudZxrQbfdz7p/l+ZWs0STqq5a5
         6nrtZxcfnU9d7qwjw0bbnUkEy+tmeaJcLs94YtL1lTk2+5WRdMS0DxpGpwJVKiegwlSg
         Goq3kJCjcCfaFY/HuPKUD5V7n9+uyegO2ZacjfCvdc+ql7Sp+DgLLQjh3mHy1eaEHGOU
         aeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SeCs8kyAMqso+MLnG0T5EI32klaRVJcxXy52nPZPJUc=;
        b=MR7FZdcoP9qMEeBIUc7LY0bBUtd4oWN7higlTrzGslaEpNiFhijcbqVZ7oBBY+WaA9
         eIRZtNcpGK1FLobrLYS4rWIZnWpdxhxW0Ge8wTxNOXXLTkejZSbR9Uy01P1eJ9JWH6d+
         EzhxOQ95FQALWoRiPjlVwL/69HjmTafbsp5ZsliDwAvLybI9N78GlTNwAponh4dOtIFm
         +N0WNiuQMkpn8eGL8ApJHESjNirTCZCeLu3VrrUkq3h27sEnSYgGdvg5165M0tHNU3+N
         TbIBWnweAXPLY2b/9lBkvsrzKkZRsxr7oQqz5QNhtBIotTP5DAOvJwp7bi0YVhdC3Vj7
         oRVg==
X-Gm-Message-State: AOAM531F4TrBv6tUEnXgB8HMfzLQr2Ay621daCyHD71bHrE5TxA9+8ZK
	ZZqHVIDcxpZen7/yuDCKCodFuszF4dW5DEj4K3PJBg==
X-Google-Smtp-Source: 
 ABdhPJwIVlN+7/aQf+6G4qwIqnlg3lLLVlpuh0cnmI7+5wKxT2OcOGK8vnmXpc80iF0FPrF/L3rTa4he2HXOwB4nC7A=
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr8510886wmc.69.1633601615954;
 Thu, 07 Oct 2021 03:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
In-Reply-To: <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 7 Oct 2021 11:13:25 +0100
Message-ID: 
 <CAAnfSTtj0bS5p05+dEJmLWG8MM-fyr1ZqVxB1MA_hcXHcGXfPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156708

On Wed, 6 Oct 2021 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> Does it have to be native or target dependency ?

Native, as it builds compiler plugins for the host.

Ross

