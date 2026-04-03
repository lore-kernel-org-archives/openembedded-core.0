Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F116CE7E349
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:46:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7600.1775205972967927541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MF91/lq7;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488895ad947so19409215e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775205971; x=1775810771; darn=lists.openembedded.org;
        h=message-id:to:subject:date:content-transfer-encoding:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2ij0beFau+VVnOSxhglSrjx+pucKOljB0763HQsV7c=;
        b=MF91/lq7dxx6vObfoa4PUv7zxADZ8i/HuBAsYC8X0ETb6x6uE/xWHgqxY8iNUbD7T9
         cJiBIucRbycLW15BdNTE8r/7HyNhKPDFr1/HEQVX8fqEvZ89qBoXI85RoFZ4+pFVkIqx
         Po872BXiG95/UGXgqtoW+9G+pTAKBtMjAFVTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775205971; x=1775810771;
        h=message-id:to:subject:date:content-transfer-encoding:mime-version
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2ij0beFau+VVnOSxhglSrjx+pucKOljB0763HQsV7c=;
        b=B2mxMV9YpdLMFoLz6/1oKZ5qA5kCdT8CYSoUOFf5uaO9cJszS8sqCgrHDEodYcibJK
         EWX+6GIN+/Gk6qauIKKB8wamrp4HX9RcZ8Wf068FlAqCteafsZUdKOnYmfg4uwLajc4v
         gKbIuWpp+ceIA7kyngLvDwAIVfUw02CeuVV2mFvnnXHMnpNAn0LesZ5RWeLdC86+3CB0
         vilk82c533Fe86Ux898AbRiCciOrcBXPJMNQW0CTJKPhVCCeoy7xqFGctWvHiTCYGpOL
         STpAakZKFaUi6d/DGurvqRDFCdKiSj3XCqNd02XUcHOAzeKvkwY8lKBTxPhe+NGu+9dU
         +Oiw==
X-Forwarded-Encrypted: i=1; AJvYcCVNEGesprWVxi9/MUxc3svRyCEB9UdGTp6LQ21H/IvDsfcZwA9JGSyiA2GXeyLWwBRzYQLIF3kjzD8pYfKDvxnF0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxSXky1OWHYBGC+4k8LL3+MbNDy5V4oYMqIP2Cdnx7GwxAmhPoB
	cJPoNyQByXNrNGmeqXwp96iLQXB8X21q7C5sPolyUiUF7OGiN+ALpsv0jCKPeR4A8fQ=
X-Gm-Gg: ATEYQzwcgfLvUcf4xcXrxNYAGfqnwMNGSzePTAk4LjA8Yu+OcKj42WdLxHcgzNBpmIb
	sM/Gai5h95LSgrW5wal4QTQbcxEpEp/e8EVBCy+Zf/RxZWvS1K0g4B8qyOaZCmDNzXkdf17OK8+
	h7nPouEikwul57z/atr7+OnpkAYVn3nuBz1vzHIp8k30qMaNKFIvJYXlmHwRlcp1NJ9hRVKWDC2
	RCFdDtq8itXXXY1qzf/XH4lf6icFkEu/IkSFYZQTQcX6natuEh/U5vpCkM4CSmKPwrJlDdaLsyW
	EI/wQM0JSHpzw5k8bwRq4l8YIy0dM07eKjbtJQIc/TroRbAPkZmUop3W3QI24aD8z1n5J0tR8Qd
	QgbhHFSoG55+jKVcflqwJ9ugI8sEBcuZQ1o9PIV6OL0NbmdOl8YTB7OWNNDXtmEp4u1WvkMbAgi
	esMlg24SQDm6tCMPICeyWfxKNfGWX5CedGUQ3RIeJGJ1YpMyqmBP2/zCdgv2wDJZoYs4Pp7P2Bn
	aywvIbPZTh2EYul
X-Received: by 2002:a05:600c:c166:b0:487:338:b4df with SMTP id 5b1f17b1804b1-4889978006amr36520995e9.15.1775205971207;
        Fri, 03 Apr 2026 01:46:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dac7300510953f30.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dac7:3005:1095:3f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980db973sm26469655e9.3.2026.04.03.01.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:46:10 -0700 (PDT)
From: yoann.congal@smile.fr
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:46:10 +0200
Subject: End of whinlatter stable support
To: "Yocto ML" <yocto@lists.yoctoproject.org>, "OE-core ML"
 <openembedded-core@lists.openembedded.org>, "bitbake ML"
 <bitbake-devel@lists.openembedded.org>
Message-Id: <DHJDUJSPA7LG.3IKCP2QUJBMRL@smile.fr>
X-Mailer: aerc 0.20.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234572

Hello everyone,

As you may have noticed, the end-of-life date of whinlatter (2.16 for
bitbake) is near.
The last release of whinlatter will be the 5.3.4 and will be built in
the week of the 20th of april 2026 for a release the week of the 6th of may=
.

If you have patches that you want to see merged in this last version,
please send them before the 10th (next week) so we get enough time for
review and testing.

Best regards,
--=20
Yoann Congal
Smile ECS

