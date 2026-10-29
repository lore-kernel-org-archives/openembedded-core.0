Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17231.1793294309264531329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PJJFfOvY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261029171827a2d95e1f0400020706-f34tay@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261029171827a2d95e1f0400020706
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:18:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=tNHllWYp3t9KOerlTl2jmum22d/GK0vLQCA12omFtHk=;
 b=PJJFfOvYQTZJ38xhq8H7zxxS9dEZnxcQ5CSWQqq9+lDjnXzelk0rE4SMIV+Cusf3t9hm+V
 Tr9k+NCCZThThOLIYivn7GExR+ELkNfEvG86YsOjgya0HyRhFqKH+Fjzp9gC1mfkY1gDVS3c
 0XTvZRFtDsW/zNpHV2ua6rqwKN4rVAUlb/YZr2HRY9isYo0kVG74iNTenHWAAfUqS/MNEyv5
 k697KDDAKPaUHaxe0+2pKSbD4fkPwU1q/UvYvYf7M7UQ8d+vOT+/2BSp5nuwHdWXckylaDrr
 9AWPEWX+O3dNlIBfX4upTT9LtIFZCqiCjktrIj3FNYDZVZxayhVQ/XcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 7/8] libical: uprade 4.0.5 -> 4.0.6
Date: Thu, 29 Oct 2026 18:17:05 +0100
Message-ID: <20261029171709.2842512-7-peter.marko@siemens.com>
In-Reply-To: <20261029171709.2842512-1-peter.marko@siemens.com>
References: <20261029171709.2842512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248963
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Drop upstreamed patch.

- CVE: Fix UBSAN issue "bsearch comparator through an incompatible
  function pointer"
- RFC5545 section 3.3.5 Date-Time fixes:
  - Resolve local times in a fall-back overlap to the first occurrence
  - Fix explicit local time in a DST gap resolves using the
    post-transition offset
- RFC5545 section 3.3.10 Recurrence Rule fixes:
  - FREQ=WEEKLY with BYMONTH and BYSETPOS loses occurrences in the week
    straddling month boundary
- libicalvcard: the typed vcardvalue getters now check that the value
  type of the property uses the same union member as the expected value
  type of the getter. If the type mismatches, then they return the zero
  value for the expected value type. The typed setters error with
  ICAL_BADARG_ERROR instead of overwriting a value held in another union
  member.
- libicalvcal: Fixed a memory leak in vobject.c
- Buildsystem changes:
  - Fix build paths in installed cmake files (esp. for cross-compiling)
  - Install the libicalversion.h header
  - Fix building libical as a submodule in a larger CMake project
  - Fix "now" linker support check in the hardening compiler options
  - Fix the DESTINATION path for libical.jar
  - Use private linkage for 3rdparty libraries (icu, glib, ..)
- Built-in timezones updated to tzdata2026e.
- Remove ancient hack (since 2012) to support malformed TZID parameters

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3c04485f3effa61811fabadb52473ee29bc95f1e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...001-Mark-ICU-as-private-linkage-1366.patch | 76 -------------------
 .../{libical_4.0.5.bb => libical_4.0.6.bb}    |  6 +-
 2 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
 rename meta/recipes-support/libical/{libical_4.0.5.bb => libical_4.0.6.bb} (91%)

diff --git a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch b/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
deleted file mode 100644
index 53bd1683af..0000000000
--- a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 13642054f650795446f6020d9d2e14d147b8da51 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross@burtonini.com>
-Date: Wed, 2 Sep 2026 16:14:44 +0100
-Subject: [PATCH] Mark ICU as private linkage (#1366)
-
-* libical-glib: Hide some target options in the installed CMake files
-
-The build paths could be shown in the installed .cmake files, thus
-hide them from there, because they are not needed.
-
-Closes https://github.com/libical/libical/issues/532
-
-* libical: mark ICU linkage as private
-
-There's no need to expose the ICU linkage publically as the .so will
-pull this in itself.
-
-This has a side-effect of removing build/sysroot paths from the installed
-.cmake files.
-
-Closes #532.
-
----------
-
-Co-authored-by: Milan Crha <mcrha@redhat.com>
-(cherry picked from commit 38c7e6d31a3a1a4bd67479f402c323fb0679271e)
-
-Upstream-Status: Backport [libical 13642054f650795446f6020d9d2e14d147b8da51]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/libical-glib/CMakeLists.txt | 9 +++++----
- src/libical/CMakeLists.txt      | 2 +-
- 2 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLists.txt
-index d63bbf3c..470a4d22 100644
---- a/src/libical-glib/CMakeLists.txt
-+++ b/src/libical-glib/CMakeLists.txt
-@@ -24,16 +24,17 @@ if(NOT DEFINED LIBXML2_DEFINITIONS)
- endif()
- target_compile_options(
-   ical-glib-src-generator
--  PUBLIC
-+  PRIVATE
-     ${GLIB_CFLAGS}
-     ${LIBXML2_DEFINITIONS}
-     -DG_LOG_DOMAIN=\"src-generator\"
- )
- target_link_libraries(
-   ical-glib-src-generator
--  ${GLIB_LDFLAGS}
--  ${GOBJECT_LDFLAGS}
--  ${LIBXML2_LIBRARIES}
-+  PRIVATE
-+    ${GLIB_LDFLAGS}
-+    ${GOBJECT_LDFLAGS}
-+    ${LIBXML2_LIBRARIES}
- )
- 
- install(
-diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
-index 6fc2e953..583f2eeb 100644
---- a/src/libical/CMakeLists.txt
-+++ b/src/libical/CMakeLists.txt
-@@ -294,7 +294,7 @@ if(DEFINED CMAKE_THREAD_LIBS_INIT)
-   target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
- endif()
- if(ICU_FOUND)
--  target_link_libraries(ical ${ICU_LIBRARIES})
-+  target_link_libraries(ical PRIVATE ${ICU_LIBRARIES})
-   if(VCPKG_MANIFEST_MODE)
-     if(NOT APPLE AND NOT WIN32)
-       target_link_libraries(ical "m;stdc++")
--- 
-2.43.0
-
diff --git a/meta/recipes-support/libical/libical_4.0.5.bb b/meta/recipes-support/libical/libical_4.0.6.bb
similarity index 91%
rename from meta/recipes-support/libical/libical_4.0.5.bb
rename to meta/recipes-support/libical/libical_4.0.6.bb
index e9b093544f..7b9185c374 100644
--- a/meta/recipes-support/libical/libical_4.0.5.bb
+++ b/meta/recipes-support/libical/libical_4.0.6.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
                     "
 SECTION = "libs"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-Mark-ICU-as-private-linkage-1366.patch \
-           "
-SRC_URI[sha256sum] = "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b8965102581401e67c9c"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9adf573921fe9dceb0"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
