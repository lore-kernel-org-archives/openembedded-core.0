Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1BAC282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 18:07:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.765.1741457235810868902
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Mar 2025 10:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NEhcmd7d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390effd3e85so2560622f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Mar 2025 10:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741457234; x=1742062034; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THpyNJLjVxziMVCFhTlLILuLSoiJ+q344GyNlPdt+dg=;
        b=NEhcmd7diq7ngWV3CgtCz1AW1NQvPVRs4qF7X4ovbYLW3fDv5CUO7fYOIx+7KEg9WD
         sQNO4Vv/OzAoy7o7JSWaOWh06dZ4A2LQLjyoEuBCSCSP9F8ajvy3GE/g3qxH83NOSYv4
         39FcyiKwkoqB9ID84bzC5IHVZKxhBBZtAfvag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741457234; x=1742062034;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THpyNJLjVxziMVCFhTlLILuLSoiJ+q344GyNlPdt+dg=;
        b=WqjuiMWR16GDuCdnDSlQ67SzTdb7XVygNEK/6xe7L93iaPO6dFBQuFHCe0/cR5C70I
         iIK39NlfRQWM/3pV/5fdPXZ1flyucutjWd4OTVsVu3Pm2w8Rta+hrVVJzO4ZmSk8KYyt
         7+2q8zaD3gD3RdFTW71m/RbGYt50xZkTXmX3rAd8tZeZP52GyC4V9fe3nlSVTrJkeYB4
         ErHS/wvgTmmAJQM7yF5sKNibSpQ+zrk+YOnKrxaosRKoHkaadF5aJ9GjiNH8+wbq9opy
         qBG0uw1Czr5aLfyHN1aYCFslsbBP+dZlUBgYWMH70+Oqmh1aB5vZjJnr1WrQfzQNDlRi
         2HmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYYi0Re9Y4z3zDP5caT+cZloBBAB8v58wbLb3i9Wi/DL610O5EHRGrQAtBg0ZGmzCveaNPk4kxt33JBFvVhuGUYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6eyt8KO8hZesnLnS7gR46sKFxA1PdEavYoNN/fIFBpnGAtT57
	GsS70+EtIib1C14VmQfCTf6fQihyL8FGE3UAf3FgTGWXrJoo8AWn2BUPBVOoyhU=
X-Gm-Gg: ASbGncvGXyArjWv98ZxLQ6n7fZRzL2WJcI0WbqfEjro1+9Cfm9ZSimVJTEa0AZTn3uv
	tSSRvenPTielPgL0x6PgDMZc4UhgGbVemv46dBt1N275CYPffI4mFpfOk3PEpUnkJWPR15WB6jg
	oazaMddpdqMIZ9ZFT3M2EQ3J6bbZCA2fBhulkV/Oopq1x6bTXiPr74dJRMx53/EsdITQJFIhfFp
	tnu93y/L0VhgJnl11DVaeYSZr2oE8wN3Q2VWDgR5O6xIwY8inwQTLhq8v/SmomqouEDRA1605Vv
	SeU7Aij/GnQW+6CF0JIA7QvzuweUb8MdXGDeyoQwNnf4BRYIFsojCDPDVwkkTNZrdqkLjTtJQIL
	UpsOuvtwc8cp9YcbOdyT8Fyg6A0CjbtGoHCRGB0mHe9Ek
X-Google-Smtp-Source: AGHT+IEHdPHRpB09m0xzNquYWoY6UbXphwiYVGSE2MrwfRgTPs3n90Yqzij4sUZCK876nZt9XPpSyg==
X-Received: by 2002:a05:6000:156c:b0:391:5f:fa4e with SMTP id ffacd0b85a97d-39132d81196mr5114496f8f.29.1741457234203;
        Sat, 08 Mar 2025 10:07:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1adb:4ff6:dee8:845c? ([2001:8b0:aba:5f3c:1adb:4ff6:dee8:845c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceaac390bsm23759665e9.35.2025.03.08.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:07:13 -0800 (PST)
Message-ID: <3ebbe1b5e26f764636ec34c4acebe4d8a588386f.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2] glib-2.0: update 2.82.4 -> 2.84.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Date: Sat, 08 Mar 2025 18:07:12 +0000
In-Reply-To: <20250307163724.3459192-1-f_l_k@t-online.de>
References: <20250307163724.3459192-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Mar 2025 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212474

On Fri, 2025-03-07 at 17:37 +0100, Markus Volk via lists.openembedded.org w=
rote:
> - Add option for tests to prevent them from being built without
> PACKAGECONFIG[tests] being selected

The v2 still has ptest failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1074
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1077

Cheers,

Richard

