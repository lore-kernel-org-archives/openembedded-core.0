Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640F7CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:19:27 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.202792.1697534365672856635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 02:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jj9fZfcY;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507975d34e8so5510957e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697534363; x=1698139163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pryw/InTYGWWjPLdxdDfV3ddnzaZmqdH7Rz6CMDoes=;
        b=Jj9fZfcYD1LBTAUxXFyyBwDXhxoOziC+29tmUgAdae6k4Bq3twV2LO0jJmnkvPvVjY
         4MZUkQvU3yMchETfWDqVjrIt+DEdvnpz5BgcSPwPYJdxRLTRPw+8GBMCpSPHQkGMoSAC
         3ZHVGgYkpTqr0tsvPkKVh1eeOJU/ht+wq8ZAQgcgaz2xY1XYfzWunfjOj4ppdGq0WO1E
         hGasZ8iF6p3FaqQMrN6L21kRBPqiXy8qHpnmICGP7moqCJlCv8ZGsVmveJSpZJisIEPY
         baFUuzvCR0GLUcxP7OSP7LXtv1SqM/vWLDVIWQ0bDWDtyW9213UEsJtoa/oehwwZmKP0
         pYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534363; x=1698139163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pryw/InTYGWWjPLdxdDfV3ddnzaZmqdH7Rz6CMDoes=;
        b=TRFR+ytUdJmG9BXFB2iEGjsm1CSQDzldAEMHsN7KWjlOQr+vItwOZuW40oFYVIeHN/
         PR0Y9LhZJB0SK54fzePCqU5hx3Xb8L3Q42tMTpq+ePJrN6vLXOpvPfFCjVsDvwEGzwHb
         +E+9ReYIhW4k6cc6y25pwwQQAzUs5dzyc0Km5+zZY4NX9dM6GAcuiwIEGtD65qtygCFr
         /qwIOLRHAwOZzHLJbBAdnDkBJFg/xLKP78GE4wVR+B67Ga2WNxrOiwwsymPJHYaL4UYK
         rD8RUd2AC0IJ8Fdw4nVGaVSabz1nRcC/+PcbARsmdQmRgfBDZwPsb9q0omMdwfbvuqYW
         V91Q==
X-Gm-Message-State: AOJu0YxCNtulPlf7K31tSbsuuJ5PyWcv5nGMY/XAEsOmDJ8BpZZYicgc
	qwL0x5XCATH9AWAXWx1mY8N3gDeCZ0o=
X-Google-Smtp-Source: AGHT+IG+OnpFS3iupOMXYW03TI8gew2tZbufv5fAHdzDr+mxEskpXcWGvb5WHu8PJKlfGCDfjlauhw==
X-Received: by 2002:a05:6512:3ba3:b0:500:af69:5556 with SMTP id g35-20020a0565123ba300b00500af695556mr1769059lfv.29.1697534363224;
        Tue, 17 Oct 2023 02:19:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa75:9e00:42c2:7a32:9a48:d1d3])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d510f000000b0032008f99216sm1210422wrt.96.2023.10.17.02.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:19:22 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 4/4] systemd: add p11kit package config
Date: Tue, 17 Oct 2023 10:19:00 +0100
Message-ID: <20231017091900.114311-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017091900.114311-1-jose.quaresma@foundries.io>
References: <20231017091900.114311-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 09:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189321

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 578d3b463d..fc42787555 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -186,6 +186,7 @@ PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
+PACKAGECONFIG[p11kit] = "-Dp11kit=true,-Dp11kit=false,p11-kit"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 # If polkit is disabled and networkd+hostnamed are in use, enabling this option and
 # using dbus-broker will allow networkd to be authorized to change the
-- 
2.42.0


