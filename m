Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mYDBSI1GS9K/7LK0I/Y08CrLWUIsLj6O8stRKISDWUZuPkYx4QoECnkTKXO0WMRcLBgRrMh4T6
 0y1heasWSgDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613630"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613630"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:22 -0800
IronPort-SDR: AlJgPlIW/wgCO8Qk5HyfpkpGrO8KM5F4uNDK2yxk2bvs2SPLdgZChXIMPNZ5nLEjJL2TNxD8bd
 ZrtEPNC3Y/zQ==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209350"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/30] glib-2.0: fix CVE-2020-35457
Date: Fri,  8 Jan 2021 12:17:45 +0800
Message-Id: <122f93d68ee0e9b418da0dcc99cb7cdcb7b3f643.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://gitlab.gnome.org/GNOME/glib/-/issues/2197

upstream claim it is not security issue, but no harm to fix it since
this is still a valid issue.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.29.2

