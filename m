Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.1279.1611858566415068773
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 10:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pr7NRBKF;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id p15so6393034wrq.8
        for <Openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=caor77I4hZf4CiLxyoBDNf8Wb7TKlSp/+EU/rQATUls=;
        b=Pr7NRBKFujWX7bmS2+xssAEZ91bnepfnCSw+Z3/MXJbLYKTpego2viySrEp/CB+brQ
         INNAv3sqQtVgjQ3wW5XViWSu/Hgn+5LIoh4ndAhEZQtsT9tyLh8WNhZYgJlmByLtvDVi
         Q5yCWs+eRqCA6dvgZAY0u82F9QiLv/ZUfjCL6S1j9MrXhtT1JFsLVQQ8bIPtQ+gu7CpU
         cIdWoe8Geqo1zNmlpyL7I7V5wHJxZSde/h0ZLWTKwPVucWtyVAqZgMW7FRjN1CYo767y
         ZLq/JcWGc9BoOE2/B2e1rcJ0q4RFzH+Fsl3P1+JTUj+TY7lQk43CExvjz4K47olMHBmO
         qmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=caor77I4hZf4CiLxyoBDNf8Wb7TKlSp/+EU/rQATUls=;
        b=pFDSa+U1Yvnk5nsimWKCAXH3u1yRt/M4hyW2W7XGQ5XbtRnMLctJOTSj1ic126atgG
         rlkls80+jqzlwFChQF3Fw63kRwbPK0Ey4jQbDp31pZ9DJ2SFLAh6MePjg5fKT6Vv9Spc
         03dpNhRCYpNONjDwDKRWdS4VSWRPdtiOmkvpdt+D2R7lbGBlHJiQVRnrEXjDCcEyRHGq
         x+vVRBh0Tnm3zvxh/PoaQPrLWMSy4rpACZ6l6c/KDWmL0GL0ULhyOfRdDE1sDFbSKcZC
         dT4PdNBhfPMj14IWt2B/dsXsJodO0v/c/OPqXXTpNDwBCGN6z08bW47kVNZkYypy9sSA
         W+Jw==
X-Gm-Message-State: AOAM530RFNAf0fORN7syXW9JW1nPnN18tioXc98Rp0HPbhBHrUJw7gTu
	zKDyQGp5DYTrTgsckjxGDM1LtZ84W+30vg==
X-Google-Smtp-Source: ABdhPJwNxUIX/zx4p4lbyePHr3yZlWfK9VMokoSqsWLp2vbBlASKHK98hBmirvILCVpT2i98rVT8Kg==
X-Received: by 2002:adf:ba47:: with SMTP id t7mr374220wrg.285.1611858564721;
        Thu, 28 Jan 2021 10:29:24 -0800 (PST)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local (dslb-002-205-007-157.002.205.pools.vodafone-ip.de. [2.205.7.157])
        by smtp.gmail.com with ESMTPSA id z15sm7567661wrs.25.2021.01.28.10.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:29:24 -0800 (PST)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] npm.bbclass: use python3 for npm config
Date: Thu, 28 Jan 2021 19:28:57 +0100
Message-Id: <20210128182857.68310-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python2-native executable is not available in sysroot anymore, which
causes compilation of some nodejs modules to fail. Switch to pytho3 as a
default python version.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/npm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index d3dd1a9ab8..d0fb5745ec 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -20,6 +20,8 @@
 DEPENDS_prepend = "nodejs-native "
 RDEPENDS_${PN}_prepend = "nodejs "
 
+inherit python3native
+
 NPM_INSTALL_DEV ?= "0"
 
 def npm_target_arch_map(target_arch):
@@ -248,9 +250,7 @@ python npm_do_compile() {
         sysroot = d.getVar("RECIPE_SYSROOT_NATIVE")
         nodedir = os.path.join(sysroot, d.getVar("prefix_native").strip("/"))
         configs.append(("nodedir", nodedir))
-        bindir = os.path.join(sysroot, d.getVar("bindir_native").strip("/"))
-        pythondir = os.path.join(bindir, "python-native", "python")
-        configs.append(("python", pythondir))
+        configs.append(("python", d.getVar("PYTHON")))
 
         # Add node-pre-gyp configuration
         args.append(("target_arch", d.getVar("NPM_ARCH")))
-- 
2.28.0

