Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6514ED5AE66
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2992.1765620062326318768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DZ/8/jDP;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297d4ac44fbso9949335ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620061; x=1766224861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueKtgkCEoWQsMJCFgU8KmXMC4cyRBhsS4RQaC3gv4DM=;
        b=DZ/8/jDPOAQ8MgDDogSPzszOK2CPmwbFeh5u9Ht7UV6V+fvt4FwgMunH6pvpKSTMfA
         kD/CIcZ5Gsuy7TGxttwiK7tCo3l++kFzTsRWC+NT8Cs2jAfTmy9aXyMmQQQ4T7jPjavR
         Ntg9Zg5PdmoSDe7uL04qbTlM27dWQluqtFhSGH65f45+xoSGnCkctNWaNkzHIRaSU6tn
         6sFa+z5f+tiaOVP3qFtuuKVg1Sc4oHqN1OxTz+t7HvLgptD0koWlsRTy5TimyMr9Skig
         XcHE26eUM/Y1HvKeW/Gr/ufXPon5qemLLDygbJL6LUACa68b9FKGi5VlWUvkW10DGWqm
         XNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620061; x=1766224861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueKtgkCEoWQsMJCFgU8KmXMC4cyRBhsS4RQaC3gv4DM=;
        b=qYr2l7PF3fHn0S/J3sZIb4IpuhdyQoL6ouJV6K3+eBc5rbv0MPEgb9Q17sWh+/w8AN
         LgEYWI4PvBMIPV2XYLa/Oy816Udbt3YgkBomo/dtW1N8xwLvhVjv+HiVbgHKnaFEzg5I
         4hiE/y2cwhTe38Z4+EB8IMobul0qX9C1M2dnW09rvzGnvljQdW6rBDsa4TBPl5u7qw11
         7u1I8m0saL7mVsifgabPYkBdUYXhead4GkiJal+SBUJlbu9phtI967uaWppJfULICx/y
         l0+CP5utpau6mZ7gYA/mYbSI/KN4jR7tcDga5Mjp4clGJQJDc89QmFaw/BP8tgCShE/D
         17sA==
X-Gm-Message-State: AOJu0Yx9XVV92SW776q2eLFvd2V2PVEGl1o1GUNi6Xx5rJv+548nD8Ti
	R0HVPCgJ0X4fOAQSSKGBKoeUNfWVgDsnKvCr0Yjgb1KPyTbE26AKP/oQtDccM8lT
X-Gm-Gg: AY/fxX5U4ea2S2rP+5dhmqecuGIy/lCR3DQHyjKYAQe+rwz1ETmlx7X0FvFrM9A0kZh
	cXjD8EXlCelh1cUm6ctou8MVl24vjJR5RtEksl0HgNDOQC0s0c3gdEEO4GuILeqRVX0X0EbsOMj
	Nvku4OreLXD2NXAanu6gm5YFYIct3vnWfkLm/t/hGeWuFAwBx8f92yg3aw7SXdTYQ1kgrNzTaFe
	X2y5nP2O6Sn4gDfkM92EiCCax4+h5zHKlUswOBBIci4pZMaz0yrVW4KyEuBpneH4+kqhLnzqJFX
	ULzpXf8JRnteZh+vdsfR0Frkl1jKiJLk8gHwWv8ufKZaL8vQBdksplyL9JSbTlbvrD3mLHHF2gG
	oIbl0jjd0OWQeN3cWDmgAQogoEag+h3mx2uBA6EpR47yV7zHyNvwmkh2Tu2e1n5Uz1K2naKvDpU
	sFSAi5xXK/o80HWXMkJ4OBBs8V
X-Google-Smtp-Source: AGHT+IENMCyzqyi8OGdgED0hYp023yyGMsyKefMZkElklDWzZ/X4pg2jHdWIHBLDuomqbWQuPSJw/w==
X-Received: by 2002:a17:902:e947:b0:297:e897:6f6d with SMTP id d9443c01a7336-29eeea06883mr84748625ad.9.1765620061463;
        Sat, 13 Dec 2025 02:01:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 30/67] gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:54 +0530
Message-ID: <20251213095931.2571498-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227648

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 03b4d82e774796a5b89f435af0d26f532bfbf962)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
index 4adbc982b7..9ba288a410 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
+SRC_URI[sha256sum] = "82af18a1f3e4a060db61d2630fbb975269b80b55bb2fdcfddfab5c6440d30781"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 

