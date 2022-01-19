Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B91EC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 03:07:07 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.1555.1642561625499089815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20J3728w013814
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:07:03 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20J36v86015214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:07:02 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 18 Jan 2022 19:06:57 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 19:06:56 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 18 Jan 2022 19:06:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hongxu.jia@windriver.com>, <liezhi.yang@windriver.com>
Subject: [PATCH] package_manager/rpm: conditional remove package manager
 database
Date: Wed, 19 Jan 2022 11:06:55 +0800
Message-ID: <20220119030655.3484026-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 03:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160688

In order to save spaces in target rootfs, the user wants to remove dnf and
keep rpm, in this situation, we should remove dnf database only

If rpm was installed, keep rpm database, after applying this commit:

Edit conf/local.conf
...
IMAGE_FEATURES:remove = "package-management"
IMAGE_INSTALL:append= " rpm"
...

Build image and boot, run rpm -qa on target:
Without this commit
...
root@intel-x86-64:~# rpm -qa | wc -l
0
...

Apply this commit
...
root@intel-x86-64:~# rpm -qa | wc -l
1865
...

With this commit, the rpm -qa works as expected.

It does not make sense to keep dnf and remove rpm, so this commit
does not consider the scenario

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index b392581069..dce5912329 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
-        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
+        self.packaging_data_rpm_dirs = ['etc/rpm', 'etc/rpmrc', 'var/lib/rpm']
+        self.packaging_data_dnf_dirs = ['etc/dnf', 'var/lib/dnf', 'var/cache/dnf']
+        self.packaging_data_dirs = self.packaging_data_rpm_dirs + self.packaging_data_dnf_dirs
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved')):
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):
         self._invoke_dnf(["autoremove"])
 
     def remove_packaging_data(self):
+        remove_packaging_data_dirs = self.packaging_data_dnf_dirs
+        if "rpm" not in self.list_installed():
+            remove_packaging_data_dirs += self.packaging_data_rpm_dirs
         self._invoke_dnf(["clean", "all"])
-        for dir in self.packaging_data_dirs:
+        for dir in remove_packaging_data_dirs:
             bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)
 
     def backup_packaging_data(self):
-- 
2.27.0


