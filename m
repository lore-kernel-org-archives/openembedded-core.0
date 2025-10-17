Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BB9CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:27:30 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.14199.1760704043593436616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UsQylnu2;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37775ed97daso30303601fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760704041; x=1761308841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SSKtChQhRBfU2vnaXzu9s23bC9U8tZRT2d+xd1RY7o=;
        b=UsQylnu2Y+pcqlrfje3Zmo1lN9BB26ogNwE7O28bD0+OaQLj5urWcM1TNBRkoMR0SF
         0Xh8Cli6kBQnfTEAUtAd6rCypEYLvX1JIo6BQSg/HaiaUaWdFj+d65S8SiV5NZAtlkUC
         jKk74rgqVRkWcKf35Hk5hV3doICdmZ+BNU6WbhwzoydAe6pxyRW7Eog1dUpRfTqN5GpO
         y/evnAfvgGLp0ogq4G4ncPwo2YL7DwP6YX3KJ8LIbm/DH56nDL0iIkk7CrvA4dGgllnH
         D3g5hFm976pS4EVUpR+I6OSiq0e1maBYrzvTFOlOmo6RaBGCwTZRWHFPEtOc970Vq6Ht
         K7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704041; x=1761308841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SSKtChQhRBfU2vnaXzu9s23bC9U8tZRT2d+xd1RY7o=;
        b=VWIVqugLtLe6RMqJN03L8Lx88OAQRHaQBjQ5HO+Jbcld9U04vsaKawJXUbE8FO5cp/
         nAtpU+8/4aIRRgrtna2dmTIViMYx5coh6kO4pD81KNIsxT9gli2YUzmXOHK1wWJ5WO+R
         PsnHdYwHWHemNfVU7FAH51WN+YtSoAKqt78Xun7Tbjy7IvBAN9XpQc4rO/Vc0F64o+Kd
         KGYMkKmyKNTFdQ9yQFFfqFOMCE9Im04FafVcfnd7p6GoPgk4//x6w/k7rVYOkCb4ExiU
         bInhSBcQCSTzvvhTGaCPLI2LGnfEXWuJ+mrygNjOFQjDDxzUoCnUA3528odanIQ7fpkZ
         sD6A==
X-Gm-Message-State: AOJu0YzNqI1JdM4pVw8kLu1qtB20TqRTWSyxLPCZTm78V6T3vJY+AH51
	rM93xTcPLpfgh538CHyrAarUnLUrJ5Ajc/RsT/3lbof8T7gpQd/VfCLwQUdX9nZ6fiOF6BSIHe0
	BMx5NEvk=
X-Gm-Gg: ASbGncvB2BiyNyGqGGtDDpqqMlHp2i6Yc2Lg2AvlnMbVUOpyQtQRwCLpSK/6IT3eCqA
	/frcnHNL7DQhSwBxaEDlEOAZyUvqSCIVxnKo2m9AR5siGAinAOpikrnTnhDeE9AsFb7dpwReRwz
	lVPGyJwNVZPGso66RWZx9kMZqGqheWlmd4D+t2fqCf6VBxPdGu/nOyu8Ec14Md11rvoAoo08gzw
	93PvdNwjzHRYpgh8fGsdHMarkh5DZhvX6zgbiZbch/BMdEpDLwMDBzvde3udreFJf6IgbfCDWhs
	373/xb3R7gZO91KYJfZU9VSZ3co/W2hHYkbU2L3X1qIKMsXjx+4wJeer01uz91eRlBHwoX2dBIQ
	7HDhxLPcWLIAk+qYDRLTD7WEXopqrw+fzvyMrP5mQMz1p3wIVsRVBR2XaKLdFQPiWoCB3XLxS3g
	DkGSGBTO1UK5zwCgHG8JUKYtyQANPetCwDow==
X-Google-Smtp-Source: AGHT+IGR7qMVzMQX9UxJVTcMNbN11gI6X7dOtIgFx+vbe9cvgMDqI1vdPHu9WbOZ24HmInJr9wquTw==
X-Received: by 2002:a05:651c:1118:10b0:376:2802:84c2 with SMTP id 38308e7fff4ca-377822498eemr20378651fa.23.1760704041462;
        Fri, 17 Oct 2025 05:27:21 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm61421371fa.44.2025.10.17.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:27:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/5] selftest overlayfs.py: disable qemu graphics
Date: Fri, 17 Oct 2025 15:26:47 +0300
Message-ID: <20251017122649.493701-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017122649.493701-1-mikko.rapeli@linaro.org>
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225015

Tests don't need it and graphics may cause boot failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 580fbdcb9c..b40e738f80 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -181,7 +181,7 @@ EOT
 
         bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic') as qemu:
             # Check that application service started
             status, output = qemu.run_serial("systemctl status my-application")
             self.assertTrue("active (exited)" in output, msg=output)
@@ -360,7 +360,7 @@ OVERLAYFS_ROOTFS_TYPE = "ext4"
 
         bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic', image_fstype='wic') as qemu:
             status, output = qemu.run_serial("/bin/mount")
 
             line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
@@ -399,7 +399,7 @@ OVERLAYFS_ROOTFS_TYPE = "ext4"
         bitbake('core-image-minimal')
         testFile = "/etc/my-test-data"
 
-        with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic', image_fstype='wic', discard_writes=False) as qemu:
             status, output = qemu.run_serial("/bin/mount")
 
             line = getline_qemu(output, "/dev/sda3")
@@ -420,7 +420,7 @@ OVERLAYFS_ROOTFS_TYPE = "ext4"
             self.assertTrue(line and line.startswith(testFile), msg=output)
 
         # Check that file exists in /etc after reboot
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic', image_fstype='wic') as qemu:
             status, output = qemu.run_serial("ls -1 " + testFile)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
@@ -454,7 +454,7 @@ IMAGE_INSTALL:append = " overlayfs-user"
         self.append_config(configLower)
         bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic', image_fstype='wic') as qemu:
             status, output = qemu.run_serial("echo \"Modified in upper\" > /etc/" + testFile)
             status, output = qemu.run_serial("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
             line = getline_qemu(output, "Modified in upper")
@@ -500,7 +500,7 @@ IMAGE_INSTALL:append = " overlayfs-user"
 
         res = bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic', image_fstype='wic') as qemu:
             for filename in ("rootfs", "delayed-a", "delayed-b"):
                 status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
                 self.assertIn("found", output, "%s was not present on boot" % filename)
-- 
2.34.1


