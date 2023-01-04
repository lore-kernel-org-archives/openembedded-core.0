Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB4AC63705
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9361.1672830356464596205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPG4mB8T;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z16so16086358wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+50VMDTVLqAP3cTSpVkS1OVOQvZDOk5LVqt2W7my0to=;
        b=QPG4mB8T6/cAc/1EgzjUQMwuUhG4kjhSr+146Q1CQ6JpD7RuBSEGGaDgmAJl78N03x
         q8uTO0eedNWQr/M8hb0Vj0cN2X3MxPzuWogHHP0Ttj8EoIstkuws2z7lB3cUMmAJ3+CH
         8EcXBXULMqF2/ihOUsdWHInxplHgMkRz8ZbUPM/ref+PmAt1QwATplFRssKg1Hq3xUdb
         DfAQ+rmkJQ8g/W+YNdgMCk1gU9u566Hj3sw+vqTJF8y24VY4xL31CgHmYLUsoHF9iZ1a
         wB9StjSbTJdEipk+8uZuV/4YATOOW0ijLY2a7ZQriCK39ZGa5F2e+g+MmfT6T0fM5/iV
         Pe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+50VMDTVLqAP3cTSpVkS1OVOQvZDOk5LVqt2W7my0to=;
        b=bbNn60Q22pke0ZvTg7BxCTFQEUL4AELdABrtoZfwPUs4luj67t7zU26vVnnuE/vLhj
         rMgjp+fNgEzOrW/+73N0xxihvKD4x/kZ1HIngIevR4tx6gpjbgOR3Nsn1SF080uy+89g
         uPTy1f4vbFoAQ2OhVTSYkOUejMoPE1mgbnV90Pg/G4vivlJMoC1iJdNPzCNbh9Ureeus
         CDwoFgG0/hd+mRrvykuh5cO9sruFfGJCWoLSkn57nBSPZNvZot8UWPYe59bh9K9sCZ+v
         mSOvOSC0rt2SamxvXgvnythPgnpOBWwBW944ZAL8LvdL3/c3b8WQJAEoRhvel1dyZPdU
         UtIA==
X-Gm-Message-State: AFqh2kpBb7BxqgiEEPJvo9RsXXkXgxH68x7eHuYgak5SLlmZ78wdLZxJ
	bly2DBayLlicBYBM5gvioXvwokniBuo=
X-Google-Smtp-Source: AMrXdXu39e3b6H5Sv28OE0PTb/TOxPNSaugNtILgyGfMyKtRDBWLRgrJtX9emOGj212wwJQeIeW1UA==
X-Received: by 2002:a5d:6509:0:b0:27c:73d7:775d with SMTP id x9-20020a5d6509000000b0027c73d7775dmr23128688wru.60.1672830411227;
        Wed, 04 Jan 2023 03:06:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 77/77] ncruses: restore version check as it's now again working due to release of 6.4
Date: Wed,  4 Jan 2023 12:05:48 +0100
Message-Id: <20230104110548.2537259-77-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175462

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ncurses/ncurses_6.3+20220423.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index ca5fa32572..fb8c11582b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -10,7 +10,6 @@ SRCREV = "20db1fb41ec91cd8a1f528e770362092c5403378"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 # This is needed when using patchlevel versions like 6.1+20181013
 CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.30.2


