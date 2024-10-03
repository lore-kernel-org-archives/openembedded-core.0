Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE364CF34D2
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 22:56:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.9862.1727996178941276534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 15:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZG+Dki+1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so14580795e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727996177; x=1728600977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqsBbcT1ZVRyMmPE88O/YiXQj4fkGhhCduI2IXrTAoQ=;
        b=ZG+Dki+1uQ/sOs8aB3K4jIZdQdhqSgU2kvALNAWhTtuvj93/vHwm3nsGPdZaWLCJe9
         96pcW9M9fI2RUtPLLxAKlCTPKrVwsRIjUB8p22JVPKW3r8jqxKFZtVQ5x9OXclyYZZ2y
         x+0L1PfDDzpkJ/bjuntqL/U8iBJBOAbqRUUgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727996177; x=1728600977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqsBbcT1ZVRyMmPE88O/YiXQj4fkGhhCduI2IXrTAoQ=;
        b=mGEAQBKy/M0nXMMdLSEfdcIJD6NuV68UHt0HoF4kxCx9RX1NyQzvCkNvIIfHx0bAYR
         /Q5/1jI1hHSEDvSfJ+MIPKRhcM9bv6BPfJ//qy/wLmw+W7tPrjdWt0iIpAUbKE/qPCy9
         BoQ2jyuglf0MMhTPPaN1mVcqgtHjC3YC04l8Oheog9DEJu7j7uwJJT3bwQYAU+HLj52w
         07qMxTyFrz1cDZ+SocG4tPBFvQ+RShy2r9QCq8Ix+jMviZRBxTpaHui4J+NfoFQl0XBW
         oECo9BCkOdlgDxZmLgtSPKPnb36NuyFYo5FgEVUj+vGqr7Sufjvgm2ZoRsdF7MB5JKTr
         smRQ==
X-Gm-Message-State: AOJu0YzCOhELeSs5mlC3E/Ev5kvmBzwavFFllWDoMF0AL69jMFyCxUAn
	fzFAeNhfdbQ2GzzoToeJqHiq5ce6jW35G1LtUxtZZgBsw+7GY33xl63q5VhitY4Kw8fef5kCTHu
	5
X-Google-Smtp-Source: AGHT+IEfJ88vz/BGwCKIq28K5uVUJSntp0FWr/C7tcJoOL5BbZcxPTOBHZ64vki7Jxs/2QjE99AmPA==
X-Received: by 2002:a05:600c:5115:b0:42c:bdb0:c625 with SMTP id 5b1f17b1804b1-42f85aa7af8mr4113835e9.14.1727996176947;
        Thu, 03 Oct 2024 15:56:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:353c:2dbf:4add:7461])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d081f736esm2118583f8f.18.2024.10.03.15.56.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 15:56:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] migrate_localcount: Drop long obsolete code
Date: Thu,  3 Oct 2024 23:56:15 +0100
Message-ID: <20241003225615.3724280-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 22:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205219

If BB_URI_LOCALCOUNT isn't set, the code does nothing. That code was removed in 2012:

https://git.yoctoproject.org/poky/commit/?id=d0f35207f9e19b440393a79ebf621649c495738d

Therefore drop the rest of it!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/migrate_localcount.bbclass | 52 -------------------------
 meta/conf/migrate_localcount.conf       |  1 -
 scripts/bitbake-prserv-tool             | 40 -------------------
 3 files changed, 93 deletions(-)
 delete mode 100644 meta/classes/migrate_localcount.bbclass
 delete mode 100644 meta/conf/migrate_localcount.conf

diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migrate_localcount.bbclass
deleted file mode 100644
index 1d00c110e28..00000000000
--- a/meta/classes/migrate_localcount.bbclass
+++ /dev/null
@@ -1,52 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-PRSERV_DUMPDIR ??= "${LOG_DIR}/db"
-LOCALCOUNT_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv-localcount-exports.inc"
-
-python migrate_localcount_handler () {
-    import bb.event
-    if not e.data:
-        return
-
-    pv = e.data.getVar('PV')
-    if not 'AUTOINC' in pv:
-        return
-
-    localcounts = bb.persist_data.persist('BB_URI_LOCALCOUNT', e.data)
-    pn = e.data.getVar('PN')
-    revs = localcounts.get_by_pattern('%%-%s_rev' % pn)
-    counts = localcounts.get_by_pattern('%%-%s_count' % pn)
-    if not revs or not counts:
-        return
-
-    if len(revs) != len(counts):
-        bb.warn("The number of revs and localcounts don't match in %s" % pn)
-        return
-
-    version = e.data.getVar('PRAUTOINX')
-    srcrev = bb.fetch2.get_srcrev(e.data)
-    base_ver = 'AUTOINC-%s' % version[:version.find(srcrev)]
-    pkgarch = e.data.getVar('PACKAGE_ARCH')
-    value = max(int(count) for count in counts)
-
-    if len(revs) == 1:
-        if srcrev != ('AUTOINC+%s' % revs[0]):
-            value += 1
-    else:
-        value += 1
-
-    bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR'))
-    df = e.data.getVar('LOCALCOUNT_DUMPFILE')
-    flock = bb.utils.lockfile("%s.lock" % df)
-    with open(df, 'a') as fd:
-        fd.write('PRAUTO$%s$%s$%s = "%s"\n' %
-                (base_ver, pkgarch, srcrev, str(value)))
-    bb.utils.unlockfile(flock)
-}
-
-addhandler migrate_localcount_handler
-migrate_localcount_handler[eventmask] = "bb.event.RecipeParsed"
diff --git a/meta/conf/migrate_localcount.conf b/meta/conf/migrate_localcount.conf
deleted file mode 100644
index e486e03e5ff..00000000000
--- a/meta/conf/migrate_localcount.conf
+++ /dev/null
@@ -1 +0,0 @@
-INHERIT += "migrate_localcount"
diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index 80028342b16..0559c4c38a6 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -55,43 +55,6 @@ do_import ()
     return $ret
 }
 
-do_migrate_localcount ()
-{
-    df=`bitbake -R conf/migrate_localcount.conf -e | \
-                grep ^LOCALCOUNT_DUMPFILE= | cut -f2 -d\"`
-    if [ "x${df}" == "x" ];
-    then
-        echo "LOCALCOUNT_DUMPFILE is not defined!"
-        return 1
-    fi
-
-    rm -f $df
-    clean_cache
-    echo "Exporting LOCALCOUNT to AUTOINCs..."
-    bitbake -R conf/migrate_localcount.conf -p
-    [ ! $? -eq 0 ] && echo "Exporting to file $df failed!" && exit 1
-
-    if [ -e $df ];
-    then
-        echo "Exporting to file $df succeeded!"
-    else
-        echo "Exporting to file $df failed!"
-        exit 1
-    fi
-    
-    echo "Importing generated AUTOINC entries..."
-    [ -e $df ] && do_import $df
-
-    if [ ! $? -eq 0 ]
-    then
-        echo "Migration from LOCALCOUNT to AUTOINCs failed!"
-        return 1
-    fi
-
-    echo "Migration from LOCALCOUNT to AUTOINCs succeeded!"
-    return 0
-}
-
 [ $# -eq 0 ] && help  && exit 1
 
 case $2 in
@@ -110,9 +73,6 @@ export)
 import)
     do_import $2
     ;;
-migrate_localcount)
-    do_migrate_localcount
-    ;;
 *)
     help
     exit 1

