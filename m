Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 412B161574
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 02:07:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01I27X1P027889
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 18:07:33 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 17 Feb 2020 18:07:25 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 10:06:53 +0800
Message-ID: <1581991613-30949-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] kernel-devsrc: fix missing generated files from the packet
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
X-List-Received-Date: Tue, 18 Feb 2020 02:07:32 -0000
Content-Type: text/plain

The file arch/arm/include/generated/asm/unistd-nr.h is needed by some
external kernel module. Error occurs when building the module with
the SDK.

Add arch/${ARCH}/include/generated dir and files under it to
kernel-devsrc package to solve this issue.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b6f2dbc..8621fe1 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -108,6 +108,12 @@ do_install() {
 	fi
 
 	cp -a include $kerneldir/build/include
+
+	if [ -d arch/${ARCH}/include/generated ]; then
+	    mkdir -p $kerneldir/build/arch/${ARCH}/include
+	    cp -r arch/${ARCH}/include/generated $kerneldir/build/arch/${ARCH}/include
+	fi
+
     )
 
     # now grab the chunks from the source tree that we need
-- 
1.9.1


