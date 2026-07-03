Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257A9C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:55:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89053.1783068907474902118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Av3eWUMm;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so1886055e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783068906; x=1783673706; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lf/JaJlMJKVaIXtuTiOzNpi7iHNTeLJ9tEvTyvew1pY=;
        b=Av3eWUMmQHwbIQ1BiWg9gxXT/tyqxkeSWsUWAI5oLqoWQoiHy6UkuaJK2NzX88h8cl
         3sbj5Szdb0LtOQatDNvJOcEFaRFrDzF7K8UpmjskWb6f7MGuZMrZYWrwXHVTP4JuAYMa
         BjHXAyjMS5xCRKtuQHcY8L80HtX3vqtO8fMIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068906; x=1783673706;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf/JaJlMJKVaIXtuTiOzNpi7iHNTeLJ9tEvTyvew1pY=;
        b=LPX83n/BtxCNqQjyuExs7/16lZ/1EfyPa3rwQUslfV4BHdcnjVAzHbxmEhkoZL4xdK
         RqIf8I65dKXfWCc/y3FJFo0r0qcPPIIAsUVnDTFZh3+OqWQzYaja4kcNzo60Sg5SOdHZ
         a7O7usdmJZGzZ+yU7p5i+1zgjwyaRos3DS0LCvc3fmqhh/z9OL1/sqbAxEuafbf9q7pU
         MHiVXaOcfgRvfbgLHGGDzvSNqYkMFaZ3GcClWz/pQirBaWq4wLfDyquhD9FBAaRQMUeW
         ufT7KU8ix1ONUvnncHdf7QVDluyIatf9igCMets0w7eoaPcsVIrAtruhED6Mc0vkvZRe
         K+OQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DIhdisu6zteKCNoA/Y6GmsNVhpKqKx8y2QD0m6bkYgM4CHgb16t9xScaOm0tpF9x8tWdEXwmgumeq1RLY+bBsEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNN6zzB0zKhMlv4xApBo0sddR1sb8RaFB2dKFyKOKrUDwY0T/4
	eycQq0fX11o6H8bqP8SiiNqMFU6l8qfaGd4hnge9qWxwMqkPMvmtFNaFnnyzNaUY3CIFr3Bz4K0
	KyK0MvcA8SA==
X-Gm-Gg: AfdE7cn79dtoHqcFAvN0lEvPF2K7UnlceBIZXWL5ESIWyS136ewz6hJddlF4VVuKu+M
	OJ77fyLrDzX3VO8FUnElEtTuEF6N9xf3gzkZIcs00ihqBcvZhPZTfbxc009wMlxUNJS4eQRKfIj
	2EnxJCpisB6UYkdBbic+TamkH/gXC68Ouy5j8FkNxg5pdnhcXm0j/R27q67Mn7iEm0oB3Xjbd+1
	k2/yFmDY8uM3UYinqoAAuYVmtVBIC5A2thDKpL9y6b/CrchzGRw/yaqJ9pXgwYqZBmL+wk2exvG
	IUABwEmTwp3iw6GMfx4uCOyriaEXgke2RgO2iN9vDSX+fqRnxaYa6M9bc/wL+ijtAEgJ4U/0vP/
	R6k1u4Jd+tHRf/NQt4wcZRCpahewrAQv82a4CsFoIAxOgwDmgg8VYJoyRPbSv2dXHpkqBwjBhz+
	ODCtGMhIrh3vKR9UkNqRvOZdU0nlpHMbx7awIRJAOsB4P9Ryb3m4YZfVdgrYrYuH9VZivqYpdja
	BAGmEfeD7etIP/K
X-Received: by 2002:a05:600c:4e4c:b0:492:465c:56f6 with SMTP id 5b1f17b1804b1-493c3cd54f8mr133757775e9.10.1783068905561;
        Fri, 03 Jul 2026 01:55:05 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbbe6sm15564079f8f.6.2026.07.03.01.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:55:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 10:55:04 +0200
Message-Id: <DJOT6ANHNV3F.1FEBM29Y1OF79@smile.fr>
Subject: Re: [OE-core] [wrynose] [PATCH 3/6] curl: ignore CVE-2026-5773
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629131453.1077612-1-adongare@cisco.com>
 <20260629131453.1077612-3-adongare@cisco.com>
In-Reply-To: <20260629131453.1077612-3-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240099

On Mon Jun 29, 2026 at 3:14 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> - CVE-2026-5773 affects curl before 8.20.0 when an authenticated SMB conn=
ection
>   can be reused for a different set of credentials.
> - In wrynose, SMB support is available only through PACKAGECONFIG[smb] an=
d is not
>   enabled by default, so record this CVE as configuration-not-applicable =
for the
>   default recipe configuration.
>
> Reference:
> - https://curl.se/docs/CVE-2026-5773.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-5773
> - https://github.com/openembedded/openembedded-core/blob/wrynose/meta/rec=
ipes-support/curl/curl_8.19.0.bb
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---

Hello,

Jaipaul Cheernam is working on fixing this CVE:
https://lore.kernel.org/all/20260624075504.63472-1-jaipaul.cheernam@est.tec=
h/
I will hold your patch for now, maybe you can help Jaipaul get their
patch merged? (like testing/review the future v4)

Thanks!
--=20
Yoann Congal
Smile ECS


