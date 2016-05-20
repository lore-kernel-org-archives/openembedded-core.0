Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 203B860761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 02:01:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6725248"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 May 2016 10:01:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 30F66489F963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 10:01:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.24) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 20 May 2016 10:01:23 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1456614353-11317-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.24]
X-yoursite-MailScanner-ID: 30F66489F963.ACA34
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] coreutils: Fix rootfs creation errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
Date: Fri, 20 May 2016 02:01:26 -0000
X-Original-Date: Sun, 28 Feb 2016 02:05:53 +0300
X-List-Received-Date: Fri, 20 May 2016 02:01:26 -0000
Content-Type: text/plain

    1) error: file /usr/share/man/man1/su.1 from install of shadow-doc-4.2.1
       conflicts with file from package coreutils-doc-6.9-r5
    2) error: file /usr/share/man/man1/hostname.1 from install of net-tools-doc
       conflicts with file from package coreutils-doc-6.9-r5
    3) error: file /usr/share/man/man1/hostname.1 from install of net-tools-doc
       conflicts with file from package coreutils-doc-8.25

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb  | 4 ++++
 meta/recipes-core/coreutils/coreutils_8.25.bb | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 9ce717d..35700a3 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -88,6 +88,10 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs}"
 
+ALTERNATIVE_${PN}-doc = "su.1 hostname.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
+
 ALTERNATIVE_PRIORITY[uptime] = "10"
 ALTERNATIVE_PRIORITY[hostname] = "10"
 
diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index 419a693..e6c47e2 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -100,7 +100,9 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
-ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1"
+ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
+
+ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 
 ALTERNATIVE_LINK_NAME[base64] = "${base_bindir}/base64"
 ALTERNATIVE_TARGET[base64] = "${bindir}/base64.${BPN}"
-- 
1.8.4.2




