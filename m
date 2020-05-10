Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.21091.1589139942917669158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 12:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=riZQ0ydk;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id u10so3000097pls.8
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yLrcJtVGLMxSNFo65WPUfMpGFdcZvAxI9auD8ljFfHI=;
        b=riZQ0ydkQKzs+lyPJmP6a3GVUcps/8Z1+2TbnBHKo/heyWkNhjj7dXXEH7eU7LQng5
         KPKa0FXVWR/28IVAlBY+KpKrdtIASiM6n4jNhlCNwZ7+A4aELZ+hzY9lr1XeAkAQuANd
         MyjPmVVxf3+TfH8NaLjmTPwXyI+klPFERvOM23lXIjRT+SDmWwY3my5AGTFFbaweuzCW
         lyqBhEvfvJC/9rbaT8Bz8lgYdg5yINVI+tm5NElGzo9WGG6L5d5JuOWnBp5N1DmAZiuB
         7HwwJZFUEZpADMyn6l5YteO+JDGMSd98s7sr2zl2uM68mCQejD2SMuYRqsbW1alEx3EC
         WFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yLrcJtVGLMxSNFo65WPUfMpGFdcZvAxI9auD8ljFfHI=;
        b=Kju9fttupAESUPbRGb5brQKxIjdKE/iHx+7gnep6p1fpfO4D4rP29X1OxC3wogSvOS
         mrWDMaduMvvLaLMjXzisCHUD6iBSGt8D4GATbS/wprV+3WbIBCss/7k1Fi+aW3XF7S1R
         QnHsa2pgiPxM3eEjCej328/SOE/PiMXIPzYXi2paqN2t28/uSZuF6rzF7NqzD9kLWMLu
         vGTTZcPQUe4zWGhRCyhZYr15dCBdE7oSCpu5gkMx1lHaVGWP4wbgD4FwirBtrCOSvToi
         20AejRJ89d7DdVC7qgYIdTXTyusOUZb6nntMyFUydIna6t3W14/MEN5BluyWggLK2o89
         ik/g==
X-Gm-Message-State: AGi0PuYouI/Jmizmlf9IKK1UA90805dyDc6B/5pjez4Vhq4BV+5ns3Wu
	gdjoAC8L31PFrMPP+hTCD2Lm11ZK4ho=
X-Google-Smtp-Source: APiQypLvoMR6N5OnQeyFB9Gy7GtEj8K85ZOxySZ5kPPNPSxRB4lFkZBX/41Rm3glhQclWyJMGCZ4Kw==
X-Received: by 2002:a17:90b:46d1:: with SMTP id jx17mr19005234pjb.212.1589139941950;
        Sun, 10 May 2020 12:45:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id x19sm7303796pfq.137.2020.05.10.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 12:45:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc10: Default back to -fcommon
Date: Sun, 10 May 2020 12:45:37 -0700
Message-Id: <20200510194537.3265782-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510194537.3265782-1-raj.khem@gmail.com>
References: <20200510194537.3265782-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For time being change back to -fcommon as default, helps us iron
out other issues, eventually this should be removed as we fix the
packages to work with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index a64c4caf00..6cb40fcb74 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -34,6 +34,7 @@ EXTRA_OECONF = "\
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
     --disable-install-libiberty \
+    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
-- 
2.26.2

