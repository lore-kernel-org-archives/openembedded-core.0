Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.5698.1624617309841187765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D2MVb05f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id f15so10036046wro.8
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/Nunve3aQsG1j9vR9+LW7XtEBbrkYCsI5m9D5h7BJY=;
        b=D2MVb05f19oYpGHogs9GXS/sNtKpnBSAPSRhcOeyCA982A9gQsewvb/dvvaujJliwv
         z4xBlSEmZKAxZ9SvaJ+V5Atl7dMAcGPZFNRayD8t4GFLNcTOMznz750QRH8DPlDs7OmH
         O6vgA9vA+FKXHGMqeZriR5mqWAmGV6SmSRbZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/Nunve3aQsG1j9vR9+LW7XtEBbrkYCsI5m9D5h7BJY=;
        b=itjqlmD0U4PhFJY8YXGTnaqhXSpAx14j6AXUcpCfjkAKA2mbCi77tZiB7QbL2NrqRr
         /Z0cvNl2EhZ0wS4JMvQbw2+6gLtsGlNIYFgJX+ji/gad26zfGJEp75xqNT4sIgBI/TGP
         Sdce8GN11Ck6SOPy2FjX2z1D47pKs9CrU+wzfZGTNOemCsR3r27mlZTlmQzW2iLW/tVK
         +hWM91Sj+Qt91kKHqLeOop9c3rLcArwnJQmTTI3O2DTdjvBszTCuSW/ndPylHJRpZ9Pd
         JW//3reoVO81kCK7ExGEhvh8qjza1KLh3I3Rwokb0LKGGHHRkaExkiqutvk4hgyMcpVw
         SVuw==
X-Gm-Message-State: AOAM533ks/cSbC6Bvk1KlAVneLkGqFjDGDnA1JsOxjr43u3ocgxePDwA
	EnPCnF8j5ZwU9dqDw+ji+zXU/p3SOszhZg==
X-Google-Smtp-Source: ABdhPJz1Q2xgpfesxcoUKZZXHfm5LskcBDiydS17WPTvftF2wd2LCnK5xNGkbnpxZssjC3uTHOJtmw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr10291320wrt.295.1624617308239;
        Fri, 25 Jun 2021 03:35:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d])
        by smtp.gmail.com with ESMTPSA id o11sm5165255wmq.1.2021.06.25.03.35.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 03:35:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package_pkgdata: Avoid task hash mismatches for generic task changes
Date: Fri, 25 Jun 2021 11:35:07 +0100
Message-Id: <20210625103507.3607746-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SSTATETASKS to package_prepare_pkgdata[vardepsexclude] since otherwise
the task hashes vary depending upon which packaging backends are enabled
and likely other changes which add/remove unrelated sstate tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_pkgdata.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_pkgdata.bbclass b/meta/classes/package_pkgdata.bbclass
index 18b7ed62e03..a1ea8fc0415 100644
--- a/meta/classes/package_pkgdata.bbclass
+++ b/meta/classes/package_pkgdata.bbclass
@@ -162,6 +162,6 @@ python package_prepare_pkgdata() {
 
 }
 package_prepare_pkgdata[cleandirs] = "${WORKDIR_PKGDATA}"
-package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
+package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA SSTATETASKS"
 
 
-- 
2.30.2

