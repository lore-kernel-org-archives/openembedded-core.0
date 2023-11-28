Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7621BC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:52:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.10155.1701211972059116365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HewEe7id;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-280351c32afso5610762a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211971; x=1701816771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjyZLEiFiNQ8/QcODn2XDa0RMmIpeEUwFHfwyolihXM=;
        b=HewEe7idv5Lfdn4VRNzyAO+QNmazfXt6DFm9FsM2ayB3cEd7y9/4EOUDaLlVvLNeDr
         zPsuf5WnmH5OusUD1mIBsQAnDKuJlpqK2qGkKYIabrz3g2wDonz+MC0z+OchXeYtn12q
         k3EamXUfv3nNDzJcSdL8Y60OO7VaPWgDtAyPoLdbFodmiPZMZ9jU/kjH2g09Cnfjy8DF
         t2FLFnnRFLvbYlDg+Zobem+PkXfUxMoNUIxnbJnY2IC0VneWtQEP+r1HWrVdq6N8u/xs
         JxUNhDfmexvZGZhjj57JzHR5majIyQEC3W2q7u9+IWzWIb+YqCqPMwCa9J8lNbbsiSjw
         CqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211971; x=1701816771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjyZLEiFiNQ8/QcODn2XDa0RMmIpeEUwFHfwyolihXM=;
        b=s3BqMh7/bUD6JdHpm34Tubbpwz5pcAjHS9pWhn/Igid7d0Irsb3mD5pevo6UKUIIU7
         1dKLRP6PsRtO3HStmxZoyXo1m82+tvphyHiMNQt7MOxvoFXm5VOj5gVHipx5Wc/qFcPB
         bXVIpB6Ix8iDGRutZ4A5cQllvunv2BGjWzVLZGuqp7HDtmm1dclGvj/xXP+7QVPiwUkj
         Bbnb05I9fOl3BItht/eI8T/bEPOBVNVkloeyoqIFWszCrilr1CD4mFX2AaZjw9+QYblh
         9Kab9Ny0ZK+rqqn+hyMXyVvBqO5nPyl2U3/ideSpy3qgUvIx6un7H+D6jNDUy0g+jfJ6
         nbcA==
X-Gm-Message-State: AOJu0YzsafRZ5Ha70dgRJs+cyoF/uxWI0EbBJ2NuechOsn6q1VZSQuB2
	rpChIOFIgvXAs0HcZ3iSpi165Pik2GaiwK/4MRB1Cg==
X-Google-Smtp-Source: AGHT+IHLuA2AVoJknoTcPjcfFyA7EZrOTUAnAy+oP/UoBSaltm6aNdbkeErnk9VMwr6+Ws/DHL+QZA==
X-Received: by 2002:a17:90b:4c50:b0:285:8407:6152 with SMTP id np16-20020a17090b4c5000b0028584076152mr17807403pjb.8.1701211970652;
        Tue, 28 Nov 2023 14:52:50 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:52:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/13] wayland: fix CVE-2021-3782
Date: Tue, 28 Nov 2023 12:52:29 -1000
Message-Id: <9c3f494bf54c4d4b7ec776ab18d900bf9fbd042a.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191397

From: Lee Chee Yang <chee.yang.lee@intel.com>

take CVE-2021-3782.patch from OE-core rev 09b8ff8d2361b2db001bc963f481db294ccf2170.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


