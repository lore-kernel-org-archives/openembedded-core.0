Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 690E879603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF077m008948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:07 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:51 -0400
Message-ID: <6d0bc23871a9280d074fca7a58f4d5a69ddf09c0.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] kernel-yocto: restore BSP audit visibility
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:06 -0000
Content-Type: text/plain

During the re-working of kernel fragments and status output cleanup the
visibility for BSP level errors was dropped/removed.

The audit phase can detect errors, redefinition and invalid
configuration fragments. We control the visibility of these reports via
the existing KCONF_BSP_AUDIT_LEVEL variable.

By default, errors and invalid configuration values will be displayed as
a warning. If redefinition values are to be shown the audit level must
be raised above the deafult value of '2'. We inhibit these by default,
since there are many valid reasons why a BSP will change a default /
base config .. and showing them offers no value to the BSP user.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 19d74a78757b..2ecd06009321 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -350,6 +350,7 @@ python do_kernel_configcheck() {
         pass
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
+    bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
 
     # if config check visibility is non-zero, report dropped configuration values
     mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
@@ -358,6 +359,27 @@ python do_kernel_configcheck() {
             with open (mismatch_file, "r") as myfile:
                 results = myfile.read()
                 bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration:\n\n%s" % results)
+
+    if bsp_check_visibility:
+        invalid_file = d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
+        if os.path.exists(invalid_file) and os.stat(invalid_file).st_size > 0:
+            with open (invalid_file, "r") as myfile:
+                results = myfile.read()
+                bb.warn( "[kernel config]: This BSP sets config options that are not offered anywhere within this kernel:\n\n%s" % results)
+        errors_file = d.expand("${S}/%s/cfg/fragment_errors.txt" % kmeta)
+        if os.path.exists(errors_file) and os.stat(errors_file).st_size > 0:
+            with open (errors_file, "r") as myfile:
+               results = myfile.read()
+               bb.warn( "[kernel config]: This BSP contains fragments with errors:\n\n%s" % results)
+
+    # if the audit level is greater than two, we report if a fragment has overriden
+    # a value from a base fragment. This is really only used for new kernel introduction
+    if bsp_check_visibility > 2:
+        redefinition_file = d.expand("${S}/%s/cfg/redefinition.txt" % kmeta)
+        if os.path.exists(redefinition_file) and os.stat(redefinition_file).st_size > 0:
+            with open (redefinition_file, "r") as myfile:
+                results = myfile.read()
+                bb.warn( "[kernel config]: This BSP has configuration options defined in more than one config, with differing values:\n\n%s" % results)
 }
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
-- 
2.5.0


