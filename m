Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.33641.1620661264913634785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 08:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JGpmAWBq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so2775277wmq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybro82EH3r4G8/8u6xvM0AfIskKxfXFDQvBK8i5RZpI=;
        b=JGpmAWBqkOMwDx/QCzH0IB7Dadg1jSwA6jABV3uotpAFe2/l5vUNosTO7omwBiDCLK
         S9p6uY1YjmsoGAP850FKOGmmzqhMsUkANif2ESTUsecINv4YqGBY2LF4A7ZJyS6gV2Dq
         wCQn0Qp/pT6fCiZZz/g9Pyg+NCTFmODFZb9FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybro82EH3r4G8/8u6xvM0AfIskKxfXFDQvBK8i5RZpI=;
        b=o9k5VoLRIUtP3uhQPBWEZWWXVVk6Xt7dfjf9h9qD9MIPFpSHHcW8Dwj4gPAlGhoRa1
         n0BuVnepTEXg4CfBgderxswFTs4g8ttyzCF8sZ5AKx4IZjxmfsxrsHNrn9BC0PzAx6M7
         EId8fskOSxCzzoCHHN3dmuxmZ7z+Y/emYzbTMzwSW4MCk7y0kbrcGYx+JmTUwVYA4ewx
         meQb6Jmj436ZBzlMuylMyNnC42v9DrV6KutwpAEQKjAmPU9sJJfBxZDr1e9ZFzz2Cutg
         WtFBzgg0du3YyjKaF+rLPkw/F/yMiMbnPvxEoNibW4MqIDYc16zIWy2grCaeRDwuZT5f
         jvZA==
X-Gm-Message-State: AOAM533d+OoLTEEIptBm9f87KPX/4D10srsKb+mxhFqIrrSh1ujXDY8x
	jQx7pGEtM0+AXhZH3QYp0dzJvIw2Brb5Mw==
X-Google-Smtp-Source: ABdhPJynGps11nq5jZYC+iTYVDsmoQ4lB4V56O99cVHd5ajUtabEx2ztchZgCGuwXFI31TSoLDTC4g==
X-Received: by 2002:a05:600c:2315:: with SMTP id 21mr26611875wmo.39.1620661263232;
        Mon, 10 May 2021 08:41:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id d3sm22796494wri.75.2021.05.10.08.41.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:41:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] logrotate: Exclude CVE-2011-1548,1549,1550 from cve-check
Date: Mon, 10 May 2021 16:41:02 +0100
Message-Id: <20210510154102.2168868-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These CVEs apply to the way logrotate was installed on Gentoo, Debian
and SUSE, exclude from cve-check as they don't apply to OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/logrotate/logrotate_3.18.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
index 55684ac9fbc..c2115e7142d 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
@@ -21,6 +21,9 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
 
 SRC_URI[sha256sum] = "841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5"
 
+# These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
+CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
 PACKAGECONFIG[acl] = ",,acl"
-- 
2.30.2

