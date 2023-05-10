Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AACCC7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 16:11:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.21650.1683735055480682941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 09:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=NSTfS2CP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f42ba32e24so15629525e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683735054; x=1686327054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eRqhzPULmcUEUuftYmYa7SjGVaWWWyivPZKkZGQXH2A=;
        b=NSTfS2CPpjN8OPP8n2B6CMloPOkowiKj9VClsIsjKl+PntmWrIUmipCd3/mQJprQzx
         J5IkrxEEV77JFFpgeD/fAEZkgDaYu+kuwKxDJWvcphw6JocehnMWs2Te8a3npkFtTe+i
         To5Dg6AjYpXIYa1ERp8/mgZ1e4zaSL8JsVpVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683735054; x=1686327054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRqhzPULmcUEUuftYmYa7SjGVaWWWyivPZKkZGQXH2A=;
        b=jiLRSAbFAlMnRmHe8tmZrBq1yLtR5PUB3gkNXmHr7DhbbQnuul2fKVypBj7Tg9zUs9
         /ZIMpMJZYzsLTNAN3IRhT6s3EW6tcvcZ9+L79p1E0qbtjsyXVCtpcMJvVwzlnbGRgfWW
         VT7h7ZrNIm/QyBTGFWdR2Z6jojISBD8z62UjjmR3ukNgL7/0zZO4tBHxUbBb8bRGRzF2
         cWThrGi8li/bSiFB0L0lcy0H3ej7hRcvdgCpxYI2wal8ThOARuJopATj4pHoX9jc7sWA
         tCkEgPOfunfOOnp8ZgYjm0wRlyxygeQ05iLo6hbKESGf2gVFhH+TLKsPTDyzdb9kPZFb
         ICqQ==
X-Gm-Message-State: AC+VfDw9xZxcmgMW1k1ehYhNFOS/chowD7SQ/yHwbMdzGRGM9RpOH1Dn
	Xze6/HtssUNbrM9IydOSrBXoyg==
X-Google-Smtp-Source: ACHHUZ5x/3gfadr3wPgWZmRUq/9HvwnwJqegeh8YHUIG2ryhpIQCy7DB7wpBn+7rq0AuJ7Aey9H12A==
X-Received: by 2002:a7b:c4c3:0:b0:3f1:72ec:4020 with SMTP id g3-20020a7bc4c3000000b003f172ec4020mr12751052wmk.1.1683735053918;
        Wed, 10 May 2023 09:10:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:97c0:2f0a:108:d273? ([2001:8b0:aba:5f3c:97c0:2f0a:108:d273])
        by smtp.gmail.com with ESMTPSA id g22-20020a7bc4d6000000b003f049a42689sm22907376wmk.25.2023.05.10.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 09:10:53 -0700 (PDT)
Message-ID: <84034359e82c7d2e31019e5ae0998a6234faca49.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] apt: Use a valid download location for 2.4.5
 release tarball
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2023 17:10:52 +0100
In-Reply-To: <CANNYZj-xUm84mDJch71_MS4GeAMd3EjMCh-whN9K3yOHvVnHmQ@mail.gmail.com>
References: <20230429150611.1521134-1-raj.khem@gmail.com>
	 <CANNYZj-xUm84mDJch71_MS4GeAMd3EjMCh-whN9K3yOHvVnHmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 16:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181115

On Sat, 2023-04-29 at 17:20 +0200, Alexander Kanavin wrote:
> Does the upstream version check still work?

I'm very nervous about moving away from the release location like this
even if it is no longer there, I think I'd prefer to leave this and let
our mirror fallback handle it until we upgrade.

Cheers,

Richard

