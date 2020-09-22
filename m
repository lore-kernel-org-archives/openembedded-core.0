Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2559.1600758205336911598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 00:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08M734Ph021865
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 00:03:14 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 00:02:53 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] kea: fix conflict between multilibs
Date: Tue, 22 Sep 2020 15:02:33 +0800
Message-ID: <20200922070233.31752-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922070233.31752-1-kai.kang@windriver.com>
References: <20200922070233.31752-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are conflict of config files between kea and lib32-kea:

| Error: Transaction test error:
|  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
     lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
|  file /etc/kea/kea-dhcp4.conf conflicts between attempted installs of
     lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64

Because they are all commented out, replace the expanded libdir path with
'$libdir' in the config files to avoid conflict.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../kea/files/fix-multilib-conflict.patch     | 55 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
new file mode 100644
index 0000000000..733adf5536
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -0,0 +1,55 @@
+There are conflict of config files between kea and lib32-kea:
+
+| Error: Transaction test error:
+|  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
+     lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
+|  file /etc/kea/kea-dhcp4.conf conflicts between attempted installs of
+     lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
+
+Because they are all commented out, replace the expanded libdir path with
+'$libdir' in the config files to avoid conflict.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
+ src/bin/keactrl/kea-dhcp4.conf.pre      | 6 ++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
+index 211b7ff..d710ec7 100644
+--- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
++++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
+@@ -45,7 +45,8 @@
+     // Agent will fail to start.
+     "hooks-libraries": [
+ //  {
+-//      "library": "@libdir@/kea/hooks/control-agent-commands.so",
++//      // Replace $libdir with real library path /usr/lib or /usr/lib64
++//      "library": "$libdir/kea/hooks/control-agent-commands.so",
+ //      "parameters": {
+ //          "param1": "foo"
+ //      }
+diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
+index 5f77a32..70ae3d9 100644
+--- a/src/bin/keactrl/kea-dhcp4.conf.pre
++++ b/src/bin/keactrl/kea-dhcp4.conf.pre
+@@ -252,7 +252,8 @@
+     //      // of all devices serviced by Kea, including their identifiers
+     //      // (like MAC address), their location in the network, times
+     //      // when they were active etc.
+-    //      "library": "@libdir@/kea/hooks/libdhcp_legal_log.so"
++    //      // Replace $libdir with real library path /usr/lib or /usr/lib64
++    //      "library": "$libdir/kea/hooks/libdhcp_legal_log.so"
+     //      "parameters": {
+     //          "path": "/var/lib/kea",
+     //          "base-name": "kea-forensic4"
+@@ -269,7 +270,8 @@
+     //      // of specific options or perhaps even a combination of several
+     //      // options and fields to uniquely identify a client. Those scenarios
+     //      // are addressed by the Flexible Identifiers hook application.
+-    //      "library": "@libdir@/kea/hooks/libdhcp_flex_id.so",
++    //      // Replace $libdir with real library path /usr/lib or /usr/lib64
++    //      "library": "$libdir/kea/hooks/libdhcp_flex_id.so",
+     //      "parameters": {
+     //          "identifier-expression": "substring(relay6[0].option[18],0,8)"
+     //      }
diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index e2560b2399..061f3a7c26 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
+    file://fix-multilib-conflict.patch \
 "
 SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
-- 
2.17.1

