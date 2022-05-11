Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F17C4332F
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.6508.1652237864009171798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=af5IqX9d;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237866; x=1683773866;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4XuM8l+np9geNXwH2oSboCXTEYnnSQgc9j5QrOdu1z8=;
  b=af5IqX9diSf/ZBAUX2JmP03JmPTQeV6K/nifQldVYAPoqFJaAdQDYhNi
   UEqElWWu/ewyNrXZ9uj8vzxmu/+Dd3GeIKRmTv8gcSSL4IqbbiIuEhXJ0
   eRmcsbC/O5OMeVbbdqLIe8Ckw0OsIIl0Qv5vstXZfYKReTUOhYQY/NwFF
   4RBUFIVzjI+YkHQvFkUpI/oMJsUooPHd/OvM8AmwCmE5njN709v9RMkwn
   X4elrEeieeUHQklYZ/xrKj09nIPRM7UbflGzdCjQQAaapInWb+cxXQca2
   edYwt0cGxRTgsWdlu2q7Dve+ds9ZC4VST/aHXtqMz4lDkeK9XmVD+QtuJ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106002"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106002"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754707"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:44 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/17] rootfs-postcommands: fix symlinks where link
 and output path are equal
Date: Wed, 11 May 2022 10:57:19 +0800
Message-Id: 
 <aae0ba9a83f4aa0d3812f9fd643a444ece7653f2.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165473

From: Davide Gardenal <davidegarde2000@gmail.com>

When creating the manifest and the testdata.json links, if the link
name is equal to the output name the link is not created, otherwise
it is. This prevents a link-to-self in the first case.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bed63756c56f296ff3d5a7eef66e978bd19f1008)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 0452fe4b27..2310e86cdf 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -267,9 +267,10 @@ python write_image_manifest () {
 
     if os.path.exists(manifest_name) and link_name:
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.lexists(manifest_link):
-            os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
+        if manifest_link != manifest_name:
+            if os.path.lexists(manifest_link):
+                os.remove(manifest_link)
+            os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
 # Can be used to create /etc/timestamp during image construction to give a reasonably
@@ -339,9 +340,10 @@ python write_image_test_data() {
 
     if os.path.exists(testdata_name) and link_name:
         testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
-        if os.path.lexists(testdata_link):
-            os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata_name), testdata_link)
+        if testdata_link != testdata_name:
+            if os.path.lexists(testdata_link):
+                os.remove(testdata_link)
+            os.symlink(os.path.basename(testdata_name), testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.35.3


