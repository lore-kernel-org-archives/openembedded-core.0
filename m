Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CE5CA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.706.1755790815123177119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jLxkMVYG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b476c67c5easo808855a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790814; x=1756395614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntEW3I7zDRK6EH668tU81tBkECIzEIvm3FEbx8k9vKs=;
        b=jLxkMVYGvMxI+Nvop7aTwqHmaTZeLOBynF9GyKvT6fpRaMwbcw6Z1pA3FN5Iwif3s6
         G5B+aQ5kIJd4mT0KIGhDdNHop3XYhuvjzoSvCqPuN5fKwgQBYPXAtsCeNLrYz1js+Pdz
         xr/Gekb0SWXQeWoHfwneX1p/yxZWx734FkbZQ92Oxm3gvn9C+fJmW6f2YhBHHVwsfI+a
         JtYDPXv1FuqqnyYrT5zQaG3KA8BBh8f7ZShaMXUDhBI+fvtQ9XPrRlop9nnvaOzLiMgP
         LHfYZrC+cbbvLrbpYH+g5xEIa5DTsGh6N3/PK12qAPow05m4i+7LIGCqww/RcIYRoqU8
         gm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790814; x=1756395614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntEW3I7zDRK6EH668tU81tBkECIzEIvm3FEbx8k9vKs=;
        b=IHUkgSsv7yRdMlHABuWwAVyqs8q5NRkEyUUquzVHMpGh0WzbAQkuOmpuxg4gLfnZZN
         kEk2R99OFo09x/rqHc81JWy1vkp2kAj7XX2iipEDG4wuDT74iekV+63OSKRtx1xbGJDX
         EO6/hxjaE3+0gAd7pYwBzOYNI+ZaBSEMmvsp8y9DNIu+Ip0J4DKOGehp7k0MVhm7hIy2
         SAgrRjX6kKfBYbTqUbye33rcnLMB7sK1HDUWMaX46DZRJGxYcB1U4QmrrKml9D4gglim
         BI3z+cpGQ8JywpmCf4UF5C5hepMxfC+AfujNyYL4bI3SkhL1A3cYUNbFuQHhVxzjiNgN
         vDqw==
X-Gm-Message-State: AOJu0YwoFOelunLw/FAon6J4/Hn4iEuPwEe5FYIkvC4QFX5midI3R5UK
	gMmxq/iV+pEnn5X1nCxJkv+31Ujg1svq/PxNxAzmhG/btcu4ld4bfXtgCgsriL7mUXKXHXFtrWx
	iVE2m
X-Gm-Gg: ASbGncvU4yw0t4WlNdzbenrepybaktBDZjP/wlx09hgCdYQXqSxuoNHEmi9KyhSbfwj
	O0wGbEb5qVvJlK4cIvpJsHqRAUB4bl7TfEAp1BCHC3z62+6pYE04dedj3Fg26ifxno3MvoPmqiT
	pZlKlI2HL20o1P8678JS0vx1iAgv4ECMfPZHnWsivg+a3ddrIYokG8nSfDNIFYh4eNI6/fv+WaK
	1LHf1oTYpW6G63nKubd3diWW2oZJO1l2oMy6sqqudo0469TMZkmZ2WUz/ilX+b+68+Q3fImEZaD
	OcM6Ce4DcNLOmNDooUtUI1h417olGUfVH/im5g/qVthj4+wiG7AUG7kjN0FkKR/vUSuQtlxOBr8
	X+P+x+eHRSnR4kQ==
X-Google-Smtp-Source: AGHT+IGG6a2iVBDK5XZhXK293E0qAYgiFhYLsrs4mjtI/lW52a8TyoBqR2ICypKm7mLhXAVuen3R+w==
X-Received: by 2002:a17:903:2390:b0:242:c66f:9f62 with SMTP id d9443c01a7336-246065e8ea3mr30026445ad.26.1755790814189;
        Thu, 21 Aug 2025 08:40:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/15] glib-2.0: update 2.84.0 -> 2.84.1
Date: Thu, 21 Aug 2025 08:39:48 -0700
Message-ID: <d818b5952001bacd4dbb24ea475df33e50bc1b53.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222256

From: Markus Volk <f_l_k@t-online.de>

- remove backport patch

Overview of changes in GLib 2.84.1, 2025-04-03
==============================================

* Fix test failure when building against gobject-introspection ≥1.83.4 (#3634,
  work by Philip Withnall)

