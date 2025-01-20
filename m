Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD793C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.35798.1737377273547285471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwWIvQH6;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso5051660e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377271; x=1737982071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGu4ucmyWPGfXRzbhvD9k9ipOAIM2q4CXLJIiUoqCGs=;
        b=cwWIvQH6zGPaIaGZUEVcl8coK08ihAJuXOM74MfL9L5frr5Q1L1OraGguSoGv1oZBm
         /RMpbwh8PIFdDZEjSZH6FSlCBPm95h1sQHlM0N9Zsh7hHKh5ofWAjLw4ZICOPw4bgtR9
         pmwPC11cwOer4QHOk64I7euWou+tvrLujoa6y/G31y0fWL3k/ccTTcZuWQlgYTrKRFeY
         LJRHLA+1OHjKO9/5bJtGy90tE6d/v8x1pNN6fnJC0B3J501hN4u1dLd6m+UokMSn1Zt9
         MmrrrqJGeT6FMzx+9ygUAxdjqsbO9qRTbl8HOOpjLt/ClrlMdocN/wwFAUgmTrTrXUXc
         y05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377271; x=1737982071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGu4ucmyWPGfXRzbhvD9k9ipOAIM2q4CXLJIiUoqCGs=;
        b=viGwJinu//61mtgZ37nJXi+BqdBnxt3GOF/7+bFdh2MrKottXAbGU9tDP3pPz4TGDA
         2ttXgzPG8zfxrpEvabYrNR4Mo2TK8Piun9HUEBmwMhAJw98S+GVI760ywDQPA9dfHKVi
         8hAk5DFP7y7tIHTAuHs3q5mN6PPC9JMwMUr5DMi56VTyl2NhWXhNjN9u5MVWd3Z6APL/
         1EtugFm5082Fbn0pgrG6fJ/fflYRkyGbrqDy2wODCBbUO+SxtZklDiBPvAijNuZQ1Nal
         zRY0FkngPT9cV6NpbMOzof2pXzxoKbLKDCqvGCQbVy14/nhtMf0lqTdeKmZb26P6P1Ph
         J9cg==
X-Gm-Message-State: AOJu0Yw11nJp2IMVbwJ7qgv3sdnenZGZnH7k/eigx6I7HvRCA9js2VIL
	jR0IMkkNge2Lfs6pzuLUQoDKo/+bf8ZPWxaUeLkId4KwWagdWlhzvK8ZOw==
X-Gm-Gg: ASbGncvrk6du4HsVGogdscMqdR2HRkCWt0/UCC2H7ck+Ye6rGngk6HVmwpfHighEIn7
	wAbOjgTYk96bAzdkrZMkGyGjCTHhqlMMRjUBPfCEXV4Q12qjcv7GVnEpuPxRqlEv3Z178K4Gm8p
	ruQ9CHyHgVM5RyW04N0sShKDESnxwhZztu41ouzvlLLTBVOqqKrCeZeqIv7wnWkIRhGTSwJeX5/
	Ud8JnTwIIIObOt0LTErOUnEcskMzdouC4SeheFq5uck3TmN/n/OBTNYs4sWjJbMKA9W3S2UQQxu
	rQ==
X-Google-Smtp-Source: AGHT+IHaqrqCGAen6w3brLKcKNrb9/BMqqSLcTwIVJJ7IOlCUFMLB0ecCVTvzMhDkbHo17H+D46zcw==
X-Received: by 2002:ac2:4e0d:0:b0:540:20c5:f847 with SMTP id 2adb3069b0e04-5439bfb75afmr4896216e87.22.1737377271079;
        Mon, 20 Jan 2025 04:47:51 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:50 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 2/8] systemd.bbclass: add ${sysconfdir}/systemd/user to search path
Date: Mon, 20 Jan 2025 13:46:00 +0100
Message-ID: <20250120124605.263817-4-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210033

We already search for system units ${sysconfdir}/systemd/system but we
don't search for user units in corresponding directory under ${sysconfdir}.
Keep the behaviour consistent so that both unit types are searched in
${systemd_{system,user}_unitdir} and ${sysconfdir}/systemd/{system,user}.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 4b4470b7b3..c167689d2a 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -147,7 +147,10 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
+        searchpaths = [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+        ]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
         searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
-- 
2.47.1


