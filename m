Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4190CF30923
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:27:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40511.1772702859822819810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YQjvE9ed;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483703e4b08so75482315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 01:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772702858; x=1773307658; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSfqn29W1VjAxW09En8Q53HmJlB4jASrMadRDRdLb7k=;
        b=YQjvE9ed0LVpZVxhu65g/wBJTDI359lFn2oZDaDuFrhxBdSo01GQJaqzb8267zOYYb
         JBkQwlo8jbRr9rJb76/IxqauKnu39LHf7490sZIkLP2JrfGcWswGW2vzIViwsRGEbNoh
         MNE66dznHzN2E/cp0iUy4Xovgg1WyenHGn4m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702858; x=1773307658;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSfqn29W1VjAxW09En8Q53HmJlB4jASrMadRDRdLb7k=;
        b=iqZ5yTZ0H6bIv7b1vZlHCZVWiianplivLvvgEJhbzOL3duDn3NmxmyOsaNiR6i1IKn
         my9h2XvY+stZbdievVYiYrZSZbwvAE3lBCYdUWEINNhu01XXGUMZ1GfkeM4dpCqyWg+p
         M1wxd7ADiMnVjZoYvxS7iXsMl9tNJvsxD8HehdHYQgFj6lV0iUBcN4AJONR2zXvaRLPD
         W/dzkQrERWelcsYXJwvG7mwl0NevKiagM2mmoQm9i1nlDl3ZX+8xdwSu3OSbX87C7RdL
         IJuZXlvW7cQwmA4+5Q9ASO6O7Td2D4g2ZmYOUT5T67eJTGjxR7THgv0oWOmR9BsCpGku
         sdWg==
X-Forwarded-Encrypted: i=1; AJvYcCVvAi6v88+ncRJ2444+yBXv0hw3ZkYip7yEzOtvzYv20ogPZ/UKnUCSXWqTlKYM3NdnMiGJj8MeOlqlWvdo59xqgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yymto3KfODaTJOY0Dk6KUPI9V0HEduOznpbD+TTZPGGT0oBBd6J
	s0D8nr5KWSPA1RlQc3HyAhi0KQyn8h89jZHTO/JwWkHn4QdTuMMCMcB0jkHVxV/m+as=
X-Gm-Gg: ATEYQzzyWA+aOLm4ZK4q3X5oMu02TCBWqUPDIk4ePxXSsCJ/QD32mNc7pCO5aGH1zVV
	CLMqLeIbkIqSHBK5JCZn4uzD/xfgl4NEttfarlqq2E1etes1nAjsYMoRQxG7YCCoRk1zkH7TtmS
	B1Uw9goXejj43r0GefVuIFTpMcTDzGNmpy/02ET3fDerKtGEI9gzsXkMRIaeouXwql8aGeqUtU4
	pv9g4UcPBHSpw4QUg8et4bmx3VTCzL99satC3jNZCFZxelTAXQXcSGXnPCk0+nSQ4kaucGEffvE
	NZBYkfvjMhvN9pR1hwxks5kyXKnVOgni75L3FEfCQyh9uyY9cvyzFKArNm7nGbD2CsCBbsaNtEn
	CWn50U46p1a3zFJ3nkM4P9TikzX2PEhEBXxY7HyZeXAD4jy/l5ZU0F+gc1vp8gxqJkDuJOg5I4F
	A67hXFRAbG2h9rMqUljkyl2LMgYkXPKdwl/wbNMnifoJrgkdMQM/su+27Nq6Rx3IBtI0+uvNvFX
	mcw1ldfDEcuh+kl
X-Received: by 2002:a05:600c:a41:b0:483:7ea3:3de3 with SMTP id 5b1f17b1804b1-4851ee7b07emr21095225e9.2.1772702858012;
        Thu, 05 Mar 2026 01:27:38 -0800 (PST)
Received: from localhost (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad01d2sm30675785e9.3.2026.03.05.01.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:27:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:27:37 +0100
Message-Id: <DGUQPU1BN6DT.3QWYXCIXTY7C@smile.fr>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH scarthgap 0/3] meta: Backport rejected CVEs
 and SPDX3 fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <mathieu.dubois-briand@bootlin.com>,
 <richard.purdie@linuxfoundation.org>, <JPEWhacker@gmail.com>,
 <thomas.petazzoni@bootlin.com>, <pascal.eberhard@se.com>, "Ross Burton"
 <ross.burton@arm.com>, =?utf-8?q?David_Nystr=C3=B6m?=
 <david.nystrom@est.tech>, <kamel.bouhara@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com> <DGU8KF6C5AC8.3PXRYKVMHQIBZ@smile.fr> <8651428.T7Z3S40VBb@brobin-bootlin>
In-Reply-To: <8651428.T7Z3S40VBb@brobin-bootlin>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232470

On Thu Mar 5, 2026 at 9:29 AM CET, Benjamin Robin wrote:
> On Wednesday, March 4, 2026 at 8:14=E2=80=AFPM, Yoann Congal wrote:
>> On Tue Mar 3, 2026 at 5:46 PM CET, Benjamin Robin via lists.openembedded=
.org wrote:
>> > This series backports three patches from `master` to `Scarthgap`.
>> >
>> > Removed references to rejected CVEs:
>> >  - Removed references to `CVE-2025-62813` and `CVE-2021-3502` in patch
>> >    files, as these CVEs have been rejected.
>> >  - This change prevents rejected CVE references from appearing in the
>> >    generated SBOM.
>> >
>> > Fixed kernel `CONFIG_` generation in SPDX3:
>> >  - Backported a fix for the generation of kernel `CONFIG_` values in
>> >    SPDX3 output.
>> >  - This is a important fix, as the generated SBOM file might otherwise
>> >    randomly omit kernel `CONFIG_` values.
>>=20
>> Hello,
>>=20
>> Can you please send the equivalent series for whinlatter?
>
> Hello Yoann,
>
> I can send an "equivalent" series for whinlatter but only with the CVE
> "fixes".
> The generation of kernel `CONFIG_` values in SPDX3 output was not
> backported in whinlatter: It is only in master and Scarthgap.

Oh that's why I couldn't trivialy backport the patch (I did not look
why)

> Let me know what I need to do in this case?

I can do the cherry-pick for the 2 rejected CVE patches.

Thanks!
--=20
Yoann Congal
Smile ECS


