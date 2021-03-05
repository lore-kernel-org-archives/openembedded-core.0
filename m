Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7722.1614918147768864035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TJxKXbgTxJEu5DQxRu0Ko7e5m9bF1fcHvqA55xxLWPmZJlOvVlCmA9vuBQdseqqXUQqyKc5+qs
 1dDtI5ceBMdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670997"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670997"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:25 -0800
IronPort-SDR: AJVT8C8twL3ilRXBFmY8LwTKvNFvY3EXiEuo3tyrNxqZEhk42dmwk0m40XBQsx1qEQjdu3t6Oy
 pAJF1gwIsdvw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128870"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/52] wpebackend-fdo: Fix missing .so symlink when using dev package
Date: Fri,  5 Mar 2021 12:20:56 +0800
Message-Id: <1d933a163fa306164bd7990fe3a734f8b39c2c40.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zbigniew Bodek <zbigniew.bodek@huawei.com>

Problem spotted on dunfell-23.0.4

Normally, unversioned .so is removed from -dev (default) package
however it is still being referred by other agents, such as webkitgtk.
That can be observed while executing i.e. Epiphany Browser.

For instance:
platformInitializeWebProcess()
calls
wpe_loader_init("libWPEBackend-fdo-1.0.so")

as a result one can see:
--------------------
wpe_loader_init could not load the library 'libWPEBackend-fdo-1.0.so':
libWPEBackend-fdo-1.0.so: cannot open shared object file:
No such file or directory
--------------------

"master" branch contains a bumped-up version of webkitgtk
to which this issue does not apply (the code has changed).

Forcefully keep this .so symlink to resolve the problem in dunfell.

Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
index 519762d125..15f4f4276c 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
@@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "9b980a73ea4e3762266c48f81ded56d9dcad4acf32bad9bd05d0dffdd454c6f5"
 
+FILES_${PN} += "${libdir}/libWPEBackend-fdo-1.0.so"
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} += "dev-so"
-- 
2.29.2

