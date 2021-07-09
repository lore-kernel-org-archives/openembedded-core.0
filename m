Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web09.9617.1625830367321326637
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tSVM5BFe;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id o10so9973379ils.6
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+r20ZL/7VsDs/moRdyx/Z/d9DvU9CtUbBWZiI1i9pU=;
        b=tSVM5BFeZdC2+jTsqBfIK3oHG+Cjzm0u+DTJXundRktqkxEdNYNN8U+JnEbzcnQord
         QNrz1C+13qlAfn7sdsKNElHzOTVoHn2qEwIuVqUnTQmlisV7mpcHZZ/p+jWyV5xFqZOr
         viZYIZBXbpMs4CjplGVxvRUVO27iZ9qRdLggUbeXbb0uT/jbSvW6iPRJhoQLu1Ov6AWK
         l2K2UzAHdMH5MCpgP1gcIWaxqsrbEPk42Jw3onYhy5hDNp8JbNCGCzZPc3NeuXd3tt2c
         7p+ltasyv216VRiwOiXlSXcrs5aDzMb7F22U+Sbe0jaNxsQYB3+cAjd2rDdKWXuEToTw
         K+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+r20ZL/7VsDs/moRdyx/Z/d9DvU9CtUbBWZiI1i9pU=;
        b=mWrsFLvQTnLSPim9omTT8Xq2cqX2xlxneKfu4rFFBB05QGsxrfLs/ajq4tc2f9AT9h
         OjrunE4u82J40tuYycspLnHBtusXCXeAdyizaAAU1JnZ0RxKk0zCLKMark53aoJ3xMfU
         fKKZyjHC/KnrZmTW6zlCkyoedyrPrpn9W7PRi3r3GGABqek+hcx9eHKJRbdyW6HEAz0Q
         YSR+DKXjDkwl33OCWnCMr6XpcGgaKOPZIwqR2igBo0sPwuWM+5b13rpf9IOjTKEOXVKe
         KXGwWuWbi7c81qlZzaPu7rmrH+u5e2aatzqrrNRXmPkSrYZL2ANMfdkMDlawEUVrCqv5
         0pyg==
X-Gm-Message-State: AOAM530JnbEXdBcsHbNiU+cg9Nz+1817y+w2g/imnECOVQCXL8GFv2Sx
	vwN+iJhKorEQHzQhZYvVun+rZkHjdKxHuw==
X-Google-Smtp-Source: ABdhPJzZzxH8kdm0f3hXcYJq1kLzOYyxUuTm0H2NmNMYX0lls8BVCriiPjqZnvQMTqSm3SV7VfMcUw==
X-Received: by 2002:a05:6e02:219a:: with SMTP id j26mr26333711ila.272.1625830366620;
        Fri, 09 Jul 2021 04:32:46 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:46 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 2/8] overlayfs.bbclass: generate overlayfs mount units
Date: Fri,  9 Jul 2021 13:31:40 +0200
Message-Id: <20210709113146.69020-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
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

