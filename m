Received: from mail29.static.mailgun.info (mail29.static.mailgun.info [104.130.122.29])
 by mx.groups.io with SMTP id smtpd.web09.6422.1612339360868144354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 00:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=haHeRjXE;
 spf=pass (domain: mg.codeaurora.org, ip: 104.130.122.29, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612339363; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=gVGrqZe6xDGaYJYS8H6ZnixruTJGrSxjP+Jar0ePSC8=; b=haHeRjXEOFbYFzSGQ9Ms39uhO13jWXwygz+86aYXVkn8t2ptTk6xLlOwRI92+Ii6+QHU7yeI
 SdhYeBnLx4cEEd1BHcBfbiE5Xyis001F42UisWYHx7OnLZBt2ElZNUjWox62UstwGJ3UNGqn
 vRRRlgeOU7u3GqXRlpB2nFgm7JA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 601a588f6a70425dcae6f45a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Feb 2021 08:02:23
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id DEDC8C433ED; Wed,  3 Feb 2021 08:02:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hydlnxeng07.qualcomm.com (unknown [202.46.23.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 95E70C43463;
	Wed,  3 Feb 2021 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95E70C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sbanerje@codeaurora.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: openembedded-core@lists.openembedded.org
Cc: vkraleti@codeaurora.org,
	ndeche@codeaurora.org,
	himalg@codeaurora.org,
	Sourabh Banerjee <sbanerje@codeaurora.org>
Subject: [meta-oe][PATCH] populate_sdk_ext: copy files from build/conf/multiconfig to ${SDK_OUTPUT}/${SDKPATH}
Date: Wed,  3 Feb 2021 13:31:59 +0530
Message-Id: <1612339319-27820-1-git-send-email-sbanerje@codeaurora.org>
X-Mailer: git-send-email 2.7.4

the multiconfig files are required at ${SDK_OUTPUT}/${SDKPATH}
for the populate_sdk_ext to pass. Without the multiconfig files
following command runs into error:

  $ bitbake -c populate_sdk_ext mc::${image} mc:${conf1}:${image}

ERROR: bitbake failed:
ERROR: ParseError at ${/path}/poky/build/${tmp}/work/${machine}/${image}
                      /tmp-renamed-sdk/layers/poky/meta/conf/bitbake.conf:760:
                      Could not include required file conf/multiconfig/${conf1}.conf

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
---
 meta/classes/populate_sdk_ext.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e6bf27c..8d53219 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -184,11 +184,22 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
         if os.path.exists(localconf + '.bak'):
             os.replace(localconf + '.bak', localconf)
 
+def list_all_files(path):
+    all_files = list()
+    entries = os.listdir(path)
+    for entry in entries:
+       if os.path.isdir(path+entry):
+          all_files = all_files + list_all_files(path+entry)
+       else:
+          all_files.append(entry)
+    return all_files
+
 python copy_buildsystem () {
     import re
     import shutil
     import glob
     import oe.copy_buildsystem
+    from distutils.dir_util import copy_tree
 
     oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT')
 
@@ -401,6 +412,15 @@ python copy_buildsystem () {
         with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
             f.write('meta/conf\n')
 
+    # copy all contents of multiconfig directory from builddir if exists
+    if os.path.exists(builddir + '/conf/multiconfig/'):
+        try:
+            os.mkdir(baseoutpath + '/conf/multiconfig/')
+        except FileExistsError:
+            pass
+
+        copy_tree(builddir + '/conf/multiconfig/',  baseoutpath + '/conf/multiconfig/')
+
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
     extralines = []
@@ -525,7 +545,7 @@ python copy_buildsystem () {
     # it updated, since it gets modified during SDK installation (see
     # sdk_ext_postinst() below) thus the checksum we take here would always
     # be different.
-    manifest_file_list = ['conf/*']
+    manifest_file_list = list_all_files('conf/')
     esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
     esdk_manifest_excludes_list = []
     for exclude_item in esdk_manifest_excludes:
-- 
2.7.4



-- 
Regards,
Sourabh
