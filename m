Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DCCC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.70630.1670929887012599922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VChliALK;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id co23so15230277wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zccH46/ZWEquLvGojTHCTa83m+HAG2VsK1vY6QXmfTs=;
        b=VChliALKdtkk/zTISuFrhxt12CURvGTqZ319Fhb7dKPrRdRiGp9nOG5nxuaYKN7Ga5
         k0PHYf4vBMDomOYVpKsRqIBMW9YBUDBoLX+8szbIPQ0RRIKE0zI4DEP8zVpbwMS5Ys3/
         WsL3wPsh//jOT08vPAvv/BHDsZe+bvwegL1rgF6hitxehhqsBUq/exlsvMpuXrX3R2fq
         P+RZQcd+MDIiiDDFDtSv/nk0FK/P1hxciUFb2IMD+47WmyCEUx1TCaQoOyTngmEGIvFQ
         jT5D9Anegr6p8Ultl5ZrXVd6Xv3h3foTXgBEA/TbcLef+8XZwQOYKrE25Q8KbGiktT/D
         MqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zccH46/ZWEquLvGojTHCTa83m+HAG2VsK1vY6QXmfTs=;
        b=HbRecR6fIW17oAv6hjqsJDp5BCyOfY5buK6dNuDzqmtaHCUuDHhZGh6cfS99jq0fTo
         DOBSLUvvlc3rvOFGz/YFhMJ/FhMhdxivKJCG0BKnXAXdyLZhRMayNFZma4HH1KrTRYkh
         s6zUlawm/eeuWskAevXh4eUCyZV6+RS+ShCiuZ51thk856IDbMrA4wLlFuOhc/Rxgg9m
         XR9zjCltFHMxUJmjdW+jUzdvfpr9yzjUbxgh8HZqSgXMp3KrJTNfIJXOnkgOzHFiqFFL
         qVnyn9haNRTjox8GpUtfe9JrdBHj82mRkZvY9EvrPQYENYf2uUe/qeY/MSk1pnveKK64
         iwag==
X-Gm-Message-State: ANoB5pnx5baLq6YbXNEL7UB27f0NRAbrfA3pqTp3j9FAHf33iYBQ9qmf
	RA/KGm5q53dThZ5k2d6X9qz+vRn6LAE=
X-Google-Smtp-Source: AA0mqf70FzCeC7BBDzvBpw5JwAyzt6MeD8usiSbXBmz7gGEqgdD0YJkFNMTLyJNs/6COfWKFjEeGOg==
X-Received: by 2002:a05:6000:1c2:b0:242:63e5:fdaa with SMTP id t2-20020a05600001c200b0024263e5fdaamr11229253wrx.62.1670929885558;
        Tue, 13 Dec 2022 03:11:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/24] python3-numpy: fix upstream version check
Date: Tue, 13 Dec 2022 12:10:59 +0100
Message-Id: <20221213111118.149697-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174515

Default regex is also considering numpy release candidates.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-numpy_1.23.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.4.bb b/meta/recipes-devtools/python/python3-numpy_1.23.4.bb
index d9172692b5..679a6f4081 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
 SRC_URI[sha256sum] = "ed2cc92af0efad20198638c69bb0fc2870a58dabfba6eb722c933b48556c686c"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS += "python3-cython-native"
 
-- 
2.30.2


