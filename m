Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.43154.1600697790071897541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=CmFuHWqP;
 spf=pass (domain: blade-group.com, ip: 209.85.128.46, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f46.google.com with SMTP id l15so98201wmh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VaEuWGBBEICWoB8rp2SaJc4WStM524mHAQWeAvQc/30=;
        b=CmFuHWqPkeyOgtPtdKXlI74Nm3EcoR/DNh3nDMV+LZo7ZqLmPTkhPUKjLTvgchWw62
         5KKJCwkZ8COBd4wye4vjw4qooI6e+I1pL9aQC8K3ovevOijaMjk8FZ6FgYQ4bf9WDNC3
         RnqyAvrw/lJuRTuabBPZz+n4vRdEUCmUQ5rp9ljtKAYdzQGYjkoKDMstq/gBXyLTJtNT
         yNoD77F+bATGh+Eu8Zvq0tyhgAwfMKMNFKka9NlPZsE+vHAJer1W3+Sxm2CbWCnt9A7H
         ew/rHo/urSvQ3lNtBP6hloytglr7TcI7a/PUROXD5Dc++c+1Mo9cRyDZmJWnJ1gfPKLa
         I3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaEuWGBBEICWoB8rp2SaJc4WStM524mHAQWeAvQc/30=;
        b=QrbOEx5afrm4NLb8Uc2gcs51F96pjxZcQFjNwp5+QiyGeNLIYnscJ0GB9t3cgucK9L
         jnZUI6EKEhqhFXNtxFNIsvRhsnCG7OuJA4vbrV4BVePkEdMw26gxVmM8cz1M1na3m+nl
         y/LSlJsMDTi9nSV0hloYYmH3RxrEw9ltqZS9tvwQ9Q4cwI5rfMp2lhPPWltUxRJ03fBR
         uiHHPNH9C5bM1wcUYDWDF0uepcQvloIbPuewiqPpbADxcccEU4p3ezkQk/gnfO9CUAHH
         7qJCX9FR68rGTQiaIE8tnRoeCOS/tnejAGgRYlYMWeeZlsDXwI+EtYGT/K8uOhi9DsJQ
         FnVw==
X-Gm-Message-State: AOAM533QKz6EwDBDzWOHQ/jNckuvWL/V7+U4zs+f/0RTipsMmyPlWcz5
	TUkDYl9GHUdkqaiAYUDHy0kDxM2SDY4yTQwz
X-Google-Smtp-Source: ABdhPJyZgUGonaCSp/UkOBXLpu0Au/dNjv8vVwJUZ/TZWN88f45Nm+BIdC867Akhk2OapQ8qU8jbqA==
X-Received: by 2002:a1c:2903:: with SMTP id p3mr86894wmp.170.1600697788078;
        Mon, 21 Sep 2020 07:16:28 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:27 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 1/8] systemtap: split examples and python scripts out of main package
Date: Mon, 21 Sep 2020 16:15:37 +0200
Message-Id: <20200921141544.3145189-2-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 1c9f2aed16..e98aff1851 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -38,6 +38,23 @@ RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
 
 SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/${BPN}/examples/"
+RDEPENDS_${PN}-examples += "${PN}"
+
+# don't complain that some examples involve bash, perl, php...
+INSANE_SKIP_${PN}-examples += "file-rdeps"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python += "\
+ ${bindir}/dtrace \
+ ${libdir}/python*/ \
+ ${libexecdir}/${BPN}/python/ \
+"
+# python material requires sdt headers
+RDEPENDS_${PN}-python += "${PN}-dev python3-core"
+INSANE_SKIP_${PN}-python += "dev-deps"
+
 do_configure_prepend () {
     # Improve reproducibility for c++ object files
     reltivepath="${@os.path.relpath(d.getVar('STAGING_INCDIR'), d.getVar('S'))}"
-- 
2.28.0

