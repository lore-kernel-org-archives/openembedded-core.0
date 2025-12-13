Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2792AD5AE56
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2974.1765620019196582890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJET1ERA;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f0f875bc5so24817225ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620018; x=1766224818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOFu0keRoyLECiYm7nl/uh31crLEko01fzKctLbvx8k=;
        b=QJET1ERA3zj/F9XVGVMHde6CaH1B8f+uDREX6qwP2O1VpGKawnC+ubZjMQONuM6nYX
         tlsQfxW5dLM464majsHYnamKcEc4CXeZTsqJUObM4l1qVrQq4WgCSMqpD4X+PNowEl9B
         7w6eB3M7etDSG5eZl8V1BtMn4QQIHSseQsihzyh3jDkwSsm9EqSOpq+JdFoK1MidAjr+
         6XYRi8q/yarfg+9htSc9l9l7+5T7zACjZM+r/3o/gSikQc+96JpMTZ0xqtox/xCWByab
         V8Fv6dVXSaFdEfZ3Mzh8EJhUXxZzBASATr0egfnAmjzSwkPFsWq9MBjkCPhZgP1LJKdp
         TYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620018; x=1766224818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOFu0keRoyLECiYm7nl/uh31crLEko01fzKctLbvx8k=;
        b=Mm5fIMj6PFnQN9oEwCBYx+a38hWcK8EiLY5p1vHs1CBO/v5F7o/m/6hM9qaFrtMzsn
         W+zdn385MRWtJ/L3afYJ6PUbAzYdmlDVVPVxU4KEv09nsjXMrvDcgT62Wn1h5SiEbag2
         rEa+chTzs5Tp0sJ6zHk3oaM8jSEEcU6Gu9BxLqVQrx/Ne+YrG/GsOG9vDlBeZA0VOhAb
         hake03LPgim+8C/LRLCKHqpftFk4mMen+i0Q38dzYFT7OP07inLr5JZWJobC8h1Ji52P
         wCEYZBE+I9uZvPOYjrlHWYQmDYIeAvDym/l2yOoR9xEyCWoWV+fI+oCSq21bbGKVhwL1
         97Ww==
X-Gm-Message-State: AOJu0YxGmV+gkY6c/srXkW3eXzRc00UEvbY3AcWjqkn9Kmt28lAKq8h1
	/Ia8QYX77TQFeVtC3v+hsmzNlYgXBxhnJ2pke3o4LyxuLoRVD4KuecDFxWSstJt4
X-Gm-Gg: AY/fxX4tz0bBWFTO+FYddDikMhjh1W77ZKjFJ73NPdavV6uvoVGsghSIBPMletwxRcZ
	/LOwhKQGNYsI4Db4A6N3+Y7MQ+Sxb594vidUvraSf34P/ZqQNVvRKxiwx3dbGdQGLX1Rl/Sa3d7
	2QrC/B04l0+C9uoqize6V8bt4XIVjEYbKe9spD4O6TB2YmU4v5Yzw7lrvtSHApP10zCMNbiS3BB
	4ybPOqp9bfcQCrtTktZ1nTBh3zxHPtAm+AwskEiFIYcMcCQ3ydJppJtbtmrwSvhPGJSl7EVqrDO
	6ffzX8ruuvNNCIF8JeqhXD6YMCl1fmfNFAXo7XNYwR0Ogikn8saJDT2r44OzUS9HaXw28XF57z3
	gwYvs8sL2dxaVUK0HnAeq/EJ8LLUv6PaFC9WU0nIhfEAq5mu1i2UKijrStfpUZQzV2v4d0/OpaA
	U5GyQ7ZDgqvDxHOCMFuzY/j3z2
X-Google-Smtp-Source: AGHT+IFOTfLB+8VBdBGxs5LribkkBoiqKvRaacjqJ5m+DPHghF+/iHbcpHuPEsqct/8XdcpH0MXyKA==
X-Received: by 2002:a17:903:190d:b0:2a0:941a:6b08 with SMTP id d9443c01a7336-2a0941a75bamr17031835ad.21.1765620018363;
        Sat, 13 Dec 2025 02:00:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 15/67] glib-2.0: Upgrade 2.86.0 -> 2.86.1
Date: Sat, 13 Dec 2025 15:28:39 +0530
Message-ID: <20251213095931.2571498-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227633

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

