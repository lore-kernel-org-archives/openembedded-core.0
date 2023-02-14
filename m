Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADB5C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:28:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2123.1676363328353136729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kGE6y0ry;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E7ghdK024613
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:28:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=DAEdzxUL7xU0t8cn5krj/XdEh4MnRvHrnEhUeSEI2yY=;
 b=kGE6y0ryoehhSBUs0Of2X/L1tMqs4ObTNXUksM0/N2Bs4aAfMwKCeW2mVuz79WIIyvjY
 14hMOjJ4CovzkQgwmi0My24eLGoPRPkCpXzpZBOTdgNEpGaRKneuyozWNGixty350tHi
 g+qorAGXmEJkvWoywj9ql4jp1lIYNhkwbRgM0W8LGR0UqL3cVWbk8kpMyqwec4oE7Pmn
 uY74fL2lcM0veeQ8b7P3JNG6jUuhr9DJmiG+58SeEpDHrMAlqoSmzQtfiLwKDXmXFpc5
 bJNWrpSqRUvLQcz/MO40pDGJZmXa3ymoYPYNGdaOFZZLyUyvs0b6SYFqXb6l+6UlSsP8 6Q== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdrt4mh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:28:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Feb 2023 00:28:47 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Feb 2023 00:28:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it is not defined
Date: Tue, 14 Feb 2023 00:28:47 -0800
Message-ID: <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1676363203.git.liezhi.yang@windriver.com>
References: <cover.1676363203.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SEOioLMJkn4W_N2kTda-QJCaVPJmesHc
X-Proofpoint-GUID: SEOioLMJkn4W_N2kTda-QJCaVPJmesHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_05,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177127

The PACKAGE_FEED_ARCHS is highly related to ALL_MULTILIB_PACKAGE_ARCHS, set it
automatically is better than manually, for example, we may forget to upgrade
PACKAGE_FEED_ARCHS when ALL_MULTILIB_PACKAGE_ARCHS is changed if set it
manually.

The workflow is:
Use PACKAGE_FEED_ARCHS if it is defined, if not, check DEPLOY_DIR_XXX/<arch>, add
<arch> to PACKAGE_FEED_ARCHS if it exists.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/rootfs.py | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 890ba5f039..f26b66ba7a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -89,12 +89,36 @@ class Rootfs(object, metaclass=ABCMeta):
     def _log_check_error(self):
         self._log_check_common('error', self.log_check_regex)
 
+    def _get_feed_archs(self):
+        feed_archs = self.d.getVar('PACKAGE_FEED_ARCHS') or ''
+        if not feed_archs:
+            bb.note("  Figuring PACKAGE_FEED_ARCHS from ALL_MULTILIB_PACKAGE_ARCHS")
+            manager = self.d.getVar('ROOTFS_PKGMANAGE')
+            deploy_dir = ''
+            if 'rpm' in manager:
+                deploy_dir = self.d.getVar('DEPLOY_DIR_RPM')
+            elif 'opkg' in manager:
+                deploy_dir = self.d.getVar('DEPLOY_DIR_IPK')
+            elif 'dpkg' in manager:
+                deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
+            else:
+                bb.warn('Failed to figure out deploy_dir')
+                return ''
+
+            for arch in self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').split():
+                if 'rpm' in manager:
+                    arch = arch.replace("-", "_")
+                arch_path = os.path.join(deploy_dir, arch)
+                if os.path.exists(arch_path):
+                    feed_archs += " %s" % arch
+        return feed_archs.strip()
+
     def _insert_feed_uris(self):
         if bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
             self.pm.insert_feeds_uris(self.d.getVar('PACKAGE_FEED_URIS') or "",
                 self.d.getVar('PACKAGE_FEED_BASE_PATHS') or "",
-                self.d.getVar('PACKAGE_FEED_ARCHS'))
+                self._get_feed_archs())
 
 
     """
-- 
2.39.0


