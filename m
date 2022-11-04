Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98977C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:37 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.7152.1667530895683981092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CvqyOAK6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so7029538pjk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0a5g7JV+x/i2QWCnVkw0Yd8tNIC8Gi0+5nBPgJLqJlc=;
        b=CvqyOAK6lKJViAKHefLjyoBuW2Fr3lb2d5TA5ENEQiAlw++poKSnko1GeOHMusH3TC
         PJJEwHfuXYmiDJxg9Q6fuL9TIG77QZZ77yyD3Sgf6Hf52CvgocW3R+L6WNdvZD2pOD0d
         3gc7Z01oh0oxrKds+VHN2AlhuKVWhJIqaFcgx65d9I8k+cOVJu6dz1OpsfHzyBhypr4L
         +SdyDl3yeoneCEhljJ1ePm0pUglAXJ8H/pXWbyWWxhcJq0L7VqoDKiFO/JW/ZmIDvZCo
         g83dHZvIkGueuewuHYAJlqYNony8IXbsi/iKnPNVULIOOUbPUWHa2AOK7++CvKGzhBxf
         UCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a5g7JV+x/i2QWCnVkw0Yd8tNIC8Gi0+5nBPgJLqJlc=;
        b=NxyDQBdpBzxBV4Dz+z6buhMuQTBuQMX+Va3J8yfRg2SiqLfhhDF87KCNobUbHxUlMg
         q//DuL+nkW7KuNEi9a1g9tP7/GnkacD9DtJXSnvt18x0VbjhB6z2CJ+GN++srXVx/G2y
         3KAE0DKXC+2t0P1BRAgRibuoVxNrTRM0OSDksLnYonQDoubynWqJQAJEc5kZnpViwW9F
         YFjeewXHJ8beM+6+9PrZq+ngofb2Soqry+iOnY+jw12/vPabtQqzZCKLG8hVksJ/X5wX
         /6TxZaiDtbAgrOdIIKqQ6p1B6InW8XsNMy2nul59T332J34CIDC1V73PdBk43lDPEsT7
         fk+g==
X-Gm-Message-State: ACrzQf2fqgKgHytWcrggPVj8/yUGlXz3IVMuureqZ7DqZWxIQxkJZCh9
	Ce76ANhHptp2Yns+nXnjVni8GehGlFNTpSro
X-Google-Smtp-Source: AMsMyM5fGr4hqhXQEM6p+x4gCAYRewLu88jPYN47uHCfeqK128WxZ5S+gZ31eQGFr3NWe9zkDujb7A==
X-Received: by 2002:a17:902:db12:b0:187:2596:8b0c with SMTP id m18-20020a170902db1200b0018725968b0cmr22854768plx.172.1667530894694;
        Thu, 03 Nov 2022 20:01:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/31] wayland: fix CVE-2021-3782
Date: Thu,  3 Nov 2022 17:00:43 -1000
Message-Id: <2abd43bc1f0d4ea77603920337bc53add4c42394.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172669

From: Narpat Mali <narpat.mali@windriver.com>

An internal reference count is held on the buffer pool,
incremented every time a new buffer is created from the pool.
The reference count is maintained as an int;
on LP64 systems this can cause thereference count to overflow if
the client creates a large number of wl_shm buffer objects,
or if it can coerce the server to create a large number of external references
to the buffer storage. With the reference count overflowing, a use-after-free
can be constructed on the wl_shm_pool tracking structure,
where values may be incremented or decremented;
it may also be possible to construct a limited oracle to leak 4 bytes of
server-side memory to the attacking client at a time.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-3782

Upstream patch:
https://gitlab.freedesktop.org/wayland/wayland/-/commit/b19488c7154b902354cb26a27f11415d7799b0b2

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wayland/wayland/CVE-2021-3782.patch       | 111 ++++++++++++++++++
 .../wayland/wayland_1.20.0.bb                 |   2 +
 2 files changed, 113 insertions(+)
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
diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
index bd437767b2..9351d2ed6a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
@@ -16,7 +16,9 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
+           file://CVE-2021-3782.patch \
            "
+
 SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
-- 
2.25.1


