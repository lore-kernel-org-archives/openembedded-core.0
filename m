Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DDBE77364
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 14:17:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.120769.1766585852490828071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 06:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4upecNl;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so37719545e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 06:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766585850; x=1767190650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5kR8OSwbwbyvU1F65LcDbCo12d4ev5DGQDKNw20SI0=;
        b=Z4upecNlW3BXepKbkhUdSLvHeaPsTxXVaHHjQYHtCBUK+F2ElYjynPx9KXZG2UjLa5
         9bpyOdJxRPdmI26OhiSp7sa2VKIi8irDD5OwYZ6e0s3a5Z89lbYecT/LUGBxD5t6eVtd
         Q7mcrn7xlmGrBU+qUvHZB7hdQyb3G5ud/AqJJPDEeO8euec4BQ6F6wtHkYbde/fW92iR
         VAFdqQbT31RuK66ESpWlgq7xcKolOL4+ApNOQc0/TE43jCwa1szrJ9ffcZ7gfjKXn//2
         J1M5fnCKTLwGHtRGh9/5kMbLViXliGACeZLrn+TJehfYivDY0maEWBC9ETQRXNmEueI6
         vDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766585850; x=1767190650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5kR8OSwbwbyvU1F65LcDbCo12d4ev5DGQDKNw20SI0=;
        b=aIJ4VS38A79nextKI+AkWoilGJ9okN9ty81iid+F0ipVeWwUOkEAX89rxSxlmcUxSK
         VgHWEW0DQo+LsSnvHUhd68YbyHUXQZwBxXjDNvu8EBcRyG1CBkXMZkiAcyNBlBVGWNRG
         G+zcemD2H/3LQt7hilNzDTIeV6egKw4cQpw/YlMcPVfdlSsdWK4vzzarup757FTd2f2t
         ioenJdaddZc7UK8fWQPQiX8yLd3Yc+Qn8sH8M5IczXZZ/c0sq/GFl6g3Q3Rlc/nVZXfN
         lzwGuhLCSE1JQsLZGNpiaE6f7yk9wLyp7YUfGamW58Z+aatkHmn5VHiCC/UlvXqjJPyW
         adfA==
X-Gm-Message-State: AOJu0YyoYbxDpT+UnyLTbjeqAbv3KKPI3/iO0d7lXSnjmdchZiYuUtcY
	PczMoWO0Yg4zVmoCedH/dP9/Dm94X+zR8sWQoQgc2Rn18EZXE8RmpfG7dsHm6Cn7
X-Gm-Gg: AY/fxX5P+lfLNOHIiTLgoznCqqKyxZDy18pqTNk1LduHwoWxtjpBxeen6z8lBTEPyfz
	sdM7hlB0pUNtkUHuX6tQzVRksmdGlnz9t077LzdzxN+h13Me2aEL4eM9o2grTw/qetskq+I+t/B
	NvOndHncfAn1jzIwMcJcNVMZyWDFHy9Ueu8ItIKGuSSn7TbpU+DUp/beJ4J3DKRJAz1ernc4SVM
	C+sgthIoONBxm2wypgb4M30qrf3eLZbVJ96R+A+C33+tfeNYiGHf11zvDAupiS2wK3/jopMk1Da
	SecRM6U83V698qXLGBNrre+dBMYQiKbkSEBYhbhRLfMoiWyvM9kdnGr+5v5g16k4i+g395muYgN
	mvLGHFz9nKS50rORYGx2/hD/hYOSqWDFkZYGGqpVcngL0MhT+TaEBYPlnE8TJP2l7g70wrLI0jS
	VyYHRBFFXwMQDU
X-Google-Smtp-Source: AGHT+IFpWFEw+SbyR8qy5+g67o5ZTb75o07oMvJW8Y4nSXJAHOqjsn/9MoomaZvdaKs9Bg9BgHK7ng==
X-Received: by 2002:a05:600c:5795:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-47be29ad8demr162285575e9.6.1766585850200;
        Wed, 24 Dec 2025 06:17:30 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2253csm34940079f8f.14.2025.12.24.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:17:29 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 4/4] oe-selftest: overlayfs: Add a demo case for /etc
Date: Wed, 24 Dec 2025 14:16:58 +0000
Message-ID: <20251224141659.2218381-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224141659.2218381-1-uvv.mail@gmail.com>
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 14:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228540

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

/etc is a special directory. It's possible to create a mount unit for
it, but many system services that start early at boot time will not
rescan its content when you mount overlay on top. The added test case
demonstrates this by adding a sample systemd service and enabling it in
overlay.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 3e55e97927..426b4ccee3 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -263,6 +263,104 @@ EOT
 
         self._test_correct_image('systemd-machine-units', systemd_machine_unit_append)
 
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
+    def test_etc_mount(self):
+        """
+        Summary:   /etc is not supposed to be used with overlayfs.bbclass
+        Expected:  Observe inconsistencies after using etc overlay with a mount unit
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+        systemd_machine_unit_append = """
+SYSTEMD_SERVICE:${PN} += " \
+    data.mount \
+    etc.mount \
+"
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -d ${D}${ROOT_HOME}
+    cat <<EOT > ${D}${systemd_system_unitdir}/etc.mount
+[Unit]
+Description=OverlayFS mount for /etc directory
+DefaultDependencies=no
+RequiresMountsFor=/data
+
+[Mount]
+What=overlay
+Where=/etc
+Type=overlay
+Options=lowerdir=/etc,upperdir=/data/overlay/etc,workdir=/data/overlay-workdir/etc
+[Install]
+WantedBy=local-fs.target
+EOT
+
+    cat <<EOT >${D}${systemd_system_unitdir}/data.mount
+[Unit]
+Description=Persistent storage partition
+
+[Mount]
+What=/dev/sda3
+Where=/data
+Type=ext4
+Options=defaults
+
+[Install]
+WantedBy=local-fs.target
+EOT
+    cat <<EOT > ${D}${ROOT_HOME}/test-daemon.service
+[Unit]
+Description=My one-shot task
+After=local-fs.target
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/echo test
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
+EOT
+}
+
+FILES:${PN} += "${ROOT_HOME}"
+"""
+
+        config = """
+IMAGE_INSTALL:append = " systemd-machine-units"
+DISTRO_FEATURES:append = " overlayfs"
+
+# Use systemd as init manager
+INIT_MANAGER = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+
+IMAGE_FSTYPES += "wic"
+WKS_FILE = "overlayfs_etc.wks.in"
+OVERLAYFS_ROOTFS_TYPE = "ext4"
+"""
+
+        self.write_config(config)
+
+        machine_inc = """
+OVERLAYFS_MOUNT_POINT[etc] = "/etc"
+OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
+"""
+        self.set_machine_config(machine_inc)
+        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
+        bitbake('core-image-minimal')
+        with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
+            test_daemon_path = get_bb_var('ROOT_HOME') + '/test-daemon.service'
+            status, output = qemu.run_serial('cp -f ' + test_daemon_path + ' /etc/systemd/system/')
+            status, output = qemu.run_serial("systemctl enable test-daemon")
+            status, output = qemu.run_serial("sync")
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            # Check the test service status. It's enabled and supposed to start, but it didn't
+            status, output = qemu.run_serial("systemctl is-enabled test-daemon")
+            self.assertTrue("enabled" in output, msg=output)
+            status, output = qemu.run_serial("systemctl is-active test-daemon")
+            self.assertTrue("inactive" in output, msg=output)
+
 @OETestTag("runqemu")
 class OverlayFSEtcRunTimeTests(OESelftestTestCase):
     """overlayfs-etc class tests"""

