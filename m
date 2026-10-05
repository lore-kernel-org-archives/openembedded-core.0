Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F46ECA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 11:10:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17695.1791198605632305614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 04:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BIR0RVul;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A38D6152B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 04:10:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B606F3F86F
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791198605; bh=xrkg7FLSTb1XBPamfsB47ZvTiXBl+2I16BuL3nJND5U=;
	h=From:To:Subject:Date:From;
	b=BIR0RVulJCge+6CZv+6l174+YT/rooPvY8KQAf195AeA3y1UpRRCPC9riXGNtBXsq
	 gTKSFHeNGsyx1x4ovPGULVy9l6oWhE/gIEvTzI+AaUTxVTwi73Re8kaCbiS0uzfzgH
	 TC6ybMv5XXYcoROxkHIGhsFoOhHFm1MQMhHJOlaE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libical: uprade 4.0.5 -> 4.0.6
Date: Mon,  5 Oct 2026 12:10:03 +0100
Message-ID: <20261005111003.1558680-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 11:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247239

Drop upstreamed patch.

- CVE: Fix UBSAN issue "bsearch comparator through an incompatible
  function pointer"
- RFC5545 section 3.3.5 Date-Time fixes:
  - Resolve local times in a fall-back overlap to the first occurrence
  - Fix explicit local time in a DST gap resolves using the
    post-transition offset
- RFC5545 section 3.3.10 Recurrence Rule fixes:
  - FREQ=3DWEEKLY with BYMONTH and BYSETPOS loses occurrences in the week
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
---
 ...001-Mark-ICU-as-private-linkage-1366.patch | 76 -------------------
 .../{libical_4.0.5.bb =3D> libical_4.0.6.bb}    |  6 +-
 2 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-Mark-ICU-as=
-private-linkage-1366.patch
 rename meta/recipes-support/libical/{libical_4.0.5.bb =3D> libical_4.0.6=
.bb} (91%)

diff --git a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-privat=
e-linkage-1366.patch b/meta/recipes-support/libical/libical/0001-Mark-ICU=
-as-private-linkage-1366.patch
deleted file mode 100644
index 53bd1683af2..00000000000
--- a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linka=
ge-1366.patch
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
-This has a side-effect of removing build/sysroot paths from the installe=
d
-.cmake files.
-
-Closes #532.
-
----------
-
-Co-authored-by: Milan Crha <mcrha@redhat.com>
-(cherry picked from commit 38c7e6d31a3a1a4bd67479f402c323fb0679271e)
-
-Upstream-Status: Backport [libical 13642054f650795446f6020d9d2e14d147b8d=
a51]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/libical-glib/CMakeLists.txt | 9 +++++----
- src/libical/CMakeLists.txt      | 2 +-
- 2 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLis=
ts.txt
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
-     -DG_LOG_DOMAIN=3D\"src-generator\"
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
-=20
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
---=20
-2.43.0
-
diff --git a/meta/recipes-support/libical/libical_4.0.5.bb b/meta/recipes=
-support/libical/libical_4.0.6.bb
similarity index 91%
rename from meta/recipes-support/libical/libical_4.0.5.bb
rename to meta/recipes-support/libical/libical_4.0.6.bb
index e9b093544f1..7b9185c3742 100644
--- a/meta/recipes-support/libical/libical_4.0.5.bb
+++ b/meta/recipes-support/libical/libical_4.0.6.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6d92944=
93d031c817783b0400a126c89 \
                     "
 SECTION =3D "libs"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-Mark-ICU-as-private-linkage-1366.patch \
-           "
-SRC_URI[sha256sum] =3D "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b896=
5102581401e67c9c"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9a=
df573921fe9dceb0"
=20
 inherit cmake pkgconfig gobject-introspection vala github-releases
=20
--=20
2.43.0


