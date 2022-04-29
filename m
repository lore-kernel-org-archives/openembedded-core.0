Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911E2C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:49 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.12124.1651248104245974346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=laAeEdw2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id z16so7282987pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eP1OA+LukvA7gd1XW7I4AZ3sov9R+s+GHbKg2rzgPtw=;
        b=laAeEdw2TP5V+mIzOthDR6ee5+5YYmlUD0ILizibqyS8bBCbtrvfAAX+jHkvUU3V/W
         hKERQbgSi5usytrKO2etFqGXokniqyw9QRbRYwz4/Fx55z+oT3eMDOZB4TxgHx7aoXi0
         7NV9GBoS/yFoCyDjAOER36KThOqkbsjALMDCiBaY3iiCXGIOmxPCRilTstWKXIKxo49f
         C7bk6GMrKlVgzRyO6UtIDYvMzmVTm+TAQ3qt55j6mJqV/9ct1Bc+7bQES5yyxrXBHVhV
         lxuiGSJ+AmH8twFpUTgmCBxFVijQ663U1AAE4sM75iE+mJwOHwEYkTk3MKVq9p++VO6f
         SXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eP1OA+LukvA7gd1XW7I4AZ3sov9R+s+GHbKg2rzgPtw=;
        b=nevelqbfHA9s6rqsi9PuJeYVls4FIFPkZgfUz9YdfzKg8ozcaTl9+xtPz7BqNHrQt/
         qc7KqLlhbic+Aw+wtVepbx0QhOw9eSRtSNti3MNVlbfQx0uxbh7/N6fKQqIGPi3NrhIR
         bzOA7KsnO25JEGKpVq/x9/7kBMJk5pwEoBvnmJdHwYW0Jbtw6nXkTPQPJGMO9M5jwxcw
         YUGx71Zwkd8GAIiEbnN7UKd8EZYCCttNIH7rBKfUy/4xtmmqEQ1t+awlQyjDMnYLJJTh
         oewPvfDBSONQXSNB7lI0TJqu4eLiiiUfMYXpCyLL2qcwTL6K7VleNRh0iSNlvW6slvwo
         sm8Q==
X-Gm-Message-State: AOAM5315wrbN/qNUKdoodI1XZnni+ZPzJuEZ3NB/S84xbRhgyN0DTJDt
	zWgh9TWG8KOzha88j1fDuHlkGg9aNflE/S5GwwU=
X-Google-Smtp-Source: 
 ABdhPJwIgg90IqQYqSr3RqVAbkgEi29bWOLJCJGZRLJPGtkFdJZDkvsxpUU81tyOukHtyrjbMWEgfw==
X-Received: by 2002:a63:7e4b:0:b0:3a5:6636:5b94 with SMTP id
 o11-20020a637e4b000000b003a566365b94mr60120pgn.173.1651248103022;
        Fri, 29 Apr 2022 09:01:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/34] package.bbclass: Prevent
 perform_packagecopy from removing /sysroot-only
Date: Fri, 29 Apr 2022 06:00:28 -1000
Message-Id: 
 <acc0a31305cb1f799e8a6b3ea2d2c5ac5a9f67ee.1651246310.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165027

From: Russ Dill <russ.dill@nikolamotor.com>

The files in /sysroot-only are intended to make it into the
recipes sysroot output, but not into the package. However, if
do_package is run before do_populate_sysroot, the files are
removed.

Use a smaller hammer to avoid copying the files into the package so
they are still around when do_populate_sysroot runs.

Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 493145c6f1bc92ab2b7a23e181641b09df87c9ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e71daafe94..44fbc32df6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -422,7 +422,6 @@ def splitstaticdebuginfo(file, dvar, dv, d):
     # return a mapping of files:debugsources
 
     import stat
-    import shutil
 
     src = file[len(dvar):]
     dest = dv["staticlibdir"] + os.path.dirname(src) + dv["staticdir"] + "/" + os.path.basename(src) + dv["staticappend"]
@@ -807,15 +806,10 @@ python perform_packagecopy () {
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


