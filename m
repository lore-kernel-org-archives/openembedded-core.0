Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170CCC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:25 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.46449.1638092784013903540
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NAQZM35T;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id l7so28390246lja.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I+9w/W6GfoKUDeAH/coV34gPt3EeM++6QqAI8gsvBmk=;
        b=NAQZM35TsfY98u9niOfBoYeGE+DykSa+v+P8F2xWHHWvYt5QNNucB3hVaVHEdbCvvU
         +ncRzRJ9lPV0HulKFOTPTPPnvVW5+JuDjmZAJhaOC8TNBjaRFLa7CPpWLkHPiTnL9czc
         hKeioGssDaOa6NrKTbESnUR7WXv1AXWA3MPwSj2NW1lMB1k9JGqtMrLLnNXEiZOZ3wHg
         FKacDXgCKBKO4LvOOZApRhnPEglm708aSZXLB1FSA1M2HdasnZzyFFyo3dWxmTL76LdN
         ocCMyuzwE8ASVIKYLDVQJDC/u5xoH/mkCDzYpub5vWHA3ZInJQ4Ts88ydMUDX5UctJyJ
         E5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+9w/W6GfoKUDeAH/coV34gPt3EeM++6QqAI8gsvBmk=;
        b=GsU6cymAiDPyDIEV6xf/wCabycChNvlGNYVQ4NkCfAz7/zGm7756Fgj2XrwQLSPu27
         1gMRfv9RmPXfl3hHc3e0dDiVmW0O7ZnExBc9xFPHPaQKqSAoWJnNin4cOZekRgLoiaEn
         GPTg/VMkAXn8g/pkBOQLVEPBVNP0a9yN58+bghV0XJQrBxEEtuI9L3+D3lpKRKXsF7U1
         qAiyljBV5NWf1L79rQuRw19M0SgiNlS+0+7oyPdzEGDbrKb2itrZIK+tfysikbtXfazv
         46Ff5Rb6VDyVPIwtid9mbkwuz38rmHfFk8cHknqMeP2GMO5dss5JHZwgq+JyXbC0W0DB
         yXNQ==
X-Gm-Message-State: AOAM532WpSGkqJai00AunAGzPZ5luCIq83yrUs4L4gfkyeUgZDKGSAHy
	pgn9hEfjoB5h55YkulukmUmYlIdfO4mo/A==
X-Google-Smtp-Source: 
 ABdhPJy+PBI4nisBhcCcCu90szQIfhrMwuwaBOp6/YYEz4rN7slC4+QtOi9brlsZD+CDgJjG+o9UYQ==
X-Received: by 2002:a2e:3918:: with SMTP id g24mr34117707lja.48.1638092782396;
        Sun, 28 Nov 2021 01:46:22 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:22 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 6/9] ncurses: Improve native reproducibility
Date: Sun, 28 Nov 2021 10:45:29 +0100
Message-Id: <20211128094532.1145820-7-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158873

Avoid encoding build-specific paths in the resulting binaries.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a0ecd8a80b..3c15498dd4 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -91,10 +91,14 @@ ncurses_configure() {
 	        --with-manpage-format=normal \
 	        --without-manpage-renames \
 	        --disable-stripping \
+	        ${EXTRA_CLASS_FLAGS} \
 	        "$@" || return 1
 	cd ..
 }
 
+EXTRA_CLASS_FLAGS = ""
+EXTRA_CLASS_FLAGS:class-native = "--datadir=/non/existent --with-terminfo-dirs=/non/existent"
+
 # Override the function from the autotools class; ncurses requires a
 # patched autoconf213 to generate the configure script. This autoconf
 # is not available so that the shipped script will be used.

