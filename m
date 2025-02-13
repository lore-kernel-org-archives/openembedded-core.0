Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD86C02198
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 00:17:17 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.261.1739405830814331884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 16:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzDYmurv;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5450b91dbc8so207037e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739405829; x=1740010629; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvGx0dxOy7zP8nrJ5BVf4f1gNkT9bSOgNBNFlCNHg2Q=;
        b=PzDYmurv+GwBILDbtcA476AEDqKwgS+4d08PcHCP7CymjHvEC4tQ4Za5iqCwo6BIqh
         nfvTbpJhdT/c+loZM8VvmfqQTguUDqv9BBtMnWlH3W2u9OSma3Ru8K2iM9cnemaVB6oC
         quGIsGSJBuqfodi2hpAoc+qJrDKvMKu2Vcz9JKpcUbk5KehmxwDwYrOs6gaq/r+K0ckb
         spX5XKEO6Vs/y3zmIGFs4g2j0tvCeAGo4yml1tWIBHMeDuRgNEvg8XcqHgvIfXW8OYUt
         lrNkpV8Y+lv3KZlgWJTCJmD6e3HsYC4K2vxUVQLGhq7JwH7y/2YSQ16cIt8Pm2kBDNin
         1o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739405829; x=1740010629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvGx0dxOy7zP8nrJ5BVf4f1gNkT9bSOgNBNFlCNHg2Q=;
        b=WZS9OWsSSE2KBfg3sfNaCfocknnBsiSjcGtc6jDS9U+HUO2GuA6wKMJbIiXG6GLb3F
         QTcl5bL3s+FPpyR7knl1bWWeNR4kYISUQj2GeinE9ZmKqORg9us+/4+ARAQ/9SAZkO4M
         ra98/8GHa5hcbnzE2/V/R7TxpJv/Bd7ulk+mcHUrwE3VvhpsPlBKfFispLAuTkNlLW6f
         s2xJcnKU8GiCYn4HDDPwaadjW74yFVGoUUprOyenfHGjKUcFo+XY7pkOvB0eosTIzTQh
         53z0hCDVK3Wj2yAVUxR7VaQrWn5galbo/Afx421puVpk40H5tR3+0Vi+3rIGlfNOamk3
         E9ig==
X-Gm-Message-State: AOJu0YzoQOUE4PUzPbqnq6G8yKjFwI+dF9UWaumkEaGdeKyZG2PuF4eT
	tU0TaHcqwR+JME7NPTyQXLwIjI7bhPglht0PCh9iVJ+ILp3mQdjxAt58nhJ5n9M61KFLWjMIN7j
	5VYPY3hQR0ZaK7EsUue/XmDDm79w=
X-Gm-Gg: ASbGncszxoZtSBXjhbTEDq4XJrw1G5Oi7p/IrlcxjGVIyBDhs9vOtrBCv/AhRcvL7rx
	AtkGX7NaSk1qOBhf9ja8b1JyaF2L/pjBFk8WTVH8cGN4ctX7jldakhEodjpTSiNKkiLW7m3EEOH
	/V6QOG0pTWn7sEKLMO6N6aojC9Mik=
X-Google-Smtp-Source: AGHT+IF9h3+c0drMljuBbPEx/5kcXOKBfYQZWHcYyhgjjaY4b15DnARYZaTLjIwVDlDLbI1lvkVc1zpqiaO3eyOymr8=
X-Received: by 2002:a05:6512:2247:b0:545:1098:88db with SMTP id
 2adb3069b0e04-545180ea954mr1443780e87.11.1739405828602; Wed, 12 Feb 2025
 16:17:08 -0800 (PST)
MIME-Version: 1.0
References: <ceec6a83-58cd-40ac-ba16-06115217f4d8@app.fastmail.com>
In-Reply-To: <ceec6a83-58cd-40ac-ba16-06115217f4d8@app.fastmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 12 Feb 2025 21:16:55 -0300
X-Gm-Features: AWEUYZltKN_n7DAKTRfs-GvlPuexEoCxidnwY-eL56mM13PZOkYF78tbtRU_Ztc
Message-ID: <CAOMZO5BGuBrf2XQLcnVSTMeGoJ8bPEF+FF6xQmP=p+PJXbz1Zw@mail.gmail.com>
Subject: Re: [OE-core] Unable to access 'https://git.openembedded.org/meta-openembedded/'
To: javier.tia@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 00:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211284

On Wed, Feb 12, 2025 at 8:41=E2=80=AFPM Javier Tia via lists.openembedded.o=
rg
<javier.tia=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Hi,
>
> Getting Git error accessing https://git.openembedded.org/meta-openembedde=
d/.

Yes, it seems to be down.

Try accessing https://github.com/openembedded/meta-openembedded as an
alternative.

