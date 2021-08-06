Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.3802.1628251608722639234
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SM50MKug;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id j2so10741164wrx.9
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pO+xyRWBm8qDRlkKIl2h/I3upBy9x8GlChQZ0ODCkWU=;
        b=SM50MKugolUanNh0UuJVBEm/0GYhwtljIbbuDMTKM7eEEOmVthKlAxIBmrelXwkxKL
         Zo8kpCarm9nWE9uDEQuWuV8d3a11/j9/J4HaxT0DQuXmdJmaYLSNBR4yt6dZ8QkmtuKT
         S5v8YW8XX6Tzs7Fl5r8Pq5HFLDti74LGWTFKJ0qcJpkHDPOxbYKmE8Q/SMHkrEV+pz1/
         hE95Knb3SjMw6j6Oee5hJ/hAm/JvVTjUqWVxP009YmGqYsJR8SOZXIoPHobeZkTK8Ha1
         EtvVlUf4pAZS03H2j4AmBL+t8ApppTjVpUBCJIHuOekoMCIpmFafZM3CLdrBWmBuYSPS
         m+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pO+xyRWBm8qDRlkKIl2h/I3upBy9x8GlChQZ0ODCkWU=;
        b=bnRg4FAMAvxuzRMXFlrUtqhvVIfQ5f4oz4JySMNTkoqzDa9S8EWu216lwDVrwuZwnm
         UrlksCiwD+Wi5jQtLxvuJyKVQOaP2TcXoaep05iKor2SpDzuwMeNFuxx47L/LHqbJ+A5
         oJd/RYrbdqgtFK9G+iR84XfcScMgoUguTHdupZidh734LVL8/K/5y4nm6h72AI2gvajP
         vZo6QSD7V56uJwLF1tS9zb8kukVOSIVhuumhBDtGGFH3vWWfc42z+YzDXUiNPyiBfZcx
         QcVsVO0IrL+SqUK1UdowiW5TMwVGhLOcvi5PySJN8c+7HQZ+9l/bXB7Y45ZPGFC4VfCl
         wnZw==
X-Gm-Message-State: AOAM533tHe/tUq6RgabFlKT3wPUsDjpPFAwrqjNEvTXxg2PFrUwrxNWx
	7PPKqBKvQn7azP1+sVlLdHUVqHCbcxPN+CPE
X-Google-Smtp-Source: ABdhPJzJasJUOD+ZiUfM8JF//Ew89RG9r3Qy9SXnqJXQmer3E1e44zpEB1YzhzKFAnUJyatdizEhHQ==
X-Received: by 2002:adf:ffca:: with SMTP id x10mr10295089wrs.221.1628251607054;
        Fri, 06 Aug 2021 05:06:47 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:46 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 2/7] overlayfs.bbclass: generate overlayfs mount units
Date: Fri,  6 Aug 2021 14:06:06 +0200
Message-Id: <20210806120611.124246-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210806120611.124246-1-uvv.mail@gmail.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
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
 meta/classes/overlayfs.bbclass | 111 +++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 meta/classes/overlayfs.bbclass

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
new file mode 100644
index 0000000000..8d9b59c9bf
--- /dev/null
+++ b/meta/classes/overlayfs.bbclass
@@ -0,0 +1,111 @@
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
+inherit systemd features_check
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
+        from oe.overlayfs import mountUnitName, helperUnitName
+
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
+    from oe.overlayfs import strForBash, unitFileList
+
+    unitList = unitFileList(d)
+    for unit in unitList:
+        d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit);
+        d.appendVar('FILES:' + d.getVar('PN'), ' ' + strForBash(unit))
+
+    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
+}
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    for unit in ${OVERLAYFS_UNIT_LIST}; do
+        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
+    done
+}
+
+addtask create_overlayfs_units before do_install
-- 
2.28.0

