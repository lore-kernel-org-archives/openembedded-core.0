Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.11724.1624889670120138563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 07:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TxDwWBLW;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id r3so7061003wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=ns+RcuDG7akrhpT41Ya8Tvigxjw0YnaAYfxcsLhPdhI=;
        b=TxDwWBLWylUPWDPKRhJW+fcSaCES4Fcz6WkeYUzjyOoM+RYxxXAlWRYkN/9sGMtHZa
         tJrf4plvYx3fX6YI9rOKdXVR6LS9jZPQ4OCpwv3zUvpPVJeyk8sX2TMV3rOYUlI+7cH6
         eZm+HxsqpmNnJJtPsNDjOOiKnm4EHR9sDGHwQZ+IXlloHyKbaNRT7A9SJ4Gi67AVaziY
         hmAG/iALjGBfSmYKGG9MXu+0tWQaDCGR4W2+p7WRNoP6aI6fwYqKhWc6dMRlPNFlqqMK
         7zK7MWwrpNqu2PyMXYMn/SEc6NARS5PAG+QQHkEbRqL3QvQIk46Lhh8Y5WDAL2XaH/56
         hT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ns+RcuDG7akrhpT41Ya8Tvigxjw0YnaAYfxcsLhPdhI=;
        b=oJ9ACeDjGUaQAvWL6S9Im2qv+W7W7kyP+/F+6EhV4K4H4WpLc/D57h9i4hqVhT4HIZ
         jn/k8QLwg8kD/t9idcRintRXsjYgMK6XbkUMq5PJGzlvSvOO4DupIK3yVvu5yUTZi6ab
         jFZbmWcgOnv9is+Y9goHLYIdlDoGm49rVaBmClVqeAmWMiq1sJvowooTNQvENIaX1Mwj
         jFkn5soNwKbT2PralEdvqCPrD4aH8Lq4gW+6g7cd1CvyMxttD2Egse2IP8FHNSpm6fG1
         P1cxqdV4TZhqQmfx2hbzzSzpDN6kLcLt+VeQ7LyfAA266luSUWxHgQmy6wEGXusZL0yO
         bo3A==
X-Gm-Message-State: AOAM5310CyZ21XhzjM+ev6E177XPlWg/GhpySgpMEBdBHJarlretBxmt
	N0G4g1TKwiB9MNkxZ+1nuyHqhncs0FS+dzS7
X-Google-Smtp-Source: ABdhPJyLa0bAYl17zqmQIZfz2f4v4w7+ne3JabSjcDOVRP8LetGdZU55kkat1QH+ueOpa+cpbIaWUQ==
X-Received: by 2002:a05:600c:1d11:: with SMTP id l17mr193639wms.180.1624889668363;
        Mon, 28 Jun 2021 07:14:28 -0700 (PDT)
Return-Path: <fbberton@gmail.com>
Received: from ctw-bre-003.bmw.criticaltechworks.com ([83.240.214.249])
        by smtp.gmail.com with ESMTPSA id x18sm14814975wrw.19.2021.06.28.07.14.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 07:14:28 -0700 (PDT)
From: "Fabio Berton" <fbberton@gmail.com>
X-Google-Original-From: Fabio Berton <fabio.berton@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/package_manager: Don't ignore installation failures in install_complementary
Date: Mon, 28 Jun 2021 15:14:27 +0100
Message-Id: <20210628141427.32687-1-fabio.berton@criticaltechworks.com>
X-Mailer: git-send-email 2.17.1

When attempt_only flag is set to True all installation failures are
ignored. Disable attempt_only, that is the default in install function,
to raise error in install_complementary and to prevent do_populate_sdk
task to treat errors as warnings.

Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
---
 meta/lib/oe/package_manager/__init__.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 4d22bc0296..de5916d7d8 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -344,10 +344,8 @@ class PackageManager(object, metaclass=ABCMeta):
     def install_complementary(self, globs=None):
         """
         Install complementary packages based upon the list of currently installed
-        packages e.g. locales, *-dev, *-dbg, etc. This will only attempt to install
-        these packages, if they don't exist then no error will occur.  Note: every
-        backend needs to call this function explicitly after the normal package
-        installation
+        packages e.g. locales, *-dev, *-dbg, etc. Note: every backend needs to
+        call this function explicitly after the normal package installation.
         """
         if globs is None:
             globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')
@@ -398,7 +396,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
                     ' '.join(install_pkgs),
                     ' '.join(skip_pkgs)))
-                self.install(install_pkgs, attempt_only=True)
+                self.install(install_pkgs)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not compute complementary packages list. Command "
                          "'%s' returned %d:\n%s" %
-- 
2.17.1

