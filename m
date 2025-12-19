Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C40D711DD
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:26 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9461.1766114544896766987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNcRTfS5;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso1407034b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114544; x=1766719344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOFu0keRoyLECiYm7nl/uh31crLEko01fzKctLbvx8k=;
        b=jNcRTfS585GEC3+yNZ4mkkvOh6W+6qrZ7hTGHQnuq4oRLaSFDMpFIlzkU2ubnhyuDj
         m0K/9qpcb3gD50PSVV7f3Aph1Hy4sAo0kbOWkxUgGKMK2NEoApAAlPXTs5vLK3DBVI4Q
         V4Q7xu5byT1MSzMZbpgJaE4DKhB4c9tlzV5SuN0Rtq4SobNqZNjNcq5uyMSQHZk64hmM
         LoYZb8pt4pwZX+G+K3clXxYHMJDIKwD3Q/67ho3bsQaSHRd1OokNO88rD+NYZvuxEB7E
         DGsEdD4xhwuYUe/099LwN+E0+QhjnYjEBy6xOoTm5TtXUnU0Z9vVW/UzW1LN4UtmjmoK
         lBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114544; x=1766719344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOFu0keRoyLECiYm7nl/uh31crLEko01fzKctLbvx8k=;
        b=AFifXTXkvmceMy6KtXKokIMFMEUHTxVUdQj1OIU+MUAI9mDQAh0/FHAMpObLD+pEsJ
         eZFrP50lL7HIbpUZHtt/xmpvzPnThnlwGB7ybW30MWGWbXcuYn0kAjcDC/9urm01qUvO
         psKITbovOILTR1K6bACFKWa9jWUQHl2h6tB1/tdEMcrgTYVlZ2wHyWPcl02CnFHQyz6+
         tBk5m3E6+8r1FBJGqkJQw3YAo2kWwDMWwn58IdN5LKvNqnbrlibDyFigwHqF5+9BWn3V
         3kStnVEyeGNsiQuMBOjjOh/v5kM9mhYJXOueA+cDtRcek7RxOPdGd20F8mYBWWDxeG8g
         ygyg==
X-Gm-Message-State: AOJu0YyZXlxkJRhmdwqsjBqQBPGaD8khl+gaijft8U6wukzuBo3Y+IWf
	q6d/6OC+3t7LwHeUc5iMd74RTCLUrCyVMHMhBvv+rhR1wOedlpA4A18j1lRlbw==
X-Gm-Gg: AY/fxX6ufudp8muF2Vm+0xJgU4OqKw0uwcxO0U/W47vvQlj8TZeXCKivtc/R34agtC3
	0xF+2cqPFjvnbXUrhxIy2KBo+ZkujQ0xSAbSgEZanX5D6slMZQ29a5SMEO87KwfSWGfg51BFizi
	1jzc5LNdJwbQYsfrWlG6QIblVjxMolmDbHLllIJcnVb5ZChUo2FGG83r1ft384pVajN5Ql+Ci/x
	t0eN7VJ47let58HHV/d6vyePi5Jx2bTSUzVgXSTIzpwspU/+oxIxuvTYNAUf8vGZiX2t3z8Zr7k
	65vBcHH2KvIgmTewFnCGrq3GhCEwa5y3cH5JQjmahuP9BLslDuBOzY6RtThy+DyZeWzdma9tU2T
	HOTL7MxO+wFAM/eD1R2H9aFNkrzrt8bahJa3V25Km+VZQNuRAFi0rztnC5scJ9/i0fdmbEX6YJX
	OCT0jC7m5zGPLQ+vkiCGqrGiVI
X-Google-Smtp-Source: AGHT+IEmhA+sECvxt+cxsxVxZuMjeI3Z7mrKdFB+A+xkYRjN+0fYIQdYsqAkl5I/EDFTgtdZJjtK3A==
X-Received: by 2002:a05:6a00:3c8e:b0:7ff:ce33:e6b0 with SMTP id d2e1a72fcca58-7ffce33f6f9mr387644b3a.10.1766114544060;
        Thu, 18 Dec 2025 19:22:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 03/29] glib-2.0: Upgrade 2.86.0 -> 2.86.1
