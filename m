Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA623CD37AF
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8233.1778224345014156295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dzk9Sv2x;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a74032ff8so1244005f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224343; x=1778829143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TEIKOBMVA1PgHAg1Csl9hdQ80hXNWXoMKH4/Kc/uuY=;
        b=dzk9Sv2x4TjJB1G5hBcK6DYPHZbqn4SzVA+BiqObTfV3kgXe+18jQ9fMmFR3ORvAlQ
         ZhjFWso+AsnYRESVAYIv9nXx/Ir14p8V6Kl6w5gMxk/90E+1dGL2FNIRMyNcn5ABwyJ5
         2ppxWfIxrLdwC75mbJYi7x2/1jj+RLPoHom3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224343; x=1778829143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4TEIKOBMVA1PgHAg1Csl9hdQ80hXNWXoMKH4/Kc/uuY=;
        b=HbS5AT4/68tFUAAPdq5rjC79xt9QXjx3+IZZ/9TpNkcD3lCez3PndOboFvFhR3upPD
         W6qbauNU2RKSqstBKr8rI0tG1fbmuwRCGS8Zh+v6i9accb06oeU8Zg4hcPga8N4MJTvk
         UDw774lk4GI7hrCFPZAjj2t93QhC95NnvzsrS9HKErI+CnrtQMeuK7s+qhgMcyxBaEbL
         I0gGAzvlqvceJCMK0zA1DRR1xovQWB9rLri01ky7z+QJXyzMvq7HmbzqhjoL9uSB7geA
         x9awCqqxSiJkCN4t/iRQuzgcWK93JQLgRlty3wI4M5eHJuSxjWKt57ZzuPHWVTkRASPP
         04Gw==
X-Gm-Message-State: AOJu0YyxtqpAxu7naH5ODGbl+ZTkLdPzglCs0aG/x8FZaD73/Cn9Kv/f
	ovdUdZVU78Wuh6CHBCgXh+zx9NpEReLsVqfTcW1KacCN/B/0DUNg0eLXQCyiT3PBY3X4ZKz6yQR
	3jQ2YG98=
X-Gm-Gg: Acq92OGAiVd9BtQYP2YmgVQbkLoPxcYXfFNShfvaxPCXzlHX+a99zHuq+Ztqx6t/rCt
	IiMKSkr/Uxu1G+eKqDs1ek50iGq+zKAzCvSnud9pc5IuEvfNNr5LnjEkldqIDYVSoopMVtcrXgx
	rxLbkLSrGaqF94jUaGhjYIASj8El4tL0PZ0678mxAG481p3z3J2riuz6ykB4OWujT8RjbzxhBaN
	qw6EYCG4hnj1dX+LYZV0W1MKPjfZ+qnlQk65xr0KUIl5gqpFQN3dgIC75PXlCzAeEF54GeOx6oY
	ueMQrWs06TPX99N5A0ks9guL82hq8l4GRagcTsNDKKNo5QS7ir3NBUC9Ony57TAJebZx0YlnoPd
	3Ra6ZwXKMDAWw1u88YUqJ2oa9aT2MyAqOaxnyYgObZWobcE7dvs1bEzZzQwJTkTABo5MTDHGU4W
	ixX8K4tytttn51+HclWx6rmfyHhH4/fvrf8YqDlqc/F7zHRXrdqVYItWkm+gwJAhIJaKLnVuRLX
	zIc4QkEvkE96LLiU1fB2+myokY=
X-Received: by 2002:a05:6000:18a5:b0:43d:1dfe:350a with SMTP id ffacd0b85a97d-4515ce1c991mr18331112f8f.22.1778224343087;
        Fri, 08 May 2026 00:12:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/52] sed: upgrade 4.9 -> 4.10
Date: Fri,  8 May 2026 09:11:11 +0200
Message-ID: <01b601952c95e7b1fababa25f4c7e275df85cd62.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236660

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-5958.

Release notes: [1]

License-Update: copyright years refreshed

[1] https://gitweb.git.savannah.gnu.org/gitweb/?p=sed.git;a=blob_plain;f=NEWS;hb=v4.10

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1089f9fcebf4bad3ce8907b2597d4a320af1458)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/sed/{sed_4.9.bb => sed_4.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sed/{sed_4.9.bb => sed_4.10.bb} (95%)

diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended/sed/sed_4.10.bb
similarity index 95%
rename from meta/recipes-extended/sed/sed_4.9.bb
rename to meta/recipes-extended/sed/sed_4.10.bb
index b30ddc73ca6..0966ce6a132 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/sed/"
 DESCRIPTION = "sed (stream editor) is a non-interactive command-line text editor."
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://sed/sed.h;beginline=1;endline=15;md5=4e8e0f77bc4c1c2c02c2b90d3d24c670 \
+                    file://sed/sed.h;beginline=1;endline=15;md5=3baf8c344ffa6281a98c30294ac62a6c \
                     "
 SECTION = "console/utils"
 
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181"
+SRC_URI[sha256sum] = "b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7"
 
 inherit autotools texinfo update-alternatives gettext ptest
 

