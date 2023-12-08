Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EB8C10DC1
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:13:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17121.1702030377444645027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cDQKlze2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07066c4dc9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B88AP3f010396
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 02:12:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=lWSknIzfra+nEnqlgUEKdIr6NYok+vPQW8xT7kunwE0=; b=
	cDQKlze2VifNjpitML9lrNFAvhYpHcbUPEZlngNN040+j8cZgUeYUv6cuSXxgBCR
	QtuxbnX8fhH1ciJosMkkdZcq6B59hSJ+FXC5EfFdDEoqmC6vIbcuH+s/mvuTed3t
	2en5V7FfAcg8wdYFoaOEpR4UJhhlGBwDLo5t+go+ackj+ZE9aB6sRZk2zYMC8reK
	MEBsAsrWDV8L58GCei4+XROI5OoOxXVTP6HMuGnwcHAVtCf/8FWNCinbywxQ+Loy
	C1v4AIVv1pxCRWobhZCmEkAUWDLtpS0vPyW/jZ5X6yHIwnAA7rSlkC0Ei6gGC+3v
	1YCy9M5Is5z8nNsd5F6b4A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r2nyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:12:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 02:13:00 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 02:12:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rpm: workaround to remove dnf lock file
Date: Fri, 8 Dec 2023 18:12:49 +0800
Message-ID: <20231208101253.4042712-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208101253.4042712-1-changqing.li@windriver.com>
References: <20231208101253.4042712-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cSKkSIFakvV85uVoNj4ZfoOmiKATMDxU
X-Proofpoint-GUID: cSKkSIFakvV85uVoNj4ZfoOmiKATMDxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=905
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192023

From: Changqing Li <changqing.li@windriver.com>

dnf has a bug, refer [1], it cause that log_lock.pid may not removed
after dnf exit. And for native dnf, since we change the lock file path
to /, it will never be removed, and make the rootfs not clean,refer
[2][3].  This patch is a workaround to fix above issue.

[1] https://github.com/rpm-software-management/dnf/issues/1963
[2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
[3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index f40c880af4..bfd40fa691 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -217,6 +217,8 @@ class RpmPM(PackageManager):
         if len(failed_scriptlets_pkgnames) > 0:
             failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
 
+        self._remove_dnf_lock_file()
+
     def remove(self, pkgs, with_dependencies = True):
         if not pkgs:
             return
@@ -420,3 +422,7 @@ class RpmPM(PackageManager):
         os.chdir(current_dir)
 
         return tmp_dir
+
+    def _remove_dnf_lock_file(self):
+	if os.path.exists(self.rootfs_dir + "/log_lock.pid")
+            os.remove(self.rootfs_dir + "/log_lock.pid")
-- 
2.25.1


