Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5C8E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:59:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16735.1736333945250712470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 02:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=frNov0yA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-386329da1d9so7796591f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736333943; x=1736938743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0gGtCyAypqg3glP8fCKex5UG0j1T9X4A7eh3dK1djg=;
        b=frNov0yAzQ/l9Z/v//129SZgKGB8Awde78P/mcWEDtQnUqrJo1hPjVyDhBF49TwE8z
         LaYcn+ylCVfI1fzK+XXfQ3bDr1bHmOqnJDiEHSIEZx92mTsXMxRrIxAhE68wM1kjyIOj
         Qwljxnx7c0QYkpP79rKpWUm0jkV9Dnqdu6BDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333943; x=1736938743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0gGtCyAypqg3glP8fCKex5UG0j1T9X4A7eh3dK1djg=;
        b=SFkBBVmOAmEHu0ypSRsYB9qjDRWQnNvc6upsP7+4DbyoAdf2B6QEGIVysSQguzIfvX
         bvGeBJj7eS5/31ko95mxEkgusvMuAM/Lq05ETRFw1QES/kKkBywTJpbfHDOr9gu5fkEH
         9dRjdxl1Fy/ADzQwwVXjeFTTT7Uv9P3iwkAeChldGu48wXNb1ilhdxyi3u57e5jr2Tfb
         VsptgK7K2WceX+jaFMJCwWn8fLXWCJTR9zpU9z30dyqaW0Bmh85IbexNdPULPx7NUvf7
         IIsN43k8KrgQ2AoLtvgAkvZW9D2VMznW2T1OBlX9/Ns5lg1bPBN955sKHvqDh/FDWFs1
         PCug==
X-Gm-Message-State: AOJu0YzSZXFG4B0odv/30/mx3jWg6L1zNEvcSFJfEUp53nO7wWw64iY3
	KTybi5BQxqOorLkBHF8AnQMjvw4Q+FAxFuWlCtLAJhetyzuXSIRhEjoTLvGEbmAForGA5DyDmWZ
	yFE0=
X-Gm-Gg: ASbGnctmhwJg+lB+UhNv4koaAZkERakKdWsZ85GaXigtDCYKfUw2z4+B+w72KTiSSVx
	skJguHKsTdrawwc4i5ZmdHTObH620dpA6f6QP+uYb9CVXwIFqyrLVYh3qkecKb4eRUMw4l+vN6S
	WPFhSG9HPRWMOqlkw5WT2PdcHHb58+MXgeuBz+wH0sSIKIK/SEoFkZP6geE7XaG87NybWuLt6At
	rZq4535925sm5HAlu4TZQz43PVawXDI/Be4SMNcQX6qscmDAXyTANcYKxDTHAuqsLl/4E+Futfl
	oencUJ0STw==
X-Google-Smtp-Source: AGHT+IEIbMjH3p1eJly77zmEDshAZLN0u4gHQyeL+P/oqe1EW9K32vmsWIDJeZ4XU9mNhpcBDgt2bg==
X-Received: by 2002:adf:b1dc:0:b0:38a:88bc:ace1 with SMTP id ffacd0b85a97d-38a88bcadc9mr922765f8f.34.1736333943244;
        Wed, 08 Jan 2025 02:59:03 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8288b8sm52186033f8f.11.2025.01.08.02.59.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 02:59:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] bitbake.conf: Add libstdc++-native to ASSUME_PROVIDED
Date: Wed,  8 Jan 2025 10:58:59 +0000
Message-ID: <20250108105859.3561400-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108105859.3561400-1-richard.purdie@linuxfoundation.org>
References: <20250108105859.3561400-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209550

Fixing native class extension code highlighted this was missing, we do assume
the system has a working libstdc++ compiler/runtime.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e3cf8a09582..6123bcd123d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -217,6 +217,7 @@ ASSUME_PROVIDED = "\
     hostperl-runtime-native \
     hostpython-runtime-native \
     libgcc-native \
+    libstdc++-native \
     patch-native \
     sed-native \
     tar-native \

