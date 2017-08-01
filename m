Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 37A6C78305
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 17:14:38 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id s143so1631644ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mIhYpPuOI0/tI21odwIBOqXh7l2YJFbNXyv3V1e8msg=;
	b=WzhzCs+jL9L9lBos1EYtB1bQJnSyQ7nJKPICMt3GmKOYP/coNdivA+HGLZpaxiwGIk
	0Y78OehYUD+AhqoBjMD+jOWrvmmajr9dHEef8sGmoIvIHubwnyZZliohTkrqQqDnXljR
	XVZjeFwebHa20haLeHQf3eyl25j9jldMkW0cmTTYlmFhP/lUg35JngYk0WuCChLpNfBZ
	7lo9IiCKxnnm/C6tvN8sjD2FAsC0NdEYsTacjUGVcAM88UjVw03lIxRFvQDCNf+ZeKIR
	tn2rWT3KiHfFooQIe2dAjeHwmaUQ3XT/FDxtL3OyrKaTYpjpucgGlxyv4k/RAYlA1/2x
	onAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mIhYpPuOI0/tI21odwIBOqXh7l2YJFbNXyv3V1e8msg=;
	b=Ns5BirioegbE0KulkjFvCWRioLeFEZqjAODQgIK0vCgSkZpjFMcMHnzR74Xc9kzSgz
	8K9U6j65Sp+vzXpmx9v1DVtqDfKBgprrPvuoAFmEserOfHYAHSv0HqhpcStn1ACHLooj
	QII7qgqG28/0Kju5RPWJyDiPRkyizI3Mgfd6CmH+uV7+E4lJJe1rS5N+rVgMMntI4oRF
	UcmV+mzOvuGkdPYJl/ts7QrvO3R29RXxULmcQtDKO7LO5QrS/kGQ7fOnTArMfw14SMXV
	hkXybPdYzV01ABft6heN6/bnSS8mv2KTxdEzPZlvRtIm9gFAy9m6GNVqcI3y9EUdmiYB
	RSaw==
X-Gm-Message-State: AIVw112czwm4EFQQ5LZUSuPu5NHF+nQqRMhuw+vjkcqsgEztqJezIEPE
	cJD65NfujtbDx7qF
X-Received: by 10.13.200.133 with SMTP id k127mr16910364ywd.128.1501607679946; 
	Tue, 01 Aug 2017 10:14:39 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	r64sm10946066ywd.107.2017.08.01.10.14.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 10:14:39 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:13:48 +0200
Message-Id: <1501607630-30241-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/4] image_types_wic.bbclass: deal with dependencies only with WKS_FILE_DEPENDS_DEFAULT
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
X-List-Received-Date: Tue, 01 Aug 2017 17:14:39 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Drop do_image_wic depends varflags, move the dependencies to
WKS_FILE_DEPENDS_DEFAULT. I can not see the need to maintain them
in two different ways, besides that it's out of USING_WIC control.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image_types_wic.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b825b47..7b0a1c7 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -39,9 +39,8 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 
-WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
+WKS_FILE_DEPENDS_DEFAULT = "parted-native gptfdisk-native dosfstools-native mtools-native syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"
-- 
2.7.4


