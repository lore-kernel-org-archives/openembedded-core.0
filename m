Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E21DC5AE5E
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.2315.1700120225488449150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2YwUpue;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9becde9ea7bso338698666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120224; x=1700725024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9caE3jNjaOTfuYjas3fcJw3o0ucBhjCa2SNkQ1r3B/k=;
        b=f2YwUpueLukR9vkkgGPYIvYeOzCcI3RlLWSYQXmPjqVioIvA/h8aVEknmeSnEQxWY/
         N3CulzjHlQtJOawQ2wYn8qxEXEkGtimo7JPT1iItkLeB5tvc3M/F09ulVTyEsiIyQ7cg
         qrc30hTYn0PVYA7Qf0IT5pW3nLwoHioykZKT9lGrD1hOl30h+WEzKQ/WWA6zG5KzHCsK
         U7bFqN+PtRAe0dzwESlb/uYvSrcv4I9JsYAkpc6d31Np1HRepTzJj9qgU8T5S+fQp8rc
         6pY9dohnaDPKEZfUw6yZ76yLhIoamctRmsEdyN7aaHSB5pfhAq3qFapuonb7pnDWpSiC
         hbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120224; x=1700725024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9caE3jNjaOTfuYjas3fcJw3o0ucBhjCa2SNkQ1r3B/k=;
        b=ZBAOq+tcOBP8MBqHH0tGQnrLIOnEHxuc0g9X57jp89bCWXbs9zn8/WjOyT9zEtmMiQ
         KFpaa7xUXE+86M8J574WgBDD+sNIgJsM8H0+QxAR2NY9IgNamlzPjk/WUZp9ZgzuNwge
         d3TwSzF6xvn4KVF+VilvN0bwPAfjmmEwPnVWXTmHUQQwhpC6oUCcvuKW5p10sT+W2H3X
         g40s0tn/u6QCR9kao2B7El51hffHqrikBw5TI4lmZmHlv52UMIvvF4MFd8aogHq2MYJI
         zjdOfohdj/3Hd2FlWf3GTkqaubHo02k+0aRqI0WytDnhTzZR+aK7nN9L41IZK1FmWPto
         WrBg==
X-Gm-Message-State: AOJu0YwkMK46IyjFlIhc3ekRNIG27Y/WViycM3kboZO3SUFYVjfKGb4l
	DysBXqbSwXKxbGfiXhJqX/YBYwnkqms=
X-Google-Smtp-Source: AGHT+IFijcmE7K2X+SKtq2llApLWDbna90lM4QTKxNNqSTN3I6Byak3EvjkW+cvjTeZKFK++jq9qLQ==
X-Received: by 2002:a17:907:7e94:b0:9f2:859f:713e with SMTP id qb20-20020a1709077e9400b009f2859f713emr996153ejc.3.1700120223995;
        Wed, 15 Nov 2023 23:37:03 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906669000b009dd7097ca22sm8038869ejo.194.2023.11.15.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:37:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 08/11] rust: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:47 +0100
Message-ID: <20231116073650.2710535-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190760

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/rust-common.bbclass    | 2 +-
 meta/recipes-devtools/rust/cargo_1.70.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 878272721c..cadbc7abb0 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -14,7 +14,7 @@ FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
 RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
-RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${PV}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
 RUST_PANIC_STRATEGY ?= "unwind"
diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-devtools/rust/cargo_1.70.0.bb
index a5c1064106..9a23ba9d5f 100644
--- a/meta/recipes-devtools/rust/cargo_1.70.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.70.0.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${PV}"
 
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
-- 
2.42.1


