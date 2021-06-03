Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.8477.1622730092413136630
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 07:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CYqiH8SD;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id dg27so7301296edb.12
        for <Openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1s9waNeyx5Ng70G97KjJcgYf8TeNs5mT1ejfhkzCETA=;
        b=CYqiH8SDPc5/MIWutckd+vwJ9pyRCtVF+z8Slo5/oEqzDGgayRjjj1XIBBNCxfZT1E
         Oq93pN2bLj/nPGSnYyI0L30yOlCgecnmvFZ26rSPGa9famRI2e3nnfhUlto1p3gvUdG9
         /d7aIAaNRmIg3Bto2gffBMqqSMYmzJsXvTfsMK48Aooq8RIUeeRC+5J4UVw2uz+EGKWO
         BHxea65ih2/f5w96YxVLUmZmJmzRSin7YjKFNKdxxqAkPTpaVSFpzSTYUj7AvFrN2HIg
         BjGfMpmhQkvp1Fk56rJD3FRdIGDj1FyoYocPnvFmhNrtUi5B8DBKVNgXlLxHqMaUzfCT
         3VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1s9waNeyx5Ng70G97KjJcgYf8TeNs5mT1ejfhkzCETA=;
        b=Hatym1jC/kKiaL1Smj5v8xwdlPxUyctnVgt1hrjPCfrqL+qbDGchPHwH5t3QBzQ3dd
         qW6LNLufJEah0kY2XkL8JI506c92l3WyyPSC82Trl6GkAR4eZajbtXhsrZEA9xAHcnca
         sgrmGu5Ka3UycZ2MpypdudVSCDcJaa27NxYB5PNRMlFUaPZEEkqRPcaZ+r3Opr/796oL
         WqFAW6MAAHQ/rV6JVqRzIZ2N0cfxo/oCsOnd1Qrdlcm9VpRVxp6cCJrnYuqP3RLsURO4
         fpY8eJnXSGe4oT3XLXbyidZ4xFiMZhu1gfhXtR0YBPp3sVTXckRi8ItxzjvWhD2rmJ8L
         3BFg==
X-Gm-Message-State: AOAM531vH81112XLA2JN4A3alseOjQ4EgbHfOxT2j6S7wD21w2N5S4Lg
	RqO8Nl6ZheOjRCNvm7z/0/qRzI8ofp7hdqiEO4M=
X-Google-Smtp-Source: ABdhPJxP7WSRpdjJnBJFNr68Y1tUivX8s7B3vc/0ycp46VfG8mLv98aJnuAXOhvf4NUW8pxeoFkP9A==
X-Received: by 2002:a05:6402:3594:: with SMTP id y20mr51956edc.63.1622730090335;
        Thu, 03 Jun 2021 07:21:30 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local (dslb-002-205-242-217.002.205.pools.vodafone-ip.de. [2.205.242.217])
        by smtp.gmail.com with ESMTPSA id y25sm1819049edt.17.2021.06.03.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:21:29 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] overlayfs.bbclass: generate overlayfs mount units
Date: Thu,  3 Jun 2021 16:21:06 +0200
Message-Id: <20210603142106.115932-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
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
 meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 meta/classes/overlayfs.bbclass

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
new file mode 100644
index 0000000000..7fac3e696e
--- /dev/null
+++ b/meta/classes/overlayfs.bbclass
@@ -0,0 +1,132 @@
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
+# is supported by overlayfs
+#
+#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
+#
+# The class assumes you have a data.mount systemd unit defined elsewhere in your
+# BSP and installed to the image.
+#
+# Then you can specify writable directories on a recipe base
+#
+#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+#
+# To support several mount points you can use a different variable flag. Assume we
+# what to have a writable location on the file system, but not interested where the data
+# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
+#
+#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
+
+OVERLAYFS_WRITABLE_PATHS[data] ?= ""
+
+inherit systemd
+
+def strForBash(s):
+    return s.replace('\\', '\\\\')
+
+def unitFileList(d):
+    fileList = []
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    for mountPoint in overlayMountPoints:
+        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+            fileList.append(mountUnitName(path))
+            fileList.append(helperUnitName(path))
+
+    return fileList
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
+def mountUnitName(unit):
+    return escapeSystemdUnitName(unit) + '.mount'
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
+        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
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

