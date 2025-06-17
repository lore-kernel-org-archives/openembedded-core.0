Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2444C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.23019.1750176018695143120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ytYQjtrm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23508d30142so69166625ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176018; x=1750780818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z64I615mjWajNuyUrXHz0qxIwvT/ba1pz8YjZ+8H12Y=;
        b=ytYQjtrmhtKzDO+px1JmSzyulcE/e3HEBIPPzl8WHZO6YknNq40cCkJ2yfLf5WEY5D
         DDu/OmsxhEd4BNVbsohVhPW1DjyYjkchxiiBlT3p9E3D3TLeCPBdwI2RDew7s4YN6LeH
         yuqgQAms61Kj068aHd9CGk7KSVTkU4vBQH7aWyPGZ7bWeyZsMhQvPKKLq3o8OXMiRl95
         ZJB8XlawqEhjGufWTj58411JOPoxd8GbuWRdjat+NRADAtyNU/Qnd1trHifxYdoFncyV
         LZxc9EyQQuc0KfGVBDQxrnmSqVgofjQ2wlhNX7U0eSBvqvLTZPxUUVNacgryGEMiKm3Z
         oS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176018; x=1750780818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z64I615mjWajNuyUrXHz0qxIwvT/ba1pz8YjZ+8H12Y=;
        b=QO4bZuEbOa08T50dkWzSTZ3Oy3YHJ0Cc8T5kDjSTsEom8/NpiHsGgAnnTbmpAy3did
         Z1983T9eR+Pch6vCeD2G650ySChs8E5fgNG+2BALnDYY2FhKWb/AFUO0KJjdGwsFRwNO
         5qkBB8sx8DmBHKbkOjKO0GN6d9gyKqUF5QIOlI0M/Yfy6a4f+SR9DN0C5gvBVxsFpLB9
         viNrmLRFB0yfjVi0Z89Dbhxl9sv30GeSQUhEH8xMEO5ZefpQLwDJBr5MABNxtEWStsQX
         D+w8Ggirq2UxAXXUJ+jw1+xr0D6CCexp7QFcrYxeDD/Du4uwYymHPLhHHcT5IsTkkRC3
         dP1g==
X-Gm-Message-State: AOJu0Yy8s3n+ovLa5jMNyyXWjAAaOSpYrhJJptvJOe48Orczyv2Izzw9
	GUltWHAjOY0BUYDw9xDeP/2gzWDHl5GibRIiQ2epz7ZX+TB5vSDoQkSV+McLIfv3hHxTgZ6NiDZ
	GUPwJ
X-Gm-Gg: ASbGncvQXjJw1yFvHGWwudSPiuDGAswVeyhMXaftH1o30dQwnuT/ZIj19eAPz5O7psf
	9yLDKtGP6lV5yrJPJAZY3UaPzze6nOw3g3EaUaGyKwHSW03eJPZbSDNmdFT0U/7DI3RFyMkH4xQ
	2iqTwBQkibLnH5FR7Oa0L5lhwUHGGj8zD/XLAyoqkjXnr0oCX1C3doKz2x5kF2hyopOFLLoAXAX
	MR9ncEEi66kLYgQZ0RwJXfKYcumHIUA1f8sgSQUfxRFQrhDqnd+MH6kafDOVru3aJDTIQasTEV2
	X0Fn3vOBm2SmBJ0DxDP9Iulokcpi8qZGLC0uijXYxz1qJEtYuqPvKg==
X-Google-Smtp-Source: AGHT+IFH4nU/C4bNy4jSeeJoPfoRie2GyiJCRgrGvvmMeu4MNsvoTVFeBOWyea4HSWJhXL+6NNo3Og==
X-Received: by 2002:a17:902:fc87:b0:234:d679:72e9 with SMTP id d9443c01a7336-2366aff8c49mr244799125ad.12.1750176017379;
        Tue, 17 Jun 2025 09:00:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/12] systemd: upgrade 257.5 -> 257.6
Date: Tue, 17 Jun 2025 08:59:49 -0700
Message-ID: <11d583e4ffb8726c66da8f764d985a37a14b2699.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218896

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-4598

