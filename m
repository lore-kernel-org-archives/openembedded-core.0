Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBE4F8FA92
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:09:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34181.1776784141584990302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ELdq+V3h;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso44729655e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776784140; x=1777388940; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCfzGG04e3rc7I7SF5DlRFnD2SuVGysQv5kLRN6r+fs=;
        b=ELdq+V3hh7RTpsFPpnt4+LpEsktAF6zRTknWSup2VAr3bgDt3oV7Bh2X5wQARP63np
         es+xyo7JtlXwaGR0YL/sg4rJroVq8JCuphkqpyyODO4PMoAfgdeBqA22jLF3iJgUzZ3E
         IfjEPt3IPQ85K//k6ZDNEkakpJdKaKNM/azto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776784140; x=1777388940;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCfzGG04e3rc7I7SF5DlRFnD2SuVGysQv5kLRN6r+fs=;
        b=LvY5ZK6NliYSFI8NnRvLOe6yIoNSCxwAFa3n82KKr3SrrSiHLEmuFD0K69z7wDoUey
         Uj2QEgjB+z/TWPFaY6Hl3QPleI/tClPDZqWxRU7lGdSmBDBeEup0V6mJkyBG0TSoFL/b
         Mza6r4HmWDUlpKPy+O/ZKxUPtXg54qa8Nsqvuo3tTlduGg2gDgAQgkE4/pvONpdgK+sc
         f3oIOw6BLC+DXulhSgaY3flepfPX9BMh5fsmbrICipzFkNiNnKvo5uQQT4L9FiGt5fOw
         zrYeQH/AeltrJBwQqfMNz4s6pQFTls1CJKpk8ElejO96W7gDT9vvOnSC5q/ibTDpnQaF
         aX3Q==
X-Forwarded-Encrypted: i=1; AFNElJ98JhSt+3Cnz3BipoWFqafGRY5t0JS4YOzt336RmMGTqzaog6WA+dzCe9DsREkw9m+A0EQ73H5npFQ3ClyuR1Fc1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPolOKmWGvIlXfiqZSXLFXVygA2y80iteplYVG7haZc+lAbVzK
	jdNIli++XaKvVxYxcHH1nqN/SUyg9MJzwrCyltgFe+p+YziG2fkb+bc36xui0tvKUrY=
X-Gm-Gg: AeBDiete+ugI3MFKb9RFPUkBcPrk07o/7lSBkAZvDzxa7zx/YBSlYMqBeeuiO6h5ZHZ
	nmISBWR3iGbL303e/iosaARmDyUpHFkmw9Pzs1vN8IFxCKZ1jbeeFkziSIL3jPmYdyicdxc0y4Z
	7RQTwGMphSCgs+eQuOOnBFtn4ji6oQOe0/kE5UfVC2DhwsuxuZO4vAhXzbLBF8zRnBI9xL2lEYg
	IEEB2h2qadmizyCUQ8aSQ4neFWGt1hSBTkssFXOL/umZpMEX3UwK9lbiCvXJDLNgJ+OAk8+ECt9
	BxQSy/BHFZctc/E9RN3I9MWjbngAMs260RKaf3L/W9VM7jcThDT8lLw2pSOT8o/WI2ruw6CBprL
	8E3f5xf/Zsd6EomHnmUxlerhImJ/ZvaMxTSwKZ5DhwjTaPlaDNifALysxT+CyaxKcKKVDi556UF
	9C8fxlsN6Qw/GXtpZC+kt2CDeCpmpWEOaAFxvO4S5L6RUJ8EFW12jrEo8xbIEBLmbk5/v6qfYDl
	YI/l2i466QFYpETHGTMTQ==
X-Received: by 2002:a05:600c:c082:b0:488:b043:5efd with SMTP id 5b1f17b1804b1-488fb75f7a6mr202392535e9.13.1776784139868;
        Tue, 21 Apr 2026 08:08:59 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm188832475e9.3.2026.04.21.08.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 08:08:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 17:08:59 +0200
Message-Id: <DHYXET56D65Y.2S77080TABHJB@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] curl: backport HTTP/2 and HTTP/3
 error propagation fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mail2szahir@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260410105939.924439-1-zahir.basha@partner.bmwgroup.com>
 <1534696.1776782799212647898@lists.openembedded.org>
In-Reply-To: <1534696.1776782799212647898@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 15:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235684

On Tue Apr 21, 2026 at 4:46 PM CEST, aszh07 via lists.openembedded.org wrot=
e:
> Hi,
> Could someone confirm the status of this patch?

It's in my review branch but I have yet to review it:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/scarthgap-nut&=
id=3Deb89bbf2bd7583669fcead099731153611b4ff75

Regards,
--=20
Yoann Congal
Smile ECS


