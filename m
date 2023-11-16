Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E71C5AE4B
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.20271.1700174925450936948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYc3emrT;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso182436466b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174924; x=1700779724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itOiZvzC+BEAUzkPJmTwxBCthyy8wGQr/c/YXZINPuM=;
        b=mYc3emrTDZ9K/AopfHuIGE9HIEbMuTmODy9kUSP9kNcOBRuSTgOpF8MejcEuLvMySe
         d1RyBMgmtUF6Un4XuGMs3RlcubhPSlUE52VCBxE41PXaiXFhA2HaXQ3E9nNmpYAfJXzg
         /MYa+Y+0tJ3NKoltVKIrSj7FdTdTnb8EycpZtwcm4RXCZtzrIpCHq1mRyNO/08341uhk
         XSWe4dwO4A7n8uUYXtZ9X4a6cqcIVqaoihjgN89sgNI8D9GpptSIZQ2pn5SC4P+cm+uh
         wL3wgU4rfnr3hvSWcsmLt0CHHjvEhp3c5Mplox/jvInEB//YCJqIAcz0ccSMpaoYRD5X
         8ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174924; x=1700779724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itOiZvzC+BEAUzkPJmTwxBCthyy8wGQr/c/YXZINPuM=;
        b=a3LcDgXfxtrD4VMqtU1Fy2FjFGc/EUINHxPDF4e7/NwvuVmXvwGoR1QxovrNT8bAmz
         yn50sUBq7+jIbJGJigc6p0igvJzC2NfmTxkk8bBr33K2HErftf3GS2O3ZaQ+DWgQ7MeU
         Cw/XGeHT+CSePJfi9bGmGOv86JTblGDclpWoW0oBwK1sWs/ElHnqUFb3vf4+kRqrY8cx
         P3QRKNANLqocmolaO+SFi235P8flDCp9qunCYxg9foDjDl1thQV9BeoQv3QZgJ9l9coD
         0NYWnk1tKtedPDKSr3SrBnsuXwBvbIlxYKg1BJMTkEs+GwxBmqkQ0zA/sjM8PcU8+dWv
         df0g==
X-Gm-Message-State: AOJu0Yw1DtnBK1hpmfldgWA7AH5DIT9nJxVZU8+Om8mQkXR9QPgLM5zE
	UTYMO9WJkSXEMX63AFmX86Fv3wPTG/8=
X-Google-Smtp-Source: AGHT+IHVseITpHThx4k7RGztd8jYD+NKhengO6RvhPE9W7WuNcMX62JofwPZyj83jfinYU8m3V9syg==
X-Received: by 2002:a17:907:724c:b0:9e2:bbc4:16cb with SMTP id ds12-20020a170907724c00b009e2bbc416cbmr18318800ejc.49.1700174923928;
        Thu, 16 Nov 2023 14:48:43 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090666c500b009e603786444sm127760ejp.90.2023.11.16.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 04/12] acpica: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:28 +0100
Message-ID: <20231116224836.2696913-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190818

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/acpica/acpica_20230628.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index b7921516a2..8974bdc1f1 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -36,7 +36,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 INSTALLDIR=${bindir} \
                 INSTALLFLAGS= \
                 YACC=bison \
-                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+                YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
                 "
 
 do_install() {
-- 
2.42.1


