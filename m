Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA6CC46CC5
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.57789.1702626737885053183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jrX/SdiM;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55202565d48so299725a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626736; x=1703231536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhL+0RAvms/NgHEhgQK/OiODgrqPoi8Jt3EHABnuK6w=;
        b=jrX/SdiMod/xxgj16kMwE2tXAtSdyUISPMMvpADNRfnsVNOVtFxwnpViecY2Q/amW7
         rOXd6dUZ/5LJ46INJdEBKw118hVReG2SY59vM9z+dxKgXOA5bALAaspyV5PKv9Vy61Z3
         MN8kw8Z8TMf0byBemVJXxWHFbrsuvDtA8KQTx4fgB9ic0zhRZQuI9TCd3vEVV0RSAb/4
         Ezm91OD9fKz6Nzwi83DjFuV1WnPh5fK5ytRSmds5SDRl4BE9fQ/kPSS99UgHsAAU/IQg
         PY7JMEigNS8HDiR3gCOHpAOQos0fMLoE5cnTomKFN1Bx0gUz2uX8v/4HvQBW6eEVrNQs
         ye7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626736; x=1703231536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhL+0RAvms/NgHEhgQK/OiODgrqPoi8Jt3EHABnuK6w=;
        b=G3rG6llW3ZHN+SNFuSQLH5MXUzrNF8itAfbw0rwnFGzeDXrYKDluPS8v5jmGIzMRGi
         DS3L2hdioDbaOVP2Hx7Tlvjvk6HXtwJ99GQbALwhaJZn1tcEnV3uL3XzkI3OtMBmBJNO
         QBvsEoGmgGk77ctWCDr7SM9mQ12+77+dlzX5uWY14WB3chw3S9xCW+xu5bDjfxpFn9px
         a2LwEq6L/lRvyL0wPOHCuqp9HkHdbRv1pBuoj+Cdj6vKRlKgP5b+owEMs+hGAEq49Bxl
         OrKhQzhXL9Cf3WeKCnUhldyk3LuSHDSJhLuBepZOasFaBfIa06x32MXpOhp7rVnkemIZ
         2TXQ==
X-Gm-Message-State: AOJu0YzsRMQIrvFxNXSe/HkKy0pXF+m4WPMdwXeRgmBkVtRp8F6jGf+X
	917/T7ocSLMMM/Vzfx5IKVEhw5ETYCI=
X-Google-Smtp-Source: AGHT+IG3LUkBei/CGyCixfdadU0/C9eqYIC/KYOjIG+1z17KK1Z9aCSkmbHxxxJxpTX23x4lbJWamA==
X-Received: by 2002:a50:d6d1:0:b0:552:cce5:c583 with SMTP id l17-20020a50d6d1000000b00552cce5c583mr208455edj.17.1702626736367;
        Thu, 14 Dec 2023 23:52:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/10] gpgme: disable python support (until upstream fixes 3.12 compatibility)
Date: Fri, 15 Dec 2023 08:52:04 +0100
Message-Id: <20231215075210.3049785-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192416

The only consumer in oe-core was dnf, and latest dnf releases no longer
use it. There are no consumers in meta-oe.

gpgme's python support is generally a pain to support, and lags
behind upstream python versions. It was enabled in

commit fc6c81da79897c95a9c81960a1dee49517f2562a
Author: Mark Hatle <mark.hatle@windriver.com>
Date:   Tue Mar 7 12:54:33 2017 -0600

    gpgme: Fix issue building for the target

which wasn't prompted by any consumer requiring python,
but rather to correct build errors in absence of specific
configuration passed in.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/gpgme/gpgme_1.23.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.23.1.bb b/meta/recipes-support/gpgme/gpgme_1.23.1.bb
index e029b73a8f1..023cf894df2 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.1.bb
@@ -43,7 +43,7 @@ BINCONFIG = "${bindir}/gpgme-config"
 # support. Since these bindings are currently not needed, we can disable them.
 DEFAULT_LANGUAGES = ""
 DEFAULT_LANGUAGES:class-target = "cpp"
-LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
+LANGUAGES ?= "${DEFAULT_LANGUAGES}"
 
 PYTHON_INHERIT = "${@bb.utils.contains('LANGUAGES', 'python', 'setuptools3-base', '', d)}"
 
-- 
2.39.2


