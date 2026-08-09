Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2744BC5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:27:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19091.1786318054273799691
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hjypsiS7;
 spf=pass (domain: konsulko.com, ip: 209.85.214.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso14302505ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786318054; x=1786922854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VY4usRICaxhXCeQhmdvYOfZpDLIP6WMeSO8y2fav6mo=;
        b=hjypsiS72LYBVFb3d5u3vtFkZOlJHUR+gchdmZpCtLVBkTvsJv53fXZxOLlBltctjy
         i7pSbOgzcR/Wk36I+SziVdlsoPHRRzCF1jpwXSGYxTGG7sNS/KmqyzNFScFPZ1nUmxLz
         kC3NFi8PvIuj6piI85SupNLva9HTqNxPkSeK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786318054; x=1786922854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VY4usRICaxhXCeQhmdvYOfZpDLIP6WMeSO8y2fav6mo=;
        b=rZo2rd7m/N1gcF825sOCu+SMpVVLWe+u7c1DOHH3T/WEPZFT6Kb8BsCdtMhS2num9J
         oh1n09j09J4Wbadp1GiX/1Clj6K+7jkw5UqnkAQmae2zISQjddIdCiSPVYD3XuVCEy/p
         jn0Drv9HSv+NNLcXs0rZwXjz0fy+kE3IbRcShEbFAxAFnAOaaKUQ+qaQp91DKIgW0ZK0
         tXdCnE39a5cpgj2fIG2d4PIY9KZ9Ld/QEYw4KrO+4bvOc1ArSlrvuoksan1bg/wJf6yE
         WjcjDwlKH9XbN+m9r2+/WiLOs8hbQbfFCEgpFtzMrE0qMosJXtK5aruazqhGRXW+BZ/a
         N8zQ==
X-Gm-Message-State: AOJu0YzYsLf0p/2HKSP6t6Z8SdgMI6DiUh7m+cu2no2hXQtP01mr1IzE
	jNzdLjMkDv8kSvW1C6ASRn8Nr1sfODauBc9kBiDdE39L+k5V7ZKOBkUTuU6XqMadCwZMl1Qx2jJ
	QKPq8
X-Gm-Gg: AR+sD13K2MHQZ76SKE1l1l3K48hRIFDQlNHCN+WebGCDvcab01fJGW4AvGSE422p1Kh
	sN0iUmqZN9J0uL2dmJzlJOJAG9+fz33s6v8LB0XKNWzCkQBrN2xunni+VOM4PaGJlnU6H4g5D38
	8ItQfvISzSfLzzw59P2ev4F/snaQNiK0BfVbgAIAsen+LkwkUkeGKvXhbq5eKZJqd4fiKsnKUTs
	WM5oeICTqYCUbpiTNY85GLlgD0h3fEe3vUZOmCklq+AnC38cJoftVWeb+BAt0x3ytEoLfG7XOIL
	/mzlPwPaotPLzFCyahVg77gjsx8c1h0mZP20RACY14OQ27Heh0+0l9fO8H+ZKip0QOmLbBje/qk
	Goib3oIvNN2x/vpuRt3590fgOMuF8efr7cBtxJCk5HzSthvt0v6iYIt6Md9108enFdj9rcZvpKd
	0ID0RhvHTFE+BiDTnNYHiSOJnGrcA2sUbsMasaWC9DhZl0yf4/1rWW/SQC43pFAWP/bV7ESzQmI
	PDdww==
X-Received: by 2002:a17:903:3848:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d0ca70da11mr471415205ad.8.1786318051397;
        Sun, 09 Aug 2026 16:27:31 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccae6f8sm26373605ad.1.2026.08.09.16.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:27:30 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 5/5] python3-dbusmock: fix CVE_PRODUCT
Date: Sun,  9 Aug 2026 16:26:51 -0700
Message-ID: <20260809232649.368812-7-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809232649.368812-5-tim.orling@konsulko.com>
References: <20260809232649.368812-5-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243087

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-dbusmock (0.38.1)
Before -> After: python:python_dbusmock -> python-dbusmock_project:python-dbusmock
Newly caught CVEs: CVE-2015-1326 (.pyc code exec via AddTemplate)
Status: patched (fixed 0.15.1)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index cbd74b4059..ecec075f6f 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -11,6 +11,8 @@ PYPI_PACKAGE = "python_dbusmock"
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
+CVE_PRODUCT = "python-dbusmock_project:python-dbusmock"
+
 RDEPENDS:${PN} += "\
     python3-dbus \
     python3-unittest \
-- 
2.47.3


