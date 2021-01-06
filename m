Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.967.1609892125050942971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 16:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: oaxtNOOKqZ+lb7j89N/vRX9wGlZdku1UqJAZsJO0oHG9bznsvWx530bCBwt1DB+icJ98b7p37J
 wqhYcARcoefQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="177303087"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
   d="scan'208";a="177303087"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 16:15:23 -0800
IronPort-SDR: OCGkS3SVtBi4AhcdCisoF7mBxEvwjSS0hbOdc+JPbA2Kz/5QBVjXKByk5FMS9I7a3VGWImEDw/
 i5NPJvUwCACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
   d="scan'208";a="565630633"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2021 16:15:22 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth] glib-2.0: fix CVE-2020-35457
Date: Wed,  6 Jan 2021 08:15:21 +0800
Message-Id: <20210106001521.19292-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://gitlab.gnome.org/GNOME/glib/-/issues/2197

upstream claim it is not security issue, but no harm to fix it since
this is still a valid issue.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../glib-2.0/glib-2.0/CVE-2020-35457.patch    | 41 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
new file mode 100644
index 0000000000..828f9fcb96
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
@@ -0,0 +1,41 @@
+From 63c5b62f0a984fac9a9700b12f54fe878e016a5d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <withnall@endlessm.com>
+Date: Wed, 2 Sep 2020 12:38:09 +0100
+Subject: [PATCH] goption: Add a precondition to avoid GOptionEntry list
+ overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the calling code adds more option entries than `G_MAXSIZE` then
+there’ll be an integer overflow. This seems vanishingly unlikely (given
+that all callers use static option entry lists), but add a precondition
+anyway.
+
+Signed-off-by: Philip Withnall <withnall@endlessm.com>
+
+Fixes: #2197
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/63c5b62f0a984fac9a9700b12f54fe878e016a5d]
+CVE: CVE-2020-35457
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ glib/goption.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/glib/goption.c b/glib/goption.c
+index 9f5b977c4..bb9093a33 100644
+--- a/glib/goption.c
++++ b/glib/goption.c
+@@ -2422,6 +2422,8 @@ g_option_group_add_entries (GOptionGroup       *group,
+ 
+   for (n_entries = 0; entries[n_entries].long_name != NULL; n_entries++) ;
+ 
++  g_return_if_fail (n_entries <= G_MAXSIZE - group->n_entries);
++
+   group->entries = g_renew (GOptionEntry, group->entries, group->n_entries + n_entries);
+ 
+   /* group->entries could be NULL in the trivial case where we add no
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
index a30c5215be..b9462bc945 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://tzdata-update.patch \
+           file://CVE-2020-35457.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1