Date: Fri, 19 Dec 2025 08:51:42 +0530
Message-ID: <20251219032209.960840-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228171

From: Jörg Sommer <joerg.sommer@navimatix.de>

Overview of changes in GLib 2.86.1, 2025-10-21
==============================================

* Bugs fixed:
  - #3745 GIRepository: union fields offsets for compiled typelibs all have
    offset 0xffff (unknown) (Philip Chimento)
  - #3780 `gio/tests/socket-listener` requires dlsym
  - #3781 GLib.OptionContext's get_help() includes width of invisible options
    (FeRD (Frank Dana))
  - #3783 [CI] Pipeline on 'main' failed for commit c31c4a52 (Tobias Stoeckmann)
  - #3784 Memory leak related to g_get_home_dir (Michael Catanzaro)
  - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with non-existent
    paths (Philip Withnall)
  - #3803 GNetworkMonitor's netlink backend doesn't notify connectivity change
    (Philip Withnall)
  - https://gitlab.gnome.org/Infrastructure/Infrastructure/-/issues/
  - !4755 ghash: Fix entry_is_big for CHERI architecture
  - !4756 ghash: Handle all table sizes in iterator
  - !4760 gbookmarkfile: Escape icon href and mime-type
  - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code
  - !4775 Update Ukrainian translation
  - !4776 Update Catalan translation
  - !4777 Update Lithuanian translation
  - !4778 tests: Fix clang compilation warnings
  - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul
  - !4780 Update Brazilian Portuguese translation
  - !4781 Update eu translation
  - !4782 Update Korean translation
  - !4785 Update Japanese translation
  - !4786 Update Galician translations
  - !4787 Update Hungarian translation
  - !4791 gstrfuncs: Check string length in g_strescape
  - !4800 gutils: Improve load_user_special_dirs' user-dirs.dirs parser
  - !4802 Update Turkish translation
  - !4809 Trivial backport of "gutils: Handle singletons in unlocked functions"
    to glib-2-86 branch
  - !4814 Backport translation updates to glib-2-86
  - !4821 Backport !4820 “gio/tests: Fix a race condition in
    /gdbus/connection/flush” to glib-2-86
  - !4828 Backport !4827 “ghostutils: Treat 0x80 (and above) as non-ASCII” to
    glib-2-86
  - !4834 Backport !4810 and !4819, various fixes to user-dirs.dirs handling in
    gutils
  - !4836 Backport !4835 “Update Portuguese translation” to glib-2-86
  - !4839 Update Romanian translation
  - !4842 Backport "girnode: Fix computation of union member offsets" to
    glib-2-86
  - !4848 Update British English translation (2.86)
  - !4865 Backport !4859 “gopenuriportal: Fix a crash when the file can’t be
    opened” to glib-2-86
  - !4867 Backport !4792 “gtype: Use transfer none for types (un)ref functions”
    to glib-2-86
  - !4872 Fix macOS and msys2 CI builds on glib-2-86 branch
  - !4873 Backport !4871 “gnetworkmonitorbase: Add missing notify::connectivity
    signal” to glib-2-86

* Translation updates:
  - Basque (Asier Saratsua Garmendia)
  - Catalan (Jordi Mas)
  - English (United Kingdom) (Bruce Cowan)
  - Esperanto (Kristjan ESPERANTO)
  - Galician (Fran Dieguez)
  - Hungarian (Balázs Úr)
  - Japanese (Makoto Sakaguchi)
  - Korean (Changwoo Ryu)
  - Lithuanian (Aurimas Černius)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (Rafael Fontenelle)
  - Romanian (Antonio Marin)
  - Serbian (Милош Поповић)
  - Turkish (Sabri Ünal)
  - Ukrainian (Yuri Chornoivan)

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 9538bb86a050901e0cc0e6b696517f40e7b5f436)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb}  | 0
 .../glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e8dde2820..5909851896 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408e4d1faea580d6d"
+SRC_URI[archive.sha256sum] = "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

