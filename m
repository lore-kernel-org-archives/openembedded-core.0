Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.12999.1611672223352945561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=siCZ8NMk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id u11so9855790plg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JnbVOgu7wt17ZUL1U6YSa+Tl6g0tWH7W8oaf3jZ3P9s=;
        b=siCZ8NMkPJWcSVppiJOgkmKDSUY0tYlXAIMS+mTXU9oKsms65hNbZOlOjNc0IfJptx
         Etc/zukfFx7U8loee4pNavKOsNquO5dEXUwNt8twrK7iZgvFvrGzL2qPXlzktQKJIWTC
         r/qggYAYCViZLJ6s7n8E0ZfY52iF+egkQ/eOO0EMspj28VnLOzpL71/HDSdG/0kBQJZo
         GprGBRaCltm4t8/j03LPo5Jozc+xwFdu1KMWBW6K5KDuihbKViVc1HztqcIJiZk7p6i1
         p/dllGpi7G4wjjmnxUf4mmLGmpW2fdXF0gpDmcmwbmCdLIRMMhgEu0LKW4LBzUttLTOc
         76Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnbVOgu7wt17ZUL1U6YSa+Tl6g0tWH7W8oaf3jZ3P9s=;
        b=ZPy+k3eyQ/3miPsrPESnp5KG7eWFhHCgfUditifuwr0E0mik9Ec1w29ssEhWLmsp2W
         sbHJoPvugdclKr7Pna0j/wuDzMqJWv3deRYOLYIjqBPvM0Xrr6/EXohMbizgHJXwWpXc
         fw21r0o50oshwxlwiz8HmA3CzRcDMPgjR6ikbHX8W2c1/vY9xCe7RN6PfD5msJp05prV
         hn+1Q8l+D85uDtKWexVQqSKVZv4xeijTdWOyZP3p+yyClMETi1Z4Vh5PrJYGYeVdbWeT
         mQbyESuHWfrrVIQHYx/N/x5xQvd/ZmcDX8oQkYtjODUD6po//2n/Y3AoO3uBswt+yQ9A
         bjdg==
X-Gm-Message-State: AOAM531IgZoMO/L8PUeiN/3uX1+JY9SxaVOtEaGZDARUvM4+dNe2Vvjj
	232WqXAeoPY5NzkwXTgzApTroh+c1Bod/KDe9AY=
X-Google-Smtp-Source: ABdhPJxilxBjcCa7lz18gj+xok9tIG4otx+hAgdDitlm7EuxZQXvj/mieZwx8CWdwazaxsO5eA0m8Q==
X-Received: by 2002:a17:90b:257:: with SMTP id fz23mr112560pjb.162.1611672222479;
        Tue, 26 Jan 2021 06:43:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 33/46] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Tue, 26 Jan 2021 04:41:44 -1000
Message-Id: <c3128c018bcc8d670b94a5c69eaf70afb7ea1c41.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55618cbd58d6784a82e773f323723be6f722232f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 4ec0608fe4..cc0382ce54 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -206,11 +206,21 @@ class Partition():
 
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
+            # Canonicalize the ignore paths. This corresponds to
+            # calling oe.path.canonicalize(), which is used in bitbake.conf.
+            ignore_paths = [rootfs] + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or "").split(",")
+            canonical_paths = []
+            for path in ignore_paths:
+                if "$" not in path:
+                    trailing_slash = path.endswith("/") and "/" or ""
+                    canonical_paths.append(os.path.realpath(path) + trailing_slash)
+            ignore_paths = ",".join(canonical_paths)
+
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % ignore_paths
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
-- 
2.25.1

