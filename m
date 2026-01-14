Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8B2D3900E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:55:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18036.1768416941367005815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 10:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QLrs6Uen;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so2015445e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416939; x=1769021739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5kR8OSwbwbyvU1F65LcDbCo12d4ev5DGQDKNw20SI0=;
        b=QLrs6Uen2s1rRUFIyvHKQe7nuBmQ+iD+doRMpJYGytPjtKUJhsGUJvObgeF/32ASW1
         YDvwPgy+BosAfWne2LKZB2+E7DenfinnSiY+LfzmOwDwmmqI/fCFSEHaN5ftwmzOLc/f
         /Wk4yCw2vrHFsv584UsGpwiI1uHAxegUdXVbukTA+v6rCXJXMPEC6fXApFpq3fCfyT/4
         yPs03RXnGZCwkm9GZIHaRXV4kXFPAQe5yIlxjxPJx0td4sHHnWmjPZiGoholyBcfCE/3
         4M+vrbqwppY77tqWzbc7fF68VRibCmrZeX+e9V3rxPaoeBrYHc0N78Li/19t0Csi+cmX
         LN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416939; x=1769021739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5kR8OSwbwbyvU1F65LcDbCo12d4ev5DGQDKNw20SI0=;
        b=Mx9bT9ZP61KDUNh4qBPKcPDKWlB+Y7C6OmSIglixCI9UI3rXVtIfKaJOCzfHxKEs5n
         lsKajm+Lya72XTta51UifmsFw01Bj5kc3CzVjWqCj4vB5ipUQskwZlgouP5yMre9WXod
         LTxF5jJWrqvj+asQ5VVe1z8Nhvkw7l4CXaQX7ciaRn0gElMlod1u+xc+X39Gyu1eDrmX
         wayq7bmlM4yq5WYz0Ahee+6qXGOuA6XxkHE/Eg4v8wcPV4wV52/lA7Mjlt2vApg43qGg
         PCMU7yTXpmPfMoOkeaxrisQtYmmYo4GXyfsOkEWO8RqxB0G95jfQYdXZVCIi+AUwbgMT
         DcdQ==
X-Gm-Message-State: AOJu0Yy5I0Y9X17pngb1vC4fXkkrk65EOzOXiFhgjBqE9/RUx5m9gsbw
	aVo1J2xp31MJz+/UyENhgbTyiNnl5138zKCK6kIB3ScuWIEPjQa3S3o87IHHqs/2
X-Gm-Gg: AY/fxX4+FWEm64L+eJ6MaK8yWDMVg74ez3m/CGr9R2Qp1W23oeOMBxscMerCnoNzTzB
	J1vPDBFViPX2aCnpV4OWeURvXhJZQK02ui71xvmiU5b98zcNPq5IsUd15uy7IxCcLuhus3g6Igj
	Tm+A+LuNh3ZAsn5qtyNpyFUFuhZw/xmP8xRfqw5WGIXOapBVs/nK/N1/xdlh/It1e9wJTdT9wRW
	mb9fvkczi393oTwxe17B+rAEGf6kx1zLmXoU5GfD3XKctkrpGLEF8aOQc+8Ra+dEO67cdvsGGjO
	4jZSJuKztMjWmhp6R/z6RHvqGtoLLCf31vVWvOnLg+3d0T+Oz6iQ/nh8g77cpxdiSGKNb2Ol+tI
	IMopuFiznFVaxZ900crFHavbnTKfjK9w+2VQ69VJPED8ur4KN0cZ7Fma0APITLMts6qeqKV6KZr
	yu45YcFC/LGQFqVmLuWZBNdQI=
X-Received: by 2002:a05:600c:548c:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47ee3371876mr49080885e9.17.1768416939325;
        Wed, 14 Jan 2026 10:55:39 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428be2b6sm5586085e9.9.2026.01.14.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:55:38 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 3/3] oe-selftest: overlayfs: Add a demo case for /etc
Date: Wed, 14 Jan 2026 18:54:14 +0000
Message-ID: <20260114185508.380709-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114185508.380709-1-uvv.mail@gmail.com>
References: <20260114185508.380709-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229371

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

