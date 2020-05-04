Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.10325.1588610678547089426
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 09:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e/Y6Itxy;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id v4so437253wme.1
        for <Openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 09:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6voPpv6paKOeofYmRFqDsoxDqFp4DwVBdezcvoR3Dqk=;
        b=e/Y6ItxyE4z669DFAC1+puW2qISAkrl0kH+Mn8iRh5uswkfIADiJttIbtcH2rhsyom
         eyWTi7euxPGSvpiHRImb+Qg9MBZrTawJSktx+KadGXbMIj+MpT6+gwwimSb0eRRIzBNl
         q+bOWx5pKQhYKkjStiutlb3WIpsee1QdB1yA52zrUGfrFTu4DUFMFmj988+EArNuED66
         HkLwGzzskZ2f3L2PZ1DrI0qkmZBctxK+sOyn6J+rcfzxjiBPUfVwPkD1fA5ec0bgkli/
         QmLPpHi8m56lz2PZCd04kKEpAzc6A7gm0tOHkM9BWVShpuua2wB0YMOmBqhDPhPunR3N
         Gp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6voPpv6paKOeofYmRFqDsoxDqFp4DwVBdezcvoR3Dqk=;
        b=n+9OCX5dlf8b6/fMroTqxlh3rjut4i/GUh0GisbE1Ph0HZxkC4eQElqbUjetFTGH5z
         GKedWoNvMPf6L/0tSiY/AFP0U2JMs0ZujJX4amwsnWQnR6XRnWb0yzSKH34TC5IxZMjM
         z+YHvJRUbSGsxtcupWaLXiwfZKvelRE2fucPRMbqJmCSsiFv03Z6wpQeYtP6XyEm3+u5
         dp0OnAmYMvlU6SzC8cTjIDOOCaihHKL8LYZQB/HyDqjKax2xyb2YFe2arLouf1o7tj9j
         MBmXSQmUw3nfBE+/qb/RRacXd46QVswmSliFnEBYEy1y+rVvheDUCJzOR/FcCa2AYNPc
         YirA==
X-Gm-Message-State: AGi0PuZJDeioRqPVHjskvc2OvcFbSipS35IdbLyJoOiMWmjhS3dIUr+n
	f6Cg1zHEXf8/cpKPcrxHsquGx00alns=
X-Google-Smtp-Source: APiQypIXlxvhzUAjEXGO0GIJv3+aRBAXYRhKUJNDGTF1z4fcp3O7by4LFXMqWmRmOuQAwAnKDRORZA==
X-Received: by 2002:a1c:bd54:: with SMTP id n81mr15159897wmf.141.1588610676810;
        Mon, 04 May 2020 09:44:36 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-252.002.205.pools.vodafone-ip.de. [2.205.7.252])
        by smtp.gmail.com with ESMTPSA id q4sm13371491wrx.9.2020.05.04.09.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 09:44:36 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH] bitbake: fetch2: Fix CVS fetcher clean method
Date: Mon,  4 May 2020 18:44:16 +0200
Message-Id: <20200504164416.687804-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Clean method assumes that download directory should be determined from
CVSDIR variable, but this is handled differently in download method.
Now we set download directory for the whole class in urldata_init

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 bitbake/lib/bb/fetch2/cvs.py | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/cvs.py b/bitbake/lib/bb/fetch2/cvs.py
index 29123a483c..22abdef792 100644
--- a/bitbake/lib/bb/fetch2/cvs.py
+++ b/bitbake/lib/bb/fetch2/cvs.py
@@ -51,6 +51,10 @@ class Cvs(FetchMethod):
 
         ud.localfile = d.expand('%s_%s_%s_%s%s%s.tar.gz' % (ud.module.replace('/', '.'), ud.host, ud.tag, ud.date, norecurse, fullpath))
 
+        pkg = d.getVar('PN')
+        cvsdir = d.getVar("CVSDIR") or (d.getVar("DL_DIR") + "/cvs")
+        ud.pkgdir = os.path.join(cvsdir, pkg)
+
     def need_update(self, ud, d):
         if (ud.date == "now"):
             return True
@@ -106,10 +110,7 @@ class Cvs(FetchMethod):
 
         # create module directory
         logger.debug(2, "Fetch: checking for module directory")
-        pkg = d.getVar('PN')
-        cvsdir = d.getVar("CVSDIR") or (d.getVar("DL_DIR") + "/cvs")
-        pkgdir = os.path.join(cvsdir, pkg)
-        moddir = os.path.join(pkgdir, localdir)
+        moddir = os.path.join(ud.pkgdir, localdir)
         workdir = None
         if os.access(os.path.join(moddir, 'CVS'), os.R_OK):
             logger.info("Update " + ud.url)
@@ -120,8 +121,8 @@ class Cvs(FetchMethod):
         else:
             logger.info("Fetch " + ud.url)
             # check out sources there
-            bb.utils.mkdirhier(pkgdir)
-            workdir = pkgdir
+            bb.utils.mkdirhier(ud.pkgdir)
+            workdir = ud.pkgdir
             logger.debug(1, "Running %s", cvscmd)
             bb.fetch2.check_network_access(d, cvscmd, ud.url)
             cmd = cvscmd
@@ -140,7 +141,7 @@ class Cvs(FetchMethod):
         # tar them up to a defined filename
         workdir = None
         if 'fullpath' in ud.parm:
-            workdir = pkgdir
+            workdir = ud.pkgdir
             cmd = "tar %s -czf %s %s" % (tar_flags, ud.localpath, localdir)
         else:
             workdir = os.path.dirname(os.path.realpath(moddir))
@@ -151,9 +152,6 @@ class Cvs(FetchMethod):
     def clean(self, ud, d):
         """ Clean CVS Files and tarballs """
 
-        pkg = d.getVar('PN')
-        pkgdir = os.path.join(d.getVar("CVSDIR"), pkg)
-
-        bb.utils.remove(pkgdir, True)
+        bb.utils.remove(ud.pkgdir, True)
         bb.utils.remove(ud.localpath)
 
-- 
2.25.1

