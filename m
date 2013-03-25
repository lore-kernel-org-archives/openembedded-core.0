Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKAjN-0005rA-GW
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:59:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2PGfjnK015476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 09:41:45 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 09:41:45 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 12:19:52 -0500
Message-ID: <1364231993-31670-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2 RFC] rpm: Add workaround for debugedit-segv
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 16:59:05 -0000
Content-Type: text/plain

[ YOCTO #4089 ]

On PPC and MIPS, there appears to be a condition that causes
debugedit to segfault.  The segfault is related to a call into
the md5hash algorithm, an address of '0', and a size > 0 is passed
causing the access of the address to segv.

This workaround may prove to be the final fix, but it's currently
unclear what the actual cause of the 0 address is.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch

diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
new file mode 100644
index 0000000..bd91693
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
@@ -0,0 +1,35 @@
+There are cases, especially on PPC and MIPS, where the data address
+returned is 0, but the size is not 0.
+
+It appears to happen when the sections headers are similar to:
+
+  [21] .data             PROGBITS        000239c0 0139c0 000010 00  WA  0   0  8
+  [22] .got              PROGBITS        000239d0 0139d0 000014 04 WAX  0   0  4
+  [23] .plt              NOBITS          000239e4 0139e4 000234 00 WAX  0   0  4
+  [24] .bss              NOBITS          00023c18 0139e4 0001c8 00  WA  0   0  8
+  [25] .comment          PROGBITS        00000000 0139e4 000011 01  MS  0   0  1
+  [26] .debug_aranges    PROGBITS        00000000 0139f8 000d68 00      0   0  8
+
+Sections 23 and 24 (.plt and .bss) which are NOBITS have a loaded data address
+of 0, but a size != 0.
+
+This could be a bug in libelf...
+
+Upstream-status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/tools/debugedit.c
+===================================================================
+--- rpm-5.4.9.orig/tools/debugedit.c
++++ rpm-5.4.9/tools/debugedit.c
+@@ -1434,7 +1434,8 @@ handle_build_id (DSO *dso, Elf_Data *bui
+     auto inline void process (const void *data, size_t size)
+     {
+       memchunk chunk = { .data = (void *) data, .size = size };
+-      hashFunctionContextUpdateMC (&ctx, &chunk);
++      if (data != NULL && size != 0)
++        hashFunctionContextUpdateMC (&ctx, &chunk);
+     }
+     union
+     {
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index ba24111..e9c8f23 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -84,7 +84,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://python-rpm-rpmsense.patch \
 	   file://rpm-reloc-macros.patch \
 	   file://rpm-platform2.patch \
-     file://rpm-remove-sykcparse-decl.patch \
+	   file://rpm-remove-sykcparse-decl.patch \
+	   file://debugedit-segv.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.8.1.2.545.g2f19ada



