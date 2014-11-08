Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B40A971FE8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 05:56:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA85uQSg001605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 21:56:26 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 21:56:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 8 Nov 2014 13:56:19 +0800
Message-ID: <d354ae6a6eb49df114d02e0e80c464cb9af8f42f.1415426131.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415426131.git.hongxu.jia@windriver.com>
References: <cover.1415426131.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] compress_doc.bbclass: improve manual file detection
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
X-List-Received-Date: Sat, 08 Nov 2014 05:56:29 -0000
Content-Type: text/plain

The previous detection missing the following manual file:
...
gawk-doc/usr/share/man/man3/readfile.3am
libpcap-doc/usr/share/man/man3/pcap_dump_open.3pcap
...

We use re to imporve it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/compress_doc.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index 6a4e635..afa9cd6 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -136,11 +136,14 @@ def _is_info(file):
     return False
 
 def _is_man(file):
+    import re
+
     # It refers MANSECT-var in man(1.6g)'s man.config
-    flags = '.1:.1p:.8:.2:.3:.3p:.4:.5:.6:.7:.9:.0p:.tcl:.n:.l:.p:.o'.split(':')
-    for flag in flags:
-        if os.path.basename(file).endswith(flag):
-            return True
+    # ".1:.1p:.8:.2:.3:.3p:.4:.5:.6:.7:.9:.0p:.tcl:.n:.l:.p:.o"
+    # Not start with '.', and contain the above colon-seperate element
+    p = re.compile(r'[^\.]+\.([1-9lnop]|0p|tcl)')
+    if p.search(file):
+        return True
 
     return False
 
-- 
1.9.1


