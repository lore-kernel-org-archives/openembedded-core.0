Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7601B73D46
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:21:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA3MLFVr023333
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Nov 2015 14:21:15 -0800
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 3 Nov 2015 14:21:15 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Nov 2015 16:21:13 -0600
Message-ID: <1446589273-23317-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1446589273-23317-1-git-send-email-mark.hatle@windriver.com>
References: <1446589273-23317-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] binutils: Fix XLP / Octeon 3 instruction clash
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
X-List-Received-Date: Tue, 03 Nov 2015 22:21:16 -0000
Content-Type: text/plain

Use the value 0x00000080 for INSN_XLP, as the value 0x00000040 has already
been assigned to INSN_OCTEON3 by the binutils project.

Without this change, invalid instructions can be generated for both INSN_XLP
and INSN_OCTEON3.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../binutils/binutils/0012-Add-XLP-instructions-support.patch     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
index c56ff91..ecc37cc 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
@@ -31,6 +31,12 @@ Netlogic. Also, update vendor name to NLM wherever applicable.
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Use 0x00000080 for INSN_XLP, the value 0x00000040 has already been assigned
+to INSN_OCTEON3
+
+Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 ---
  bfd/aoutx.h           |  1 +
  bfd/archures.c        |  1 +
@@ -251,7 +257,7 @@ index ef26167..ef53ec6 100644
 +/* Netlogic Xlr instruction */
 +#define INSN_XLR		0x00000020
 +/* Netlogic XlP instruction */
-+#define INSN_XLP		0x00000040
++#define INSN_XLP		0x00000080
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-- 
1.9.3


