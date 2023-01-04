Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F0C54EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9361.1672830356464596205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UvPDVDPu;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z16so16085482wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXZwBgF2eEQD+2gKvEuZnBkSYpsgJAik+z4lrsMymjw=;
        b=UvPDVDPuPfIIfGY2Ktl/tEs14RtFYR+dGTkckLA/OKnPKYyIVVFw9EBqWjQx1ZZkmz
         7tcLYbEHQKzSFDB3WRo5yuVHquqkYngiv7nnISU19xWHAtc8nWrs9SZHF36ftl6FsT8A
         lPWQCzmlnUK8QMC52h5fYWMoNDssy3eD9UrLpl2LTpwooVxAmRK5QvktrUpMIJyFfyGX
         5S67OR9UK6nJ+rZCqKxjClFl1NlSYUZFdGW8k6fAm4zkUMJOFtJdZfdQXpMDx1NFc4s9
         7XJPCEhlEADhP3NwTYPS4ZAKQ2WDr1wQpwDpMija/rKmUC+YkVb4iNCa1nDMLJCBWTDT
         2u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXZwBgF2eEQD+2gKvEuZnBkSYpsgJAik+z4lrsMymjw=;
        b=KaRZ/DVEnvPtQLlzDCOvGmhnK1PXMbx8FSAmhBo5dvM1EcwIZVKnC945IAJ41C7VnN
         pKuBmcu+HTBGfMf0ZOoAHP995MOqJkG7zjrpdu21HI2yb7m/GKWXEu2wx1y6guWs4K47
         gCxGksxS9lnTJOHyzQnOxtRO3iPXseyUToJ32bGyim2DYW72dLMd8G2edcTt6UNV0mlc
         5LTOotACT0v/QLhW2m6VPIqr+Old1Zu7HayeyJA9ozEJkYTHOP2saudUOzlOv53qEQOe
         /TtAl6IWaitVNSUIJF5FydFrWx1e1nug5elTGJSGj86LmdUuuKJ9jibpWNR9gkbvJbim
         56VA==
X-Gm-Message-State: AFqh2kovM5J9SNNjSH+Vg4CcN+WuKoE3MuIrFAq1/K/HabIsAaSqoQas
	cEldfq/avx9eua7V2QvquDiijZ4EMRI=
X-Google-Smtp-Source: AMrXdXv3JX/DMrjc9p4mVDrRHe+FL7X3Sq264CLP6Ju2xrxywUJEYllw91TWPGVEVxeUf0c3M2S2Vg==
X-Received: by 2002:a05:6000:16cb:b0:242:1b0d:9c58 with SMTP id h11-20020a05600016cb00b002421b0d9c58mr34839061wrf.69.1672830388362;
        Wed, 04 Jan 2023 03:06:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/77] python3-gitdb: upgrade 4.0.9 -> 4.0.10
Date: Wed,  4 Jan 2023 12:05:18 +0100
Message-Id: <20230104110548.2537259-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175432

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python-gitdb.inc                   | 2 +-
 .../python/{python3-gitdb_4.0.9.bb => python3-gitdb_4.0.10.bb}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-gitdb_4.0.9.bb => python3-gitdb_4.0.10.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 9482964f30..d92d6453d8 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,7 +8,7 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "bac2fd45c0a1c9cf619e63a90d62bdc63892ef92387424b855792a6cabe789aa"
+SRC_URI[sha256sum] = "6eb990b69df4e15bad899ea868dc46572c3f75339735663b81de79b06f17eb9a"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-gitdb_4.0.9.bb
rename to meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
-- 
2.30.2


