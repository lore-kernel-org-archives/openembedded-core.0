Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.496.1600353954275222432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 07:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZTPy/wnX;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id lo4so3646726ejb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=w3ULTGJ85lDfJrIivFja2kShz7rx/gB4i7rz60gWNAE=;
        b=ZTPy/wnXQVOS0G/T2XvWzoeyFlQwm4klc9lCbBFTPnAX1jBTH3A2KK01t2wseqXjPb
         lNLEp6JrUVBzyo+sDfaPHJesBgHFkCc/XUt87F39IflevBgs7v9UFIU8tiRQJF9cWCmJ
         IOh5wj0J1IGuBCg6X1IonbZ0nTJGT92mUGf8TrH0+IMS/ca2bokpBLPvmBvvhqOvjgy4
         htcx+RoKI9z5TkNOVKhbsOscTZyZap5GdKVOgwgOFxenXqLJYLVzoEJ9aZUYmcH7nd82
         G10yJePPkXFjdV+c/7jASQ1U1ZMGD6DdKxidvPj8UEksfeQOi6AU/+hv3C7966G6iEoa
         DTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=w3ULTGJ85lDfJrIivFja2kShz7rx/gB4i7rz60gWNAE=;
        b=OpIkUQU/DzGZVmW2dI3D8tDlMQwIjg2enK61jKfQDRw1c8xigijBoF4rwRPA7wFtH1
         O/ds7kpsLsdpBVs2k8nYvRfQRLZO5ExG2txvjK/5rz6KKG+A3lfQX3fuW6IYdIJpPJiV
         bai4R6+83/tadpbX6GnxWlOIH8gjB7nBI+b1RV/Ng4JsS7dhXcrsybFzm0FtTZGI3GN3
         lzQmW9nqP4I6rvtZXi+NgO1yxm0uPVHnVp8sQcMoWucskJb4K9LxQbyBTZJLCv4xKXWG
         iWJW+uUAjUpHeXx6+OdxMzi/kOFYG3nmWBBI6stvVKyoQZCtBJBPsTZzp5peIC4JwS7F
         xTNg==
X-Gm-Message-State: AOAM530Lo09r/yrzTcSfEwL19cc0msDT2qFkgY75gcrW49QkU719xDtc
	4D/KaHOK17WPgsOTnpzwStyFKorDFUk=
X-Google-Smtp-Source: ABdhPJzdv3URIMST0VfBUS6w6sXuGjMU4z4hL2mCRPa2AbhOXN9YZJoFiqqVoof3lNw8JVA1D7RXsg==
X-Received: by 2002:a17:906:49cd:: with SMTP id w13mr30563729ejv.151.1600353952290;
        Thu, 17 Sep 2020 07:45:52 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b0d4.dip0.t-ipconnect.de. [91.37.176.212])
        by smtp.gmail.com with ESMTPSA id v17sm75898ejj.55.2020.09.17.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 07:45:51 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH] image-artifact-names: make variables overridable
Date: Thu, 17 Sep 2020 16:45:34 +0200
Message-Id: <20200917144534.17549-1-sno@NetBSD.org>
X-Mailer: git-send-email 2.17.1

From: Jens Rehsack <sno@netbsd.org>

Since the newly introduced image-artifact-names class is inherited at later
processing stage, individual IMAGE_NAME settings are overridden (hopefully
by accident instead on purpose).

Allow derived distributions define their own name schema by setting defaults
iwth question mark.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/image-artifact-names.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
index 5ab8f1b7aa..3ac8dd731a 100644
--- a/meta/classes/image-artifact-names.bbclass
+++ b/meta/classes/image-artifact-names.bbclass
@@ -2,11 +2,11 @@
 # Specific image creation and rootfs population info.
 ##################################################################
 
-IMAGE_BASENAME = "${PN}"
-IMAGE_VERSION_SUFFIX = "-${DATETIME}"
+IMAGE_BASENAME ?= "${PN}"
+IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 
 # IMAGE_NAME is the base name for everything produced when building images.
 # The actual image that contains the rootfs has an additional suffix (.rootfs
-- 
2.17.1

