Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.10260.1594882628006529778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 23:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06G6uZQ3019069
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 23:56:56 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 15 Jul 2020 23:56:34 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] rpm: fix nativesdk's default var location
Date: Thu, 16 Jul 2020 14:56:32 +0800
Message-ID: <20200716065632.33861-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

For now, the nativesdk-rpm's %_var in /usr/lib/rpm/macros is
'/var'. This is causing error when running `rpm -qplv A.rpm'.

   error: cannot open Packages index using db5 - Permission denied (13)
   error: cannot open Packages database in /var/lib/rpm

The rpm in SDK should be using its own database. So we should remove
this configure option, letting the SDK's native sysroot prefix to be
there in %_var. In fact, '%_usr' in macros has already got the prefix.
After this change, we have in the macros file lines like below.

"""
%_usr                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-linux/usr
%_usrsrc                %{_usr}/src
%_var                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-linux/var
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index cbe1acffe2..b5a0ac9382 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -67,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls --disable-openmp"
 # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
 # Also disable plugins by default for native.
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
-EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1

