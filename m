Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8F26FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 01:59:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6725126"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 May 2016 09:59:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3805B489F960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 09:59:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.24) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 20 May 2016 09:59:15 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1456614225-11266-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.24]
X-yoursite-MailScanner-ID: 3805B489F960.ACEC0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] net-tools: Fix rootfs creation errors
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
Date: Fri, 20 May 2016 01:59:18 -0000
X-Original-Date: Sun, 28 Feb 2016 02:03:45 +0300
X-List-Received-Date: Fri, 20 May 2016 01:59:18 -0000
Content-Type: text/plain

1) error: file /usr/share/man/man1/hostname.1 from install of net-tools-doc
           conflicts with file from package coreutils-doc-6.9-r5
2) error: file /usr/share/man/man1/hostname.1 from install of net-tools-doc
           conflicts with file from package coreutils-doc-8.25

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 63b2051..759de0a 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -99,6 +99,10 @@ base_sbindir_progs = "arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig r
 base_bindir_progs  = "dnsdomainname domainname hostname netstat nisdomainname ypdomainname"
 
 ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
+ALTERNATIVE_${PN}-doc += "hostname.1"
+ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
+ALTERNATIVE_PRIORITY[hostname.1] = "10"
+
 python __anonymous() {
 	for prog in d.getVar('base_sbindir_progs', True).split():
 		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir', True), prog))
-- 
1.8.4.2




