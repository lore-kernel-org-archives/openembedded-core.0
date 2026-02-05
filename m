Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79262EC1E95
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:27:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17597.1770287250556519558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ukjmtz+8;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so602521f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770287249; x=1770892049; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC3yeqNr8F12Fc6tezVf4zlhbTTLWDFxN5oRpiMWvOY=;
        b=ukjmtz+8uC0Bo/tpgNXtZaWJ+XredyeCWKtsWmZ7DpcGB12pqS0spwW73lC2D+7qTM
         CdPgr/epsCWhQRflqhWx5Ii50hMCoCpnArOcr2ywmrg2aWJaHXyzq34lvMTwuK3yxdhv
         FgBnEGuH1skkKvpzbs52H9a5vYnWz74W9Znyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287249; x=1770892049;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TC3yeqNr8F12Fc6tezVf4zlhbTTLWDFxN5oRpiMWvOY=;
        b=IuS5SZjpYGFhxOC+S/Xyh/Wg3ZX/IYwyDzk37wlDEQd8Epmug00x/+WY3HYS4JuAIa
         ls3NSzuflreHzkICR/hDOlkysZOAqWw7dZ8QulXRSjzMPXtr88W14iDUNEbLNvjFmjw5
         H2nUp4YS7hQDeN2JES32bx8kuZa0mIGejxwLZ0MDTPYk1i/9r1IB7VHGw0QW8m8uXV0/
         8I80Xjh1AMZmJxSQcLIPCtisR7XbgIzOMGW1emirAEDe2tdebdgTdfGAqr1Ah2RM8p0l
         mgzTa3J6eW8wH6bOZQI4JueDvIcNr9qI10kaaRNBskiYump9/HP/eccEvxXO50LSv1R7
         Z0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtAEhO+hDC6gSXpsKC4aM2Nx8fw71Blgn6UcCP/k9EGOZ1tjFBUNSM6nEEZRqC1BrvBtMBRCk5XezdZljqnu0R3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0UyzfiyZRuQAp4fyohZv3yhMgcLargAunvXsSOcL90oJuTZj4
	akeThKXYa0as+O4HZmAoiEEoWVT+oznwXDkkTSkLrff+r6ojLIvnlLJk5PgwW0lcd7c=
X-Gm-Gg: AZuq6aKAxnTgi4XD4dDsEmqZ667bIHZhN5i0+B9jc0fdjHDAoDR8DVvRtz7jACw0l49
	FJjD78DHmC2a1d2aXnfjrfZeuA3fNJOVyXFkZIUjVFsIuuNRGe1vsUHdIXjQCf5aSX5aOs2WU70
	R9M6CuzV8kCW/o+epldydes1FdHtB69r6d//f83mttICR8hPCIteqldRGJroqsRQ8KNXafpm0Ln
	f/d36hX74Dh0kMNRb+RwReqLKHm4crhBapSCQp3c4PN+JzsCcYtzFkU6tFSRQmkfqtG8dQ4QxrL
	65NR4WGEANEg5VByHr7WzDigiK1uuqep3JCd0XKlKHFFXkQ7GDjkZQTox4TAEkPQlK58PJnxI9U
	pccjouZhALkigjInX0eWBQq18d6BzAvVm/atS8qrtLd0eJ+FWUKhqmw7MP0dElaafoJR+gSlCDZ
	ZUcHKorra7qh85Ng0QKUok/b8pf7I34ZSN2AzSIknyTU55caPjvWPDMs1vNVXkrnvopH5vHjqIu
	KGZoHV0O8091w==
X-Received: by 2002:a05:6000:2207:b0:430:fc63:8c8 with SMTP id ffacd0b85a97d-43618055383mr9273040f8f.35.1770287248901;
        Thu, 05 Feb 2026 02:27:28 -0800 (PST)
Received: from localhost (2a01cb001331aa008fabb4f40b3eded6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8fab:b4f4:b3e:ded6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805fec6sm12734240f8f.32.2026.02.05.02.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 02:27:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 11:27:28 +0100
Message-Id: <DG6YGEQCHEDD.2RYMYDPDQT9IH@smile.fr>
Subject: Re: [OE-core] [PATCH] inetutils: fix CVE-2026-24061
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <alperyasinak1@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260205095525.1104867-1-alperyasinak1@gmail.com>
In-Reply-To: <20260205095525.1104867-1-alperyasinak1@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 10:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230572

On Thu Feb 5, 2026 at 10:55 AM CET, Alper Ak via lists.openembedded.org wro=
te:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24061
>
> The vulnerability is about:
>
> The telnetd server invokes /usr/bin/login (normally running as root)
> passing the value of the USER environment variable received from the
> client as the last parameter.
>
> If the client supply a carefully crafted USER environment value being
> the string "-f root", and passes the telnet(1) -a or --login parameter
> to send this USER environment to the server, the client will be
> automatically logged in as root bypassing normal authentication
> processes.
>
> This happens because the telnetd server do not sanitize the USER
> environment variable before passing it on to login(1), and login(1)
> uses the -f parameter to by-pass normal authentication.
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
>  .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
>  .../inetutils/inetutils_2.7.bb                |  2 +
>  3 files changed, 122 insertions(+)
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-24061-01.patch
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-24061-02.patch

Hello Alper,

Thank you for the patch.
Sorry but that patch was already sent a few days ago:
  [PATCH] inetutils: patch CVE-2026-24061
  https://lists.openembedded.org/g/openembedded-core/message/230248
... and that patch should merge shortly.

Regards,
--=20
Yoann Congal
Smile ECS


