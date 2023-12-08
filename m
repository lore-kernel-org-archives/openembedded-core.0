Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F9FC10F04
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.11152.1702002822206043392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DgllzLYh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d075392ff6so13257695ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002821; x=1702607621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrtOtSCdc4weOrQT9KKwaWGd3NG5ykmm2segnHjB+3U=;
        b=DgllzLYhk5LdG5RyOve6O4yruHQO3q4NOn+86nfn2ZL2q6wqFSNI5tS8pkTv1I3sw6
         /F1OVjQdYteQXf3NxujfvoIQmNxjNQJcF7cJ5fcQ9rDa7Ge01LEfQWz+1ffhqWRzuDDg
         GjEqy5pS5TKpZMBiW1cZ5uUKhsluejV2g7Wip+NM/XAnLNrx9Hk7ysJx4NncOLHm2nBT
         fswefDH8+BPozLPNECbRALJ/noSmV5FM2r6YUvTsol2PEqy0V1otPRDm3HnNqdBr7OSX
         E+1hOWHxrGYoEZeAEXI8/GWZO4fO1GsAZPoue8kEBspU9cxqzPgkk1GDy+Wysie2EIOa
         wsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002821; x=1702607621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrtOtSCdc4weOrQT9KKwaWGd3NG5ykmm2segnHjB+3U=;
        b=k+yY6G/vSbO3B58yvPCtHVUMWT2K43dEgp9k0Re64ZZzAAxSfuMpfEzZ428HW6pMdO
         jTddSng9UES4ykO2+DJZ6Ir1fVeLzJrCvcdsjuGrJQo5UyeObPnDbnKDD3cYq5xPqSjn
         RFRSllpmRMDoKVSl7EFYXNHmGTFmdqhNYVEzFyIZdUwtUzDarmjuXirn8DUUXmih0+nv
         gFG+P4cPNSzUjl6htHSPQqzBrQmxDOqR334KazS4Q7En/zQ1IC92N4uOjw6Qcdy/qZeh
         PIPMNpqHa0C6oluWC2z6kG4Fyzkv/Iis1jJfecdAT+FR6H1h4Wo9B6l4gtOjoh0XM0jJ
         1nxA==
X-Gm-Message-State: AOJu0Yy7MzBL2/T8zEikqdA7r9VnWG8Oivm4gA94thWq0V7BU9xS6sen
	QwgkqNO7ZhY0I+76tZfK/tv9noBUd/D9wJW9dLc=
X-Google-Smtp-Source: AGHT+IEC+EmGcA3H28RX63xJP8KzPCTT2IL4tie4hqY2x3w0WfjI+aZs5CY/cHcCjrMATYKMkohbkg==
X-Received: by 2002:a17:902:d48e:b0:1d0:8be8:bb6f with SMTP id c14-20020a170902d48e00b001d08be8bb6fmr236531plg.38.1702002820878;
        Thu, 07 Dec 2023 18:33:40 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] vim: upgrade 9.0.2068 -> 9.0.2130
Date: Thu,  7 Dec 2023 16:33:10 -1000
Message-Id: <7a6aab8b28b57bbaa4d4cf436a8cae18f1a43eba.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191996

From: Tim Orling <ticotimo@gmail.com>

https://github.com/vim/vim/compare/v9.0.2068...v9.0.2130

CVE: CVE-2023-48231
CVE: CVE-2023-48232
CVE: CVE-2023-48233
CVE: CVE-2023-48234
CVE: CVE-2023-48235
CVE: CVE-2023-48236
CVE: CVE-2023-48237

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5978d565a9e700485fc563dfe2e3c0045dd74b59)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a37310afd8..6b440d8947 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2068"
-SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
+PV .= ".2130"
+SRCREV = "075ad7047457debfeef13442c01e74088b461092"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


