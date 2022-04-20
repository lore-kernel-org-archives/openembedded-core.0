Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646EBC6371B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.9681.1650470619629100737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor-com.20210112.gappssmtp.com header.s=20210112
 header.b=D5t5EnTV;
 spf=pass (domain: nikolamotor.com, ip: 209.85.216.52,
 mailfrom: russ.dill@nikolamotor.com)
Received: by mail-pj1-f52.google.com with SMTP id o5so2373007pjr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikolamotor-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YYUIwgyksd0CKnFHdkWyrsnA3Uk8JSmtq+mbTU20lVw=;
        b=D5t5EnTV6Xo7Z9UBB4ctipq3aSiLny6Ol6/UVAE6UOu3Bcshd2ORDOmklkYu5eMQ3B
         aQqRWJhatSUDZg8ko4q3pGMv2wCPkxFsmeSkHryHl5Ts1Lk2W9gs2//TgUnL8+OAiA5I
         5M5YZpC35/0t3sVHmeLq6FKf68gfyrWTIW7bmN1vLyKO8kJk9gaVwNYPsVdZ9fBSSX7L
         0pl04hNhUkrshGd2DQAzKlDfIjJxU+/I+46ogQH6wii3Qk7rkQXgIF+YZWLDAqp8GyX/
         cdPr7aDdTbGtaNt729UanWCPQRpIe0kc7jotMvaldDQ0/4qjz0vsi+MWu2VV2/qzO9PT
         FaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YYUIwgyksd0CKnFHdkWyrsnA3Uk8JSmtq+mbTU20lVw=;
        b=KB2OcUw8ZPN+FT2XsIO9/FITfVHT2nOziSezpj0rerNUCWWVr+cWpEQxCpMiknCcnq
         U3wqGk2Uf5tSnBCcSi1DQHJQ4gRvlPlBBdT1Y++Pf9lwoXIqbM81tKc9KDCpJdIMNsNu
         kONQ6HIyBHDGvHBvNPruCdkGlX/O4dJtxG+JyilVevt5+PAuHMEBDALAHIo9rm+0JKGW
         RFdRZwp1Oy6SMuw1g70yTgaQu44K+bgYPaMkwtWZdJsemPGxCRQGwK5b70tcnVgFpvgr
         ubQpUPCKvWNZWsBN4Ymhw7BKtXC+0nwP36StUsfCas6Sq40gkJZVbmzFNtFnF2+nHLKi
         71Xw==
X-Gm-Message-State: AOAM530mXzLjugMQyISehB2roaMGK+Ohb2sC+Qm2wZSpVOJ3AsTidJGG
	PRAcvw2ay5T5JPqbMqaLsO/jyytA32xsx0WDSKCFWWlYjZ+gmZavyBcBKsjwZjBVCLKP5XoK7hB
	T6VIqpHRpNZrwDXcEqM7lMY7NNfUXXkrO1MrztFef6ETjhylM3EhTQQ6Dfze5gyE4U7jccHsumU
	bP9vSNzV1OBp1XBQFolIyHXFJnaIPQmMtJgjwJBpF6CkyHK4y+adI3LMOHrRaodJt0k9flFWaHF
	VdCcoY=
X-Google-Smtp-Source: 
 ABdhPJwwerlJnwB2lbDIlaWph/9CMPa6EyEth6wzdtYYzUWd+KZToy/RBnwS6W7OpSFDqzCqr7z3qQ==
X-Received: by 2002:a17:903:2312:b0:159:3df:5651 with SMTP id
 d18-20020a170903231200b0015903df5651mr13963887plh.44.1650470617435;
        Wed, 20 Apr 2022 09:03:37 -0700 (PDT)
Received: from localadmin.local ([47.145.220.128])
        by smtp.gmail.com with ESMTPSA id
 y30-20020a056a001c9e00b004fa9246adcbsm20037966pfw.144.2022.04.20.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:03:37 -0700 (PDT)
From: Russ Dill <russ.dill@nikolamotor.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Sueiro <diego.sueiro@arm.com>,
	Russ Dill <russ.dill@nikolamotor.com>
Subject: [PATCH] package.bbclass: Prevent perform_packagecopy from removing
 /sysroot-only
Date: Wed, 20 Apr 2022 09:03:29 -0700
Message-Id: <20220420160329.3355315-1-russ.dill@nikolamotor.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164709

The files in /sysroot-only are intended to make it into the
recipes sysroot output, but not into the package. However, if
do_package is run before do_populate_sysroot, the files are
removed.

Use a smaller hammer to avoid copying the files into the package so
they are still around when do_populate_sysroot runs.

Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
---
 meta/classes/package.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 985dfacd09..c0e9b4dbca 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -428,7 +428,6 @@ def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugsta
     # return a mapping of files:debugsources
 
     import stat
-    import shutil
 
     src = file[len(dvar):]
     dest = debugstaticlibdir + os.path.dirname(src) + debugstaticdir + "/" + os.path.basename(src) + debugstaticappend
@@ -811,15 +810,10 @@ python perform_packagecopy () {
     dest = d.getVar('D')
     dvar = d.getVar('PKGD')
 
-    # Remove ${D}/sysroot-only if present
-    sysroot_only = os.path.join(dest, 'sysroot-only')
-    if cpath.exists(sysroot_only) and cpath.isdir(sysroot_only):
-        shutil.rmtree(sysroot_only)
-
     # Start by package population by taking a copy of the installed
     # files to operate on
     # Preserve sparse files and hard links
-    cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (dest, dvar)
+    cmd = 'tar --exclude=./sysroot-only -cf - -C %s -p -S . | tar -xf - -C %s' % (dest, dvar)
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
-- 
2.25.1


