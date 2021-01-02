Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.16534.1609619125525429970
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jan 2021 12:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bdsrRrX5;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id n25so16255532pgb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Jan 2021 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+N79grSloXqD87rhWYEmaBRamgj8KE8e41hkAeb743s=;
        b=bdsrRrX5QAMgk6Gkmjn7USGiB407PY9xDUJ3MNJtRatFJy8v0SkDTat6vt0eMTO8sZ
         /n0R8i6IrZ1ncYtqLjyWBtOx6yu7BVAtlIm8ct5+8zRUbCOS5W9/zkhX+K/lLRYLy+aC
         wzwY3Sa03+PZRXwfRqPjkRX3Yvq2kRuoT+AMa9hbNeXKLBzVmsRBrmwZvjTqaX11Nv6P
         e21UtmWcHC2422SaAJAD9FRq4tLRgFMuOkVcpct4G/JacaSPFEz0lZIhvG/z7IVjxPMN
         3/SnA+Q28o1ZdGcDo9XTY1oO7QEbSL7T339SgKC9yKEXIpTs0GsCqDMXdQ6i3KhEp17Q
         6xOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+N79grSloXqD87rhWYEmaBRamgj8KE8e41hkAeb743s=;
        b=gvcnOhORubHtxTt/bjD8lC/0aoeh+aREtWdfF8+Bx5/lTiHoK7l9pozUL2V+KMuwl7
         ATxwNwEUYah9RCWhC+fT7RuFD4Yh9xxtbNdjHOKLbfSeP4K351krtdM3kuvfBXLYrqkb
         qauQf10kgbK7FPaSH7d+pVkEywFGNkfASNo6EdFDg8+Nmgbok/Q+zXl10EiL8vdzUUnZ
         nKdwgK+pftJNPRwiLWZAsa8TY9TjhdNVkkHKo4gw70zVgzMX4DjRYAKzFKtSCHo+XLJE
         hUN4JE5GbhWQjXNJgLGPvHmf8pxNWLOjGlTH5p2x3anLSTVqASmZ5U/WpM6PUwlvzPYq
         SE7A==
X-Gm-Message-State: AOAM532izXmvP3nwcQy4ACozggtf0yvcXRbikYAbcsph/GvRYZ/0tO4c
	OsmZPbTxRAjnccx2Mi8MDf0xQ0GexKguCw==
X-Google-Smtp-Source: ABdhPJzi1D+KdbtLLRXvu3pdr5JCm4I8KiTWWQrtFXmXhxZnUcuIg7dNKeADQTwAQJDheadB78pDBQ==
X-Received: by 2002:a62:3582:0:b029:19e:4935:bea2 with SMTP id c124-20020a6235820000b029019e4935bea2mr39739908pfa.34.1609619124863;
        Sat, 02 Jan 2021 12:25:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::cd68])
        by smtp.gmail.com with ESMTPSA id k3sm31750773pgm.94.2021.01.02.12.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:25:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] rxvt-unicode: Disable lastlog on musl systems
Date: Sat,  2 Jan 2021 12:25:19 -0800
Message-Id: <20210102202521.3791499-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102202521.3791499-1-raj.khem@gmail.com>
References: <20210102202521.3791499-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it needs logwtmp implementation which is not there in musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index b064a63caa..1855232973 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--enable-xim \
 		--enable-combining --disable-perl \
 		--with-x=${STAGING_DIR_HOST}${prefix}"
 
-EXTRA_OECONF_append_libc-musl = " --disable-wtmp"
+EXTRA_OECONF_append_libc-musl = " --disable-wtmp --disable-lastlog"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
-- 
2.30.0

