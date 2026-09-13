Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82910C88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6004.1789330332498011455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SJDCDhmr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48442ea8f59so1141455f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330331; x=1789935131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nVMO4AztWK0/O6QQDsFS8Xsn2Q43RujBYUZbFcaU2Dg=;
        b=SJDCDhmr3HRpVT8+FyWSVWLON65CrNOYBMKDh/7j+YG95hkdfcRMUMJeQeBMsUZDfi
         Gdfkkyw2YhngckrfBWHO9Wicy+2+8GjSueGrD6/11+jmzJvTw9GrJDcXru7tx6sNDDpG
         FjaBBV0+5TPUj1gA7CyfnMHuPnZTkvdyEY9ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330331; x=1789935131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nVMO4AztWK0/O6QQDsFS8Xsn2Q43RujBYUZbFcaU2Dg=;
        b=ooBdpD6IlxkpYvwvDRN6xoKKXjOV++QXGcxq74vUACPKJp8FhRCa5aXDU93PTGkJq6
         CZhuMyZrXjeSSwLYjgS6mj8Yvn7Rc8QI4ge5M9oGYm/+u5AvsXFMX9JNrnU4K+KMp5TB
         JkZ+5forjKK/QmaU3aD8yfv+HMmLHW6SuHp9JOPhCGJgx4eObSC2wFA3i+0U8tMyoJpw
         MDcKgVlTcDCySf+cf5zBwNMeiq7MxAYFkXDLJ3U5PwvldYJzqmZCt7fm3rNt0On3bhSA
         K2SzPmiULsFlzEZ+dLDEH/mOJJ3G1319jwdLofv0cmuDswfJrXHQvhgLarCFiJthpwtd
         /d6w==
X-Gm-Message-State: AFuF++mob8h6bdyZ1Yb77o7oq8xjD7TvtfYpL112xG3POSGDTXr2VBi3
	FmgxSenN1ESjn8GEF3p6XwhBduuZUDGZmqYjYkxQH1LOwARsPnKt+jZV3dypai05vBrASyI31PN
	ndQjFj3U=
X-Gm-Gg: AYBFou1vf+27Zxh1W5uPbWwd5G0ziGB9YaMW/GihgzGVgePRCLhz3m3hPKIvTeUMPYD
	w03hvly8nxXXc0QsOK/6DUD3y3Wev0HamTtFO6PELPhU+YzJXRAu2KfA+JIFndzONTWfMg+SQZH
	bXwrYt6l9xDZfo/1MaZ2mlO/gT/uRPPKEqsVFeeKhS0mb09a5tTjIl3NYEOlFHWNgeRT9kYTy0r
	Z4EN5FypkFU5gCyH6VOa1nF+R8dPUClx4JMqKTgrBixUBU1EOoz6MzrcYpZNyoCGUOTutvP/ZXY
	qEq1wiD62dCJDDsSi84fnJMK4aAal1wgl5nLU/k3/vSvcN/rmDddtvHCZt1Xng90cBMdPqaovFq
	hkBTZi1VLOkideKSFe0ZM2S/U2VSLRi6SRRR8imSAxJr57CpG/rCMvLgrESs76B7zL6wCGNVAg5
	vAuQSftlqNcevXHpNTmuO3aGrT77sh28Hkt92X/c7yMyPSNG+QlxbuGt68+YkKutKNQNjwQkyMf
	j9rxgRGFb1tR2/+fYsCWKn3WJ8O
X-Received: by 2002:a05:600c:4ec8:b0:49e:7185:22ac with SMTP id 5b1f17b1804b1-49e75fbbd17mr46844995e9.0.1789330330726;
        Sun, 13 Sep 2026 13:12:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] libportal: upgrade 0.10.0 -> 0.11.0
Date: Sun, 13 Sep 2026 21:11:55 +0100
Message-ID: <20260913201158.687889-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245735

Changes in 0.11.0, 2026-09-12
=============================

Features:

- Support globalshortcuts (#226)

Bug fixes:

- Various Meson cleanups (#232)
- Document XDP_OPEN_FILE_FLAG_DIRECTORY flag separately so that since annotation lands in the introspection (#230)
- Remove erroneous CLOSED signal from inputcapture (#229)
- Add G_{BEGIN,END}_DECLS macros (#228)
- Remove CONST annotation from get_type methods (#227)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libportal/{libportal_0.10.0.bb => libportal_0.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.10.0.bb => libportal_0.11.0.bb} (96%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.10.0.bb b/meta/recipes-gnome/libportal/libportal_0.11.0.bb
similarity index 96%
rename from meta/recipes-gnome/libportal/libportal_0.10.0.bb
rename to meta/recipes-gnome/libportal/libportal_0.11.0.bb
index 4ba56dd44f6..fb2cc4c9f3b 100644
--- a/meta/recipes-gnome/libportal/libportal_0.10.0.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.11.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "c23024018c8eb076549a1517fcb2d7f80d3e2ed5"
+SRCREV = "fc4d62cfe131e8494c82f597f92b2234d584c367"
 
 inherit meson gi-docgen gobject-introspection vala pkgconfig
 GIDOCGEN_MESON_OPTION = 'docs'

