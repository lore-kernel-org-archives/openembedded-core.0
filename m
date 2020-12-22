Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15095.1608660497284631493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 10:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CfmNHl8e;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id b73so13754625edf.13
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 10:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FNyx+BobTiSpjx90KRDhUNcqxIPmSeA9+4K1rsC6jlM=;
        b=CfmNHl8eegUW6wjvoTA2GJlTb+gC3m72MuXcchq8eLvT4hZCuWjb30mTzvWfnU6z+w
         S9DL/uU+onCHID6MSDTblOwjffq2exg5xauCUGh1+Agcym7BEmPeFYQvzi4DePpeJb+Z
         OtKWVwlSOGLb6Gpp74QIS3da6OnxXbWdoOqln2JFIQkuRuKfWtR3pQxMrDd1grrjVujN
         5A6/eANPDR2AJr5iLWJrThPXCFHV25GutCZ8jHDv96slgTcm+SLh+Qj/J/awiVDisPl7
         PsQTyGju1kKtR/Ua38GxtIC913nCU54L+QYApLF7/SAC9T/updONrRUUnPd0EVWw64Rs
         B7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FNyx+BobTiSpjx90KRDhUNcqxIPmSeA9+4K1rsC6jlM=;
        b=gYi+5Xy0Qer4ld/Dxext7CUDsafVWu8oUjtEB2dElJsvHcYBmsWAcI3na6qMh6W6iq
         cMrZKRGAbj+B1hK9Layea1f/qp4JqrvVRE+uGAq+tqdtv61agP7sN5j03JQw1AC/Ygvi
         x9pnd2nrfVuzLtIB2fmgNKJDPNTTOLyCBN5042s8CqEH66spqpofPPCSbnFHVyYOaBTV
         zJlqiyY6lFthKqBpJQR6se+bm4CpT+c1fyIwYtMw24NhPIqBJJeccTqEnpuClXVwLmL2
         s19/sf1qYxZtVpSBXT1tSu2RnWs3cIcAkvyeZ14eRbjKmV/0+VpHn9fN9kvHZCpX2+wI
         HGWQ==
X-Gm-Message-State: AOAM530tr7j4GrPBSlpDl6rLWZPLBGw84qdvn7Un/1qjD/4fJtDZsl3T
	ljV2K3RpHTsrIyiAsG8RCIvkbryt/jM=
X-Google-Smtp-Source: ABdhPJw8XWkL9yxrYDV5bWcs1VIEjQZQPAxVUWl86Jss35W8iqS7N0bAaSPa/A0gzk6/QyoEV6RnCg==
X-Received: by 2002:a50:c315:: with SMTP id a21mr21448936edb.50.1608660495682;
        Tue, 22 Dec 2020 10:08:15 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i4sm10655051eje.90.2020.12.22.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 10:08:15 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to PSEUDO_IGNORE_PATHS
Date: Tue, 22 Dec 2020 19:08:09 +0100
Message-Id: <20201222180809.956110-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* now without ${COREBASE}/meta in PSEUDO_IGNORE_PATHS after:
  73d538f207 bitbake.conf: Prevent pyc file generation in pseudo context
  the do_package tasks are failing when LICENSE_CREATE_PACKAGE is enabled
  pseudo.log shows that it's because of license texts copied from
  ${COREBASE}/meta:
  path mismatch [46 links]: ino 96733640 db '/OE/build/tmp-glibc/work/all-oe-linux/foo/1.0/image/usr/share/licenses/foo/generic_Apache-2.0' req '/OE/build/openembedded-core/meta/files/common-licenses/Apache-2.0'.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f90176d6c0..dc91118340 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,6 +31,7 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-- 
2.27.0

