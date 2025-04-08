Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909C6C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:58:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.71930.1744109883093412952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gSEHtYzn;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225df540edcso63147185ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744109882; x=1744714682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oasI7UhluOg4pk04ifFBY3SZ96Yynq9s0guCTArpU1M=;
        b=gSEHtYzn2F1WAXBSI9oB3llOFgWRikwW63VTqXY0vFrUm05rnb/8aijUCjhPPqSh+R
         S9G9rui2z1E11H54W1Aw90RZeswZRNj1m0dUOkzc5OX7hRWOOc+yTDW2J2qzqCxUMxic
         wBP+tHKhxQ3tz6GSq/MLTHZBqVP4uFgjCZ5XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109882; x=1744714682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oasI7UhluOg4pk04ifFBY3SZ96Yynq9s0guCTArpU1M=;
        b=O6c04UokOoZCBL+f75wH3Yn8FZE8v6U89K20O+f4bMJkGSDrN/6v4s2tbJq0vToFrb
         h02rWu6byzcby3QXnhWSK0jR+wbZllTyfGV4MlchPGCGUx878cNXQe+zU5BXE9WFeieo
         CDTV2nCIgCByvW3N7j9AholT49pWbEBQUJWsM4W0mdLadq6e5Am3daNWx76mjlkv/w8n
         3z5zypRrQsJ3kEgHCEpEad4xeUOFHy3F7uoI3udn1ab2Th4ieBdWJavmKWv2xWzhzzND
         l0aQgLtOzzKuAI8jgyZmkUwI9cO5Y8J5z/WgRGBotmhfA4A1gIrfh3TW4clHkumDGur1
         Skbg==
X-Gm-Message-State: AOJu0Yz0cm7lf0g9UeaNSlrFhQOEqxplO3+4ksaIWRGnOq4SM5LLnPnY
	zPnbs773ZHeMFHmofAwPNa18u0SfdkmeULOoFZeqmyPGXq7YRi0f9yLrv8w24oHE2bPE2157zI9
	Nnsk=
X-Gm-Gg: ASbGncsTz1HmkbnyY8+ejJx+BwJTYWyfIMJq+Lse2RWJfB699XH1Xpe9sCEKibh7KYr
	XWEs/vWqPbDZRksguP7bp8dMXDxSlX0ubE9msA3WgtrFtdfPuJbwu3/zyr30vlW2wigV/eLKXF2
	OtmEN8xr5PfRHinBAHs7duFCbC6cB8wK+rsVaxtOlCft6dupLQEQzaN3KQaK3cYd7NHYO3bcyN4
	GjMH4W/Px2p+lgGHjpAfLrZvjub8peid5QFb8FneqApWqN/IVhGpx7qgVh90biF6V2RN/ATKFHp
	VKRtlxxxlu4CbHQpqjefvVPUYg0vA8ZBOItH2yXuimJcZuHoR8CPOJCi
X-Google-Smtp-Source: AGHT+IEjwDWVlVT9FGVl2zsUA6AHu+YJ53lziWjMZFtgR/9asVMuv3JHYIYTuGQ44i4CVZVM6W5++Q==
X-Received: by 2002:a17:903:185:b0:223:3394:3a2e with SMTP id d9443c01a7336-22ab5e68900mr36126615ad.18.1744109881569;
        Tue, 08 Apr 2025 03:58:01 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe34sm97696255ad.67.2025.04.08.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:58:01 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 5/6] ghostscript: Fix CVE-2025-27835
Date: Tue,  8 Apr 2025 16:27:20 +0530
Message-Id: <20250408105721.1798123-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408105721.1798123-1-vanusuri@mvista.com>
References: <20250408105721.1798123-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214530

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=de900010a6f2310d1fd54e99eeba466693da0e13]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ghostscript/CVE-2025-27835.patch          | 34 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27835.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27835.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27835.patch
new file mode 100644
index 0000000000..9cdefc5201
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27835.patch
@@ -0,0 +1,34 @@
+From de900010a6f2310d1fd54e99eeba466693da0e13 Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Wed, 20 Nov 2024 11:27:52 +0000
+Subject: Bug 708131: Fix confusion between bytes and shorts
+
+We were copying data from a string in multiple of shorts, rather than multiple
+of bytes, leading to both an read (probably benign, given the memory manager)
+and write buffer overflow.
+
+CVE-2025-27835
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=de900010a6f2310d1fd54e99eeba466693da0e13]
+CVE: CVE-2025-27835
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ psi/zbfont.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psi/zbfont.c b/psi/zbfont.c
+index acffb39ef..5850ab54d 100644
+--- a/psi/zbfont.c
++++ b/psi/zbfont.c
+@@ -253,7 +253,7 @@ gs_font_map_glyph_to_unicode(gs_font *font, gs_glyph glyph, int ch, ushort *u, u
+                     if (l > length)
+                         return l;
+ 
+-                    memcpy(unicode_return, v->value.const_bytes, l * sizeof(short));
++                    memcpy(unicode_return, v->value.const_bytes, l);
+                     return l;
+                 }
+                 if (r_type(v) == t_integer) {
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 376d4a300e..abc0238ddc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -67,6 +67,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27831.patch \
                 file://CVE-2025-27832.patch \
                 file://CVE-2025-27834.patch \
+                file://CVE-2025-27835.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


