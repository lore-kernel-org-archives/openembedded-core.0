Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.489.1606848758773950880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f2toLhr4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id 4so1651680plk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=emoe7AgswvCpJip7v2ctO3h2cXMPmGFq6rBSjpzRMd0=;
        b=f2toLhr4/W8BxIpJ2mM8XkFxT8xGJfHkt/QF85a+YYhwlaZXlPUSuuKvri5gPUuuJ3
         VNLCUIhQJbKVabznOYFQVhfZVbzRDpEnluDMJv52IHBOQ93SdaCiR2EH9K45DSbKyF94
         luMRamFKDnuvGxITnl1d02vJ5uwhHs48MlIkcdkukD+mafzCfQKPwWj6V/INOcf80ST2
         ZFG9VTsdF7r9kkJPhiFr1mFnwEsbpAI6EoQEab9gnknMSpZcslWo5gDtqMameAuSZvzy
         tJbB+u3nDpD8QMgrbn/piDcPxBfLDhnHGmsdcPP/xYbjrs+NhtZiy8bJKyC3IU0fH0z2
         0L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=emoe7AgswvCpJip7v2ctO3h2cXMPmGFq6rBSjpzRMd0=;
        b=uaWi1T9gqLknz76V60i663neEQDR1yyXGuDrgZtrrnhXgfgduDZlCc0Dm7FRr2zsTU
         Cbp/8JXXKAVUFkjkgmSvU5pAWgMT1jRF1ppKGm6OK6hcwOZFIZM6bBgw85RkKVe0W/CD
         YuhjqsDYqR92QEZu81SZLtRpudDVycvBtky/s2QWdxhnw2Z/MM6BHKgRRtrIQPN+MZab
         sTpsGbEGTb8RZY+x1b4izTlCavwe6DDFMSOBxMfrwE/02owHsCXDBZ0Tn0Q11/tQ41vZ
         j+Ry+YJwhecoVcWnLIvSO3OOlLvYDT/qPr8l/G38w7ny24qgrERbnWy3rcq15cvL6Lnp
         gnEQ==
X-Gm-Message-State: AOAM530J/bi4SQiMCUQqouJ/5LTe1xHTM2YNASWWMIUsUE7g4HuJVhs+
	mkV0Zzz6dWIkczrC3nwMlOTOw2lfi3CID5/8
X-Google-Smtp-Source: ABdhPJzOp672GtLrh18ai7roKgkkXkmlcZ2x6sPjo3ljRSusYvYydYMcfwz4VOtqKSctEtRdeZgW8A==
X-Received: by 2002:a17:90a:2a42:: with SMTP id d2mr4078688pjg.42.1606848757890;
        Tue, 01 Dec 2020 10:52:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/16] cve-check: show real PN/PV
Date: Tue,  1 Dec 2020 08:51:50 -1000
Message-Id: <2618eedbafc408c41479e63dac88a9b5bab461fc.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

The output currently shows the remapped product and version fields,
which may not be the actual recipe name/version. As this report is about
recipes, use the real values.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18827d7f40db4a4f92680bd59ca655cca373ad65)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 17f64a8a9c..669da6c8e9 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -205,6 +205,9 @@ def check_cves(d, patched_cves):
     """
     from distutils.version import LooseVersion
 
+    pn = d.getVar("PN")
+    real_pv = d.getVar("PV")
+
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products = d.getVar("CVE_PRODUCT").split()
@@ -214,7 +217,7 @@ def check_cves(d, patched_cves):
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been whitlisted we return empty lists
-    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
+    if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
 
@@ -283,12 +286,12 @@ def check_cves(d, patched_cves):
                         vulnerable = vulnerable_start or vulnerable_end
 
                 if vulnerable:
-                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
+                    bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
                     cves_unpatched.append(cve)
                     break
 
             if not vulnerable:
-                bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
                 # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
 
-- 
2.17.1

