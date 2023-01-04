Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73B3C63707
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9380.1672830371928987685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nFsHMaSR;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id co23so32594790wrb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHmMtL8MIcgyZ82PnbBkjSIsMU2zsQQlLSMJGqbkqA4=;
        b=nFsHMaSRP4eYRUD++6/yjDRkI+0BgxqYlP/9kkk6yqI7QoHvdu/g3b+H5zk6iB/a8K
         mG/b84o4I5l6vBUsrNjlQqyylNbebPDnexVEgRhAjzWcTPhe5iPUVScSupsjMSB3GJxB
         ihC+FuFrYkBYmIgS0TEIc3q0ZvF5bpWaVdglxpLuhKEKn8oDQ0KK9ni7YaDX4IpmI+FG
         8e3gwZ19nnqrPz1hEZmJ+0+TMBl7l7PvLJx3x5cU0Q+JuHDWeN1bFbfClpZQE3ern9ZE
         Osf9QChnwaeV6io6y8w2px7ZC8DChW6czq23E+v3EtaOIZrjZIZIi3O/pug6m2dMkZr2
         iJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHmMtL8MIcgyZ82PnbBkjSIsMU2zsQQlLSMJGqbkqA4=;
        b=a7G9clrHA/JR7sRgIrTyPpllJSZym/ANqK8LIimwFCTDreFVOvmDV0MSUF1T65JJLB
         yQYAnZderGiqusHu4ap6h9j7AGs58yPeVZqkBGSnmr+k2i7pV1sbDyjpVXhtv5QCHgm0
         UgkEhpQHV169IVgPz0EY7Il5xc/5ZGbw6JowBbxCBsFD7UXXoG7wjoxeik2xkUC3lAwQ
         iQTrwFeQZTnplUCmh4S2+DBkAWUz52p4pwqkXJ5zWTyZ5hZwObXhyTlD6WtxKKwGnFNP
         kRMN9g4sPZUWZpV/T5M/mZLJaq7nyEt88QRDjRdwrIMH3RhSjv57dA8nlZBGDFCRk/XI
         11XQ==
X-Gm-Message-State: AFqh2kqAG5DYZc24MmzqCRBpaw/FdMRNs630ncpqkXH5urdnYju63YOP
	Lc0l1fshY4LswBr1ZD9ac9rnhcNo30s=
X-Google-Smtp-Source: AMrXdXsHAbbUKe0HMJ7Fvt9Hvd6P0gD03UeoK+un/fzE/ieAOCjNNIfojfOwPtuh4sfiAue1oYa/lw==
X-Received: by 2002:adf:e6ce:0:b0:293:1089:d6a with SMTP id y14-20020adfe6ce000000b0029310890d6amr9555848wrm.39.1672830374450;
        Wed, 04 Jan 2023 03:06:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/77] file: upgrade 5.43 -> 5.44
Date: Wed,  4 Jan 2023 12:04:59 +0100
Message-Id: <20230104110548.2537259-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175413

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/file/{file_5.43.bb => file_5.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.43.bb => file_5.44.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.43.bb b/meta/recipes-devtools/file/file_5.44.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.43.bb
rename to meta/recipes-devtools/file/file_5.44.bb
index 102d0fda26..b3d821518a 100644
--- a/meta/recipes-devtools/file/file_5.43.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
-SRCREV = "011778a2877f75597ed83c1a2716d917770920ee"
+SRCREV = "b92eed41b1bc0739c5c5d70c444e0c574429321b"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.30.2


