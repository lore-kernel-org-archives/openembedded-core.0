Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66D8CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8245.1778224361033415782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JXlFaS8j;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a044cb827so1304587f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224359; x=1778829159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvXiSDSQiPQIisnO6U0jndVhKJ1Ylm7Tdnjoxc7g02k=;
        b=JXlFaS8juK+/71QZv8CSAqCKKOyjKrUzJwks0F7PinEKmcV7BdT1J4ebYkD85HBhZp
         R7l0m9O7huFDt+wkYB2x6Rkv0dwgOMchlv2xi/CI/NxY6nZCI4bk6ffCQP7aPfM1qOqS
         6cIX7FiaeGelVDuPhANxFA3Qp6RzVEI6erigk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224359; x=1778829159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FvXiSDSQiPQIisnO6U0jndVhKJ1Ylm7Tdnjoxc7g02k=;
        b=Ebzo+eDjpJldAbuvlR4RaPmfVr5b4icAzDs0fNqX2yjGx5uBtnuSOpJy2s7zl6BiRr
         ++N9hB637Wnu02mZXmJGA+ilZxsIASe0GNMTUVmr5kS6aF1SnH9jsV7L+Zw7qCT5HGr1
         8B2lirk24PcAMOXBqUaKpplDlKLMihSKPJUIOoRKFGWJvGpWxG6OmPTlPYJtwsMGsD87
         p+qTXgFeP7Byp2Ox1AOhHETccN3wwgVRIHDm9VRz25SKukmdbOESPiYesxYXkUsjZPgS
         Z93fW+or9kEBocByNZJ7/qk3XUS8xExPNFWbH8d20NYknNAgxllykctCMbjbPAmMu5jS
         vhSw==
X-Gm-Message-State: AOJu0YynixuWg6PPNl3yULx651EVviNgifHG92q3ZYnMBZYizer506Sr
	jAILqE3sG0SuaH/ZsmI/c9+7xOQNsdvxleio6vYBh2e8spZXyI6+0JRu0OVMwkBTnx5WPtH4M2G
	25ZWDPT4=
X-Gm-Gg: Acq92OEEksp68rInyO90/lVTLKazkYxkxAXDekFMCTupFkA5HWzcthlATBJ7S1ZGVqA
	pG7pXtX/8UIQUfDbAwS9BL/dV5LXXYkuj026Zyo+j9cUV+O3QlBONiygtazYR7Mwpsqx9KMBMeq
	WneReSJsHj4Fz5kf1x28UpfU8edzHSa5N2g6k8hYnOS+YIhFODH/e0joqxXm/bKjB6cf7aaadyO
	2eUBhtwzt32/7BudUL89gMyU0IYu08Jt2svuRKLmpvy8wSvfEkqsUrPN7/w4VMSB0it16Rbfr+z
	N0SyBrHlPLcb7z4So/AuHCUQYwwyV4Fint4Anu3+d1gyUEgnAihFW4eZ0XIqbl8E//1HoohFPu2
	EUCy/5GCYC0kPMm66iSMEFvVUuJSJziMC7gkF/V2i/5xx1zC+t8ZGUMpxHT8QIJb/KBj+nCLvJB
	uDVMKLftoD9GKVOzBs87FND5J8xCISplPU1bzH0xCyBgFOg8GaDoX0k5nrDTfGewsWycCeoyRQu
	WSbzVUc3hsEgww7fsmaCPzxKEs=
X-Received: by 2002:a5d:5d08:0:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-4515d3dc4d5mr18135636f8f.29.1778224358857;
        Fri, 08 May 2026 00:12:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/52] python3-cryptography: remove obsolete explicit debug packaging
Date: Fri,  8 May 2026 09:11:31 +0200
Message-ID: <ceb7423fedc4705ef3b576c43f5fa0659524027f.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236680

From: Ross Burton <ross.burton@arm.com>

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c7c51f917cc72563c833f8e242eb34ad7baf1dc)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index fc5cb50b029..9387dd725a8 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -69,8 +69,4 @@ do_install_ptest() {
     cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
 }
 
-FILES:${PN}-dbg += " \
-    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
-"
-
 BBCLASSEXTEND = "native nativesdk"

