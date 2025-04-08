Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DA6C369A8
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6959.1744145486088231498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uAVWyqu9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22401f4d35aso69155395ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145485; x=1744750285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7D/wmJ19NjkmUebK39tgFNgBwqHln/fZsxlwCHn+LI=;
        b=uAVWyqu9LranasljKHrF5xyEQ3KeQ5gbKpwdcpjTeIKRRCp44AH7QXgbeedgLPXlcS
         5lyRiAaF54W098WnfVuISONA9gJaSs/+ojavLPlTU4QxhD1ilfVsiGiYAO53KkP83z8J
         kdPOFBvEdDdiiBGNUq6BsJvyzEea+0RYXGATV05uQbGyS0AZsZwn5iET9lXS569b1RtS
         qAnSeeyrfG4N/G3ORv5FA+uvW5fnYM1Em6rXk+0RdXgauhfN1PJR7HmkoIZGjIleLV45
         q+xpVp215Jam49cQ/pJazUCw1yW9W5jy/7zJASfmSA53fAVR1STMhBPGhzUm5UD9Nc/b
         cYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145485; x=1744750285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7D/wmJ19NjkmUebK39tgFNgBwqHln/fZsxlwCHn+LI=;
        b=oy8h8Io29JHdTR/iKLeReshjqov4kw/ZnD7e/YMNC8ePNEOuarK34UOB9AG7/EXilb
         DIcxZnUXhe1u+wH3/z6P2ayw5Sa1RZxK7wRTHgppoP50kY1mX6XD3MWeqpE/pUBUEX5L
         iO9r3QPCntVEwl3ZY8MhQdVMwhFnsvWY91TO9WHEdvAqvWvFpRwU5cG54gCxcPSvZDEJ
         LrMTlDEdYnj3pJxK0RBv44dnl9xQOTI/Fn0gwKhcWcb4qeG6UEpigR18BCrEMQ1FU0Wt
         BM3FjKTwW0Gu/WbdoKe+c9XwF43dp0Fknn2qP7rYF4W0RIB28Q+2E7pAvIdgtZS73ek2
         XOZA==
X-Gm-Message-State: AOJu0Yy0DhSR9wEZ+COredqpzANfZxWX7ksh936QlNULy29m8AyEjkg6
	OqiB1IxkxV/ykyvxceEj+DHpo28DYTVQkZ/H9sMNvmvbhKWD+hAzI0d7fi/+Ufhnq9RBTMeJtrG
	t
X-Gm-Gg: ASbGncsFfSVPHw5Wcj4R49QtcirSTdm+gclXDhk32wUzFQVbJXACfUg/FAFy/MxRbhJ
	efF6cgcR9VozxFr0Ssxxzkjo1qejKgOmBKLdfLMx9acYYYJ81YkHsYFfX6Z9o5Sg+/k1UF8EZ9g
	0nVHBCTrGC3nquuEUUlJwvvHUuENAjtCQdDH7y239PuATTj073jGINmxnBjHFtWbbabfzmsFrBi
	AdsSlaDHZbEDUUJkvs3sWRZ9IwlCyx7JSzw0S7PcFHD7+xVl6Gk3FAw/l/d8wCYJvU99sV+eaNo
	K4BqRA5LqNcyLDlcThITpxG0gW1mGeSPhdFkIe87Ue+HB+8=
X-Google-Smtp-Source: AGHT+IHnZByzQO+996IHpEdysBfisK+QEOgskKdq7JwiZBENgW50gQ8whZA4idXLwT0cpRscOLFnmg==
X-Received: by 2002:a17:902:f681:b0:223:3396:15e8 with SMTP id d9443c01a7336-22ac29a8302mr8851355ad.22.1744145485192;
        Tue, 08 Apr 2025 13:51:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] ghostscript: Fix CVE-2025-27835
Date: Tue,  8 Apr 2025 13:51:03 -0700
Message-ID: <c30c46c2b4048dd58cf91b1523ddeca6075176ec.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214562

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=de900010a6f2310d1fd54e99eeba466693da0e13]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


