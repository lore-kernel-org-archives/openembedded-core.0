Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3298BFA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 17:09:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.162.1667236131503307322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 10:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DvTEeR0D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8303463e3f=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29VCAoF8029601
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 17:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=3hv3T3ebfnxtxbujiTlhWyJSPNOD6Jp9ATPg7SquvAg=;
 b=DvTEeR0D+nNRtkY/c3KrjGKbo2IGhtr/jX7HwP5aKYpeDKjqXygwsBkVkBRg8SIA4e/K
 atHrsG/gEFCUN6+YanKQW+bZaXTk8CSviUBk4ye5JO/cLlqVg9+H4PkHEMlXlfMPvLeA
 Mkmc/WADT2OkpBBHxWVO7l5NotsYvJF07D6GtqqaGHFZAB1FbIyAGukEyRKmY30ltTco
 FEQcmpvRfOQqqFZHQ2kLnpBLxoUiwYstzf1+vQ+jLtDMuOhgEh5R0IjNv5nWSUg9jQMX
 rChmTw0gQv+g4QC3DH79S7AuwgV20oSSwpYj+ta+cWJdie0MmK3kdJb/ixdb/2HVXB7P tg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c1par-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 17:08:50 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 31 Oct 2022 10:08:49 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Mon, 31 Oct 2022 10:08:47 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] wayland: fix CVE-2021-3782
Date: Mon, 31 Oct 2022 17:07:57 +0000
Message-ID: <20221031170757.3687756-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eszwRpEsHS5ZJLf4QBDKdvwQO3LmUnSv
X-Proofpoint-GUID: eszwRpEsHS5ZJLf4QBDKdvwQO3LmUnSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_19,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 17:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172332

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
2.34.1