Rebase patches

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ative_257.5.bb => systemd-boot-native_257.6.bb} |  0
 ...systemd-boot_257.5.bb => systemd-boot_257.6.bb} |  0
 ..._257.5.bb => systemd-systemctl-native_257.6.bb} |  0
 meta/recipes-core/systemd/systemd.inc              |  2 +-
 ...llback-parse_printf_format-implementation.patch |  2 +-
 ...12-do-not-disable-buffer-in-writing-files.patch | 14 +++++++-------
 .../systemd/0014-Handle-missing-gshadow.patch      |  4 ++--
 ...rrno-util-Make-STRERROR-portable-for-musl.patch |  7 +++----
 .../systemd/{systemd_257.5.bb => systemd_257.6.bb} |  0
 9 files changed, 14 insertions(+), 15 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.5.bb => systemd-boot-native_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.5.bb => systemd-boot_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.5.bb => systemd-systemctl-native_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.5.bb => systemd_257.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.5.bb b/meta/recipes-core/systemd/systemd-boot-native_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.5.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.6.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.5.bb b/meta/recipes-core/systemd/systemd-boot_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.5.bb
rename to meta/recipes-core/systemd/systemd-boot_257.6.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 243053a8c7..5ed84757f3 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
+SRCREV = "00a12c234e2506f5cab683460199575f13c454db"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index f9a45bb40b..47b8583e7a 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -25,7 +25,7 @@ diff --git a/meson.build b/meson.build
 index bffda86845..4146f4beef 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -773,6 +773,7 @@ foreach header : ['crypt.h',
+@@ -770,6 +770,7 @@ foreach header : ['crypt.h',
                    'linux/ioprio.h',
                    'linux/memfd.h',
                    'linux/time_types.h',
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
index 00b4b777f4..0bbc6bbac7 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -71,7 +71,7 @@ diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
 index 332e8cdfd5..804498127d 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -354,12 +354,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+@@ -359,12 +359,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -154,7 +154,7 @@ diff --git a/src/core/cgroup.c b/src/core/cgroup.c
 index 6933aae54d..ab6fccc0e4 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -5167,7 +5167,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -5175,7 +5175,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
          if (r < 0)
                  return r;
  
@@ -180,7 +180,7 @@ diff --git a/src/core/main.c b/src/core/main.c
 index 172742c769..e68ce2a6d8 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1812,7 +1812,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1826,7 +1826,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -231,7 +231,7 @@ diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-
 index 01fa90b1ff..83ab655bf4 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2563,7 +2563,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2564,7 +2564,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -359,7 +359,7 @@ diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
 index 805503f366..3234a1d76e 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -173,7 +173,7 @@ void disable_coredumps(void) {
+@@ -180,7 +180,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
  
@@ -372,7 +372,7 @@ diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
 index 1213fdc2c7..4c26e6a4ee 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
-@@ -495,7 +495,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -498,7 +498,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
  
          /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
@@ -381,7 +381,7 @@ index 1213fdc2c7..4c26e6a4ee 100644
          if (r == -ENOENT) {
                  if (offset != 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
-@@ -511,7 +511,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -514,7 +514,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
                  log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
                            offset_str, device);
  
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
index 08d4e384ff..0aabae6d82 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -140,7 +140,7 @@ diff --git a/src/shared/userdb.c b/src/shared/userdb.c
 index ff83d4bf90..54d36cc706 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1041,13 +1041,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1042,13 +1042,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -157,7 +157,7 @@ index ff83d4bf90..54d36cc706 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1060,6 +1062,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1061,6 +1063,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
index 791079a19f..56083cc7b3 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -11,8 +11,8 @@ Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/basic/errno-util.h | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
+ src/basic/errno-util.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
 index 48b76e4bf7..6e7653e2d9 100644
@@ -23,9 +23,8 @@ index 48b76e4bf7..6e7653e2d9 100644
   *
   * Note that we use the GNU variant of strerror_r() here. */
 -#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN)
--
 +static inline const char * STRERROR(int errnum);
-+
+ 
 +static inline const char * STRERROR(int errnum) {
 +#ifdef __GLIBC__
 +        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN);
diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.5.bb
rename to meta/recipes-core/systemd/systemd_257.6.bb
-- 
2.43.0


