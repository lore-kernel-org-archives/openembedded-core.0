Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 890717367B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:38:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1KIc85o015761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 10:38:09 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 20 Feb 2015 10:38:08 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:38:03 -0500
Message-ID: <a9038233862667971dc193ad0e160a7b28ef252a.1424456540.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424456540.git.bruce.ashfield@windriver.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto: warn when a generated BSP description is used
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
X-List-Received-Date: Fri, 20 Feb 2015 18:38:12 -0000
Content-Type: text/plain

The meta data (in tree or out of tree) that describes a BSP, its patches
and configuration is not always available when a new/default or manually
configured machine is built.

When this happens, the tools generate a skeleton BSP and use a
architecture defconfig for the build. If this is by design, the build
is typically sane and everything works fine. If an existing BSP
description was expected, chances are that the resulting kernel will not
be correct.

To avoid surprising the user when a default/skeleton BSP is used for the
build, we can make it obvious to the user by emitting a warning like
the following:

   WARNING: [kernel]: An auto generated BSP description was used, this normally indicates a misconfiguration.
            Check that your machine (myqemux86-64) has an associated kernel description.

[YOCTO: #3383]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0cbbb5f2d22f..a5e2b180c496 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -281,6 +281,15 @@ python do_kernel_configcheck() {
             with open (nonhw_file, "r") as myfile:
                 results = myfile.read()
                 bb.warn( "[kernel config]: BSP specified non-hw configuration:\n\n%s" % results)
+
+    bsp_desc = "${S}/" + kmeta + "/" + "top_tgt"
+    if os.path.exists(bsp_desc):
+        with open (bsp_desc, "r") as myfile:
+                bsp_tgt = myfile.read()
+                m = re.match("^(.*)scratch.obj(.*)$", bsp_tgt)
+                if not m is None:
+                    bb.warn( "[kernel]: An auto generated BSP description was used, this normally indicates a misconfiguration.\n" +
+                             "Check that your machine (%s) has an associated kernel description." % "${MACHINE}" )
 }
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
-- 
2.1.0


