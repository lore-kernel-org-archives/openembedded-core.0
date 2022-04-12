Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF381C4708A
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:39 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.5232.1649723961733503418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 17:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jP6OMHLW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id bg24so4370866pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 17:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hVUnVr4mUze6QXLyHzYwqg1CG8PtZIvTy+y7hYFtW4s=;
        b=jP6OMHLWhVzuwY5saJvPL3Wi7+s+ZCQQn8mF4FuzkSW1dSWqFIy0Q/mXqtDWZ7+hiM
         KwQN8q3nddnuRO3mqRJnnLAyVZEsXvRDfXlU+ZDWpAnVFnbl+/tPBjAr6JT+2wnIxPyu
         m8kidKJsyedX+XU/NherscAWYTJvMHhqYS+JnbJHHNoR0oWSsmiSyP0s+PfgJZK1XiaL
         OUtGEbWIcrxzhAp7K6JWgsYb2Znm5lyo/f9Qrc2FY9f/6lUq0WVujOWXGFh8TkUa6tdO
         foZ7jenYohLE8t6lAkRC+IhCjQzLiJymWoJmqZCHP/dEcUP4qpaiZmU4j64hehRMI/Ff
         y+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hVUnVr4mUze6QXLyHzYwqg1CG8PtZIvTy+y7hYFtW4s=;
        b=Nl7xsTbUtMq/Oj7s8Hq3wS1syOSx81396nr0n2XVRKtErlKPbjmBqx2qTxye58mOcE
         oiIrYYE4B/66SAub0bmFKXAdJW3a0z/QiSIcTrYhJx/3qI2A9w25A9iYo2qO/bx4ugnw
         90iD71JX6pw059kvFXCtWqJhzEBTHeqKCsAQ70hKk3gPCeM7IArZiAW/jjaCFkeQ1vyW
         EAQhl1GYTKjTi4sgNm5lSBrRyHLG0C6OxGNUdAYGcxDo8/S6vY4EtFkZ0sNt7zR0NAXh
         L1RB4LZmcqpcxUmU1dFmYhEUcNd3nnfLfNprcsxDCzlR7MCwfEBpPKJXZg5Odvd5n0Zj
         l4ww==
X-Gm-Message-State: AOAM533H5wDLP5+BV/fItP3CzAkZ0AxZQq5bfaqCYvF7i1/+GxiZbT+Y
	u+1BkIENxJQuREN1LtIURCpQyC2Z3DqBNw==
X-Google-Smtp-Source: 
 ABdhPJxXV71TWczuuA9iQQzGJFMREHbDjEnJUpJ7lz/cEqFKvxR9XC/RmM2kTU3PmGW2MVtGMfG99Q==
X-Received: by 2002:a17:902:f68e:b0:154:6518:69ba with SMTP id
 l14-20020a170902f68e00b00154651869bamr35313201plg.60.1649723961004;
        Mon, 11 Apr 2022 17:39:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j14-20020aa783ce000000b00505b64b82bdsm6190154pfn.10.2022.04.11.17.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 17:39:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] babeltrace: Disable warnings as errors
Date: Mon, 11 Apr 2022 17:39:15 -0700
Message-Id: <20220412003917.3593854-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164245

These settings are good for developers/maintainers but for distributions
generally disabling them turns out to be better especially when there is
a knob to do so. This fixes build with gcc-12 which find additional
warnings

    inlined from 'bt_ctf_object_set_parent' at ../../../git/src/ctf-writer/object.h:120:6,
    inlined from 'bt_ctf_trace_common_add_stream_class' at ../../../git/src/ctf-writer/trace.c:1243:3:
../../../git/src/ctf-writer/object.h:141:26: error: null pointer dereference [-Werror=null-dereference]
  141 |                 if (child->parent) {
      |                     ~~~~~^~~~~~~~
../../../git/src/ctf-writer/object.h:141:26: error: null pointer dereference [-Werror=null-dereference]
cc1: all warnings being treated as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index 248b84e98d3..b48f07ea0df 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest python3targetconfig
 
-EXTRA_OECONF = "--disable-debug-info"
+EXTRA_OECONF = "--disable-debug-info --disable-Werror"
 
 PACKAGECONFIG ??= "manpages"
 PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
-- 
2.35.1


