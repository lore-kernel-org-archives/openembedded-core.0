Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6E1C54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.15534.1672847243177034808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WhP/ErTM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso24545751wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRVhKK9yhGoV23Ow6VTNbA/LVo5ZgOUa07g3lPnE3vE=;
        b=WhP/ErTM7cTjI6KlEBU7kg8g208VUQwHzjV+S8vuhHUmdMVVDEYrxbFobaQx6x6vgm
         pBDncgM3eh5xQB5YMp9Xn1Z0XhrgG0J21ouT+T12ZkuV6XX6z8Cl3NtSTS4+s11LAC/3
         zaMMV0lmKpRHQfH73kkfqzWzfp1MxrrNICLEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRVhKK9yhGoV23Ow6VTNbA/LVo5ZgOUa07g3lPnE3vE=;
        b=t1C+RskPhgdimuLBn0b94mWr93/UAy5OgYokNQGyl/b09EJ9iL22pdFY2aFv9QU0tY
         gfnyc7TH+lfa9VP6PgZFoJpMAO4E8d2qNeaK0ZdmPxhd1/MOVUO8MijjTWYd4MaZOJGc
         Zm9tASK3bf+wdrLdnRtHnIeRdaRpCqBdx81zoO08HimUGiTaU2X/8LC8aGArcaWR0C7O
         +Mrs8Qv/OVwEvcONRbJ7JgiVCbLhYm2jgfJc1FrP2/DIZYNPbxbcKHfEJjGA+p0GUmjd
         yvq6s0Z15kSBI3fWj2vc9DfnnwUiYyWCAYg/TQxMpmlcJcg1HkMuO2pqPLjkKmzt/vRZ
         Omgw==
X-Gm-Message-State: AFqh2kq5EF9aB/27VIvGTIdlVDFq0ljgzC/P2KKIBs0Omb/mcZ5Sbw17
	jl1xyOL/iCFcqCI6Ifh+cB9d7dk1X06FzF67
X-Google-Smtp-Source: AMrXdXvLcYeyFUzb5VBpq7BOGvR7HD8UCPNuZPLJ4Pfvxgwwz6jJQ5NxTd8x2yXSTTyPwdnUinoXGQ==
X-Received: by 2002:a05:600c:1d98:b0:3d3:48f4:7a69 with SMTP id p24-20020a05600c1d9800b003d348f47a69mr42045339wms.17.1672847241446;
        Wed, 04 Jan 2023 07:47:21 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] package: Drop support for PACKAGEBUILDPKGD function customisation
Date: Wed,  4 Jan 2023 15:47:13 +0000
Message-Id: <20230104154714.1168535-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175498

We don't really need the customisation capability of PACKAGEBUILDPKGD
since we also have PACKAGE_PREPROCESS_FUNCS which is generally used
by recipes. Drop PACKAGEBUILDPKGD to have some simpler/clearer code.
This allows some function wrappers to be removed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index d334da6fb3c..7e96601cd95 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -353,14 +353,6 @@ python perform_packagecopy () {
 perform_packagecopy[cleandirs] = "${PKGD}"
 perform_packagecopy[dirs] = "${PKGD}"
 
-python fixup_perms () {
-    oe.package.fixup_perms(d)
-}
-
-python split_and_strip_files () {
-    oe.package.process_split_and_strip_files(d)
-}
-
 python populate_packages () {
     oe.package.populate_packages(d)
 }
@@ -453,15 +445,9 @@ def gen_packagevar(d, pkgvars="PACKAGEVARS"):
         ret.append('_exclude_incompatible-%s' % p)
     return " ".join(ret)
 
-PACKAGE_PREPROCESS_FUNCS ?= ""
+
 # Functions for setting up PKGD
-PACKAGEBUILDPKGD ?= " \
-                package_prepare_pkgdata \
-                perform_packagecopy \
-                ${PACKAGE_PREPROCESS_FUNCS} \
-                split_and_strip_files \
-                fixup_perms \
-                "
+PACKAGE_PREPROCESS_FUNCS ?= ""
 # Functions which split PKGD up into separate packages
 PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
@@ -528,8 +514,12 @@ python do_package () {
     # Setup PKGD (from D)
     ###########################################################################
 
-    for f in (d.getVar('PACKAGEBUILDPKGD') or '').split():
+    bb.build.exec_func("package_prepare_pkgdata", d)
+    bb.build.exec_func("perform_packagecopy", d)
+    for f in (d.getVar('PACKAGE_PREPROCESS_FUNCS') or '').split():
         bb.build.exec_func(f, d)
+    oe.package.process_split_and_strip_files(d)
+    oe.package.fixup_perms(d)
 
     ###########################################################################
     # Split up PKGD into PKGDEST
@@ -562,7 +552,7 @@ python do_package () {
 }
 
 do_package[dirs] = "${SHLIBSWORKDIR} ${D}"
-do_package[vardeps] += "${PACKAGEBUILDPKGD} ${PACKAGESPLITFUNCS} ${PACKAGEFUNCS} ${@gen_packagevar(d)}"
+do_package[vardeps] += "${PACKAGE_PREPROCESS_FUNCS} ${PACKAGESPLITFUNCS} ${PACKAGEFUNCS} ${@gen_packagevar(d)}"
 addtask package after do_install
 
 SSTATETASKS += "do_package"
-- 
2.37.2


