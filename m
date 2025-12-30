Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1141EEE499F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71732.1767125544084168785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SA23z+5H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0bae9aca3so148695825ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125543; x=1767730343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXQa1GRcOIbIMQ/wPR/YxDzxT1oHOY6+x6J7SlXkYqM=;
        b=SA23z+5HLdCT32/KqAQc2iqnwMmpmuqYkNulG8qNulOs3ae/CRM4cleOgTs2phAHxR
         r+262PMzHOyWiAKdeh0KmXwwWcMyYPHiwXMIdESpLLMpAjVxT0jqBss7ed3JOEBDOaHm
         HoMI36blCzS9K6nAYdtWfavHCt5+4gR+fNlHfiwH0ZhqyrTuSn6Hp46FSZj14/xu+Chd
         tvK3emIgjmV6tOM6X5DuUnh23kr+TNZ8pN4xb4B2gVLv2kbqVRSn7yLroIUV7A7UXW9U
         CAA8EsxBxADcjfG3zZX0iLKrU9cLirsId0y/FptuxvaE28RLmkpiyNL6wWmtSttIpNhn
         IkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125543; x=1767730343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXQa1GRcOIbIMQ/wPR/YxDzxT1oHOY6+x6J7SlXkYqM=;
        b=qFyaYCrI1SqBgGtwgORD+TzmKrzcgPs6Fclu5c31T1D/Yf1BcrEOvi2rYMAKxk+LCt
         XI8CGNQRcxBLiky9QtjfBFNltdr3aRrRvkiDbz+mo2IKy86GPs8RNiKlmCRGIR2HxcaX
         jGA0JCnWRXdMgNFgQHpl0T5kR2V9mKvTj2B66d2tTpatmSWG4zfzO1LMWp2uJFHT4ez2
         kbcdEHrPJyDCB2CNc4RWsYUVpCK/1P6XtocMiSvDcRmlN3gXX+R1W8NuTCzYo3qEkdrC
         TNPLezNEI4yg5fjzuL7ftceJb/OHL/V0sd7KW/mHSxlgLX0OOqqatkq7945gc+6GkSik
         H85Q==
X-Gm-Message-State: AOJu0YzGYTl6VBXa/ZrPbgBX1lb7DaYqbryzx//nWFxbSXZxm2PJj4is
	3uYlv5oe/9u7WNcisS4+pokdx8NJ5O31cRPBf137cns+SfDVCpcxG4xFo5woKTWoBtjyTINocCZ
	CdWWz
X-Gm-Gg: AY/fxX7PvXeo3uEYtCjXISdWYloUnszZzBia8FoAnr479UPTeAnhlCwJjPPmFDosSmy
	wGWuRedvhLFEi8IgjRLv61ZLXgtiDxB2j5jxVNAqPPhyzHM2RbrZv/JBL8/P2fZcebVVx0jnBFF
	+OpQZ7zVmYrp79vLErQUVGq6q0z4ewCTeAvKb/C6bRfCu2AjZlHRTOFlinMO858d6QIujuoIAmt
	BqYxBUG2SeHB7TKaIYI8Me+bbZ87PjzVqZKrvOH/drjqAs3dKuDhenSpPLBgZ2kFUKd38lDimiY
	Hs5Lxm1fJ4mX+aW18Of2HibgioJtkbKdYQsSS9coblEzXYegWW2oeZzwnJr8HRJ7Xap4NNChat0
	KxBvyZTWbF+304KjkIvgDA9YmvWfKwPE9KTCkO2wNj/z98cRZL7iJItVAH8kOgpKx06UnicCm1I
	KmRg==
X-Google-Smtp-Source: AGHT+IHqSA/ce1+KK6FB8DjG/j1nyq/BqqkwYCzIj+dgo+6FEMyYWX28UbFvYIaUYYxKuvm+692eiA==
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr355232525ad.18.1767125543248;
        Tue, 30 Dec 2025 12:12:23 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/29] glib-2.0: Upgrade 2.86.0 -> 2.86.1
Date: Tue, 30 Dec 2025 12:11:38 -0800
Message-ID: <2058d6255cd6a6ce77e769d991d9b8bd3de1f460.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228700

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


