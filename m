Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96783C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 05:17:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.13076.1724217454212134124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 22:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEUC/4ot;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37196681d3bso3220786f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724217452; x=1724822252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OttHMWIhy/DTNqP8gkHJPRbn/W2U0CuTcRvnUBPGyng=;
        b=cEUC/4otYTMAKhC+Dyb5c0OkMCzP75LNR7kzat/qWS4CBbDnIilDUVxZzicaGXFXkl
         T9fCJohpz1JvhSY4Bs+fQ3WfGHdffj9olcW+58xbrUCAzFPR7Cai0B0AWJnY/Xsyz2DD
         IUtTL63/1svhhVq+oVI+MS/olMnmcfF8kuBJ6cdteH9pJ46k4cfXOsLK6r81eLnwcQfO
         kiIfQracIrXbIpOXL25TMwTu3vbypzQn+8tO9kNHfZgxgmUTmNy6Yzp3pk5ZANhDSbL8
         CEneYnm/DHpjVG39KvEyH7cklbrFfHHCLWTN5rTboAiXF5YfqhBxUDz8c+rmGJte5/KZ
         zBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724217452; x=1724822252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OttHMWIhy/DTNqP8gkHJPRbn/W2U0CuTcRvnUBPGyng=;
        b=b6gdynlvrvfvptpVNWtwErl1NJaZG0ZtcDvk49rNz3lFsWNOJ1Ec/kmrn/LP4jUdp0
         PD5NbojdupeE/NEmWVcyn8isO4YqaUuMYcM6ex4F+8Rs+vGOwb3LdR09QGzUJJBiUlcq
         9T6zZFyv3i0OBSLLR0T+96pRP+Fz7bYvGeVK7t/IMiVKccvOvdTCHaH8LgyQUacHobTI
         xduGfn5x0hZ+6e3u55Teyq/UtAKK03M5uHYzkMQCUaiopZ16I0Sc8zpkPVDMXUlKePlt
         nohtfnzNfkInWrh09XV41aSRbB+jqUAyE2wdr7AI74uSIhihCVBcZAvViOYjDdvPZPsY
         uKhg==
X-Gm-Message-State: AOJu0Yw8SgULeVq/oNUxGe88tYrqaRL8NBZusc0xVWN9yyPeWU3oauHU
	V/YpyO2Hzm/EgjaYSb+D8nbBLmq9GZLvhnUAJWd6ARQcNyR9BRxl3WFA5g==
X-Google-Smtp-Source: AGHT+IFjPWmmZQQrX0m7O4D6KAAn1GRdezxxxxzGNyUU7JnfU3EJzofNaeBn3UX2dFaOl8AfhDoc3A==
X-Received: by 2002:a05:6000:246:b0:371:8cb7:5d6b with SMTP id ffacd0b85a97d-372fd728d5cmr616562f8f.53.1724217451961;
        Tue, 20 Aug 2024 22:17:31 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:236f:cc10:27cd:4b60:cc7c:f092])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abefc627asm11638155e9.34.2024.08.20.22.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 22:17:31 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH] cve-check: disable the text format by default
Date: Wed, 21 Aug 2024 07:17:21 +0200
Message-ID: <20240821051721.70558-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203574

The cve-check JSON format has been present for a long time now,
and this is a moment to disable the TEXT output.

The JSON format is easier to parse by automatic tools, so users
should have migrated already.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0d7c8a5835..41f2b8304f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -61,7 +61,7 @@ CVE_CHECK_REPORT_PATCHED ??= "1"
 CVE_CHECK_SHOW_WARNINGS ??= "1"
 
 # Provide text output
-CVE_CHECK_FORMAT_TEXT ??= "1"
+CVE_CHECK_FORMAT_TEXT ??= "0"
 
 # Provide JSON output
 CVE_CHECK_FORMAT_JSON ??= "1"
-- 
2.43.0


