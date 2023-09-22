Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19447CD4F2A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:52 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.16008.1695367490872770306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mibXcEpL;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bf3f59905so219122266b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367489; x=1695972289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJwMihLIzkYNOAuOtcXN9csO0fqiW09UWcFa/Y4vZdY=;
        b=mibXcEpLhtDp8tvBfhx3uJgznOAO9szYRoVMHgOwqQrDPbXMMGwvaAeMlsDrTUjQp5
         Oh4sMNNGjA0a9N3pvTYlVhH+0miD27o+JmzbW3qmGB/DdqibLnng2hJ066gMUZ+WiLsk
         4WGP6ccWpXvng+TVtPF+hCvEoywPOuf6/kpTnxdxkwQjbFSBf8FCWgJh6339IZ5WxeQM
         Yb79Gg9rD0YXL1Fqon2L9jQg4vTpBxFq9F+N2WFVGC1N9djzoEXqrUwarDsGjbd6puHN
         pspk90ldO2pv6xsqt02UH4XIlR7KsC/4vCiY/PDGStCcx6jGHj/+gY6LstcdY+pXDRUd
         FO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367489; x=1695972289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJwMihLIzkYNOAuOtcXN9csO0fqiW09UWcFa/Y4vZdY=;
        b=gddXk2Gv0b9YpVDEG5ISSB0F6f08d90hrD6/PqDtoELGpzpHxAuxuPu1rCOokSR4cC
         8/tlQ3WoMkID0f+rVaLDYm8iHwaUZSWYP5MA+TK7hFOlzwHTkQq/hJzGzQbggTG28X1i
         SFinkKEEXdP77iQBwE7oMhtn8rlhEZ2EzfuyYyqfE3GLy0LNnzXXEmoa5IoUh6Hxhhaz
         4iCbFaI4Dd1sr2jDT7NI00vPSOLx7/mCN6XyjtMGP7boB7Le+gCU9P4Iecbn1ST+iFy8
         65aYB+iEYYpyZ8OP72zwDV+L94K7MWFzc4E+Znloa/0/z+vB/BaeY7WTMzTLNMGLFF+c
         lquw==
X-Gm-Message-State: AOJu0Yx/HxPDE0a68BPT8dQwxuNOMjo5divpz4P4SJSP2EZDOrSc9mok
	lMPbaugdd9YpgvVF4fpEClXjOuMSGjQ=
X-Google-Smtp-Source: AGHT+IG1sRGX3CA7s7IpHEl/dxS0UrLUUFQDDjCevps5nrEdJVlMhw+jsg6UIvel0H1pQ6GBT60zRA==
X-Received: by 2002:a17:906:9c2:b0:9ae:4142:de7d with SMTP id r2-20020a17090609c200b009ae4142de7dmr7135134eje.18.1695367489296;
        Fri, 22 Sep 2023 00:24:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/40] libsolv: upgrade 0.7.24 -> 0.7.25
Date: Fri, 22 Sep 2023 09:24:14 +0200
Message-Id: <20230922072431.1481743-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188066

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsolv/{libsolv_0.7.24.bb => libsolv_0.7.25.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.24.bb => libsolv_0.7.25.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.24.bb b/meta/recipes-extended/libsolv/libsolv_0.7.25.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.24.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.25.bb
index 11825270147..69cb3f79967 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.25.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "4d05dca3974156faf2f025ca4a82b68904848307"
+SRCREV = "f1be8bf3dcc7dc14d331adbc97f337fa08e641c9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.30.2


