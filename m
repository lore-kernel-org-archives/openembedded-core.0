Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D64C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:40 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14785.1783866571028668166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=GMQ0KstH;
 spf=pass (domain: underview.tech, ip: 209.85.128.177, mailfrom: vince@underview.tech)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ea9f974ebso477077b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866570; x=1784471370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUNYA/hFmr53NcH0LlWOULNRRXKWmYCC1OPxJM2/ppw=;
        b=GMQ0KstHbO6K75CiSmnJlEtZDt4xn4VMWDFtpWWZh7VPpMqr7mHVsf9GBy4/bg/xiJ
         dFPqizuYulCi9AA49DyOUo+Zkj7FUj8aiuPJ1ZSiAEwFcOoZwWOlbbHsds+39iip4912
         jMRUTZfbbncOuHMVCulzWdPKaypxYstKDuVdXEpyZN8DKVPPjtTZ0s8mtUBqIkwWoubD
         2PA8qCr1GFiDouqtsC8EQB7lBIWUMLTGN9QTfd6hkSYB1gD0Hn8f2Fqwzd5VbjqqeMso
         tpO5H6ELVVoeOpX34eIRa5bvNHmPQHtlxlMviQvtyLfeu2JZiHj5uy3Ko3aMGHCq2oOX
         KzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866570; x=1784471370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUNYA/hFmr53NcH0LlWOULNRRXKWmYCC1OPxJM2/ppw=;
        b=smNXuQRi4ZhlxdxCKmAgSLwxp9kBUj7M0pm9M/vpCUD7Pde+FQBWhBtis7hQR3qe2u
         zGx2nMlDYDMd8TD4VTQ4gX2NoRvJ8SGwupJQkY21+aQP8lVQ5bbWnUa3te5ADATcadMJ
         OXnvVljYIDLm3DsZaMfvTwXCaD6xzFfb4LgBFTfbsQWLy2DyC0zomlTw9sgrJg8K5DMX
         tPr9ip0wNwwIYIsNBfHnqjYX2xSgSZwU2hWJlPJQupwCAuOB6GGanTdCENDJ4TOZ7CQK
         Bf3E6nCkERXbUZhTUre4iu1kLUoHJqe0Q3hW7TTfdCU1RKt2nl4C6BhGscNG96QQ1L+/
         c/FA==
X-Gm-Message-State: AOJu0Yz8HUTRhrCSSZF+EKxRnPBMcPcXQQh7S0UrgKvxlIHfYS7mn4J8
	aQ8PmLvIh/X7+6aVUoY4XqrZ40cEACPsByVPXexFlW7hiCgOLYUQV4eaCShwAVnSTvfA9OX3TZ+
	7fBQcyZ4=
X-Gm-Gg: AfdE7ckLDfalYRTel8U4EYQ+j/aQyum/BnWchs4J75dDdm6o5e65hHTCx+xnTNEAvJN
	hgF4J4U2WegVEcfYQn2gWrxHURnOPBe4bM/OQplhk1+acRYoqRMBtMCqeEpThGuyIXQYftHwAn/
	jqDnAxP3k1A90QqIeqVvI1I/mroZnSsRfRD+8QEFp6nqU4J6AfR4qIREf1cdF8kNSLj18xivgC5
	155KVCWktDp2fb22xt6kXNt2C+Pmxeok/mNpKH+kMan2AcuOcc9cyoALyrX6TKD0P4brk3hJHXT
	9IoUFsGDaSbbCM0InhpST4dmtXwzW7u/w3RgmJD+86tljw8eA/eXtXKhG86Z9kOaWB/lC/402UE
	USoLbmiO+C3yeKtBfNjnVx4kEht0TQ79GYWrw9Vzxj0C0EsjrOBDc+XSedCgg+gZgxz/dGEWmNm
	2gIwFUKfHy8kYcxw==
X-Received: by 2002:a05:690c:6a87:b0:80c:cad:c4e5 with SMTP id 00721157ae682-81e9009158bmr42906107b3.30.1783866570081;
        Sun, 12 Jul 2026 07:29:30 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:29 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 07/24] packagegroup-core-boot: rename kernel prefix
Date: Sun, 12 Jul 2026 10:28:59 -0400
Message-ID: <20260712142916.2573370-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240773

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 5cdd161811..96c07aff52 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} ${KERNEL_PACKAGE_NAME}", "", d)} \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
-- 
2.43.0


