Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB7BC624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5681.1788326836180601639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OaZldGE9;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so4189185e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326834; x=1788931634; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IogGLwXAEIqVsXBFAXtvkAj8bKKxRhqVfVSUZCvZxA8=;
        b=OaZldGE9E5OzTQvDJfWik51AA6Y31emPbJDR+Sbnpx0mgX/NGvKm6/LTnNHTAgdalF
         B0dNL8MQwx6qxPagLhr/vHaQwZBT4TE/i39Q3Sxp9PKwJHEgPm+ndUsEiVA0lnakx4xs
         ftQ0gHQl80IaSJeM8hF9XeLz9Zeqq4iFzfISo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326834; x=1788931634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IogGLwXAEIqVsXBFAXtvkAj8bKKxRhqVfVSUZCvZxA8=;
        b=tGZbFVOSwhXVrrQi6F57DV0Uog6gvxHeGpQynXDE3XK1KFOfm14oetBRGRrbeQLk7z
         TVzRdd3o+/7KJdSsUrG2yfRJ4Q1Y4Kfsn+hQT2BVgc/ludu4Iebb0Og9yJLSR2Z7yG/j
         jOBqvFInI0rOJOdWqAEFMPy3q63vXIvPyVBQiEwsh0OhxTXuhT0Yr5KmRqzn/UB0KV3W
         c5ncMC0nqGWQKzrSMFvREVDs8nDJVgGnhilUmUaPnnNwDCcMSnzdY9Hc4OrADmdqgf5G
         spsnzmglA2LY13WRTrSjyQcCttCU1d3PN2+rB1cz/PaN9NkE1HcoV+v4wEW89Ri2//b/
         oiuA==
X-Gm-Message-State: AFuF++kXZW3I0AGBNtmvpdd/dIi5zn07hz7Y75tsT6BtRtBNBmKKPECg
	fyVI1mVOtdVB5MnU4uvWgXWuZpONiBNAH0IBmw0X2FC2UfQ3CqspUGcaPyVDU7DGac3No9dgcn2
	zekAmNIA=
X-Gm-Gg: AR+sD105P2Ho7Wx/mbAyPdVNTwjmOB3jcV2JM1+9HHVATwAW454fsKGjHkkBp12Eciv
	E1V5OiFkjqmVvz4TXYYmnmZGflVa8IRLyRx5swo0ue6JHmhAqWgJsnRvhbU9GqYRlksZ1hEv1Hy
	OkLFOZRTBA2BTGlelY6U4AeAHpy1oIFYAa5pS5HDAfxliLWlHTemy+uM6ljI8440bMmnk6beI3E
	2TBOBZ8sR63M69lv/RjDLMJsZX3efbpj+NspHZlQZZA2Ypkl2o5yMhi8j0u2B0kr4ZwIRCQ/0Il
	1ipkrd7nPEnryZvN+ovoMdG0P9pNdmcA3cikn4IMKhqoYxtc/A3KWXYyozmF4bY04AYBnEun3z5
	3r+YpnlDrO4umALwlkh6REHYjIKclyT2d+O8Zz/FzWG+ioyaigOrTqakaSoYLkvcIcn49v4AHO2
	SERXZe1hPOJzyAQa1HaRJH9qfSGgV6aXTBG7lZf1yex4Zb0wu6iyrPIh/sDUp4+slytbpozDn0W
	rpWgkWA+waPMWe3JA==
X-Received: by 2002:a05:600c:a0b:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49ce5818612mr28058085e9.9.1788326834411;
        Tue, 01 Sep 2026 22:27:14 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/27] patch: Fix CVE-2026-56289
Date: Wed,  2 Sep 2026 07:25:43 +0200
Message-ID: <b1540647185015c99fbf421d889547a6c10e7e29.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244877

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56289

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48c1aa91e829a87c398e8c012cde45cd8c1aab0a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../patch/patch/CVE-2026-56289.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
new file mode 100644
index 00000000000..cfcb2216c35
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
@@ -0,0 +1,36 @@
+From a40c835ab06314526d623e62ae27830d0ad88752 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 13:16:10 -0700
+Subject: [PATCH] =?UTF-8?q?Don=E2=80=99t=20infloop=20on=20null=20ranges?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/patch.c (locate_hunk): Don’t attempt to optimize
+matches of a null range.  Instead, apply all the checks
+we apply to non-null ranges.
+
+CVE: CVE-2026-56289
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9]
+
+(cherry picked from commit faba04ef4f2b410257f76c1b9dc85e350929c4b9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/patch.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/patch.c b/src/patch.c
+index b348b5c..0e8d5c9 100644
+--- a/src/patch.c
++++ b/src/patch.c
+@@ -1146,9 +1146,6 @@ locate_hunk (lin fuzz)
+     lin max_offset = MAX(max_pos_offset, max_neg_offset);
+     lin min_offset;
+ 
+-    if (!pat_lines)			/* null range matches always */
+-	return first_guess;
+-
+     /* Do not try lines <= 0.  */
+     if (first_guess <= max_neg_offset)
+ 	max_neg_offset = first_guess - 1;
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index e0e44f9c977..74d9085c6b9 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
             file://CVE-2019-20633.patch \
+            file://CVE-2026-56289.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"

