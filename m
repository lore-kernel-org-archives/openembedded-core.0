Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EDC35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4680.1741809193352326357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C1pBmcmk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so2518240a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809192; x=1742413992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKH+A6TkiIAbQS8ss2jBCgemCB8K+maPmwTWN2EsumE=;
        b=C1pBmcmk0j+lW+AtxYXYtbTsnk6ZKxnE14KPnJJX4OqhzgttzZCajM+9LL5DBGUHJq
         LJp1Pkpw6Jl01Sob6ZMMuLt8MWD/7B/ML4js/nziTnpAJXrSHTnFwfAqt2yFHGm2z6rw
         S7ebOSFjqg2QF3/C5vZrD8Zfg5L/AC0SMviAMSWT2pEf2/PYvy0KpU2jOFO5PV4XgO+f
         gSpbnXWLU+4AeyiAEIu3sfTH2U8MoBeHBGvvr9Dv4F/WXA/PTpdJ0pJ22EIh7NWoFT0v
         4G3s9fQyQeUxyMhPm9jpUaA7dbaLuIpB2Ja9+q1QrS1dzWZdXAHdkCsWOj0A+zgC4Hvu
         Bx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809192; x=1742413992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKH+A6TkiIAbQS8ss2jBCgemCB8K+maPmwTWN2EsumE=;
        b=w8FOSCjENuclIX6qIKp/SlfjeZJHA0NPP+xts57Tu1G3Oi80s7q2rA9UQKpzqNRcyj
         HPlNHZdtShiUVCa5X0K795axzlWzv1FwlFPlFKZTZC/tFcuHpVnaaf/2CYCI6RF8vi0s
         rfKNoJwguzFnpho+t/6nlD9x6UkyXrQahUMzVV+toNipLIx3TVqdwBUrazfaVgupjKjb
         uoudDP51ksMk9Lkheggtux15LUsFKENotc7oPoO666tTfJ1VvM0UR21Rr9FFuNCnk3pl
         kIPyg5LEFhoxn5tZ43je7Dt/fMlmdpO66BQmHcsnnUhjebWI3W+Gj5wl89UDbUajQBOS
         mUlQ==
X-Gm-Message-State: AOJu0Yz3KWkeQ15B4GMb9fpd7skbln/BEqQyHkREGhNR1CQDJwiXBI76
	gqXZ81hB3uwzDqmJp+2MaViBz97KKUJFBIxcL4daKIe0T4RkbluLbvo5zu5n8ZAqs03yxmArFPw
	D
X-Gm-Gg: ASbGncusMS5y0E675gvr/+yRPY1zHuGUUfjtgLcOt9T1nNHjW5kkvgYg2zY16LkR2r2
	DXJB+4QXrl8YO7UTranqeV/MTJKbkFagsDVS4FQHcHUhgSnyJb3JTCbGDkTrkMgjzzjBjHLw7Pw
	HVJPwjjWOjkypTWndMR+MrkUqK5qwyYkbjHA0dVJUnSqqfH9oDX7llEO8I9k9l7Qwf3ipK0Swv2
	BvW0u0/eybZWKUA9q9iG5TKUgzUHXToB8z+RM9r6tveMpDhNCj3aHh8FRayVVeGpCB8u4HWK0Cv
	YH05lfZppE8WyNPx5xwRRAmpz25uWT4TOoEpPUAlB1OLsA==
X-Google-Smtp-Source: AGHT+IGkcY+oJDWDMKgM/XyheqG1OWmvViipzKRNnM5PDUj7Wl/CzDbyaN4F8t8WRrQo0JsmPOvjVA==
X-Received: by 2002:a05:6a20:b22a:b0:1ee:c7c8:cae with SMTP id adf61e73a8af0-1f5ad81d262mr786790637.9.1741809192654;
        Wed, 12 Mar 2025 12:53:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 22/25] xserver-xorg: upgrade 21.1.14 -> 21.1.15
Date: Wed, 12 Mar 2025 12:52:30 -0700
Message-ID: <a97e23fe412b8b382f718f73c5a8b12f26208661.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212689

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba94110d70ebfb1b4798ecf05389f7ea602b1f55)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.15.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.15.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
index 28c98eb527..080e6d220e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "8f2102cebdc4747d1656c1099ef610f5063c7422c24a177e300de569b354ee35"
+SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


