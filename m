Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.3833.1628251607328952106
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SeFQ5g44;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j2so10741081wrx.9
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mI7utnoqAm8JeEErYS2xR/SiFJ1tIQhbCf4h/tlrSDI=;
        b=SeFQ5g44C/2/GuUCBub6juX7+JsmvWeMIV/6Xnrm11uW4KpSGD9iR07jHq3DK+mWaf
         F2iQyGVsI/cDyrUtu7wSbe4vu8vtJUjFieAG16tKg4T0we1jDQEAVqLieT1WQnWpkInl
         L0XS4lgNezIwvCRhXKR/mn3uDd7pGcMCVy/AHNEYth7f0cxMo4duDYGRW4ntBfCG86wD
         Al+WqrQIBiC45YlAd7ROh5Ev0/z6DLtFNqfn6v3Q+WWroge9BjxyXj5xSa9mFaeVFUYq
         sZ/EpOwc+TzpCwZiNx8GMe8ffNcdhIXB4uC/Gb2LXplukjmKFvJZxwqizAoW/zGGnWdV
         aXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mI7utnoqAm8JeEErYS2xR/SiFJ1tIQhbCf4h/tlrSDI=;
        b=EtIMzp6keaRwPRyb458o0mEW4QEym+AC4qiMBE9XDmS69nWUcqb+0dCdQa17j8Js3w
         Jt1LSX1fLN3AgjpSwuFDg98Io16a+3//25eqI0ifBYwkTnkfa490mOambzO+Mjvp1eVp
         o7KvW2JFm5JEmnO4I95yYjhClucjOffMdK+lqjDgWhSCtV5qPKMfGIh4LHXzM9xqih+Y
         XTa6GBRRb6hOYYJlA1hf8bWWIez7u1AT5NbXU6oMwLGXtxHibVIjFIuxicAKbYX/shQY
         FO+cP9CVEiQtt3bRSFYgRpw2u7exCi5HRQsy3G49H6Jff2/PJNAAjyzhzIv+z+m+q7a5
         9w4w==
X-Gm-Message-State: AOAM5319c3NOzQsnCtNOvV81YS6zzY9VK102ofMWVfeIpVN/LAJEa9GQ
	Q1c3mgTQB0vwgC8fhGA1c7fwn9JNqDb7U5Ui
X-Google-Smtp-Source: ABdhPJyYXxqYkLxhwlbzEpWa1t6q4QdYMmnrtCR859lxRA2M8Wy+BceYsVTzinXREkGu75fvUMpEtg==
X-Received: by 2002:a5d:518a:: with SMTP id k10mr10426762wrv.400.1628251605465;
        Fri, 06 Aug 2021 05:06:45 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:44 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 1/7] lib/oe: add generic functions for overlayfs
Date: Fri,  6 Aug 2021 14:06:05 +0200
Message-Id: <20210806120611.124246-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oe/overlayfs.py | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/lib/oe/overlayfs.py

diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
new file mode 100644
index 0000000000..21ef710509
--- /dev/null
+++ b/meta/lib/oe/overlayfs.py
@@ -0,0 +1,43 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# This file contains common functions for overlayfs and its QA check
+
+# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
+def escapeSystemdUnitName(path):
+    escapeMap = {
+        '/': '-',
+        '-': "\\x2d",
+        '\\': "\\x5d"
+    }
+    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
+
+def strForBash(s):
+    return s.replace('\\', '\\\\')
+
+def mountUnitName(unit):
+    return escapeSystemdUnitName(unit) + '.mount'
+
+def helperUnitName(unit):
+    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
+
+def unitFileList(d):
+    fileList = []
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+
+    if not overlayMountPoints:
+        bb.fatal("A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
+
+    # check that we have required mount points set first
+    requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
+    for mountPoint in requiredMountPoints:
+        if mountPoint not in overlayMountPoints:
+            bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
+
+    for mountPoint in overlayMountPoints:
+        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+            fileList.append(mountUnitName(path))
+            fileList.append(helperUnitName(path))
+
+    return fileList
+
-- 
2.28.0

