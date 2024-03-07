Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E672C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 09:19:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19316.1709803167962408237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 01:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=roMWHH4J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796ab1ae3=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 427502b2026901
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 01:19:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YWvaT
	vkAUtwoMZKy/wMGDSnTDpg0ANpM/DCqCYxuG8Q=; b=roMWHH4JWZM+o5dnMSmK6
	VQz76SoYD+idgSjzKpVPB9YC6Zk7Z+IEJoy7Li5DTt5Vi1JmdAIta3fJe2vxN3ZX
	W31g840u8JS3U8+uo1T0b6ltyBkJ472qPRXT61mthkYK8CaoGwDB2k7SOyRZ7dGr
	1QB/6/Kzlv9ZkWb5wd/1LoIv0/M8AIa2rdOyh4OUWRBT0/gPKrqxuvFz07XtEGkA
	hbVzTS6rjgZVO6pAj5j8SIkbIGUXw7PtN8xg8mOrpocvemYLkHSlY+iZF00NfYub
	Esc+GD22H4KGBgO9vPHQz2a6W/4BnFUFZiBbh7M4KYI61E8xP6652Ibq7X0lnJOs
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vs5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 01:19:27 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:19:26 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 01:19:25 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] dnf: remove log_lock.pid before exit
Date: Thu, 7 Mar 2024 17:19:25 +0800
Message-ID: <20240307091925.2324637-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: by3N3xMf8cGXz--SQFXR9J_w39cqsTal
X-Proofpoint-ORIG-GUID: by3N3xMf8cGXz--SQFXR9J_w39cqsTal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_05,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196780

From: Changqing Li <changqing.li@windriver.com>

dnf has a bug, refer [1], it causes that log_lock.pid may not removed
after dnf exit. And for native dnf, since we change the lock file path
to /, it will never be removed, and make the rootfs not clean,refer
[2][3].  This patch is a workaround to fix above issue.

[1] https://github.com/rpm-software-management/dnf/issues/1963
[2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
[3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...n.py-remove-log_lock.pid-before-exit.patch | 41 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.18.2.bb       |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch b/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
new file mode 100644
index 0000000000..2dd4969d57
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
@@ -0,0 +1,41 @@
+From bdf17281385cf33ad59267fe75a9e427e6e2ffc4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 7 Mar 2024 14:03:07 +0800
+Subject: [PATCH] main.py: remove log_lock.pid before exit
+
+dnf has a bug, refer [1], it causes that log_lock.pid may not removed
+after dnf exit. And for native dnf, since we change the lock file path
+to /, it will never be removed, and make the rootfs not clean,refer
+[2][3].  This patch is a workaround to fix above issue.
+
+[1] https://github.com/rpm-software-management/dnf/issues/1963
+[2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
+[3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf
+
+Upstream-Status: Inappropriate [oe specific workaround]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ dnf/cli/main.py | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/dnf/cli/main.py b/dnf/cli/main.py
+index 2a7f92d54..2f672cff2 100644
+--- a/dnf/cli/main.py
++++ b/dnf/cli/main.py
+@@ -200,6 +200,12 @@ def user_main(args, exit_code=False):
+ 
+     errcode = main(args)
+     if exit_code:
++        for arg in args:
++            if arg.startswith("--installroot="):
++                root=arg.split("=")[1]
++                if os.path.exists(os.path.join(root, "log_lock.pid")):
++                    os.unlink(os.path.join(root, "log_lock.pid"))
++                break
+         sys.exit(errcode)
+     return errcode
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
index dc0c18be5e..7770c9d7e0 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
@@ -17,7 +17,8 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-set-python-path-for-completion_helper.patch \
            "
 
-SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
+SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch \
+                               file://0001-main.py-remove-log_lock.pid-before-exit.patch"
 
 SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


