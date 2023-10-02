Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420AFE7849A
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 13:36:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.81899.1696253790147847579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 06:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=f1xN11HL;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.51, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5046bf37daeso16292637e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 06:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1696253788; x=1696858588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYJRBoB8D6rE/w+aGHm4tT7ftrKhdmAR7ZudKs73jh0=;
        b=f1xN11HL35ookCbBvvG/kmOpd0vqbNi+1tKPb3QAbGAsD+AMd5TxTxvN2E77LPogaN
         tyssWazm1Z9YgQ2YYhIYTeIGjzOYug+w8C13vLxq4hdiN7oZbwT4gZ7j68xeiubjm9Bx
         YC2ho18mDA0tM+4dF2GwmiT4x+kqe5y2uPAjFtJ99CEdxsAWORU5LRpsbN/LrxQSAv8l
         Pj/5Hn+aMV8RG90QOvmItMxD0F9qBL++xRqnm6N/AgMRzci/L0KayVx4EGgI5MEqRr+M
         +pxwcSeb3Os+Qit077LvZ8v+GzlLbcRVeSn6zhdsfj5InkwJJPXI59xJkrF/3BpgDqJj
         61Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696253788; x=1696858588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYJRBoB8D6rE/w+aGHm4tT7ftrKhdmAR7ZudKs73jh0=;
        b=GEdKMw5YDeJ8EjTG9aEPNdyPBhZNxeWzdv4hene7g78Hho+7DKn5EoKPtiZZHy0Xcd
         DZ0NpYVlSEYS0cNQ938T5nqcTn95rrOjUDJCZhJcPdLt5NbdnED7ZK7Kq3aAFIPeox1p
         +6QWEJl0146KKoGwB4zQUw0Ds4+jBtQYCTK329fBkyxXD4G5fqoBV7MzCvf7x9hLj2+X
         iO3RR+PMfJgKU2ziMCbC9FysCFo41m8xKffM1vmkq7BMhGikT3/uTxeuZBRhP/xhvY9u
         sCJ7xyJ5ODDT38xDyPGRis2y3RdO9zLzbczkog2jUw9RIk7fgVIRo1KsfB/AdeuaeHQa
         okyA==
X-Gm-Message-State: AOJu0Yxrcb9sy+Ujl3qXvdboQCBHN/7rndmClDILdZykmVrukCFrrxvS
	T/Jekb1/xeA/DWr/f4OEgQZESpcJTPBcZRQF9NU=
X-Google-Smtp-Source: AGHT+IHAc16zyAncxNsAwLblYBTHZT5IktK6E4p6i4t3BvM4MJgLeECesjjT9KlMuXiPcqFaCC6Lzg==
X-Received: by 2002:a19:ca59:0:b0:500:7f51:d129 with SMTP id h25-20020a19ca59000000b005007f51d129mr8410562lfj.34.1696253788129;
        Mon, 02 Oct 2023 06:36:28 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id d14-20020ac24c8e000000b005009c4ba3f0sm4647465lfl.72.2023.10.02.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:36:27 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH v1 0/3] uboot-extlinux-config.bbclass: Add menu title configuration
Date: Mon,  2 Oct 2023 15:36:12 +0200
Message-ID: <20231002133617.205619-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 13:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188607

Add new UBOOT_EXTLINUX_MENU_TITLE variable that allows configuring
the "MENU TITLE" entry.

Daniel Semkowicz (3):
  uboot-extlinux-config.bbclass: Remove repeated space character
  uboot-extlinux-config.bbclass: Uppercase "menu title" entry
  uboot-extlinux-config.bbclass: Add menu title configuration

 meta/classes-recipe/uboot-extlinux-config.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.41.0


