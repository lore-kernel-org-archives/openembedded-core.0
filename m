Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.29733.1628809218742807077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 16:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQu0FuFH;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso13151183pjy.5
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 16:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEzoBcOVR0M/AzCtozba05McW4QBtOmTqCCVcUNmY9w=;
        b=LQu0FuFHTiiE6m+vdzCVTmpS77uxxtr/+ZzM/VMFUuosc6hnvtkqp5vI4AR9nedJs8
         t3y9i+henGvirevQzKm3FTSw2Kda/bDnLhK21rTk1FlzxZ52zVtddMmIUXj1ulDP5L3p
         AKeHGLq4N7vnfY+13M7ZgRuL/J1n0RY8JFHLyfDCU/j9b5bVV8I6Nglv6zCP0Uk0l32F
         lkXBt2MtWvwqx+2uw+SxAMCslYePLNKOuYrVTD6NhXjwgwaqfBIxLgAeN1hukqO2HZYf
         WDZ41Ao3aCgaJNhDue4blWOGxIcx3b8CFrksUeSJqwe3TYfsIts/Nnl8C6X3JA4dC67m
         ovZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEzoBcOVR0M/AzCtozba05McW4QBtOmTqCCVcUNmY9w=;
        b=DI6g/RQN721r5HTy7DcMhfk4t5CvCzBYUfVGDrtUmWBAzWteY6Vau43incxwqbp19d
         Uyo3ByZhoeVbDsA0y9APs100fBvVoAGcWuyyIjI/Zif1FCwc1dsOZVrwdYHxOogw5LyW
         bABd9RcCQVaFLPKZOuffFq8VmaUQFZ/tCzlC3l56V4Q23Oi7Du8IN2OBoICo5XmzKGwx
         FIokFF1gFo3Q2cdKGqThX7X2pxZJ0AGGfti3WfsjxdKxqZrr/ff87nQZ1cEd8nmIkSSo
         beuFxaGmW+t9ObVbh0Lh250PtwlmRE3rqeo9cmCXAXoxPjxEEUbSjPBHq5Su7BUUrRcD
         HX6Q==
X-Gm-Message-State: AOAM530WxXs/naXuCTk0Ol2xxXQZvGWPn44FGXAwt6qwnuEdRLw5zaEM
	zx5299Bl5a6Md1iLYewSOPFiZvaRhDT+Jw==
X-Google-Smtp-Source: ABdhPJwnYj0/R51xDrJ1tZ+/5KEleflfKItT6JpNokIkm46UTpT3RoIxnsoDKPnKEOA8UP00o28csg==
X-Received: by 2002:a62:1892:0:b029:349:1b8f:af2b with SMTP id 140-20020a6218920000b02903491b8faf2bmr6399665pfy.20.1628809217922;
        Thu, 12 Aug 2021 16:00:17 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:722c:f107:144b:6ff3])
        by smtp.gmail.com with ESMTPSA id l10sm3318292pjy.47.2021.08.12.16.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 16:00:17 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] package.bbclass: FILER* override syntax
Date: Thu, 12 Aug 2021 16:00:04 -0700
Message-Id: <20210812230004.1533422-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkgdata no longer includes FILERPROVIDES* nor
FILERDEPENDS*. Fix with new override syntax.

Also apply to FILERPROVIDESLIST and FILERDEPENDSLIST.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/package.bbclass | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a659a1ef5c..a9138ff6be 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1663,12 +1663,12 @@ fi
                 val = write_if_exists(sf, pkg, var)
 
             write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-            for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
-                write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
+            for dfile in (d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split():
+                write_if_exists(sf, pkg, 'FILERPROVIDES:' + dfile)
 
             write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-            for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
-                write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
+            for dfile in (d.getVar('FILERDEPENDSFLIST:' + pkg) or "").split():
+                write_if_exists(sf, pkg, 'FILERDEPENDS:' + dfile)
 
             sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
@@ -1714,11 +1714,11 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps --define '__font_provi
 
 # Collect perfile run-time dependency metadata
 # Output:
-#  FILERPROVIDESFLIST_pkg - list of all files w/ deps
-#  FILERPROVIDES_filepath_pkg - per file dep
+#  FILERPROVIDESFLIST:pkg - list of all files w/ deps
+#  FILERPROVIDES:filepath:pkg - per file dep
 #
-#  FILERDEPENDSFLIST_pkg - list of all files w/ deps
-#  FILERDEPENDS_filepath_pkg - per file dep
+#  FILERDEPENDSFLIST:pkg - list of all files w/ deps
+#  FILERDEPENDS:filepath:pkg - per file dep
 
 python package_do_filedeps() {
     if d.getVar('SKIP_FILEDEPS') == '1':
@@ -1755,18 +1755,18 @@ python package_do_filedeps() {
 
         for file in sorted(provides):
             provides_files[pkg].append(file)
-            key = "FILERPROVIDES_" + file + "_" + pkg
+            key = "FILERPROVIDES:" + file + ":" + pkg
             d.appendVar(key, " " + " ".join(provides[file]))
 
         for file in sorted(requires):
             requires_files[pkg].append(file)
-            key = "FILERDEPENDS_" + file + "_" + pkg
+            key = "FILERDEPENDS:" + file + ":" + pkg
             d.appendVar(key, " " + " ".join(requires[file]))
 
     for pkg in requires_files:
-        d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files[pkg]))
+        d.setVar("FILERDEPENDSFLIST:" + pkg, " ".join(requires_files[pkg]))
     for pkg in provides_files:
-        d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files[pkg]))
+        d.setVar("FILERPROVIDESFLIST:" + pkg, " ".join(provides_files[pkg]))
 }
 
 SHLIBSDIRS = "${WORKDIR_PKGDATA}/${MLPREFIX}shlibs2"
-- 
2.30.2

