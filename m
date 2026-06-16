Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1072CCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:19:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159.1781623161822169929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j9izdHv/;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso2222240f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781623160; x=1782227960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFqqtMPWNZhEuuZ7sKgpYq8W8xP3bKfL/+kpUFoVit0=;
        b=j9izdHv/Bn07GItXr2Bdj1GmRadYeO0ibBF1JYQNexlaV1v9qL+Mfx0o6WY6WoxPoE
         HSmJatuMPk6AlnnT34HitZZBVWsgOAJhp/dxTJmhfZvGVOc3BKGf35ZzwiwWNIB7BwTU
         2f7fhytL6S38Vm2XqloJmlywJVawg7K+Jst8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623160; x=1782227960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFqqtMPWNZhEuuZ7sKgpYq8W8xP3bKfL/+kpUFoVit0=;
        b=pGJu7IEpzvg5xCr9uO7zuG+tMCTTP0G7cqAXKXI7bJ8788OJIoNDjz9TDezjYMTJr5
         Hxf+SKA2BwxHbLFYdMW24CeGPsTiuhPr4MrxghcM7XXxMVikw/KKvCzvkULPwq/Noxdi
         fMROFG1Czc/qzANtMgv4CEftNj6wdCXCI6CJLIJeaUsp+Gyr2FvXsNxxMzrQw2G0zTBM
         grol+qxEaFx2B3IQsuTLvkbAQaVBOSwKYC0Z2IRp4twkyJsPx56CwWxJtiFxxgHH6tTK
         jDA/KE0XtD07+KH3hlPubckjW0cMwMOBU3c/RithbNWTk4ToOvk/yKpBjkthEihbxTte
         fNSw==
X-Gm-Message-State: AOJu0YzXSsEu1Szx9mgnVKuwH8a1VUEGYM+evC2pUNbvS/2DJ3DaMtb5
	ceMmfcHPDASEQ9604S/tRxwRKe/DXGMItVs9bmvLcXsg7RN0WpRUwjOWLl4U2iCXIqQ23an1SOV
	LcMTo
X-Gm-Gg: Acq92OFR3DHO6/BA4dWMLk+ZYayhEH0eX1ZvccDNREFmdqeXMFy9vinui0+prXoHkKP
	HhFa1hjuxtH6liSKB0ALpVkNRymhSIOSeC2KEXEQx/yGwlUNmuPLiG48Gu4CK0vu96iFQbrGrfe
	TAouJR7ylQmv9jao0ZRGpK/zTav8Za0OWUefC4XknWsCY42EngU5iSTxi6Pp5XZ45a5Io3J4D1s
	Ruf4qS76e5H//HXm1wARkavGOoItIcjwiwBJA5gEJDhS46pmfKd0Si7dDqXC025wc/Hmc98uigg
	OCmLXQaVn8hx1pVRUQXw/2z3zNfwZs5LQmsdEe1yqpMh1HPu7ZRyR8MM2tCPnsIGFzcMEE3i8UM
	AUxQRsOFOddD8XwrfhFlUqqP7UObIaMoG9h/hx/smKTqGbsJTRYzGnoP49+34W7BpVm+ISx15qo
	JaGBo4kDhcqg2wDuFl2olSiVzrW15od4XafkOiHnm/cUyDw1a7O0nm6MgfChykH2CGBEjlidH7L
	j9JLMI6jjWBtm9tz128AxLGYj+ByMfXsiItfeY=
X-Received: by 2002:a05:600c:6288:b0:492:32f3:a344 with SMTP id 5b1f17b1804b1-49232f3a42dmr9781175e9.31.1781623159671;
        Tue, 16 Jun 2026 08:19:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm438595175e9.0.2026.06.16.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:19:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] oeqa/runtime/parselogs: ignore new PCI BAR sizing warning format
Date: Tue, 16 Jun 2026 17:18:50 +0200
Message-ID: <20260616151849.1604663-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238909

From: Yoann Congal <yoann.congal@smile.fr>

Kernel v6.6.130 commit fffdb0fece19 ("PCI: Use resource names in PCI log
messages"), changed the PCI firmware bug warning format from:

  [Firmware Bug]: reg 0x10: invalid BAR (can't size)

to:

  [Firmware Bug]: BAR 0: invalid; can't size

The new format makes parselogs flag an error.

Add the new format to the qemu ignore list so the harmless warning no
longer causes do_testimage failures on qemumips.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
index b0c0fc9ddf4..c149959395b 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
@@ -13,6 +13,7 @@ FBIOPUT_VSCREENINFO failed, double buffering disabled
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
 invalid BAR (can't size)
+invalid; can't size
 
 # These should be reviewed to see if they are still needed
 wrong ELF class

