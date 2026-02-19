Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F838E9A04A
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 14:35:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14950.1771511740444242316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 06:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xBFOksaO;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso7974905e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 06:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771511739; x=1772116539; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I2MWDH5ir/nVTnTqy+77vRxBe0bCQgymC5gvCsRdx0=;
        b=xBFOksaOLAMHd1X0Jl88ksQ7VhV8DfOqI+eT3jcMboiWJXTqW7rr2yicWM7So6ufzC
         b7saZx9I3W0zwnMPZV/lJBEtfB0QjtKmTVlBzghw0sv3pDV16sbLuiq+gJPGMMoskJch
         9g8oGbdozCYHl6Jj1M+bwKrZThPbCl0JRPhPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771511739; x=1772116539;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I2MWDH5ir/nVTnTqy+77vRxBe0bCQgymC5gvCsRdx0=;
        b=d3+h6N339hU3YfR59o0ijWL2W/dZOA4WXxxbYHUT6+VvQh7LsInM0vDgq/najNpi/M
         jPiOeNm70LDazaO3+Wj9Zz2liggXjnYL2EosAB/RDiOeJHvEzebRPMHPNud0de20p992
         JyngoiKubciD0Lz0P2qqyhc3GxxLpYa7OK8RJNExuZriJ5E/gDXxwF3tqH/5LYYVbKfm
         I9z82idVL5KKZx0falPUs4/3SfYuaxFf7RjmWNZUFR0iAUIV+AwIPxJNTMg3j/r2umd+
         kY+ediWNC2AHTS0xpZ1KUEEBQ2ucUpmhDcX5F6Eza9ZT//WsdB/zkO7/KJBv+6p6YCDJ
         jVew==
X-Forwarded-Encrypted: i=1; AJvYcCVeZSHb7zgnTxEImxL7hbb9hLzTon08FwS7cEK+XQiK5Mmzl2rxzPZIGxkiIqJ58td3ViPH0igz1UJDwGEoVOzbBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+Y9FcnwX4Hjh4DbvV5HqTjSek552siaLZJuwFAhdtjBeuiNpn
	lkE1cE1phNhucarNEB03dhxzuGYt/hqx8S+WUMSu5GauCsS+omyHZuUyYHUY+IRnKhs=
X-Gm-Gg: AZuq6aLhrg1tmqun6LucwWXwGwDSuKKTwtICIe+7Vy8Rl2EuDRCKeo8K8CEHaTn/SeV
	2Bz9JtjuH6fviG4+cJ/SMa9/j+rTYXqloaojeJ6vwbhSrGGFznnPOzo6eg81adElvQyJGMBAZK6
	Z1rxCgwO2+HfNLnyat2OtuwogYAPHlJn+Uzh5HXShdTHConecMNRzOpJroKNN53MpUxojl5t+5J
	nD0BrIXeMqt3Q5+Qj+IuQ7JzV7JRrz6QtLYieebOx7WmeSJgLwG/r+igGsqZ8yIohGyBAWKP7fs
	WodbSNihGuWJe2m2woT6DEw6LGcFD0eFYkOph7Xlahl7GTxzzhbISVjEv2IDZ16XjbeJsvsGoMK
	zzmWBCNArkHBCobIQLSPduqSCXOEGEkV02qI8Z7MqstWsP5oLYst+dt2W/rVLPFTWsMuRoxaVau
	N9D5X+rvNUoXrJ9Xy3hpg/PajrMVaTwq90MuJiBy9FEvYGdjgK4/pWSW+hX4/SUdDXekFX2oZL1
	vKZUWoC/pO9jvE=
X-Received: by 2002:a05:600c:3b11:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-48398a52be1mr112806805e9.9.1771511738600;
        Thu, 19 Feb 2026 06:35:38 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f99067dsm21878925e9.29.2026.02.19.06.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:35:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 15:35:37 +0100
Message-Id: <DGJ0I1AYCUMK.2QUHJL111LVBU@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "careers.myinfo@gmail.com"
 <careers.myinfo@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260211072322.79206-1-moins@kpit.com>
 <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
 <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
 <DGHXI0SQALG9.F3GW93KUXVTW@smile.fr>
 <AS1PR10MB5697ED75CACEF217DC9722B7FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697ED75CACEF217DC9722B7FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 14:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231427

On Wed Feb 18, 2026 at 9:16 AM CET, Peter Marko wrote:
> Could we add "adding/improving tests" to the allowed LTS backport items?
> I think we're shooting ourselves in the foot here.

FYI, I've asked the Yocto Project TSC about this.

Regards,
--=20
Yoann Congal
Smile ECS


