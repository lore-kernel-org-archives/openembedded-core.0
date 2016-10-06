Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC87E606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:55:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u96GtaEJ003639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Oct 2016 09:55:36 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 09:55:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Oct 2016 11:55:33 -0500
Message-ID: <20161006165533.40950-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161006165533.40950-1-mark.hatle@windriver.com>
References: <20161006165533.40950-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] linuxloader.bbclass: Adjust mips to cover all mips/mips64
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
X-List-Received-Date: Thu, 06 Oct 2016 16:55:39 -0000
Content-Type: text/plain

[YOCTO #10389]

Use a glob (*) to match all mips (not previously matched).  This will ensure
that the linuxloader is properly returned for mips, mipsel, mips64,
mips64el and their n32 variants.

See: https://sourceware.org/glibc/wiki/ABIList#mips for the official list
of loaders.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/linuxloader.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 8d85e6e..4be5503 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,12 +1,15 @@
 
 linuxloader () {
 	case ${TARGET_ARCH} in
-		powerpc | mips | mipsel | microblaze )
+		powerpc | microblaze )
 			dynamic_loader="${base_libdir}/ld.so.1"
 			;;
 		mipsisa32r6el | mipsisa32r6 | mipsisa64r6el | mipsisa64r6)
 			dynamic_loader="${base_libdir}/ld-linux-mipsn8.so.1"
 			;;
+                mips* )
+			dynamic_loader="${base_libdir}/ld.so.1"
+			;;
 		powerpc64)
 			dynamic_loader="${base_libdir}/ld64.so.1"
 			;;
-- 
2.9.3


