Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6995.1595487303554512268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 23:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06N6sw4D028667
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 23:54:58 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 22 Jul 2020 23:54:58 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] layer.conf: fix adwaita-icon-theme signature change problem
Date: Thu, 23 Jul 2020 14:51:20 +0800
Message-ID: <20200723065120.2942320-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQdLigicck-6Q53upOEBNxGei1a_465P6kOb_ZV8ungYMw@mail.gmail.com>
References: <CA+chaQdLigicck-6Q53upOEBNxGei1a_465P6kOb_ZV8ungYMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

allarch package adwaita-icon-theme inherit both allarch and
gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
[gtk-icon-cache.bbclass: add runtime dependency], it start depend on
non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
changes when machine changed.

like for task do_prepare_recipe_sysroot:
"Hash for dependent task
gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from
a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f"

the only way to fix this is remove the task dependency.
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS not work in class, so add it in
layer.conf.

Maybe we have other recipes under other layers have similar problem, we
can only add one by one to its layer.conf, seems not a good idea. but
add *->pixbuf will influence other packages

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 098ef12ac6..c115c87043 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -80,6 +80,8 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->kbd \
   connman->xl2tpd \
   lttng-tools->lttng-modules \
+  adwaita-icon-theme->gdk-pixbuf \
+  adwaita-icon-theme->gtk+3 \
 "
 
 # Avoid adding bison-native to the sysroot without a specific
-- 
2.17.1

