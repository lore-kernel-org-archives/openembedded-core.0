Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F621103A997
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:09 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13957.1774405192507008724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QxExRHj+;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2418265b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405192; x=1775009992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqukR9PJEB6LJ3oCpqZxEkWoWSD7YXfIXZoRKw/Jjes=;
        b=QxExRHj+e50HlxlMXFD11aIcAfmlMgHDvbfmQ9KT43DIORt26aVQZ3I6s5u4lq1OJm
         xhC9aooqeL9s64iT8eZc4whT+yMHyF55dNJp9hWSnVzr/0FaCCNGHzxIZsZl4p3VtEyc
         NWwql3mX0teAulfaZW7ifwPUfL5rHCOhnNIhUSh/GPuq4swC5q/zcGiUnyYCtIQc05T0
         WUlSd2P1xqQGkQNpwWjjzigkJunQ2z1GBtJvngayx6zaT/5a2OpudQjmIBBhIUGXO0AG
         6t3eLxn/Uqoh7PsQTXJJNMkxuIEN9RJZ8TfIapS7pqzndQr6ActCvmdEHcjOQ/8TQ9M8
         K3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405192; x=1775009992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LqukR9PJEB6LJ3oCpqZxEkWoWSD7YXfIXZoRKw/Jjes=;
        b=d3clv8T3qnCNz+TzegIYYr4Ez9fsxKtAaKkoFt+TulbUd8ZEyjqZ2GCIULfG+eQpC8
         1okVrxfv0BBGRN02Hly+bR2CrfJaSBAHd3Nf5Pg+I2IzP3YhxppJ937RJLmLP3MG2QV5
         dJJtL1/lTHybcI6UbWcoV2sY8VPBmbrwIUJzmThaL8HrjxxOKwA01u2VBYlFoRLTy/pX
         tsWiY2AowHRFRz60EEElSBUhGcIAY1kB6r+6HeaSm9Emi/7h5lB/SKGwPp8ys9z8tP1G
         IeuVkkLlgER/CcG/pZ+DlyGLqx78abP5I9uD1VNTswz7zbFcXknW07X9YOo77vJOEA5u
         Ldxg==
X-Gm-Message-State: AOJu0Yx2S5xrTbQtIltonC5Cy3AnhI0r/HR0rn47nOEXwl8Neyg+aNCv
	Mhluizd7naJC0WH7fLf4iUA54k60Sy1sQzF0XTt03VlqzAWSDk3+zrEzgNXGEIOm
X-Gm-Gg: ATEYQzyPZLxUUpjWH8CGiaYeoDZUlamyTkRrWHsueWF2JXxYySDRu1PXycA1raCKfz2
	p9MwynU3Gc0pf6OOoAcS5nUW3J0bn4j+clIrIBTZJ0ddVqUZb1dPFtOyJEGQg+wu7bOCR6mr/Sn
	+fVN0SGMKJmIeaGmS5BDRz1DL+YrgToOLpQDP4NszYzN+Rv83gr/r5e3BjCbbff16cxMpU+OXvQ
	yFaG2vchz9FYXqK98xa6D/NI3Orf3Ydcq6jrsU/n2r/B+3myRkho7Pmy0eCuRZ3mPeVC11c6NyS
	8rClmUKlG3z8ievDjW9ZmnTrwB8nybd+ujsN9aL7vbxXYp2oIIXFIjZ/Kc5/Dxc2YJaZ4CILkvO
	4UhxTI4oiHzTeEh+1JuWTcJfUDWDJeMPAsageIli2d2pvIDYH/xV/B7A0t8muNGMn/wETIGymnr
	/ViAs2uEqzLdJ66w+tqkbi2KU3JSdX1kLM/EE=
X-Received: by 2002:a05:6a00:114d:b0:827:2995:3b99 with SMTP id d2e1a72fcca58-82c6e0eadd0mr1637605b3a.31.1774405191743;
        Tue, 24 Mar 2026 19:19:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 08/12] seatd: fix packaging error with systemd DISTRO_FEATURES
Date: Wed, 25 Mar 2026 15:18:52 +1300
Message-ID: <20260325021856.4053666-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233846

From: Gyorgy Sarvari <skandigraun@gmail.com>

The systemd unit file for this recipe is only installed in case
the target system's init system is systemd. It is achieved by
inspecting the VIRTUAL-RUNTIME_init_manager variable.

However the systemd class was inherited unconditionally. This caused
a failure in do_package task, in case systemd is present in the
DISTRO_FEATURES but the system's init manager is sysvinit: in this case
the systemd unit file is not installed, however systemd.bbclass is
still trying to register is as a startup service. At this point
it failed:

ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd.

To avoid this, install the systemd unit file unconditionally, regardless
of the used init system.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7f157ad1207567ef3614ee4f6e755bccf60a3f4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index f9f72c9e82..3be27dda9d 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -34,8 +34,6 @@ PACKAGECONFIG[systemd] = "-Dlibseat-logind=systemd,,systemd"
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
                 install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd
-        else
-                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
         fi
         install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
 }

