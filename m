Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.29778.1629982596376607799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MFXCSgHj;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id t19so6054400ejr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+wix2pU6wneoUm/w2YpBbiHFyLGecT+Cs7ogBzN9ucA=;
        b=MFXCSgHjQh9sPiljwcPN22Xiv7QRBbbylMqbLv4IBfpX/IDF1rxauG4yeF1E6RhXYb
         XVaWL4W2rUAN7emhMAMEHTvOnfQSOk3yPbNSffWKtqvgJJvp2AOf8g037JDwRplPRT4w
         FX6jqPUKBZrAOBBMdXS8jffBqj6TClz8sSnsbGvlhRNDd6/h7jMTb6L66yRFY8dI3aiV
         04UznCP3gMck/a+aESvgKjNSJiQHK9fhbKb+jCj2Wuvs5BUJpuDdLmFqvBLgHbYztKaZ
         FBe902rIinJe+YU5ae9Gz2BrJ/gQudsG55wAB4gLoPG345a7YfXZ/1Z0Lqtwl+uMTYh/
         raiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+wix2pU6wneoUm/w2YpBbiHFyLGecT+Cs7ogBzN9ucA=;
        b=qFmsM+lt6zwbWEtDSzrTMa26/hMvMQkRplY3SQCz3xiQdqIBnEuL/J6BWwY2niuM5+
         YXKT/9fwfyzxqPFCqrWd6pGBFaF40tfxhfIEBp0OCUzLLQ4UEdWx2zf1ybhh1pKZAOCo
         FZ5p62oWoY4WSp66l32O/NyXOmg0bNmaiF1Xe3a0Famx55QDwD+8WFSSrDY1HlGia/X1
         IdLuxbTNHRKsfIQlWvOh5r5FMHPYD6qjT0VuXxRdVSjq87p2cKgMr+L8FATos7W8z0dQ
         jQWM4wq9FlKYDFZHxbeNCZYjJ4EWLpX9wJS2WGUIE7CKCvQMwOsT5IOTSlrSt4/FSryu
         qJGQ==
X-Gm-Message-State: AOAM530cJuEF65aUGr5GeK2lR33BH9+wRS9qRFwcD/sSmqIUeJEOQtSm
	buMsJ7gfvzGBOdsNbcE+zQRYW8kfpdkIjg==
X-Google-Smtp-Source: ABdhPJxwLFqVtXiGU10ll3n0WW33nBCiWndRE5V1NiuxvOjDf4viG3nliO53T0nPOgqEwdX3MrxqkA==
X-Received: by 2002:a17:907:2083:: with SMTP id pv3mr4113983ejb.402.1629982594832;
        Thu, 26 Aug 2021 05:56:34 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id d16sm1799581edu.8.2021.08.26.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:56:34 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [OE-core][PATCH] lttng-modules: do not search in non-existing folder during install
Date: Thu, 26 Aug 2021 12:56:26 +0000
Message-Id: <20210826125626.31492-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

When CONFIG_TRACEPOINTS is not enabled in kernel config - module
compilation is skipped, which causes the ${D}/${nonarch_base_libdir} not
to be created.

This fails later in do_install:append() due to the fact that find
command in executed for non-existing folder.

Check for folder existence before find command in executed.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
index 109f5d69335..72d912eaf63 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
@@ -23,7 +23,9 @@ MODULES_MODULE_SYMVERS_LOCATION = "src"
 
 do_install:append() {
 	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
+	if [ -d ${D}/${nonarch_base_libdir} ]; then
+		find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
+	fi
 }
 
 python do_package:prepend() {
-- 
2.17.1

