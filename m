Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.4532.1604880147330654058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ogzJ3s0P;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id i26so5323523pgl.5
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4QSTBsTGPBJfxZS3s9s/SSuCrqi2GwBLI9mdSJdUmkQ=;
        b=ogzJ3s0PDRL3gAWK3ergaOvA+jk9pLDBDj2IbkyKa7715AIVK2VeLSzL/Rkp80DrQB
         pXLfiIrsJM/IV8f/r/A+yhteRmKBmOabzxG6/Nc0PrCJMzMRd75fA4qWd6265j4DJOPF
         p03wt/f6Jrfqt6ZVhpMV+sc+Prhc7lspFsaHaE6T8BOavgoWkPEm35nTlQ7U0tuT2Com
         HiY+WtjlYqmwM3SMnRXFvYzZ9qGoiQPSavX8kJzyct5QlwzxoJVAnfpOyBsCCp47IDBc
         1drRwq909b/Wccbm/KO1GzKZ4osVdgNAtU40ihEYV3u/LQ3Imi4jQWem45KXSolsd9Y3
         mySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4QSTBsTGPBJfxZS3s9s/SSuCrqi2GwBLI9mdSJdUmkQ=;
        b=dDwg2xRnYQpN4Y6vMZICIh/uh1VDelmmi40JHVZNksvMxS5ug3qVC9udD87YYhFDgF
         t8/MUDAXnsr2LlXwCHW+Y+O9Qu84JPi/T2yacvo5cVLdPSQwsBiRgkooogtKcp9M2zMg
         DTV6+3TACBE7aR3MHsQOxpSQNNpUX4a0/NZugNdLpZ4fqbgsghH+k0a3J+gIQBher/6G
         VnKybZJ8sDv4ZyymT1I796/JRq79zZ+cLo2KHRRcCjhbHLfik5q8hY7mhSldG7niTS/A
         9GKHG5zDDpl44E28Bh3SNtCsbnLUkmO+Ll3H6Ky4ig4kXm06Bb7sDIs9elIy1ysb1jCw
         tF5g==
X-Gm-Message-State: AOAM532AuZbnksJ+vC1MIM5J4z6XBYiSkLAwdemSzPUORg+ZQi7t/VSB
	j4QJtKkti+9N6URNfJ05037SzsrYWmzm6g==
X-Google-Smtp-Source: ABdhPJy7R3Ely3XQnixtwjwykdRjmBH5JEpOBK+KE2126z5THd/DZI3rrXDuqcCMa+Gryxadv6DiXw==
X-Received: by 2002:a63:7e09:: with SMTP id z9mr10716777pgc.150.1604880146701;
        Sun, 08 Nov 2020 16:02:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:26 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 06/11] weston: Fix linking with LTO
Date: Sun,  8 Nov 2020 16:02:12 -0800
Message-Id: <20201109000217.3008448-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

weston uses --no-undefined option during linking which does not work
with LTO therefore override it with -z undefs when lto is enabled in
distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 75f9fb05fd..051fd85941 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -26,6 +26,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,undefs', '', d)}"
+
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
 EXTRA_OEMESON += "-Dbackend-default=auto -Dbackend-rdp=false -Dpipewire=false"
-- 
2.29.2

