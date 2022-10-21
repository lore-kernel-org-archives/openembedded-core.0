Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B36C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 12:03:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.9120.1666353819598588491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 05:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VIcICsWq;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r14so4947942edc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0+JBc0nMPlH8DA7Mi/9GitgLCe27YzznaSJ2qtD17E=;
        b=VIcICsWqR1z0nO397CFcZO7qBVV1TIrRJfLFXpHmq5CVmTmGkbmQiBOQThifYh9tnM
         zqzJt3lMGKtCVYodx9ckfW4dbTtdavorkn7iwbFpnkyu0rN5AQeldX5EiiJ8/9J4vV4L
         KYn+NIIc0lTICnbHBAR18Ss4KNXvi2KjaGf6Iv9SDKXmElLFeweMeWb6fBoYM1OAuYmp
         k0qz1//u8kp3SdtZ9vANihLJGAB8EzkJuDOZafCAIonaxg+O/rPAnLbBEpXula7RYNYt
         1AvpAyTDNUPG19egMx06zvvpccyeQsbJvYiif8hTm/NZqTUHZjJFDs3Y72N72nJBvHRo
         V4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0+JBc0nMPlH8DA7Mi/9GitgLCe27YzznaSJ2qtD17E=;
        b=c43WBraSM4UdbnZ6c7jH5d5zs7aNzJzokDb5Elfprt3l058vLjdd9czA9P/JhfqVbJ
         6smHSSBzPzWh4h3bRvZJP/S+n9ZAfLSWaTshi0Tac7E+m4ovLvmJ3k/TCjHhsI54J4Ig
         7wwyl/vILTKLrpT0VZKt0LyF+4vBF7+ZR7DJDZAMhWIh4PFmW8omt+NrSTjbKU62jqZa
         E8YMTiUNt1UmYGqRTeg0zgz0dbaoA1GvaeGt2cpp53h/bFPoqkJlBW7YRUuejcSrcnAj
         gYFGCxTcZKDKikjr8jYD7RFLhjNb2fzjxJMlYpjR195pwgQ7XAPdK81WOOpIuF4zQz25
         x3kQ==
X-Gm-Message-State: ACrzQf3w1XX4gFMqTHZ6MVwe0P6W4XeVuDPuzEZ9rJ63Qs/aS5wTU3b5
	vGoeZ3oYh5KIZ/AIhNPbrKr60mXqVMCKbw==
X-Google-Smtp-Source: AMsMyM6zftQp+anLbUTDF2W5dxQn1UBzD13YdPvpRy0PBEz/vOyMlVMWmPN+3aGfxZGU8QPlPQe5nA==
X-Received: by 2002:a05:6402:5ca:b0:445:c80a:3c2 with SMTP id n10-20020a05640205ca00b00445c80a03c2mr16975184edx.247.1666353817033;
        Fri, 21 Oct 2022 05:03:37 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id v25-20020aa7dbd9000000b00456c6b4b777sm13156494edt.69.2022.10.21.05.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 05:03:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual: add wic command bootloader ptable
Date: Fri, 21 Oct 2022 14:01:19 +0200
Message-Id: <20221021120119.559136-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 12:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172013

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/kickstart.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index d82da0ee75..30629563f2 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -227,3 +227,9 @@ supports the following options:
    the bootloader. You can provide a full pathname for the file or a
    file located in the ``canned-wks`` folder. This option overrides
    all other bootloader options.
+
+-  ``--ptable``: Specifies the partition table format. Valid values are:
+
+   -  ``msdos``
+
+   -  ``gpt``
-- 
2.37.3


