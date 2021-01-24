Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.19261.1611482007184814756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 01:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OyZS5e4i;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id a25so10490724ljn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 01:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlBYKTzOiKWq/8IoOAzOdXd1eYkrGdtKPX4tQDoJv50=;
        b=OyZS5e4iN2kP5hS7fjVEIB+3H2C4gSbxLnpnQLd1WVLTsI3fFmGSvO8KOh0Eqsgftk
         3ot7JDNYkfB5ellSZ5LHHA7EVVgbXc0WvM16asmFTID0OAHz/AhksTAmg5oqDiYU3MQS
         YE8NGDFkhZcJxgjKq2QSxdDgrWUYYtVWQa7Y9GOuwWnT7QdbJPhfhSBiN4oQCVBi2Nff
         qYkaXSTLrlDpObgbcIKhgYFdIUaXlWLGrYd1H9CvVmnKr25AAdf7UDZCU9N3cJEfHm+1
         smD/oxt+Pk6y7IAdaYCJhPXFdb1JUmgKSkwFO6iGp2AAtdm6tKOQbfhldLu7ZzLb5XBe
         QIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlBYKTzOiKWq/8IoOAzOdXd1eYkrGdtKPX4tQDoJv50=;
        b=s3ksrs3cgM52D63sr8qVl701hFZKLWKl/PsPNq1WnLXwCHZrYFWkSssHkwL9cWdRHW
         prSGUTeWwDMdNTAO/3J40/cimtYeJvqMMBu3yOdgd7KQ1MYWAEAopAtGxlRr3oQXtfPu
         U05TUFhQfjng537FR0Zw6BLf8mGNYu0xzBLIv1I5F4Bmwnmggm36BeZzM3diemK4gdjW
         4hohvl68zLfq622cWQIRYivH2Z0WFOzljIoCQej8p4+lhzq+FWQzrIriuXeAARAGgqQA
         W58940D3v1BzhYIzPrLD+NiDrb+pNDLHz8UkXK+t3QN/XttMj190PjxG44l0EPMdTyLG
         KtTA==
X-Gm-Message-State: AOAM530qtt02tnVWl1FRsHYaRoZ3pxCaywEEqaz8m9U1D/MaVq8i+sHe
	ktQC+zPRnXATeXULdO0ZRrhxtO0nZEU=
X-Google-Smtp-Source: ABdhPJxUbQx2/9n3/dpioqeHOwQwMhfkOVvLxM5DKyZapp4jfZRHKcQar2ZNHGJWxYjOel+2bK76Ug==
X-Received: by 2002:a05:651c:83:: with SMTP id 3mr940271ljq.25.1611482004635;
        Sun, 24 Jan 2021 01:53:24 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id t4sm1618338ljc.50.2021.01.24.01.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 01:53:23 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH 1/2] insane: Add test for native/nativesdk inherit order
Date: Sun, 24 Jan 2021 10:55:45 +0100
Message-Id: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Classes native/nativesdk should be inherited last to prevent unexpected
behaviour.

[YOCTO #5729]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/insane.bbclass | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 105d2a5ce8..3597943ddd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,7 +27,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
-            missing-update-alternatives \
+            missing-update-alternatives native-last \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1366,6 +1366,32 @@ python () {
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
         package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
+
+    for native_class in ['native', 'nativesdk']:
+        if bb.data.inherits_class(native_class, d):
+
+            inherited_classes = d.getVar('__inherit_cache', False) or []
+            needle = os.path.join('classes', native_class)
+
+            bbclassextend = (d.getVar('BBCLASSEXTEND') or '').split()
+            # BBCLASSEXTEND items are always added in the end
+            skip_classes = bbclassextend
+            if bb.data.inherits_class('native', d) or 'native' in bbclassextend:
+                # native also inherits nopackages and relocatable bbclasses
+                skip_classes.extend(['nopackages', 'relocatable'])
+
+            for class_item in reversed(inherited_classes):
+                if needle not in class_item:
+                    for extend_item in skip_classes:
+                        if os.path.join('classes', '%s.bbclass' % extend_item) in class_item:
+                            break
+                    else:
+                        pn = d.getVar('PN')
+                        package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. " % pn, d)
+                        break
+                else:
+                    break
+
     qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
         bb.fatal("Fatal QA errors found, failing task.")
-- 
2.29.2

