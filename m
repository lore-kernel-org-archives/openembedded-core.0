Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416F4C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:03:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.12261.1641927784055622631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ke6BLvBJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id oa15so494809pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rAEyaYHKtfC1kWgNp7cCedmumNM6juyd9tHajobTiHI=;
        b=Ke6BLvBJYc/QJspDaYf+TYMGGcOECkVj0xAuJ3ZY0amOREL2jcpFV90DL8jZBUWYuq
         E1FUuttCGfIHp5KCJEpP2s63utz8uNlmx2kU8diOZMpTE6qCynbwUwPASeOFiAfGb2KW
         Xs9jOvxhZ9CD672JWjJGxzTwVmsfchZQ6VstHmM2FT+Fa5Eenmb4e/+bhRUStJUABzdY
         ppbztctzGqq9yw0xrm7XtSPPGh1HawF6YS2ziMsR75yKfrSGbM7X+AOAULaSa7/GrlDI
         udB3RLhxLAXNquk/QlsRLGCKg8Vf04UElp4AoRNvntFcM/yZa6HYkA5ccqHhbpJ6HClp
         8OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rAEyaYHKtfC1kWgNp7cCedmumNM6juyd9tHajobTiHI=;
        b=2e4g38gzb0T+wuw2gQM6IU0FrFN/ph8GsIymqAzbfcgl8AAC9lS3UTE1DIzoNTGsoO
         29pj9MnCol4n1dpVWaAqdz1w/ODviM2/DDFifpa301F6yyCmmmPWf5vr/Ik7iNbtwaE7
         1V5rCQPKKppWqygvlLpN3zcGDaRowmnwS5nFYgt987a5E2GwcjX07k0C7LO1lT8EFcOJ
         TXHtRJBjeJt3AnOnTM/2jl5U0H26H5r9cQCtnFm/Lo94CIcG8CuXlHK05V5euzfelCuP
         JX4C/21VqAYxfFLqXAL9yfgvaCdTa5fgByn1qHoRot/gz0EfSz54U9ySfjoJ7rmgm1gf
         60kw==
X-Gm-Message-State: AOAM533pNR+Uq+v1gGxHYS9VaV4LdmKprC7YFXMd880JAAzvD2aiN4+7
	dGNRGPioH1qXCq1JX81g5plF/44R3G0=
X-Google-Smtp-Source: 
 ABdhPJyTvnaWEbRX2stOPYmiEgy7ZoNyY17m6LVQGT7Hn5mBM9Z1qCtqpiwWK+jc9v9De3+gpKsN/w==
X-Received: by 2002:a05:6a00:1c76:b0:4bb:ffdc:6434 with SMTP id
 s54-20020a056a001c7600b004bbffdc6434mr5876518pfw.70.1641927783367;
        Tue, 11 Jan 2022 11:03:03 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.03.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:03:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 20/22] dnf: drop python3-distutils dependency
Date: Tue, 11 Jan 2022 11:01:29 -0800
Message-Id: 
 <593d4f09c5fff4562cae9114037c878de8e77477.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:03:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160456

Upstream dropped the now deprecated distutils:
18995d65 Remove distutils which are deprecated in python3.10 (RhBug:1950229)

Usage was replaced with sysconfig, which is in python3-core

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/dnf/dnf_4.10.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index 6ff2a6b1e6f..3fc24b132df 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -38,7 +38,6 @@ RDEPENDS:${PN} += " \
   python3-netclient \
   python3-email \
   python3-threading \
-  python3-distutils \
   python3-logging \
   python3-fcntl \
   librepo \
-- 
2.30.2


