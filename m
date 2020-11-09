Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.4533.1604880148389387728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o0qDcZxy;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id r186so5339873pgr.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BiB22rX9o3isooHonUFk3t55AvIwPwuHOq9zN01lLcE=;
        b=o0qDcZxy0h3iU98x0HJD6XOGmx0OLvqD2tHPJ/bmGO4I2RBKP9iIbLcbwTrdTdWx9D
         ZzM7bwLFJSOdrl0u6PgCTpo8IygclLtThJcUaZed6KGPpm0HEkikpepwZJ3DO7iDe00k
         RSDIAZWgUUWBDXWnuv7OVKffnW9Fx7Czy9Lz5oGq3OZOa1+nZQM0oORfe8bPojmvd3vJ
         AaEE3ZXZMMDniyHb5iXLDz2MJAW6LgFDv8JkJG9ONmVHPFxOs/st0EzfxELgnLWOa4fy
         5WIlYdThGWe5ac0ko3w57FyQ6cJYGwLb46+qWvyJpVkgLhLcCwqdmHSPbYYNKMyPDZvR
         rgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BiB22rX9o3isooHonUFk3t55AvIwPwuHOq9zN01lLcE=;
        b=J8hSjTbmbsoJDBxIoTLuJwsQHSHRUH+NZ5UQKjspHTak6OgtZsRycQCEyoGoRKNACb
         VRoE9u64A0IfJ/dr38tC3ZrXtO9mb5KPidVTDeAc8oTa1ueUD8AdVneEw0Iwg/jvJTa9
         aEcVVW+3cJop1YNlEbNsg3toLh+vPPkc6iPq7nRfQ61nyizxs0EGbbUDJj4eKR66Qnam
         gzccA9lG5cKAYlSiCw8hpnM9bxQKjbkq/ZgwQHMWz440o3VnoyI0wLzUm3nmGHgNW/+x
         obq8tCG0NgxPJb/LG1edka1NeXntv15vwhdTdim2tXrdcgDVMb8V/uzSLQdhh93jtZUK
         dvbg==
X-Gm-Message-State: AOAM533NsGnyE48esBaRvI25LZ6JuNo70+qF66cn2Rr2kDDAou+hKMYt
	Q/nkrsoZ2tNqjqMeDKjT1q6dBGzdCkhubA==
X-Google-Smtp-Source: ABdhPJyg4kqBziMEKuYrsQTpCvPggoFH/ViHhZOheQleV8Ud3HS9GkC71xxW5mBVp93xi36RPAwq6Q==
X-Received: by 2002:a65:52c4:: with SMTP id z4mr11047682pgp.238.1604880147742;
        Sun, 08 Nov 2020 16:02:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 07/11] lto.inc: Disable LTO for xserver-xorg
Date: Sun,  8 Nov 2020 16:02:13 -0800
Message-Id: <20201109000217.3008448-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It ends up with undefined symbol when LTO is enabled
Fixes
test/xi2/protocol-xiquerydevice.c:345: undefined reference to `GrabButton'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index 9c4e0ef507..bd433aa418 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -18,6 +18,7 @@ LTO_pn-curl = ""
 LTO_pn-libcap = ""
 LTO_pn-libproxy = ""
 LTO_pn-libbsd = ""
+LTO_pn-xserver-xorg = ""
 
 # Custom LTO flags
 # disable partitioning/streaming algorithm since its uses ASM
-- 
2.29.2

