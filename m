Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4335BC5AD5A
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:19:29 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18965.1786317559652069163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bRaBfpwq;
 spf=pass (domain: konsulko.com, ip: 209.85.210.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1167728b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786317559; x=1786922359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvQDB1TOPAKE75weNymHpmNw/wtMEhxjFmdIyOmkddw=;
        b=bRaBfpwq5gw6vr4Gz7EqfNZH7J/PThFsn4/Pa4SBiJhsFvDVoCeVZYnYkbJJkHxgdO
         XrCXDfvvDTDvwM0L01mkN93mbI6yzMr5VyzDYio9AojjYE4HT49V0OVdE5xtDsDWB+sa
         MOS6LWduAfhRoR2rpfkrCnICG+YS/MLEpnJv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786317559; x=1786922359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvQDB1TOPAKE75weNymHpmNw/wtMEhxjFmdIyOmkddw=;
        b=hdHAj9d1OuTT2yZYcfaZXn3PgyiFg1wMPnWHLY/eei8tD2ydHPJWouXJlvJB6H+Ehx
         CumxOmPrGNlws6N6tIw8mjFVf87+CGNaaICO/TwkBDgNBHHAJB0UwxWsmC0LTFdsEEO2
         BNWR/boeEUazGnagtFmEthg+zbINtsnof8kQPZyVAl5v4fJnHkx5SE2sc4f8YcuW4kWz
         9zxd2GmjNzTY/ggLTKlRhb/OXb0gfgPqd1ohBm91D/FILS21z2Eq4EQ2ETP0qOz6AGs4
         jKv89wtxAjNepWS7+T0zP2RD/xajISxmLxjUVhZpBAjtbacfiES//MDS3IFexSCxapMG
         ZB4Q==
X-Gm-Message-State: AOJu0YyUvgHpr68+dzMZGFB9muRDQE/in/jOqBz3ahMGC5+e7sJDubJJ
	RpI3kPaD3gsyC6mWqXWDH0L2v0sPclo2DgPALH15SOa9jtLI6NfSBog1QGqXa1wCMGXvoNa1av+
	Pa3TX
X-Gm-Gg: AR+sD12SYEcqKYvOO4KdNEJNVxMp2t9IT6BY0kaSW5DFlFgk8s/TThn3TW13VL8EA6h
	LEv1tMKAI+krs5uIhoG5tHtzNy3y0jYHL8/f5q5PNZD9TRevHAR67PhO673RCi4uumRd8Jle6E6
	+N4Az58Z0wWpcbUXVjdqX1De9eElYxx4zxqJ70MzYVEP2rsMd1PdNx3NRGZ5KN7hF5xPpkwtTwr
	sCA9goukUrFWmYmrv1/2k85R6aLgKfK9cPJ8PKBiSmQ4BKbhvtcg0y7Yoiv7c4VTpS73XMpMslM
	yODAU4Q4Mk6DLDMplj4T2X2DeFFNAdfaXjQY7rSX3m7qwB1VrAb5oZpKTTQpZB0jhch1ZY2E9hy
	x4ByAXOYrt1J31taoHSdysPkwoT8DQ613J9iZEWqz8JQ6HViteHwJT1/C5yClzKYgipiIpvRQ8o
	csXauvRepcKQFdZdaYxhreyPPQz2FGAihLALh3WNxDVCNF8MDZe5FnyzCl1khxwbVRJ204EvpKG
	++lQUc=
X-Received: by 2002:a05:6a00:4288:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-84f2dfc8c42mr44718348b3a.2.1786317558928;
        Sun, 09 Aug 2026 16:19:18 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58998bsm2976866b3a.55.2026.08.09.16.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:19:18 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] python3-git: fix CVE_PRODUCT
Date: Sun,  9 Aug 2026 16:19:00 -0700
Message-ID: <20260809231901.366919-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243080

From: Tim Orling <tim.orling@konsulko.com>

Using the pypi.bbclass default CPE of python:GitPython detects no CVEs.
With CVE_PRODUCT = "gitpython_project:gitpython" we properly detect
9 CVEs, with 4 unpatched.

WARNING: core-image-full-cmdline-1.0-r0 do_sbom_cve_check:
python3-git-3.1.43: Found unpatched CVEs: CVE-2026-42215, CVE-2026-42284,
CVE-2026-44243, CVE-2026-44244

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-git_3.1.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 45c988117b..ccf6def292 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
+CVE_PRODUCT = "gitpython_project:gitpython"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
-- 
2.47.3


