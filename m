Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CFDC531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:59:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22919.1784811540264261406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i7/MligK;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b966dd74so4083005e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784811538; x=1785416338; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yyxA/ucvmFHLGiiOxbOmQ9I+AuOMI2wMiQE/hLqasTA=;
        b=i7/MligKI08mfkWG788bzmqs6DH3GpgEF4GRDSZrHnQnAsOaeNnzH2t76zANtOubi9
         9+hXPh6c/fCMNIAhGI/YxLwpGi4G7PupsPd14MxS3zd2n5ZMrDCF7mPkf4128572ymCH
         mo4heJy04Tv7EHdXtHGKidvzHgWaRXf/Y8Ytk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811538; x=1785416338;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyxA/ucvmFHLGiiOxbOmQ9I+AuOMI2wMiQE/hLqasTA=;
        b=hhGx9/ZnVRfkQZKm28ZWH7lRrXunaMJ99qSWVSDMiC3HcYv5JvRjEgU1m56cx4Cfva
         hfOQ7FV4mSFwrUfP7/c/M0Tma1DD7ADTT2l44U3Pd9CCZzCTmCaWjzJRrjoouFc58lDp
         OkPK7u4KP7PU9utPZsP/+A+9oVlkFTCTKkOjsRvkYlhwSkzI3m1ee6VOh0dZGA1g5mQP
         wuNNT99CllM+lDWvYMAtmsGXj6jBx6p5PjwqydX3V/x9KUws3WPm0peI6OnJhb7QuE2s
         A5DK0eATSFNP2A4E0gbGQXoMzQJCadWObO90nqKlSjXCT6kcPtijaVDiLqCVAf1E+dRV
         n9Fw==
X-Forwarded-Encrypted: i=1; AHgh+RqhfsGcGvjZywmefA1V/X0xKAFswGURMMWOeS/bN+D+4cN8DwicFDUekpx2sEqrVkjo4Nw7apJ9UK0WrE9xF/Zocw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9FjoxKV6E7eSj9fsH6IQKWGao0jprCfTlTXx9wrTbjjRTQQmk
	70svbcewaapHXT1HVvyqdhm0KmuMLjLWxnTAsuRRb0R2MU8ULa7oreD1GkODfmzGRRY=
X-Gm-Gg: AR+sD1015bt1OfQFdfN0wWGXwBHmWaSBXuatqeNrLlWmSR4gXKE+GS8CvfyDSLXffCs
	X+igGeEhz7Yuw4v2kbuyiK7zxErOem4vvkAE0PhhpgqHWKNUGvA3TzlMpXSauZ2TqQKO4tI/pOO
	67YK/HPNiXMcMEhb9nfMWwhMNT8jsM7LCS98XE5eQ5vQ169daeOaZPgqW72XXTrjj2b2XwoLBd+
	9t6l1HrDlJgoKlQEJC3AJm0Hq7P+F5MYEOYV4t88pWD6wXLvkK3gVjDxEgUaaucvYoWTkv7TmoK
	077j2OjihKPn6WTB517ZUsd85Pyt8NgMW512P8dK7IKGHsugIfEoi8VrsPG5cM8znFc0Dmhcj1a
	se5jzCMydecfhA49FvxupYC3LmAnxh4E69GOXnUj0YMMr3yUnrIe0ClrEdsc4XiQ6ZUscgwSu1N
	3Q/C8mRP1BlvI3Sb3ZooaeCdImLjX1275q9yTsOIbaHMsBZMKI10l877Gls28v6E0nTQ==
X-Received: by 2002:a05:600c:1553:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49573cc2d52mr31203645e9.7.1784811538333;
        Thu, 23 Jul 2026 05:58:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a596sm16085538f8f.4.2026.07.23.05.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:58:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 14:58:57 +0200
Message-Id: <DK5YVWWYT9N8.1NLJXFMIU67G1@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629104801.972184-1-adongare@cisco.com>
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241836

On Mon Jun 29, 2026 at 12:47 PM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In scarthgap, these protocols are optional PACKAGECONFIG entries and ar=
e not
>   enabled by default in `curl_8.7.1.bb`.
> - Record this CVE as configuration-not-applicable for the default recipe
>   configuration instead of carrying the upstream fix unconditionally.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>

Hello,

This series fails to apply on the latest scarthgap.

Can you rebase and send a v2?

Thanks!
--=20
Yoann Congal
Smile ECS


