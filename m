Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.42.1626378000171301732
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aWP++V8r;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so4354044wms.5
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+r20ZL/7VsDs/moRdyx/Z/d9DvU9CtUbBWZiI1i9pU=;
        b=aWP++V8rKrVezwo+lDfa90u2fQeBNXFpqONijwfALq0GnT5jYmL4i9foBbZVyjJt9s
         mo8GkQyKKdpBxWBjf7LIxJAfVseeiYMAYR3Vc3X39FQDoldr3odjOJPjDv+NMpT1vCf0
         8XWEnxIwgJgRyl2DVSQLybu+RAVeFD3cR/BD5W2cGm85XJy8+6DRzYYvIIz6H+ORyjHS
         voxC7QhdkGHHNSbM7Y0p31r0BmLSlEy6tuq3dnYsIzPHaUo2MUc1XbipsUlrDgoSZqhr
         cE8Mn3OR13PtdJnObjbiJALp4FoIuAe8QzIjyatg2mVbJJHmEoh6BRkvelLXlHwHWlmZ
         2dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+r20ZL/7VsDs/moRdyx/Z/d9DvU9CtUbBWZiI1i9pU=;
        b=cT8NwmKyeUXxJ6yAiFfU3FGMmQA3p+iTGFO0w9/LfQpuqCQovfAS4yKkPjR0DI1VEI
         ezEUpPCWwn+W0OsAfPaCxFJdxN21Pyb6gU08ojJ2OWoDKhq/O72sHizjcUdfjUqcLBOd
         F1tPcjqzujXvNKRHi57+4MdIAxEpk+mgA2HuHG3VyqUK0dTI1l5FqCK7rIIWQuQULmDW
         kQpcNxmuZNd5DpZmkFW3q1LJ+JJPgFmiOk0rSW+8JoPs29lcLUlEKP61fNZFdWK/fz/O
         BHftO/tVICuHE6V44VcxAY+HXZNy/iQ1viZL4sj6D26QAgJgMmgdyE/l3fP2aU44ewiJ
         idiw==
X-Gm-Message-State: AOAM530QaGdpH+c1IBotzmPcbwe+/9eXuOVR2xYcQTaAAI42SoaOXWKf
	pcsSuElaW8ati1vXJI7qHWFYzYNvFISELA==
X-Google-Smtp-Source: ABdhPJy0ZrQBND2YZspaRzZp0KHCqFzkWE01oUcMGm4KNtQ2G2JBDrhfysXRJX1eAbwXCFYCspsbYQ==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr12220510wmd.179.1626377998346;
        Thu, 15 Jul 2021 12:39:58 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:39:57 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 2/8] overlayfs.bbclass: generate overlayfs mount units
Date: Thu, 15 Jul 2021 21:39:27 +0200
Message-Id: <20210715193933.66120-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's often desired in Embedded System design to have a read-only rootfs.
But a lot of different applications might want to have a read-write access
to some parts of a filesystem. It can be especially useful when your update
mechanism overwrites the whole rootfs, but you want your application data
to be preserved between updates. This class provides a way to achieve that
by means of overlayfs and at the same time keeping the base rootfs read-only.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass | 133 +++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 meta/classes/overlayfs.bbclass

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
new file mode 100644
index 0000000000..40e6107f0d
--- /dev/null
+++ b/meta/classes/overlayfs.bbclass
@@ -0,0 +1,133 @@
+# Class for generation of overlayfs mount units
+#
+# It's often desired in Embedded System design to have a read-only rootfs.
+# But a lot of different applications might want to have a read-write access to
+# some parts of a filesystem. It can be especially useful when your update mechanism
+# overwrites the whole rootfs, but you want your application data to be preserved
+# between updates. This class provides a way to achieve that by means
+# of overlayfs and at the same time keeping the base rootfs read-only.
+#
+# Usage example.
+#
+# Set a mount point for a partition overlayfs is going to use as upper layer
+# in your machine configuration. Underlying file system can be anything that
+# is supported by overlayfs. This has to be done in your machine configuration.
+# QA check fails to catch file existence if you redefine this variable in your recipe!
+#
+#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
+#
+# The class assumes you have a data.mount systemd unit defined in your
+# systemd-machine-units recipe and installed to the image.
+#
+# Then you can specify writable directories on a recipe base
+#
+#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+#
+# To support several mount points you can use a different variable flag. Assume we
+# want to have a writable location on the file system, but not interested where the data
+# survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system:
+#
+#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
+#
+# Note: the class does not support /etc directory itself, because systemd depends on it
+
+REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
+
+inherit systemd features_check overlayfs-qa
+
+def strForBash(s):
+    return s.replace('\\', '\\\\')
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
+def helperUnitName(unit):
+    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
+
+python do_create_overlayfs_units() {
+    CreateDirsUnitTemplate = """[Unit]
+Description=Overlayfs directories setup
+Requires={DATA_MOUNT_UNIT}
+After={DATA_MOUNT_UNIT}
+DefaultDependencies=no
+
+[Service]
+Type=oneshot
+ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
+RemainAfterExit=true
+StandardOutput=journal
+
+[Install]
+WantedBy=multi-user.target
+"""
+    MountUnitTemplate = """[Unit]
+Description=Overlayfs mount unit
+Requires={CREATE_DIRS_SERVICE}
+After={CREATE_DIRS_SERVICE}
+
+[Mount]
+What=overlay
+Where={LOWERDIR}
+Type=overlay
+Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
+
+[Install]
+WantedBy=multi-user.target
+"""
+
+    def prepareUnits(data, lower):
+        args = {
+            'DATA_MOUNT_POINT': data,
+            'DATA_MOUNT_UNIT': mountUnitName(data),
+            'CREATE_DIRS_SERVICE': helperUnitName(lower),
+            'LOWERDIR': lower,
+        }
+
+        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
+            f.write(MountUnitTemplate.format(**args))
+
+        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
+            f.write(CreateDirsUnitTemplate.format(**args))
+
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    for mountPoint in overlayMountPoints:
+        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
+}
+
+# we need to generate file names early during parsing stage
+python () {
+    unitList = unitFileList(d)
+    for unit in unitList:
+        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
+        d.appendVar('FILES_' + d.getVar('PN'), ' ' + strForBash(unit))
+
+    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
+}
+
+do_install_append() {
+    install -d ${D}${systemd_system_unitdir}
+    for unit in ${OVERLAYFS_UNIT_LIST}; do
+        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
+    done
+}
+
+addtask create_overlayfs_units before do_install
-- 
2.28.0

