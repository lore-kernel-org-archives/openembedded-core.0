Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7E2CA0FE7
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.721.1755790819569098880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P8j+rbt+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b474d0f1d5eso791184a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790819; x=1756395619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSIVWc8ig0idkIf27VPU3O4BQPjtI4rjP0mzsKkjS1w=;
        b=P8j+rbt+5Kr390UozS6dRvXgaXGExutt6Kj4mAV7vDefXrXR+nK7uHPZDA8hIxknby
         tCQq+dzt41LT7s/VjR0d6EL4rtBkSdQn2d/FljqE3HJMBgo2gC3IhK08Mg5XThVUTQv4
         FAMzVfzD3jZyelxw+dry/7rYTdPlGpLKWRoq0xCMiIQAN9ooJ0yrwLAKETxlCnxtnhqg
         erQCozo+kaeeRtaF+AyMrK/yUJRQal+yCY6D/+veJl8WnRS6AVlYUyUwBoWbc3T643q3
         eSDgvYcff9GYqNdu6KPs+zaO3QgxVUaqqaaYv9h+gYvHnflE0JstT11mJd88s0JgZw4g
         OQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790819; x=1756395619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSIVWc8ig0idkIf27VPU3O4BQPjtI4rjP0mzsKkjS1w=;
        b=kPd90i1BQrhnmfK7dPbN0pXo+NIFk4AVhJfI6esyWWZoZzKvr4i608JV6UHdxR9n7G
         jfF1Pc+RrROVR+8RGd2LUjgYeZWbIM3U1T7rGlfqMd80HaGfSoFD5xuu3P9EB3rXEeRY
         k/b28XuVPl3deEZN7Wmh3CWLMhkPpv3JQQm2jizhwGftqrn0AoNQ9Rf8bk3FZdN6omAj
         GSdZEpC3h/1BG2222cT+gbKk1ANit2QPMK8uVaCx4SgV7joycSDv4MEZle7S7axb9RhD
         /XcSzP56lkJfCyDjY961y97Ja1DxJcOyuo4Yikld5oR5DEVv/O+9toNu1KwqHsEfdJlE
         QJPA==
X-Gm-Message-State: AOJu0YxxvZC9/XFzOjUMPGmfuLYaY7u1qsmwunily9mIoOi9ZD6jLsyG
	Gmkwr8roN1aUfknjthG+37npWozemB/eljRwzp3+1ZFCChqhd8wm873K4cUZWaxLVrBPYMXLmtt
	UuvRs
X-Gm-Gg: ASbGncsAw+duQHGINzH9T3W0OVF/EiCrAk2iL70ru+3RdN3Hj7R4r3/utYuiRwGWnXx
	D5d1wHkHCyZKM/uZTzDLR+3UAuldp4zqwoz6U7rY29gAVWWJHhkCGseVpa0k2/vFyJGIMfC6VLi
	Q6BoL2d53pHY9U2cXwhtDVLHEdWeapEaG64Vz/d7vfUwuphtuYDcF0lkszLxFPqqoP3YV/thitP
	KvICJQmlsl2GVvVBMaOreowgDOgmQo/IaiscAatwBkkpG3lyhRK2IYsdKt9riujg1weyb42y6Fw
	GvCtcyqRu3R++nh+oJPlPYd3tWd7BAcgg5KPazrEgxnXyBOvimS1jy4hFBF276KmhUDQ8wCiqJJ
	63TubRR8pEMtaRA==
X-Google-Smtp-Source: AGHT+IGyAQ2sAGfBS6asz/A2i35YDG5D3ExTgpNsQW1lXZeYd5XfR6N3Y8wyNzzeh/prJki8HfaKMA==
X-Received: by 2002:a17:902:db07:b0:234:9656:7db9 with SMTP id d9443c01a7336-245fedcc650mr38574605ad.32.1755790818717;
        Thu, 21 Aug 2025 08:40:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/15] glib-2.0: update 2.84.2 -> 2.84.4
Date: Thu, 21 Aug 2025 08:39:50 -0700
Message-ID: <8d5df566ef2c3d342ca0eb2421b4a583b02969da.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222258

From: Peter Marko <peter.marko@siemens.com>

Overview of changes in GLib 2.84.4, 2025-08-08
==============================================
* Bugs fixed:
  - #3716 (CVE-2025-7039) (#YWH-PGM9867-104) Buffer Under-read on GLib through
    glib/gfileutils.c via get_tmp_file() (Michael Catanzaro)
  - #3721 GFile leak in g_local_file_set_display_name during error handling
    (Philip Withnall, Michael Catanzaro)
  - !4668 Backport !4667 “Incorrect output parameter handling in closure helper
    of g_settings_bind_with_mapping_closures” to glib-2-84
  - !4675 Backport !4674 “gfileutils: fix computation of temporary file name” to
    glib-2-84
  - !4679 Backport !4677 and !4678 “Fix GFile leak in
    g_local_file_set_display_name()” to glib-2-84
  - !4697 Backport !4696 “gthreadpool: Catch pool_spawner creation failure” to
    glib-2-84
  - !4705 Backport !4702 “gio/filenamecompleter: Fix leaks” to glib-2-84
  - !4711 Backport !4708 “gfilenamecompleter: Fix g_object_unref() of undefined
    value” to glib-2-84

Overview of changes in GLib 2.84.3, 2025-06-13
==============================================
* Bugs fixed:
  - !4656 Backport !4655 “gstring: Fix overflow check when expanding the string”
    to glib-2-84

!4656 solves first half of CVE-2025-6052

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0001-meson-Run-atomics-test-on-clang-as-well.patch    | 2 +-
 ...1-meson.build-do-not-enable-pidfd-features-on-native-g.patch | 2 +-
 .../{glib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.4.bb}  | 0
 .../glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.4.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index e5878a1428..5ad2a0375b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -17,7 +17,7 @@ diff --git a/meson.build b/meson.build
 index a8bcadc..041b68e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2075,7 +2075,7 @@ atomicdefine = '''
+@@ -2077,7 +2077,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e512940e34..aa098da379 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -17,7 +17,7 @@ diff --git a/meson.build b/meson.build
 index 041b68e..155bfd4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1073,7 +1073,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1075,7 +1075,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 819f3ff50a..c171598bed 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,7 +234,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
+SRC_URI[sha256sum] = "8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.43.0


