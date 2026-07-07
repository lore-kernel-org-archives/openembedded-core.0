Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AFDC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 17:25:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3230.1783445111663566862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 10:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SEA5QOXS;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso2733109f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 10:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783445110; x=1784049910; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/kuO0VPSxzQIU562sIo2jv03bstmllhKUXgC4NOpYU=;
        b=SEA5QOXS1KbXsLR4PbkpXdpdd0Fm8kWXeHba/+KtUMkSqtbQinchIpxYfjMKdN2TCe
         VSXoYr4gLIDs7kQ6JimrprnfVn7JIh4FZKcT/SdunpttkEnBq2MssxZZYr56NApk6J+0
         QCKrdLGWpaWsBf8yzHETxy9eSus83U2AsIzb0fcEzAEvEFY4Bq/Sb686gKnHEG6H5ewb
         749TtZayFHmtyaLkh4+bzFXd7NVBY6sddixFFvfU4EmfhofsXPafu1nLhX3WUAOodM3r
         dnBF538t+YTm3rROAOHCJSvFZmdomVyyrTlguXS5RdiZf80sKKU7FmiDFxFW6G4/QI34
         L46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783445110; x=1784049910;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7/kuO0VPSxzQIU562sIo2jv03bstmllhKUXgC4NOpYU=;
        b=qnQECcOc4z7bo8A2xhl52Op0lKEKd+lB77Z45wmsHFNlaJB/6WhcB5kLYGk1Stl4gD
         6++b8u7TXULZN5DaEf7p0SpoFDvVmg6aOwk1WtOXSCQxnBxSYzwoAGB41OYkcCS9PVr3
         u9CvnEuuPs9EGn+NDrs990p2GJjF9YzRFfIQ8Cef03lWD7A8QUgAiOBqQ332ODDUaj2T
         lVY5uyaEP4/azHfQyVLuaycTDoGXsOZsPGmN2z1Kr9THmkvW52gWsvF47g8dIN0I7G9x
         5ik5mFmA44Hz6izZaF972N+TSLNyrCESRtpOYBNwmYCbuSaX5kQGLbCq5rIWAcJ/qu7w
         NLDw==
X-Gm-Message-State: AOJu0YwWQCIm5EFgVpZUpQXbnt0SyHAqCLo2rPd4IZjtF6yVuCsyVepd
	zOrSNtI2Ieq4qYolCBSB8GG3Lo3QX9OLjndGL67mfOZuYgybHF58aST/nJLaCw==
X-Gm-Gg: AfdE7ckrXXaYk9OIfWTukmo3iknW+Kq31UzYYKmhGEiECNwDUGgX2GyJYCuRMo6Zpls
	PgVdDzvHsK+mkOk4+ME1nQ0ZMheV16MIcrdbpJoJTGLWIurT+tdQPvriQJj+g8vepmtJS907xC/
	B1PDZpb+c7xALwSmkCmTDmodOL6vsO6eNkVgTqO5WgsYYXoIMi/Fh2Gc/bW1XMowIgzvC3BJ8UO
	WxK7k5EGUWpfwC/XYZ1omaujgWDR9aSf48SJqx/iB3Ry2iS9jpZx+0fKP9+4TIOhCY3f/noLcIh
	R9FUeHryTLHTDRRyQS/oYWFcdW3JwbHw9lLYjb4CaArnqeeAHJLvQDLUJywECjkR8yBX+9zkI5T
	81Qzv01dAbvk5ClUFb+hF28xCpuMlO3vPtWHX84AWxJQq5fTVC7GJcb5tY3dmQKD8TzlmsyrvsB
	/LEmchG66UR5F+n1BBpJ4HlFom0bRXZmQG29jPAi9cMHTsePr2Huzu4xwm1ObJleIq72Q=
X-Received: by 2002:a5d:40c6:0:b0:475:cff8:b460 with SMTP id ffacd0b85a97d-47de66c3cf3mr6005674f8f.30.1783445109412;
        Tue, 07 Jul 2026 10:25:09 -0700 (PDT)
Received: from localhost.localdomain ([81.15.96.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34916334f8f.36.2026.07.07.10.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:25:08 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: tool changes following 5.87 upgrade
Date: Tue,  7 Jul 2026 17:25:03 +0000
Message-ID: <20260707172503.50147-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 17:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240404

hcidump utility was dropped in BlueZ 5.87 [1], this was previously
picked up by bluez5-bin, but is no longer provided.

btpclient binaries were moved from tools to client/btpclient [2]

[1] - https://github.com/bluez/bluez/commit/a035be775703bba1fa92b25769191ffb37ae4c76
[2] - https://github.com/bluez/bluez/commit/a98f3d5abf14eb6e3ddcbf73c22362020f26e105

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     | 2 --
 meta/recipes-connectivity/bluez5/bluez5_5.87.bb | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 8d2e1e8f42..6a98d769dd 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
 DEPENDS = "dbus glib-2.0"
-PROVIDES += "bluez-hcidump"
-RPROVIDES:${PN} += "bluez-hcidump"
 
 PACKAGECONFIG ??= "obex-profiles \
     readline \
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.87.bb b/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
index 75b765d524..687780de21 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
@@ -74,5 +74,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'client/btpclient/btpclient client/btpclient/btpclientctl', '', d)} \
 "
-- 
2.43.0


