Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85520C4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:38 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9502.1783835497092963764
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=JCKkqsQo;
 spf=pass (domain: underview.tech, ip: 74.125.224.51, mailfrom: vince@underview.tech)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6611669cd16so3160222d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835496; x=1784440296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkjp/Ui3z0NDyXIH3nQu13Rw8g+SlquhdVP/pxEgEuI=;
        b=JCKkqsQozM6pST1g4FPM7R4+bWcI++zwG+J2FiNyjQvuTnSMW4turobYde9ELZR3JF
         ceXhmE7OB/0Fu5mFhb+w0c4otyuS1r8AZFYFlLGUuxbJQjY+VtNsI8E6NhxbnB5rGBl7
         UcIyjL/5r2nqRt1ZxDWRvy+Lt1lI+EHYP+zKdnFaOZ3Q7gsibk42dsKyvX+na80Gt7QB
         rmChUo0w9M9cJndazB25sAjrx31QjffWkj1EnnH/80r5+5F7OuTbCCy/ViMExwMZprSz
         qOQ+czfREcjJFG9TZLB7EnkBsZbaAIyUyYiI1lUOUw15ulb6UjkzeoyBC7m16j8NeEh+
         QSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835496; x=1784440296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkjp/Ui3z0NDyXIH3nQu13Rw8g+SlquhdVP/pxEgEuI=;
        b=aLdQLPt8uOPLr43+T9ocYy0iEs2Pri00Gh2Hv9vgD2Uk6zR1rH/tX0EUc+IWdau+Rm
         ga+Gc9STkaANCrVt2MgYTcpRqvod/43Es968hH/9mj5LweBQmOlMQtzuEWvGXEf9QxjT
         ofEQbhbnK85j2ozO45uPfYRJQjT+6/QFdXl9H4Ye/WAllOG0pXhxXuN7aMMi4MlsqDEw
         Zfo0hR084BSgRPhGI9N+FQ6xPU+VhftU+xXFQuM84eOINTLISWcaLZ9fwPkDhjaVjzPt
         bzw+jbUSuxD4jH1rTRRuj9QuBvExnm1xNFJVUWkDyiEpzf65ZTrttAG9L1sQ/KBJ4b7R
         8xUA==
X-Gm-Message-State: AOJu0YyYNyeLSOsbdGKUDQW3ZxlEPx6t5oDNfevS2pRbcMx46XHL9QYo
	EBkdWvn/W+aZZgpnSCoFNZAL+a1Vd2QrwcvPyYS3mqg2rL6y71n6Bb2ygvRT9ME5jgxJMLihPJa
	AIpswbdE=
X-Gm-Gg: AfdE7ckNk7kHlxLvTjjR8ofqDTyA1RobTxurXQa2kpc1d/cpLqHFcKkFXmoGhZtgd3L
	WUPIN6ch8ped0n8AetDaHjtEELv/X9HlGpPAt6Op6QnvmTFl5JZhk1zc6+vNNGn2AUxlscSGw8V
	OqIImz17yjlWF6yDQL82V8ittYKibsYwKH9LcqlbBJSUvui0sqMKymn1DKN+yASxi3t7q3DfBg/
	sBJ/7KkkSRL4jkl1x9+bvVqhDndYa9b4gLUFBmQXZXqNcbUU5QsPEMkSf/DB1cciJrdBs0lavdI
	G+AzzzFclnTkQB+MavZiztQ9wPuKIraidYNS2F/Pzk/6tgIIYxHL21KB0BF8fznDXH7mVFgsPWg
	cb6I2tL5Zz0aPLZJlt7SYsKbRGmBE/+J/Pblvf/VBSNkvgdCzUsxPrtpJ3l0p9VfDbq3JyrJ3zR
	pwBkY5RP6eLKL53A==
X-Received: by 2002:a53:c05a:0:10b0:665:2296:2163 with SMTP id 956f58d0204a3-667d7bde585mr2800921d50.67.1783835496163;
        Sat, 11 Jul 2026 22:51:36 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:35 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 09/26] ofono: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:37 -0400
Message-ID: <20260712054954.4063745-9-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240734

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/ofono/ofono_2.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes-connectivity/ofono/ofono_2.19.bb
index 74fa70f609..defbe5fbe8 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -44,4 +44,4 @@ RDEPENDS:${PN}-tests = "\
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)} \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-tun mobile-broadband-provider-info"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-tun mobile-broadband-provider-info"
-- 
2.43.0


