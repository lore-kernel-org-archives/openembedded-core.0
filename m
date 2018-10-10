Return-Path: <gtertych@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 92AB77869E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2280; q=dns/txt; s=iport;
	t=1539188783; x=1540398383;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=EX7K8h+Dh5KY+PAkckU/HTs6djtr5ZGJN/8occ79WTU=;
	b=fm4zEGdi+XyT8WKUoxvVjmAYg6Dz/EMiJQ74ZYF1+QJqZMo/3pK3OfHV
	z1/abjr12u0fyfwHCJET7tQYZGc3yHtMg7h+axotVYvdbXXkUrHKoFCVa
	5lgBTrsw7/yNrf+jqR8lGwDv00vrZHXjmSA0+F3EPs/bAA2Lb2Fi61rqc g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AJAAD0Jr5b/xbLJq1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUwMBAQEBCwGCA2ZtEiiMaZZijX+Beg0bhFGEczYLDQEDAQE?=
	=?us-ascii?q?CAQECbRwMhXIBRoFRgyEBgXQNpmWEd4RkFIcIhDaBQT+FZQGECYULAo8gjmY?=
	=?us-ascii?q?JhlGJdQsXgU9Lhy6GQyyVYIFJAy6BVXAVgycJgimJNoRwPDCMXgEB?=
X-IronPort-AV: E=Sophos;i="5.54,364,1534809600"; 
   d="scan'208";a="7142872"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2018 16:26:21 +0000
Received: from think.cisco.com (dhcp-10-61-106-181.cisco.com [10.61.106.181])
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id w9AGQM8e020495;
	Wed, 10 Oct 2018 16:26:22 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 19:26:24 +0300
Message-Id: <20181010162624.7377-1-gtertych@cisco.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.106.181, dhcp-10-61-106-181.cisco.com
X-Outbound-Node: aer-core-4.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH v3] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Wed, 10 Oct 2018 16:26:23 -0000
Content-Transfer-Encoding: 8bit

Append '\n' to the non-empty formatted string before return. If you
write it to the (manifest) file, it will ensure file ends with a newline.

Many GNU utilities have problems processing the last line of a file
if it is not '\n' terminated. E.g. if the last line is not terminated
by a newline character, then "read" will read it but return false,
leaving the broken partial line in the read variable(s).
It can also break or adversely affect some text processing tools,
that operate on the file.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---

Changes in v3:
 o write_image_manifest(): remove extra '\n'

PASS bitbake buildtools-tarball
PASS bitbake core-image-minimal                                                                                              
PASS bitbake core-image-sato -c do_populate_sdk_ext
PASS oe-selftest --run-tests manifest.VerifyManifest.test_image_manifest_entries

 meta/classes/rootfs-postcommands.bbclass | 1 -
 meta/lib/oe/utils.py                     | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e816824f28..bde58ad6cd 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -253,7 +253,6 @@ python write_image_manifest () {
     pkgs = image_list_installed_packages(d)
     with open(manifest_name, 'w+') as image_manifest:
         image_manifest.write(format_pkg_list(pkgs, "ver"))
-        image_manifest.write("\n")
 
     if os.path.exists(manifest_name):
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 93b0763b0a..d05f517a70 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -347,7 +347,13 @@ def format_pkg_list(pkg_dict, ret_format=None):
         for pkg in sorted(pkg_dict):
             output.append(pkg)
 
-    return '\n'.join(output)
+    output_str = '\n'.join(output)
+
+    if output_str:
+        # make sure last line is newline terminated
+        output_str += '\n'
+
+    return output_str
 
 def host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
-- 
2.19.0


