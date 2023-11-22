Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD115C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:15:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.15381.1700644524584223423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Eb1OKCcL;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700644524; x=1732180524;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pK3esmZihq/21U5SXtKtjPRBhy+HYjjzGwthEBAeXOI=;
  b=Eb1OKCcL0boWP7u7G+cTpIKJNtA4u6mzGwwKkXJ7hN3At2VtqJCO06Uz
   dYiO1X09FSB6EF/xElJxvbkuLHWnHGphaA+RahMOYAoK7qwS6W0UQrvTA
   KWbI6yRxa/1B0BY/72wDV7BJMUZvVP7TezCDtAdYQYGIkSP55S8KnVIqn
   UMJr75WPjCP1atz6nIoU8uEAqpOXzMSPNgEabGah9SInrvw/4z6jk6PtV
   i1lAVqWSlzGgl6Aqp2YvwvfLuNIjSRFRX8almrsSx/HOQNlUjLpBPAPxw
   +VGjTxrnB6VvqZhQTITb5dD00Ycjc7jPLznKNvKkmZh+TJNHHXWBY+IpO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458512234"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="458512234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910728620"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910728620"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 01:15:22 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] wayland: fix CVE-2021-3782
Date: Wed, 22 Nov 2023 16:55:44 +0800
Message-Id: <20231122085545.2327422-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191043

From: Lee Chee Yang <chee.yang.lee@intel.com>

take CVE-2021-3782.patch from OE-core rev 09b8ff8d2361b2db001bc963f481db294ccf2170.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../wayland/wayland/CVE-2021-3782.patch       | 111 ++++++++++++++++++
 .../wayland/wayland_1.18.0.bb                 |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/CVE-2021-3782.patch

diff --git a/meta/recipes-graphics/wayland/wayland/CVE-2021-3782.patch b/meta/recipes-graphics/wayland/wayland/CVE-2021-3782.patch
new file mode 100644
index 0000000000..df204508e9
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/CVE-2021-3782.patch
@@ -0,0 +1,111 @@
+From 5eed6609619cc2e4eaa8618d11c15d442abf54be Mon Sep 17 00:00:00 2001
+From: Derek Foreman <derek.foreman@collabora.com>
+Date: Fri, 28 Jan 2022 13:18:37 -0600
+Subject: [PATCH] util: Limit size of wl_map
+
+Since server IDs are basically indistinguishable from really big client
+IDs at many points in the source, it's theoretically possible to overflow
+a map and either overflow server IDs into the client ID space, or grow
+client IDs into the server ID space. This would currently take a massive
+amount of RAM, but the definition of massive changes yearly.
+
+Prevent this by placing a ridiculous but arbitrary upper bound on the
+number of items we can put in a map: 0xF00000, somewhere over 15 million.
+This should satisfy pathological clients without restriction, but stays
+well clear of the 0xFF000000 transition point between server and client
+IDs. It will still take an improbable amount of RAM to hit this, and a
+client could still exhaust all RAM in this way, but our goal is to prevent
+overflow and undefined behaviour.
+
+Fixes #224
+
+Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3782
+
+Reference to upstream patch:
+https://gitlab.freedesktop.org/wayland/wayland/-/commit/b19488c7154b902354cb26a27f11415d7799b0b2
+
+[DP: adjust context for wayland version 1.20.0]
+Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
+---
+ src/wayland-private.h |  1 +
+ src/wayland-util.c    | 25 +++++++++++++++++++++++--
+ 2 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/wayland-private.h b/src/wayland-private.h
+index 9bf8cb7..35dc40e 100644
+--- a/src/wayland-private.h
++++ b/src/wayland-private.h
+@@ -45,6 +45,7 @@
+ #define WL_MAP_SERVER_SIDE 0
+ #define WL_MAP_CLIENT_SIDE 1
+ #define WL_SERVER_ID_START 0xff000000
++#define WL_MAP_MAX_OBJECTS 0x00f00000
+ #define WL_CLOSURE_MAX_ARGS 20
+ 
+ struct wl_object {
+diff --git a/src/wayland-util.c b/src/wayland-util.c
+index d5973bf..3e45d19 100644
+--- a/src/wayland-util.c
++++ b/src/wayland-util.c
+@@ -195,6 +195,7 @@ wl_map_insert_new(struct wl_map *map, uint32_t flags, void *data)
+ 	union map_entry *start, *entry;
+ 	struct wl_array *entries;
+ 	uint32_t base;
++	uint32_t count;
+ 
+ 	if (map->side == WL_MAP_CLIENT_SIDE) {
+ 		entries = &map->client_entries;
+@@ -215,10 +216,25 @@ wl_map_insert_new(struct wl_map *map, uint32_t flags, void *data)
+ 		start = entries->data;
+ 	}
+ 
++	/* wl_array only grows, so if we have too many objects at
++	 * this point there's no way to clean up. We could be more
++	 * pro-active about trying to avoid this allocation, but
++	 * it doesn't really matter because at this point there is
++	 * nothing to be done but disconnect the client and delete
++	 * the whole array either way.
++	 */
++	count = entry - start;
++	if (count > WL_MAP_MAX_OBJECTS) {
++		/* entry->data is freshly malloced garbage, so we'd
++		 * better make it a NULL so wl_map_for_each doesn't
++		 * dereference it later. */
++		entry->data = NULL;
++		return 0;
++	}
+ 	entry->data = data;
+ 	entry->next |= (flags & 0x1) << 1;
+ 
+-	return (entry - start) + base;
++	return count + base;
+ }
+ 
+ int
+@@ -235,6 +251,9 @@ wl_map_insert_at(struct wl_map *map, uint32_t flags, uint32_t i, void *data)
+ 		i -= WL_SERVER_ID_START;
+ 	}
+ 
++	if (i > WL_MAP_MAX_OBJECTS)
++		return -1;
++
+ 	count = entries->size / sizeof *start;
+ 	if (count < i)
+ 		return -1;
+@@ -269,8 +288,10 @@ wl_map_reserve_new(struct wl_map *map, uint32_t i)
+ 		i -= WL_SERVER_ID_START;
+ 	}
+ 
+-	count = entries->size / sizeof *start;
++	if (i > WL_MAP_MAX_OBJECTS)
++		return -1;
+ 
++	count = entries->size / sizeof *start;
+ 	if (count < i)
+ 		return -1;
+ 
+-- 
+2.37.3
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 00be3aac27..e621abddbf 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch \
+           file://CVE-2021-3782.patch \
            "
 SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
 SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
-- 
2.37.3


