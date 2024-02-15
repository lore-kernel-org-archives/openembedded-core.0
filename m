Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23992C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.17931.1708013898626828910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wke0NsHA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d72f71f222so8514995ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013898; x=1708618698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uVwpMArWSqMSvGcOn+nGVZ48Sog1wBAS9gkumxo/2o=;
        b=wke0NsHAKepoMEohsw5ddkiT1LtqEtRN+4GsKLC5AGnzGznQ+OZrVJgm1MAsN1AMR2
         GEa5Sb1SkqGcbCzI8lffTNdsl+prK8WAXRznXaFOOXxNJ+lx/v4OsVqA/ERSgt4KkXKM
         oCHpDtNHnFGfSZwF9uRtddSHpKjzlgLNMf9T5j2Wwq5jo8yUiARg3ifkIbGf99Mu36j4
         sNyZImMqp7VHZhH9qIqlKArNjqNBdLdma7oP1uxbTD60JYsfV7e15mIakw2qsSvBFEEI
         QOnyvmaPWOo+04sWycLowVwahxAOft4y5cFDGXPzmg4MXspU152JlKwlrdafu6+alSeI
         klAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013898; x=1708618698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uVwpMArWSqMSvGcOn+nGVZ48Sog1wBAS9gkumxo/2o=;
        b=viG3OsJV9Y/MI2QbuBca9tvinnohHdlXcGlxgSH699q7G2ufOrZzabGUlREZzX0pKB
         du8Bf4kNH5ahnXY1/a0LAUq/wxUj312SI4Ym4uA+AxwsbnEuZduQikbRBPuf6eaQStBX
         mDbDyGf1lxnPhBxp6lTyPDTzO0ttQEdgNJEiB+9M0TVqS/ShHjLe4z0Gfu7TjQuw2yGB
         pYErOfY3vvBOHfLks+r7X3KT7jM9E4AcOy7BI+QwEdenbi3TMOw+ONs4RtTxvA4nq+fA
         A94yN80K2bTnNuyXypvu5SbVlIAO5l6e9SoWElxvbUsM05se9WByo50VPp4U1YMW7UYR
         /DQg==
X-Gm-Message-State: AOJu0Yz0BqvSbYMDAnCEMcFpllkbvOxpCNk9SKvoEv9Smw6cSleOApYa
	gv6FipBOdomMVu9QszdMiWo3A7enbOkyL+tAEeaTRzsGRyDcg07OM5MDS6DdaohKeu/saeLFzXv
	l2l8=
X-Google-Smtp-Source: AGHT+IEkKFIlRFs5I93v+2djtxvGEJBwEvC5oZJi0Ueg3EDLs/iVkE0uD2imCtS5mOnbcYeqI9+KUg==
X-Received: by 2002:a17:902:6f10:b0:1db:9fa4:c770 with SMTP id w16-20020a1709026f1000b001db9fa4c770mr360023plk.34.1708013897902;
        Thu, 15 Feb 2024 08:18:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/21] zlib: ignore CVE-2023-6992
Date: Thu, 15 Feb 2024 06:17:46 -1000
Message-Id: <7523c7b3609220b4dfc2bb0a83c552db60e1dc7e.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195523

From: Peter Marko <peter.marko@siemens.com>

This CVE is for iCPE cloudflare:zlib.

Alternative to ignoring would be to limit CVE_PRODUCT, but
historic CVEs already have two - gnu:zlib and zlib:zlib.
So limiting it could miss future CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f953a1cd832f03f0b3666168addf45fd4fc8d14)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/zlib/zlib_1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.bb b/meta/recipes-core/zlib/zlib_1.3.bb
index 1ed18172fa..ede75f90bd 100644
--- a/meta/recipes-core/zlib/zlib_1.3.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.bb
@@ -47,3 +47,4 @@ do_install_ptest() {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-45853] = "not-applicable-config: we don't build minizip"
+CVE_STATUS[CVE-2023-6992] = "cpe-incorrect: this CVE is for cloudflare zlib"
-- 
2.34.1


