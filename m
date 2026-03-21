Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E6B1094474
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 13:39:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11075.1774100369575810960
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 06:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KuF/Xhwx;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso25268365e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 06:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774100368; x=1774705168; darn=lists.openembedded.org;
        h=from:subject:to:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yXuNJBDDvnm/44/RUrQKlHt/Rhlumh/nULrg/Jhqfvg=;
        b=KuF/Xhwx7RILdknC/cy+VgQiJIXEDNqgysdyaI2hf3K7vwlXtMZIlyfppyLl/x9sqe
         XolVuuKi7QaXrB2rtxV/l8MkR1bR4zmwZtL0Oo3CrNl+pDTIAWRXUa7BuoPhDjd8Aad8
         +rN2CpDP9a6TElmlYFPJPG1k4s5s9cw5YPsiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774100368; x=1774705168;
        h=from:subject:to:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXuNJBDDvnm/44/RUrQKlHt/Rhlumh/nULrg/Jhqfvg=;
        b=QJ0YNyZmAywAUoBY08zgzWRIg/fQO1YhwE95U70z4nRlh6x2ZkakzSGJdBk+D9qiee
         EbKyL8xFs5Z/F0zUAZB1TAiEk4JfjKS6J4jP3ZksGjhc8vvgRjCSSw0HP2LeDA+HsL6d
         Y5vmDV4N+62piwvOYay8mBSP4HSAlodUIy70v+caRxyxcor25kFOWbDdSQrpJeOa+enW
         kuf+lsphTHebHWnx9luocfiZLo/BLVd4hjAuh7EPErw5r1aDmMPk1GoMjW8oWAJ6Gb6i
         MEkQo3PFJtGbW8IYWrm85W00c8StCLSBiiwwxFmg8zybf6+wZZ0WNMyP83h05eYP6FxW
         xVAg==
X-Forwarded-Encrypted: i=1; AJvYcCWETiwuq72z3kpI4ICeNz3ULXZljakZhJa3zW6gFmPJLXGmLNg+6zJMdYNIBKA0l68ma3y7fvD/p6XhBbvx3lTfAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzCvcAcK7hkCOq+k+yqgiOMnxkHwS2N2QfikJsgKoqLTH1+cUb
	cuw3AZmpv827QrLe2vGNplK2avh9GxIFGLcka45bz+hUSuaQJrcH9cXWcTs3e0aTo49KHoNI2V6
	zb2YA
X-Gm-Gg: ATEYQzyMVGvSn3HYBc1z3lgBMd2A/ZsQNUFf1VNnZ6RfH/pBvTft1NvBcvbAlvTPR0m
	jAWiCtfW0PnkYGnI0twaNkQcaWamJ/UpUI1mVu3owp1OpbFG3NSiFkt+Nkbdw/QT2km3BJlhm/O
	Zh0UhzVw7eP1LwfB+ggGpa2gNnzFuUmdYYoLhCS559oYbjhP9U9+EJSD7iScNplu834P56cWJaO
	MGVeUTUdyPmDjFb13oaI5b9GR6R2njRm0IHld5a+Ti7dO/2IXL5XdWh4hfxSalQMyFtj8oC9Caz
	4LVkfk02J4l9Kp2wEZWHdCTec4SHW87lO26v9pNE8oOG/srQjEMA3RdeucLt/Um4dc3V5tYKEcn
	l29X5BrJEN/nlQiJd9R4awNmmwXIommT/lEw5vW0KAlIc+o6OVfcNktAOm7/3Bk03pgqtfb8Hjw
	dk6B8gc32gwrh0JOd3rQbJY4OZg4WbYIuoIs6YZv5Rd/Q+XuDechskmhuv/ZBlYBxnh/Lk7lWYK
	ygFixVqrRIRcg==
X-Received: by 2002:a05:600c:c083:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-486fedf9be6mr70648075e9.10.1774100367635;
        Sat, 21 Mar 2026 06:39:27 -0700 (PDT)
Received: from localhost (2a02-8440-250c-8030-6c94-8350-19c4-1d82.rev.sfr.net. [2a02:8440:250c:8030:6c94:8350:19c4:1d82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870504f2e4sm10470155e9.18.2026.03.21.06.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 06:39:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 14:39:24 +0100
Message-Id: <DH8I3C005I7I.EAFAABGT2FJL@smile.fr>
To: "Yocto ML" <yocto@lists.yoctoproject.org>, "OE-core ML"
 <openembedded-core@lists.openembedded.org>, "bitbake ML"
 <bitbake-devel@lists.openembedded.org>
Subject: End of kirkstone LTS support
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 13:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233662

Hello everyone,

As you may have noticed, the end-of-life date of kirkstone (2.0 for
bitbake) is near.
The last release of kirkstone will be the 4.0.35 and will be built in
the week of the 6th of april 2026 for a release on the 22nd (the date
shifted a bit).

If you have patches that you want to see merged in this last version,
please send them before the end of march so we get enough time for
review and testing.

Best regards,
--=20
Yoann Congal
Smile ECS

