Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B01BC43217
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.12125.1651248106993339315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WfE+LTEx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id i24so7271390pfa.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lcp+FjqsfpM5lyHQU0zmtNWeTmGqf1Oyjf6OLVY3HiM=;
        b=WfE+LTExhyvL2xyY4d3L8V0WqAFxcFTeCSP1dh0lqS8PPoiRd58JZtUOY7n9xCE/xq
         YBuu4SzUuEq09nmHx8mIvUNFzcAu1slWwRDiMcWfsNpBOjkLZLuWQMgBhwndVSu70y/O
         kuJSfEsxnyexB5DnAVIvpDT/kWcePReHBHSl4JpCLTSOWRHCcui8Ii7aXg1o25tL4YIg
         S7rSngOhOaRN6qoiGApJqPz3h7BybtQ6eMjp/CwPDUL1Q0JRZuDFWimrBTtOI4c944zO
         DdKXrgHkWZZBwQTv45tdyAr3Ap5/+pmBqByhO15bGRm/h7Lr01OqwfNPcMGItdim6WE+
         jLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lcp+FjqsfpM5lyHQU0zmtNWeTmGqf1Oyjf6OLVY3HiM=;
        b=e1Pc5mG+CGIIlIXXoOihrU4AprN6uyxKC4fyndD0QlGB3j7UDwBOgzY+NxMowmKEpi
         h8TISG7Kc9YkuzpaJvXMci4q6srmtDcqa8PMoWRj2+E3v0yQU49wtnJVq5tx/hMDmc9/
         iPCJKvn+a+gphPyTtL2BGWoPpTXB5QOmz3gi4OhtIXdAL0tHZA0b/P9+63J922v1LT+8
         zmW/139TpQMhz8JIUbm5uCsA+2Q6rmQlIs56dJnj1QvuUR2FdRShLM+IPhM0ZKrOjGRH
         j95QvmcJtJskv7NDaLaDur85STAsQrDqwuXQCGB4cPCgXy8UwLlMafVYd6MwFBti4LMo
         DyXw==
X-Gm-Message-State: AOAM5308VErPUGOjqfNbFvXLKNCaJn9ozBEY1Q+MOgmHn5fiW/6IhWlM
	B4h9macbYIQGuSXzfASoRRHMlbd3nbXMw5p3NdE=
X-Google-Smtp-Source: 
 ABdhPJzz2Kjov3p/bJpKQ/69vbSCKvDAPJsInChkNOuxvakwdQqYoYmFTvUYVssnJIDVtrwiTWJNUQ==
X-Received: by 2002:a05:6a00:190f:b0:50d:8b82:cb90 with SMTP id
 y15-20020a056a00190f00b0050d8b82cb90mr68829pfi.65.1651248105844;
        Fri, 29 Apr 2022 09:01:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/34] kernel-yocto.bbclass: Fixup
 do_kernel_configcheck usage of KMETA
Date: Fri, 29 Apr 2022 06:00:29 -1000
Message-Id: 
 <c322272a51d923cda9b0e5e388e32b7dd3a6bd22.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165029

From: Russ Dill <russ.dill@nikolamotor.com>

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
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit f4a3e80a4a6f4f709d09940dcaf45b2b00654496)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


