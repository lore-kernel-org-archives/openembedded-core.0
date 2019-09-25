Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5717E465
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:30:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9UrRF003378
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:30:53 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:30:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:30:51 +0800
Message-ID: <f2f0747a348d329c7a20feb8ea54c90c38b75b68.1569403775.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403775.git.liezhi.yang@windriver.com>
References: <cover.1569403775.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] net-tools: Fix installed-vs-shipped for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:30:52 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-net-tools
ERROR: nativesdk-net-tools-1.60-26-r0 do_package: QA Issue: nativesdk-net-tools: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/man
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index b565fd0..0be9913 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -109,6 +109,14 @@ do_install() {
 	fi
 }
 
+do_install_append_class-nativesdk() {
+    install -d ${D}${datadir}
+    src_dir="${D}${target_datadir}"
+    mv $src_dir/* ${D}${datadir}
+    par_dir=`dirname $src_dir`
+    rmdir $src_dir $par_dir
+}
+
 inherit update-alternatives
 
 base_sbindir_progs = "arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig rarp route slattach"
-- 
2.7.4


