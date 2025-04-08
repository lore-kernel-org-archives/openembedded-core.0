Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F89FC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:57:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.71916.1744109863786331177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Dvd5t8+K;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2241053582dso67764885ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744109862; x=1744714662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLSzQQl6g4HSKKUdNQmzh4MRed6GGXRVb5jr1zcj+vA=;
        b=Dvd5t8+KQOF+ErvOHSMTUcDwdyti0tobE22FRpf5A/dnqS9dgt3ape7V07NT2An24q
         wfAiEDYOSBUhuQM3M+bKHmLPpujEPVViJ6KKLaKuyep0hxOt/PK1hK5BedenWgmzt3r8
         SxCWZXObrR56ONIUK/pLx6/z09hc61hN1y6zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109862; x=1744714662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLSzQQl6g4HSKKUdNQmzh4MRed6GGXRVb5jr1zcj+vA=;
        b=KZfR15B5TjWwHWRggteEMjS0NJiOJRZ79SS1ox3q6GBfqJCARWPKSEM8p6U9iOGOLp
         GcZTJJflttAcfn+fYxUSA1HVVumctuXgZzQop+1mAkk3B6c73RM1EqldKPyi2x7e4NUR
         zZpDFvmW56bZL64ecnsdkko/NI6mrqVM/WlnlTQuUgLhe+sNgzRJ5KJ12TrmYKhOXw8C
         s2OzuNCKz3/74fSSUWUd/U2rPQmW9Thm9nOmvodsRfuwj591c9OdQNup9KhGoWfA1ApL
         HPCt7UL4BqIn4YfrwSUWR+AQijsk/FzWd+PopSOUKVSLrKRMy1ueYWiFMJOhSy70R2jl
         Wj7A==
X-Gm-Message-State: AOJu0YxIhvzSVpSvN9oaUaULkMDlqulDr+PDtpdQ+gTahitzRd//UGnB
	Fkqcvgji3S1E4sfipflkaqcmBibwlRzMqM9eGgMQ9li3N+Y6E1txy+2W3rEIVXHv4ySSfHUos+f
	eQdk=
X-Gm-Gg: ASbGncuhn0zHYRFk6Nx4pdBOWwUxQtPVhxoj+7jt0T7KTVeRyu4yWcKtpFKhjTyi9Uj
	68N2I8RALrodd5MDooQOz3Qi7VwIxHJtA3tNypCWBbeOAvq9qZ+UHovOMTNbkxgQws35dbi8hy1
	OeHg9OrK55QY7APHnGg+OtBq00j0RainrdzhXICzM3F56T7xJ70dKYktFu3LdyALzC345l9Na4d
	fW2dZ0uKOuRTBYKOnUnMgVIY3fNkk1/n5Fl/39SFJrCDc+iA/OyfuylPZ9rS3vO9AmZ2oP2qtJB
	A7/WC7rqsWyGgTl8UTZg5xTPvRXfAgaAaboDZyLSu+gjAWIVfTx6eNiM
X-Google-Smtp-Source: AGHT+IGOZ53xuwLz01Hs2OSOVJSOiRR4BhhQhgUbdVUl4iqKjK7YnRzZIVwuYyRCX0L63P96UMw95Q==
X-Received: by 2002:a17:902:f683:b0:220:be86:a421 with SMTP id d9443c01a7336-22a8a0a37b5mr252776035ad.38.1744109862592;
        Tue, 08 Apr 2025 03:57:42 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe34sm97696255ad.67.2025.04.08.03.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:57:41 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/6] ghostscript: Fix CVE-2025-27830
Date: Tue,  8 Apr 2025 16:27:16 +0530
Message-Id: <20250408105721.1798123-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214526

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8474e1d6b896e35741d3c608ea5c21deeec1078f]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ghostscript/CVE-2025-27830.patch          | 79 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27830.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27830.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27830.patch
new file mode 100644
index 0000000000..a516b8ad41
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27830.patch
@@ -0,0 +1,79 @@
+From 8474e1d6b896e35741d3c608ea5c21deeec1078f Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Mon, 13 Jan 2025 09:15:01 +0000
+Subject: [PATCH] Bug 708241: Fix potential Buffer overflow with DollarBlend
+
+During serializing a multiple master font for passing to Freetype.
+
+Use CVE-2025-27830
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8474e1d6b896e35741d3c608ea5c21deeec1078f]
+CVE: CVE-2025-27830
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/write_t1.c | 7 ++++---
+ psi/zfapi.c     | 9 +++++++--
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/base/write_t1.c b/base/write_t1.c
+index 52902be..d6b2454 100644
+--- a/base/write_t1.c
++++ b/base/write_t1.c
+@@ -628,6 +628,7 @@ write_main_dictionary(gs_fapi_font * a_fapi_font, WRF_output * a_output, int Wri
+     WRF_wbyte(a_fapi_font->memory, a_output, '\n');
+     if (is_MM_font(a_fapi_font)) {
+         short x, x2;
++        unsigned short ux;
+         float x1;
+         uint i, j, entries;
+         char Buffer[255];
+@@ -759,16 +760,16 @@ write_main_dictionary(gs_fapi_font * a_fapi_font, WRF_output * a_output, int Wri
+          */
+         code = a_fapi_font->get_word(a_fapi_font,
+                                    gs_fapi_font_feature_DollarBlend_length,
+-                                   0, (unsigned short *)&x);
++                                   0, &ux);
+         if (code < 0)
+             return code;
+ 
+-        if (x > 0) {
++        if (ux > 0) {
+             int len;
+             WRF_wstring(a_fapi_font->memory, a_output, "/$Blend {");
+ 
+             if (a_output->m_count)
+-                a_output->m_count += x;
++                a_output->m_count += ux;
+             len = a_fapi_font->get_proc(a_fapi_font,
+                                       gs_fapi_font_feature_DollarBlend, 0,
+                                       (char *)a_output->m_pos);
+diff --git a/psi/zfapi.c b/psi/zfapi.c
+index 0b3ab1c..1ffef47 100644
+--- a/psi/zfapi.c
++++ b/psi/zfapi.c
+@@ -682,7 +682,7 @@ FAPI_FF_get_word(gs_fapi_font *ff, gs_fapi_font_feature var_id, int index, unsig
+                 }
+                 for (i = 0; i < r_size(DBlend); i++) {
+                     if (array_get(ff->memory, DBlend, i, &Element) < 0) {
+-                        *ret = 0;
++                        length = 0;
+                         break;
+                     }
+                     switch (r_btype(&Element)) {
+@@ -709,7 +709,12 @@ FAPI_FF_get_word(gs_fapi_font *ff, gs_fapi_font_feature var_id, int index, unsig
+                         default:
+                             break;
+                     }
+-                }
++
++		    if (length > max_ushort) {
++			length = 0;
++			break;
++                    }
++		}
+                 *ret = length;
+                 break;
+             }
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 6d425710b5..dae8dff813 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -62,6 +62,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-46953.patch \
                 file://CVE-2024-46955.patch \
                 file://CVE-2024-46956.patch \
+                file://CVE-2025-27830.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


