Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: BPJZ23vZK9dF8/n4uEl4UH5fNxkq7ELntNioyi3nErWnvLjGuEz7QulFdr4AMtzXGUCdEV60Ra
 Vrvbv/VoejRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671179"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:52 -0800
IronPort-SDR: 51vcs7Pq8s0v+LAKSpuDGTnrXmLGe7qc/tC6Nczq4yIaTms9VFE9wrFwj7C4oZxDvbcT3dGA7H
 UoNeEfOg9WXA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129109"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 40/52] epiphany: Fix distributor contamination from /etc/os-release
Date: Fri,  5 Mar 2021 12:21:16 +0800
Message-Id: <26bb8ebdcb19df55f5bad8102eb2d4380d450a30.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Set our own distro string rather than using the value from
/etc/os-release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77f23ece471e8855bfd8be06951f21cabce25545)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.36.4.bb  |  1 +
 .../epiphany/files/distributor.patch            | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/distributor.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
index dcb337f4cb..0c22a67bde 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
@@ -14,6 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://migrator.patch \
+           file://distributor.patch \
            "
 SRC_URI[archive.sha256sum] = "588a75b1588f5a509c33cf0be6a38a0f4fc1748eeb499a51d991ddef485242bf"
 
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
new file mode 100644
index 0000000000..b09c9b38d2
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -0,0 +1,17 @@
+Don't encode the distro from /etc/os-release into the binaries.
+
+Upstream-Status: Pending
+RP 2021/2/26
+
+Index: epiphany-3.38.2/meson.build
+===================================================================
+--- epiphany-3.38.2.orig/meson.build
++++ epiphany-3.38.2/meson.build
+@@ -15,6 +15,7 @@ if r.returncode() == 0
+ else
+   distributor_name = 'GNOME Web'
+ endif
++distributor_name = 'OpenEmbedded'
+ 
+ prefix = get_option('prefix')
+ datadir = join_paths(prefix, get_option('datadir'))
-- 
2.29.2

