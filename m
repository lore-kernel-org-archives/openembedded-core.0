Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.34788.1612190809022212130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 06:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YtGLdzHB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id d16so16821045wro.11
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=t/oGOh3CEsrIYZ7wIG/5qRO1ddy+Mzssepxkhq347rw=;
        b=YtGLdzHBOTriTRfD62eVVHXSNrCgkiN9gMQozBVi43+slkdwTU/qbRzTGae52FXCVy
         lfCwnL7yiGy5XnEVJH+l1rtnvieXOjoggGjE+M0erX606ALv0USJd2z9vj7A86Z9luSA
         38pcpckmma0mKxCAfXzWJBGoaEJY1gqHrEH57YLWrp+zaLPBNN8/ZvSbIMiYAxk7Z8pL
         o0hs3XRIDeFqKpk7vfvPpe1qvwTNdsN+nbhKlddsPS4PXtvqooDgQXBEdQZ2UOJ/Jbd+
         omR/ZyUiNxa3orAQenVXHutRz2CNnm3mI/58e1wbQq96hm1pfbBvlh8Uc2AJo91H0R46
         bGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=t/oGOh3CEsrIYZ7wIG/5qRO1ddy+Mzssepxkhq347rw=;
        b=heXanemaxF+nfwytwrz0crHiKhuUoAwDUrN3mF6LqxbHXsMp1D6loKPeF37LD8Dxi5
         vSQLDf140PHmFo5xGmkN5Sot+R5etkt/+LuCHhgmBWsGdGcKxkIrvovrxiJFc6aqtbfD
         C1iL1+6JOw800UAgYiXa9gh+0c1WqgEgTkz90yt84asPTVzz2F1/6SRK+PQj8G8DmZXU
         i1cdhBTNPJE8wcj4GiF2k5PH+HaUng+sGkxo3CaBpxxQ2q4gynohaS+4py64Nml4DE/E
         ZB2O39KRGR/khAP9uu4fXs+fWXo1LtUcx5j2nevcbFnpv/4c+0tIzST8tyZ96vEW1DR+
         k8yw==
X-Gm-Message-State: AOAM531A+jswwXiECuNCV9FYWe1nCL6v2wGM0QogD/FT/FViXmJXFhRH
	5rGKkad1ePVeKc1Zf2GiCRsPTUOZtNpo/A==
X-Google-Smtp-Source: ABdhPJygn7v8ZtNLgc/0WOAht+GJYjNSwZ4Iiz6ZgUXOCZhryCgbSU5pEACDz4aVuYCMj+mugLA6Lg==
X-Received: by 2002:adf:f891:: with SMTP id u17mr18779281wrp.253.1612190807239;
        Mon, 01 Feb 2021 06:46:47 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.13])
        by smtp.gmail.com with ESMTPSA id y11sm26755566wrh.16.2021.02.01.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 06:46:46 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v2] oe-pkgdata-util: Check if environment script is initialized
Date: Mon,  1 Feb 2021 09:46:38 -0500
Message-Id: <20210201144638.15582-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Tinfoil doesn't behave well if environment is not initialized, this check ensures a proper error log if environment is not initialized.

[YOCTO #12096]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v2:
-Positioned check under a condition when it cannot determine the pkgdata_dir

 scripts/oe-pkgdata-util | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 93220e3617..75dd23efa3 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -598,6 +598,9 @@ def main():
             logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
             sys.exit(1)
         logger.debug('Found bitbake path: %s' % bitbakepath)
+        if not os.environ.get('BUILDDIR', ''):
+            logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+            sys.exit(1)
         tinfoil = tinfoil_init()
         try:
             args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
-- 
2.17.1

