Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BBBCD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:56:31 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4289.1778667543219490968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cbkn33qi;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jackson.james9803@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-41576c5c01cso4075101fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778667542; x=1779272342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p47P85kYr0KzzI0mrrfx0/uDNgATM77C6l7gJRZ7P4k=;
        b=cbkn33qiqqeJYgK8GGTBw2v32urgW6VWfUIij7qfwawBSp4J63sfEYhKEwEM83xn8x
         XhHHbqz7ttYtxUQPA8JN8FoxBU18m4Iz3JQOObx+hKCIZdw7qXvZybHZYN2IivHX4f/P
         8AUCIqme16PeZ/s5UiKAt1rs/K664HkBLfTPMjJqKDEJGLP771ycwf/2EsptiVdn+tKG
         gFcbBJsdo1jYveQF79EWTpL7WUrYzXa4oEFjmgoyw1MLu0krOIIFYT3FMZINyWlW8MiZ
         QdpyRieyB4R+wTuvgTsO8wAt2bYE4FTgglgfOcIwRLCqj0emQaKLt4lWUilVCKk5/+I9
         G/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667542; x=1779272342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p47P85kYr0KzzI0mrrfx0/uDNgATM77C6l7gJRZ7P4k=;
        b=pMUea0CxId5n8AqXLeKG2a43a6zmVUxM8EP6+y0q2nMglIbvJwK2bB5RmiAIjmVo8b
         CAFRnc+po/2y33/dGDUTt2MgMfHle3NJHBJMMkJZfKMCdeKU+EGYNGo/Ra4BokZ7CK4z
         8w8nYL+y79NACYLKFh5twPFBMjjhO5moYoUrGc6ivlzKWxnLHiJb8XBt0yicvtCS9N45
         luEkadXLfKxvIXFiHyGnR4zhWy/Uf1fEZwg9InKKMiPuYPVn8ciRpKOVYoOFxRyOS2vY
         TzPgeGQKystDIIm/yo8H4flR4XaaRwll3CltNnnpsNCE2yFwNfsYWOK1n/Y3VX8LI+50
         pdug==
X-Gm-Message-State: AOJu0YxwdzOoEU9Es98hYAN8CCnECUCLySrWLyxdqTI6X+HXGnUC+pxF
	KXqEW2U5qHQGX0KvMIU/PITZ8KEZsmIVrieCIebxg5pnqIgp7Ndy7KFHzdLp8g==
X-Gm-Gg: Acq92OFSTaUC7UuAdhhHh7uov8ACZMTDkS+1actyzxaPDnNIDCqT+1I9QSyuHq3Gsdc
	2sjUevM4K/aqx9YBlhntQQTonuXIiTJNILYOQML35JRaaFlX54OzcBHmwvqVSp430qSlwMiExY9
	ldeFXKU6o36f5qJm0Ea1X7kcZTMwEortDTKBgHB/fUaxoIGdrwTAvQaSWMYm+ruxLIX4FsYVcv7
	gYWwmNEpYJO7FwUYDRMxW5NliHD//74zM/Oxv5Np1ZvCK1XiLW0g7T+807OaWRJKIYLoZ/YtEIf
	jNL5O7fh/Txa1KU9IB3LEw4+rVDMg3Zdjg9K1b9HptgEtsYZYLVv7YDKuLQ/qkQgyHgYe4WWMa3
	mGwkqIcPgIysuPLffb9t4tfbugJDcAX2uBdOrjH8AksdZyrxpmvFosK2aUdbfjDBw+0rt/do+Ge
	QB9akKPbDgwRYXqsGwR/4pQBZYJA==
X-Received: by 2002:a05:6a20:394e:b0:3a3:56db:919c with SMTP id adf61e73a8af0-3afad847097mr2546891637.14.1778667074684;
        Wed, 13 May 2026 03:11:14 -0700 (PDT)
Received: from LL-868L.kpit.com ([49.206.134.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767c6d7sm14676027a12.7.2026.05.13.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:11:14 -0700 (PDT)
From: Jackson James <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson James <jacksonj2@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH] cargo: set CVE_PRODUCT
Date: Wed, 13 May 2026 15:40:57 +0530
Message-Id: <20260513101057.285791-1-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236973

From: Peter Marko <peter.marko@siemens.com>

This removes mediawiki:cargo CVEs from CVE metrics.
* CVE-2026-39837, CVE-2026-39839, CVE-2026-39840, CVE-2026-39841

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5cb71e7df95925a5c342c341e699e244b1b84f6)
Signed-off-by: Jackson James <jacksonj2@kpit.com>
---
 meta/recipes-devtools/rust/cargo_1.94.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.94.1.bb b/meta/recipes-devtools/rust/cargo_1.94.1.bb
index fc41a19a25..c5eddb54d6 100644
--- a/meta/recipes-devtools/rust/cargo_1.94.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.94.1.bb
@@ -17,6 +17,8 @@ require rust-snapshot.inc
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
+CVE_PRODUCT = "rust-lang:cargo"
+
 inherit cargo pkgconfig
 
 DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
-- 
2.34.1


