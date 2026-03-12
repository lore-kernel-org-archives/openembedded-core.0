Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4C8FED2E4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 07:57:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16406.1773302275101266271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 00:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qEsYoGrt;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so6362225e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773302273; x=1773907073; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJYPj7itHcpwugYMGuaMrR6MCi+6ZE3Bo/T6IBEqoGU=;
        b=qEsYoGrthu2er4OwOiGVc/MYzx+lgd6s6BA/POAEgopCz++MU6ZgTpmDe889Ms0hH4
         zPmF/XC8r1gfu1rmLlBktyEW6j71+nUBO2It7GmWOQ7InXFJHRnmUamgVXG4re9Jt1e4
         zjXGRWhXeBb4uGvuU+J1ZpLXQcNW5f81RpGp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773302273; x=1773907073;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJYPj7itHcpwugYMGuaMrR6MCi+6ZE3Bo/T6IBEqoGU=;
        b=dvpPjLSsv/bCp95BLn1+XzrdsB9r4SosvS5FmqAXi4EcvLdm/sbCpHFaVWQ2taodhY
         efuFzPTtP9VuIiRum3JRbIUGJRgdSg1b3PUk1yfmPeOxckKUZPW9buTHaM2ozaaMA5ju
         UCZi8PYabH20p2XTSKPD/AXGSvXaziDyaWGQXVvpU5lrtMLATRuhIRpv0OgBIYmxV3w8
         5utSbF/pTro7Q63/MMBRlR0Jvy7Ufvu3Hkw166z/uv5HM49B9fpFFpKyC5JuZMvO1ojk
         EJSnqGn+O2ipb+Q7UbhPDgf77rbnecQngSnikuASxnBCyD8iLFUhjvQdGCkKgpBaCvKe
         mKUg==
X-Forwarded-Encrypted: i=1; AJvYcCUHhdB/Nw3XprZx5j4Po67M3DQWP7TeZZr9o7XyI8wjFa4IjEIjwTbNVvyHv5dTLSLY+E7lNXPlso+aFeZzUuZP0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzip27OxaAuzAczAetu4pJW7nhMs5XxmX6V71vYwLTyETHgwZnK
	GHxumsbPXAMe0Dnbq1yW6t8cFbbRREZ4XG3Yf6hyy2dmyLuZsNpRz2wVn6m/KEWsZ7s=
X-Gm-Gg: ATEYQzyi+NfLBoYfpEH2+B8CfP2wlEhJbRMcGk4icWO3okirwsHpRxtq0cZSmmeblCi
	Sj33hToCTsNyMyRKt9nUku61N5PFtn6CJbH+StCDk1aUWgbfY0yskCQ/wsUtKHshfjBDE5uXCEH
	uQrGE2FCvm2n7/mM7b1mWC46RX3bnJWptRLruGKTpjbzSKTbDDXsVGxSJfM5UIJmV9H6tqjse8z
	thWaoSHrOsVoXC3+J6rhK4RLbGJOFzNdLP/QOZlRFQ79KD87cm2sgCBWtzWtQ8Y1YdjOCzpsWxM
	FnddN75SznpZuRQnsY6O3xpoyDqs9g4ZXN9zDEvy4ejDGNx229hEe1hOXr/+9BQQTzuj2CYv6hU
	/MV4NibU2lza2h+9fyQBdfqtni3VGsNr/8R2J/HMglDU7kTx7nEpZXkFlXTh577K54GQOvbUsOp
	ZKOeHOhJCs7OLN4QFmWjqlOb55rSppnB5tc4++QZ4gJgqI3ucW4uKtX7PeWWMEi+Fw5bII8SDLV
	VTA5wgZzDyNRMs=
X-Received: by 2002:a05:600c:a4b:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-4854b0a71f3mr98072995e9.3.1773302273378;
        Thu, 12 Mar 2026 00:57:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6c24sm101020875e9.5.2026.03.12.00.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 00:57:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 08:57:52 +0100
Message-Id: <DH0N6XQ2BIVE.29QQNDCE76OJF@smile.fr>
Subject: Re: [OE-core] [PATCH] shared/fdset: add detailed debug logging to
 fdset_new_fill()
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <emailaddress.ashish@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260303081244.3330595-1-git-patches@bmwtechworks.in>
 <317026.1773030655249324672@lists.openembedded.org>
 <DGY2MZH9OGCJ.8XW3AQX0RNI0@bootlin.com>
 <317026.1773132660681799762@lists.openembedded.org>
 <375609.1773300819945269738@lists.openembedded.org>
In-Reply-To: <375609.1773300819945269738@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232925

qn Thu Mar 12, 2026 at 8:33 AM CET, Ashish Mishra via lists.openembedded.or=
g wrote:
> Hi Team,
>
> As suggested earlier , have already rebased to latest systemd code base
> Does team have any suggestion on https://lists.openembedded.org/g/openemb=
edded-core/message/232763
> I still don't see in master-next branch

Your patch is now in mathieu/master-next-success[0], which mean it has
succesfully passed test on the autobuilder. It will now go through
review, but, as stated in the weekly status[1], the review team has
limited bandwidth. So, please be patient. I'd suggest waiting at least a
week before pinging a patch.
[0]: https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathie=
u/master-next-success
[1]: https://wiki.yoctoproject.org/wiki/2026_Yocto_Project_Weekly_Status_Ar=
chive#Yocto_Project_Status_10_March_2026
>
> Thanks ,
> Ashish


--=20
Yoann Congal
Smile ECS


