Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6587B7FD1E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 20:09:00 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id z22so42260453ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 12:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=aUCwwdahEN5Ka1/3Tx4voaHOqWFqrgGe1TQqRibQnJs=;
	b=kjCXw5gUIDRWL60jArF+J2dy9BrOO7WDbz5wIVb8wDEwcI480Rymo4bfXDWGQwPXHt
	QVgPXDZOiBBVVR+OYMFPDxNsKs8t+nPaoJSb+tvTmbq9vvwIHJdAvEcL1GHBXQNcNTuX
	QRWK0eRKSqJR/8rMEwPFlS5LndRVPXv0yaKS1On9PLLsVKXGX5lOz8+7OiMCiYba6Op/
	0YJVwGQRG1oCJcyxiVADcreDdbCjOBdQbl0xGRqjzjd5i1jnsGr80hgv8V+qaBimaBoo
	/k9RmWMohVlYKoNqBHBcMIrXrf/VEYsFxzoB1SN9fOystOjMD2H+cwGTf498Gdkx6EyS
	tQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aUCwwdahEN5Ka1/3Tx4voaHOqWFqrgGe1TQqRibQnJs=;
	b=aMOAr300YlLPX+bGgd6N5Is2CKPw4K+hFCHkyuT1Nv2KYOvNcNgAp20Y2AU2t0Gndn
	K63COtG2ymGCPjV1oEwjatjYj2UvROz5EY/f1/HBL2tog7C8sTeeOWg+Yhzjf6nmbP7A
	hE6Pus0N3SkBEt++p0TZN/2rSdG9RvUNg4yH8hy6PBrKteYjVm1AnklPMaivMwnXWf0G
	4QWSEzrPbTFrgafuAS1z7GdiuGzqz3xwy6kTIFSGEiaPLR3UnMswBuhCE4ilbkb8bH07
	+HtpzbMNpIHMmRJPfi9wtY3ZQSHPPnS/vl80vhavYP5Ug7hgQ4cU/QT+rG1NvZnTx7RV
	EvTA==
X-Gm-Message-State: APjAAAVB2d/A64E4SpZ2cgQXeEBDexnjMHwLgJ9VWOaqzrgoGiDNcFbc
	6r0LUbTj01lM9PxqOqN4Rg0H+0NbiQM=
X-Google-Smtp-Source: APXvYqyrNE5sHWTDSV3Y57qgiMV0buQh49Axo6+g6AQUMk35swQdUpjlZRVBFg2kcYdy80GnlVIdcg==
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr56708376ljm.106.1578168540741;
	Sat, 04 Jan 2020 12:09:00 -0800 (PST)
Received: from localhost.localdomain ([176.59.51.166])
	by smtp.gmail.com with ESMTPSA id
	b17sm26681191lfp.15.2020.01.04.12.08.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 12:09:00 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 23:08:57 +0300
Message-Id: <20200104200857.6847-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] runqemu: add virtio block device
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jan 2020 20:09:00 -0000

Implement new QB_DRIVE_TYPE="/dev/vdb" which falls back
to virtio block device emulated by qemu.
That is needed to support following qemu command line:
-drive id=disk0,file=%s,if=none,format=%s \
  -device virtio-blk-device,drive=disk0'

Real use case is arm64 emulation with qemu with atf+optee+uboot,
so that uboot driver sees this disk and able to load from it.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index b6fca041ae..c324982e8a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1196,6 +1196,9 @@ class BaseConfig(object):
                     elif drive_type.startswith("/dev/hd"):
                         logger.info('Using ide drive')
                         vm_drive = "-drive file=%s,format=%s" % (self.rootfs, rootfs_format)
+                    elif drive_type.startswith("/dev/vdb"):
+                        logger.info('Using block virtio drive');
+                        vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0' % (self.rootfs, rootfs_format)
                     else:
                         # virtio might have been selected explicitly (just use it), or
                         # is used as fallback (then warn about that).
-- 
2.17.1


