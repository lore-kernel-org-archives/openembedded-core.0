Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996FCC6787C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.17301.1650513510576399322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 20:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor-com.20210112.gappssmtp.com header.s=20210112
 header.b=AC6rc7JB;
 spf=pass (domain: nikolamotor.com, ip: 209.85.210.175,
 mailfrom: russ.dill@nikolamotor.com)
Received: by mail-pf1-f175.google.com with SMTP id j6so1497394pfe.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 20:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikolamotor-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mA4YZJOr/u/cpTxQIPoQYdA9OOkf9KzWm3cWgjOCxo0=;
        b=AC6rc7JB/eWnG0O+64iWRaQ2SmkfrzpHEBpbob/LXF/7I7e/r62L5NRqU9G80W6/2B
         YQY0KjUTbHvlll0QtKH0Qcdp2ocIecZe3tpXr8iHVxjdwLEuuq3PE6OnJ6wjMi65T6/e
         46zCVBiCIXsIhPLzOiKgb6AbVKjrhM8ztICF7cCRmzoABatOHsOJwEZXIzUkBC/GH+AQ
         EMYBwiZFknOIypFAS7VZBxF4Vn/uj/pDwa/w2S0XHkn7JcUPE0LFN3GyBmLkckCyaR6q
         48qf4lYJRjHhSDxhKkdIgl3um+qFNvheRjeyszKWrndBFFfqDwq8Bt6j5O1t/7MC1Kax
         GunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mA4YZJOr/u/cpTxQIPoQYdA9OOkf9KzWm3cWgjOCxo0=;
        b=dirRmAeyqiZjPX1KcDKLQS53AXA0Tu4LSUYXNb51h46jxSB4oJtm9zNXUP+JuscDJ3
         rsxTUB7u2SQfb/ltoGqmElua/N8nj8W3tV1ky4EH5JFKW8ZixicXrFOmIs9AQrivhfN1
         88n2mCJ3gJs1smTlzWmQOJNzMB2nyBb292J4WlS5buROiC5EfBJbYZ7Jxq7rbwW5OfJZ
         TmvCuCOb+CXRZ4byOFCssNeEVHcwN+D7VxsS3Ps7f9VasuZQr+WdqoszmxvF4fA2YR/6
         SxP7+N50ZnsCThsVjwj0tbBHnzxUK0hiRKh9gSRjBmvs/qQDVDZLZRu6MsbstJ69XzK0
         eIvw==
X-Gm-Message-State: AOAM531j8kleI0sCu4LAzUT6CCdx4fKJmB9lZeJt50Vl/fVUGsh4yX+6
	kGCNkS8KeslBmp/E7JSy3xOP9HVNiL2Z0nzgL/yZPA0M9h8n5tcrr/RkaGsB70kdGhwb5v4hYlg
	Kr+lnXy3moqabeBrVmCHJteXPdclLV36MKg2aFwxysROYTKIbi5qAPNBF6DnC/C3lA4tLvIiK0E
	c0RhiwMwqg9EhDlCJeHaN9EOxW+aNQLXYLIk3BY+Vs+8cZYK8b/LiRglX/evRDfIA7qdDjAgJXm
	AmXbPE=
X-Google-Smtp-Source: 
 ABdhPJyceCQp3lSAd2igBg0oe4ljapOZ/PymPBKbvm+yNkN62YA/IQSCfIpfPCkfc2aRjLWgpYBTIA==
X-Received: by 2002:a63:4a23:0:b0:39c:c255:11ef with SMTP id
 x35-20020a634a23000000b0039cc25511efmr21733949pga.569.1650513508685;
        Wed, 20 Apr 2022 20:58:28 -0700 (PDT)
Received: from localadmin.local ([47.145.220.128])
        by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a280a00b001d29a04d665sm734304pjd.11.2022.04.20.20.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 20:58:28 -0700 (PDT)
From: Russ Dill <russ.dill@nikolamotor.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Russ Dill <russ.dill@nikolamotor.com>
Subject: [PATCH] kernel-yocto.bbclass: Fixup do_kernel_configcheck usage of
 KMETA
Date: Wed, 20 Apr 2022 20:58:19 -0700
Message-Id: <20220421035819.3741349-1-russ.dill@nikolamotor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CLOUD-SEC-AV-Info: nikolamotor2,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164741

The do_kernel_configcheck task requires a meta directory, normally
set by ${KMETA}. The meta directory is taken as a relative path
from ${S}:

        outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )

However, when checking for the presence of ${KMETA} the current
working directory is searched. This will almost always fail and
"kgit --meta" is used instead. If the user does have a path in
their current working directory that matches the ${KMETA}
variable but the path is not present within the kernel source
directory, the build will fail if it tries to write config errors/
warnings to that path.

If ${KMETA} is not set, the same problem exists with the hard-coded
"meta" directory.

Fix these issues by checking for ${KMETA} within ${S} rather than
the current working directory. Additionally, drop the hardcoded
backup directory "meta" as it hasn't been functioning and
probably has no users

Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
---
 meta/classes/kernel-yocto.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d5a8cdf29..4cb638864c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -521,15 +521,15 @@ python do_config_analysis() {
 python do_kernel_configcheck() {
     import re, string, sys, subprocess
 
-    # if KMETA isn't set globally by a recipe using this routine, we need to
-    # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
-    # meta-series for processing
-    kmeta = d.getVar("KMETA") or "meta"
-    if not os.path.exists(kmeta):
-        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
-
     s = d.getVar('S')
 
+    # if KMETA isn't set globally by a recipe using this routine, use kgit to
+    # locate or create the meta directory. Otherwise, kconf_check is not
+    # passed a valid meta-series for processing
+    kmeta = d.getVar("KMETA")
+    if not kmeta or not os.path.exists('{}/{}'.format(s,kmeta)):
+        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
+
     env = os.environ.copy()
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
     env['LD'] = d.getVar('KERNEL_LD')
-- 
2.25.1


