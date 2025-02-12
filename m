Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F97BC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 23:41:39 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.2965.1739403693660280072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 15:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dVcMJRwO;
 spf=pass (domain: linaro.org, ip: 209.85.219.49, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso5534906d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739403692; x=1740008492; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:message-id:to:from:date
         :mime-version:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFkykKX1XFaARgcciu0hcjg1vX4MOkOGKUyF/gPPc3E=;
        b=dVcMJRwODV3CyQKpQfPQ4HkUiasyKBgWYWEPHO5dcKaySi2BRJoOhFT8sFCzB/vKzm
         AV3qQfSy92JTjFO0lBUvshBHOTPLIjLJCp0TY3QS2KrjJm2u9XAvp6Cm5J4KpxCdgsUE
         fEFRefr5uFm4tt9LwVQUZo/Z9LjYI9/65LILJUTaLxS6T9SPLSzSPNDCs1P1sL5BkAKz
         jau6XlQQ8WmqabueixZJ3wSIFSDTVTp2T85BADkYtsh12LLh1AIgo0qyK9Lw3L337+5Q
         Ir0bqSUR3ZPNbiraLYontdM0y4jBTIbX7yR2zoHe208t1SPjn7GloZa15MbMiAWUAbva
         Y6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403692; x=1740008492;
        h=content-transfer-encoding:subject:message-id:to:from:date
         :mime-version:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFkykKX1XFaARgcciu0hcjg1vX4MOkOGKUyF/gPPc3E=;
        b=SIqkRjRANnzDwjuCKoyLrgCjXl704BfzePP8eQF3x+jNhwesg3Wox4lIIKNuk5vkae
         uWatSz8Pf8c3myBWIPXsoZdHsT/vzADaNa/m62nYtUkqCxN1LjPkPPtuJCN3DE0Dq8lg
         zNXvvMoDJZ1WVBH++UGWQs+XMxFghOVhZa10NtiXqvWbCremMg2NOZQOI2Jg3z74MVpm
         V/sSiyg4Puza8USuc7Aa9fAmp8Np+sUWcZEQShA9dP1YysBCZSZ5ZI+wu5/gLTmntR7s
         HOknZdNqX6Icf7OQR5OWBeo4fFXRLb6Al8To4MH0zS2hiqoIhn/ZULrRG3xfAW/bqpU2
         qfBg==
X-Gm-Message-State: AOJu0YwCLcgskFdZbgDKVWf0lf4uoLHwXVJCtWZ2rWtrYdwkklktNOYq
	LG8JBcbVvtZWYSEkq6ejcu1Yy/C7A8zn5n2klF4UuhyQ5SFxAMlfJ5hBbXHE0uszj5VFASOJF6+
	Z
X-Gm-Gg: ASbGnctDo834TUL4T+q5Yii+zu22LiyiovIz3iYLFqyV4yaXeGqDVmb1VzYCKvyE8ZH
	pngpw6VmajM0qAhzSnHDHVV1XLYHi/cO7Woy3az6ZTGNycPZtVgGUfAmi3HODgjGWtZ+3LnfQZo
	L3iECxKt0YNXe0yhyrI40+gvKZrR+tsKmxEg0hj02CDaQfNMsrv43eSQeOyEbCpDeXxAjdTiXCE
	YPRfNmIrRUpi1+ldgLNSwBqsSKKCHVHTg61Ra1jXiiJ9m14zBtpct1u8dmDfSJ4BFjHXNsIvml0
	o5oeGul1+yePD/as/U6JKy6QSiOz/pPFn/VBfwE/GlflAjPbqeiwsv+uNglwr4mQIIJP5WG5DhD
	23/D0WN0=
X-Google-Smtp-Source: AGHT+IFXVEFUTad1pW4mmmdhsTQlLGQigCeoBBJEfcWTCejm728jtX/S55sBd1UV063+YUFPQHsoBQ==
X-Received: by 2002:a05:6214:cc3:b0:6d4:c6d:17fe with SMTP id 6a1803df08f44-6e65bf4db37mr30568496d6.25.1739403692457;
        Wed, 12 Feb 2025 15:41:32 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f388dsm735096d6.91.2025.02.12.15.41.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:41:32 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id D38D6120006B
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:41:31 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-11.internal (MEProxy); Wed, 12 Feb 2025 18:41:31 -0500
X-ME-Sender: <xms:qzGtZwtsmco-V6eCgo44BXQ36aZZO2PgAEnTcTz85lU_ExwlIcABTg>
    <xme:qzGtZ9f-foYMapHqpr9igFXQp5patxlKM_a888mG_0g3DkH4L3AiNBq3CcHk1RQNr
    YyEIk_KkHkctOxr3lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeghedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
    fhvffkufgtgfesthhqredtredtjeenucfhrhhomhepfdflrghvihgvrhcuvfhirgdfuceo
    jhgrvhhivghrrdhtihgrsehlihhnrghrohdrohhrgheqnecuggftrfgrthhtvghrnheptd
    elveettdefieelfeegvddvkedtledvtdeuueetgfeikeelvedvtdegtdeuuedunecuffho
    mhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdptghouggvrghurhhorhgrrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgr
    vhhivghrodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduhedvkeekleehke
    efqdefudefieegvdeliedqjhgrvhhivghrrdhtihgrpeeplhhinhgrrhhordhorhhgsehj
    vghtmhdrmhgvpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgs
    vgguuggvugdrohhrgh
X-ME-Proxy: <xmx:qzGtZ7wDnLQBggrB19JUPC8CmwdyKerwfZoh15YxwGpO4tr1UTKfVw>
    <xmx:qzGtZzPr-8-H9CitA5ZM-N5vo8p8wp7eJ1weGOtAdohohhEmvUwTug>
    <xmx:qzGtZw-72iwBwrO9vkhJTQmQ2lfdlicGKewK0ajeQ7BKeWj4uAxiDg>
    <xmx:qzGtZ7W765FTbbSxrJvS_uwb2y_Q2sZmRbPm_64ns9FxZhJQVQPiRg>
    <xmx:qzGtZ5cbfV9-FdcrWYy0S0XZ3-GTkv11MsXS8t3MYpBjqAZ5e4eJ3yF_>
Feedback-ID: idd3648b2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD219780068; Wed, 12 Feb 2025 18:41:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 12 Feb 2025 17:40:58 -0600
From: "Javier Tia" <javier.tia@linaro.org>
To: openembedded-core@lists.openembedded.org
Message-Id: <ceec6a83-58cd-40ac-ba16-06115217f4d8@app.fastmail.com>
Subject: Unable to access 'https://git.openembedded.org/meta-openembedded/'
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 23:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211283

Hi,

Getting Git error accessing https://git.openembedded.org/meta-openembedd=
ed/.

fatal: unable to access 'https://git.openembedded.org/meta-openembedded/=
': SSL: certificate subject name (oregon.wlsource.codeaurora.org) does n=
ot match target host name 'git.openembedded.org

I see the repo is at [1], but I guess that will not be the final URL.

Also, there are issues with the site SSL certificate.

[1] https://git.openembedded.org/openembedded-core/git/0/

Thanks,

=C2=BB Javier Tia =E2=9C=8D

