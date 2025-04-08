Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DB6C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6951.1744145479660462414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vBPT0zjs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227b650504fso55349655ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145479; x=1744750279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfLtqcM8vaZKmosu0fp2wSEgynW2d7qyKJuZ1hJJycc=;
        b=vBPT0zjsCqISaj2Qj+zn264Um3mf4h9Kvh6cYjwbac0tfMK7UHRKjIfmFLi1IBJ971
         XRCmduQEephpESPYj5L99DovbKry151RVsvTmecyY2xgV6hKWh1TPXEbDM4XC93058CZ
         iBTa/mc3Ydt2MezxUbYXro35QEAqlyyYMzggmiFSvVEcYv1VNMCtk5Z86la2PexV16Y7
         nrpEuUeg7TQJJtU+oV845lyg8e8g6CSW5tGGlGGzt+zHLKCsbk99qg0+Ma0ZMHJCM4R6
         dVzaUXJxYEQ4LwCopuCwUBudnU4Z6dFNkybSTpanmtesST+WFbEcLlYNcEBBT2De09D/
         Y3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145479; x=1744750279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfLtqcM8vaZKmosu0fp2wSEgynW2d7qyKJuZ1hJJycc=;
        b=qYW/SWNHyJnpcCYC7GUgT3NtwIxpYC3HTqNO8IOB7BPbMIUtRkncXfg6FfYfpCFmyv
         8ZUO6GEJXfvFeCBpPa1VsqU1nAtG+1PWqjFO4OUnpnfi3x8tBrxShMyMQUMZ3nsjvnfR
         MmzVUVrLkN7ZjmikTLpHUz9Qb/dMZRr52w7ztCLVhACJpMgB3euvNVVXWzPuTD41dT5N
         2kuTGn0xt7rwXlbvk1Yf/+I8mZ7pKCc30sD0OV4pDo1IcCVIKj8/dblpUsGqOj/k1X5W
         QDRnZeHgdg6vf7jgur4B14Q4sKr31p1xjiVAdSpJM67wYwlpFNkeFFx0CoWPqN6VxBcx
         7sHQ==
X-Gm-Message-State: AOJu0Ywc5a9r7IWP8z2tNeW2jjlChG/xb0bYU5rz+29x1P0krlXi67X2
	HVJnHN8dD4vkI1iZAokh9r2PiTh9gDV4cyasEZzAIRtZWoH6JppoO7+5qX14qOmrem6EEKrNias
	t
X-Gm-Gg: ASbGncu8EofTIn99yHS0hi424x1OLsw7lwylGjXqCBZAZdxf05qsInRuudl6SRB8Ori
	eZbeyVQdYIlN0faP3+6tJ/XTRR5wh5pT0aL1uZIp8NprV8yhVCdUIdqXwaOeU3rdZz7bVNAy/bA
	zvSSC4gKQ1JQ943pckF3X65SuZpnwMBdFgbnm63X31WelIyDzJfj5xqegvLbCsQcM3cxxWpMA2Q
	uTh62i9m9Dxcerd5OkpYi81LPl6Ui3pgBJ3W1OFiKlMVlp3z/9Plyp4x/NhrEpx2+yPpZhCuSjS
	iqVuQGVQZ2jCTl4hK34Kxn6lPA3mJlUU0CPa
X-Google-Smtp-Source: AGHT+IHhaoduymjcoSrFFxPoTdBRV+eCPiF0mg9zZxQTH43YJLIHhNDAKyRp12i9yBS5SH6ua2Zxjw==
X-Received: by 2002:a17:902:f68a:b0:224:6ee:ad with SMTP id d9443c01a7336-22ac400e421mr1723535ad.44.1744145478743;
        Tue, 08 Apr 2025 13:51:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] ghostscript: Fix CVE-2025-27830
Date: Tue,  8 Apr 2025 13:50:59 -0700
Message-ID: <bc74ad209b243b131ea5467b871339f1773ba64b.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214558

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8474e1d6b896e35741d3c608ea5c21deeec1078f]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