* Bugs fixed:
  - #3630 2.84.0 build failure on Linux: ../gio/gnetworkmonitornetlink.c:47:10:
    fatal error: netlink/netlink_route.h: No such file or directory (Philip
    Withnall)
  - #3634 test failure with gobject-introspection 1.83.4: warning: element
    doc:format from state 3 is unknown, ignoring (Philip Withnall)
  - #3636 gio/trash does not handle special characters well
  - #3642 `g_cancellable_connect()` documentation incorrect (Marco Trevisan
    (Treviño))
  - #3643 g_cancellable_connect(): is it safe to unref cancellable from
    callback? (Marco Trevisan (Treviño))
  - #3649 Crash with some registry key values in GWin32AppInfo (Philip Withnall)
  - !4484 Memory sanitizer fixes
  - !4489 gobject: Be consistent in using atomic logic to handle the
    GParamSpecPool
  - !4541 gsettings: Port docs to gi-docgen format, add missing annotations and
    make various improvements
  - !4544 tests: Don't install runner scripts without installed_tests
  - !4545 Update French translation
  - !4547 Update Catalan translation
  - !4548 Update Turkish translation
  - !4551 Updated Danish translation
  - !4552 Update Persian translation
  - !4553 docs: Document GSignalFlags members added after 2.0
  - !4554 Update Indonesian translation
  - !4555 tests: Add a test for g_object_freeze_notify() being called too often
  - !4557 gfileinfo: Slightly expand docs for
    g_file_info_get_attribute_as_string()
  - !4558 gi: Dynamically set doc-format
  - !4561 tests: Various fixes to create temporary files in /tmp rather than the
    build directory
  - !4562 gdbusnameowning: Convert docs to gi-docgen linking syntax
  - !4563 giounix-private: Fix macro for checking for epoll_create1()
  - !4565 Fix LGPL in header
  - !4567 gutils: make documentation of g_set_prgname() clearer
  - !4568 docs: Add some detail
  - !4569 Update Romanian translation
  - !4570 gspawn-win32: Fix potential integer overflows in argv handling
  - !4571 gvarianttype: Improve docs on type validation

* Translation updates:
  - Catalan (Jordi Mas)
  - Danish (Ask Hjorth Larsen)
  - French (Vincent Chatelain)
  - Indonesian (Andika Triwidada)
  - Persian (Danial Behzadi)
  - Romanian (Antonio Marin)
  - Turkish (Sabri Ünal)

(From OE-Core rev: 676b9acbe94f055a351da3bdcfbe457411e1877c)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This upgrade fixes CVE-2025-4056

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...664e6f1a29e0d5f301979f6d168b08435a61.patch | 75 -------------------
 ...l_2.84.0.bb => glib-2.0-initial_2.84.1.bb} |  0
 ...{glib-2.0_2.84.0.bb => glib-2.0_2.84.1.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 4 files changed, 1 insertion(+), 77 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.0.bb => glib-2.0-initial_2.84.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.0.bb => glib-2.0_2.84.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch b/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
deleted file mode 100644
index 28bce02dc3..0000000000
--- a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From aee0664e6f1a29e0d5f301979f6d168b08435a61 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 10 Mar 2025 15:21:15 +0000
-Subject: [PATCH] girparser: Ignore new doc:format element in GIR files
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-As of gobject-introspection 1.83.2, a new `<doc:format name="…"/>`
-element is supported (as a child of `<repository>`) in GIR files.
-
-For the moment, this information isn’t needed in libgirepository — but
-the GIR parser does have to know about the element in order to not throw
-an error claiming it’s invalid.
-
-This is a slightly tweaked version of the code added to
-gobject-introspection.git in commit
-9544cd6c962fab2c3203898779948309833e2439 by Corentin Noël
-<corentin.noel@collabora.com>, reformatted slightly to fit in with
-GLib’s style guidelines.
-
-This is backwards compatible and does not require a new
-gobject-introspection version.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3634
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- girepository/girparser.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/girepository/girparser.c b/girepository/girparser.c
-index 63143718d9..be88d871a4 100644
---- a/girepository/girparser.c
-+++ b/girepository/girparser.c
-@@ -107,7 +107,8 @@ typedef enum
-   STATE_ALIAS,
-   STATE_TYPE,
-   STATE_ATTRIBUTE,
--  STATE_PASSTHROUGH
-+  STATE_PASSTHROUGH,
-+  STATE_DOC_FORMAT,  /* 35 */
- } ParseState;
- 
- typedef struct _ParseContext ParseContext;
-@@ -3159,6 +3160,11 @@ start_element_handler (GMarkupParseContext  *context,
-           state_switch (ctx, STATE_PASSTHROUGH);
-           goto out;
-         }
-+      else if (strcmp ("doc:format", element_name) == 0)
-+        {
-+          state_switch (ctx, STATE_DOC_FORMAT);
-+          goto out;
-+        }
-       break;
- 
-     case 'e':
-@@ -3843,6 +3849,10 @@ end_element_handler (GMarkupParseContext  *context,
-           state_switch (ctx, ctx->prev_state);
-         }
-       break;
-+    case STATE_DOC_FORMAT:
-+      if (require_end_element (context, ctx, "doc:format", element_name, error))
-+        state_switch (ctx, STATE_REPOSITORY);
-+      break;
- 
-     case STATE_PASSTHROUGH:
-       ctx->unknown_depth -= 1;
--- 
-GitLab
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 61e1a3ef17..4368e51df8 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -229,13 +229,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
-           file://aee0664e6f1a29e0d5f301979f6d168b08435a61.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a"
+SRC_URI[sha256sum] = "2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.43.0


