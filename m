Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965DBE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 21:25:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2215.1734038702845845795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 13:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ad+m0yq5;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2162c0f6a39so21347135ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734038702; x=1734643502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPzIAyiUre4AiK1NoER/1Wmb9Xcc7MKDwKNMd7DANX4=;
        b=Ad+m0yq5rAHk6bgzb6pUidhEMhjlhKIAkByUFqLSUYMivcOYHbI0zDCsEQLQyRVf+y
         PtJmtPlr8GcEUTH91J6Nd8NH2DFkYB+1ThcBHKLDuzXDMT7LFggz6bXAZY9CdkBctZHT
         HR9ojFahXsFK4aIB4SiBqhbz/mdx792jXt2MWB6oN13Cusm4hTJ8YhhJTjuwC+u6gwK4
         5nCev+e0jEhH3XAKxptVYi9IN7KK3lvjFuHs+fd+sK4BF5uEkESq+65YSpBNE0Rj+p16
         482E3tGE2WvMvMXXzS4iS7JYY//Qj61hheOBg9ztQAKonsxUp54bC9G0y70fsDXsrhGD
         ojTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734038702; x=1734643502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPzIAyiUre4AiK1NoER/1Wmb9Xcc7MKDwKNMd7DANX4=;
        b=qrkTUSEuIdUbadIIAXV9tKzQOEFvtk/V/NnkwqNZAcvvXNIWHZ92bdkyNUSNEitREV
         Lke4JzwxmCJwS4ORjvFrXLTB288xRgobgaAx7/BNLNdUaz4BLGEj+1gxlDPlt42Ig2v1
         mKDNeDaf33mtdJA/myvsF6WL3FMvVechuNtwl5/7muiU54dFIdRjZz06e1W+KmD+b0s0
         F6XbUdH0UFfWIVMkXBhWduaNrUu08cX6XIBg/4kK+L+t7wW210lZ4pHycKvUd66mxj3k
         6259GV4c9rNmZIUx3ncgOm9hgCOEM4/oFiOGuZpYPS5cmqVZ5NTlJtgdQQgZIS9Vbcmg
         CMgQ==
X-Gm-Message-State: AOJu0YzlsLnaiQVB+1X/xnSzXzae+2sBRCOX3oV4VucHPtQjWmTnwzH6
	S/nnbKXEDFr4s3TvQqoakQpGxIv9mrYUYdwccN8unuA0Kkbu17e1qbIEOA==
X-Gm-Gg: ASbGncuBV1/D+2b86tbnnw2Y5nmA/Tfpfn9TVrDAWZvqqpgZamf+ELIIWiHMSUwlwov
	AUJc2ueNVDcpNrUrWUMRY3Fern0pDSd+6mmAUjrD8L+4ZMaVSMUkXvbvLPR6UknK3ZPN1CQnjls
	qyauELAFIw3/dGoWumhrl5bRUTGX6qQMSRaPfmgtf68juJSDmGAHKfeZdHnjROb0AN+2ppA6Utz
	Vg4UPjA6kNi9Vm+B9iNz3up7jhkoDrBNecijNclBjWrApNhFvNV5+02hIqwcJ6k6R1MKK0TbaEw
	Zq8=
X-Google-Smtp-Source: AGHT+IFoMTQyajE2p93HbXLvuJ3q4WwfQU0XIgGEsLoxnzDhBPPtXkmQDlABgkCXMTypyRG4+tn54A==
X-Received: by 2002:a17:902:ce10:b0:215:7e49:8202 with SMTP id d9443c01a7336-21893c8d520mr108585ad.13.1734038701972;
        Thu, 12 Dec 2024 13:25:01 -0800 (PST)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21625a15937sm101039805ad.21.2024.12.12.13.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:25:01 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] weston-init: remove kbd from RDEPENDS
Date: Thu, 12 Dec 2024 18:24:31 -0300
Message-Id: <20241212212431.248280-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 21:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208666

From: Hiago De Franco <hiago.franco@toradex.com>

The kbd package is no longer a hard dependency for weston-init, as
weston has replaced weston-launch with libseat and logind as its only
launchers (see [1]). Remove this dependency.

[1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/663/commits

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 5723655a9bba..0f79a44e48bc 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -84,7 +84,7 @@ USERADD_PACKAGES = "${PN}"
 #
 require ${THISDIR}/required-distro-features.inc
 
-RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
+RDEPENDS:${PN} = "weston ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
-- 
2.39.5


