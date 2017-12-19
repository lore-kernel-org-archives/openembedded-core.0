Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AA84B78289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:17:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j137so5590530qke.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=xYtTTG4rGorHnM/wpLd7wDo+YoiXaPuIT+F07vzFu2I=;
	b=ifyYjd8PyyAOrpbwBxXWUHd155YygGGzXiA8J7tIx6AsG5p/T2E+l1kEnTixixoAOv
	25FIlT2uv1jv5ehx+Wiaj53TGGv8dNQSut1CwE2yHXKTd6/aOvwCMZnfu63aWwnEtHbR
	fksoeLIljehvDjJB9FSbb/dE6nRdUauwuNxmJh7nUf6rMxE+HkTnPgmW3mPRGYlHvid3
	2TnbxgSetzkrCbRdwmJ9u4ylCmZVrPFk3Tcl8DFfgjxG/8SR6wV7qK2ZYufA8BauSJEy
	znuleu7R58pXzXWCitwji7nAGJfSMRTcbB8NAugrH68vGdSUsdKSe5VAi01tT7Ap0CmR
	/NZw==
X-Gm-Message-State: AKGB3mJmZLJjx/kq/E+7mvwUGwh/eduAyKjLRw/dLXmkeqXL+cPXEK1a
	HtO2f7RvQBnLotGzEgdwvwjKeA==
X-Google-Smtp-Source: ACJfBosnv5j1DhcI5uZQ4zDROTVjnQ6c2LVIhPIaR2GeOIqLSHM/jEdaV7VNQxtWSrnL95bmc0LOzQ==
X-Received: by 10.55.217.82 with SMTP id u79mr6084702qki.42.1513703834273;
	Tue, 19 Dec 2017 09:17:14 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	l62sm4352613qkh.63.2017.12.19.09.17.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Dec 2017 09:17:13 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Dec 2017 15:17:07 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Dec 2017 15:17:06 -0200
Message-Id: <20171219171706.396-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 19 Dec 2017 17:17:13 -0000

The 'wic' image may use files which has been deployed (e.g in
do_deploy) for some partitions that may need to be copied in a
specific partition or filesystem (e.g a bootloader).

When using 'bitbake <image> -c image_wic', from a clean build, the
contents of do_deploy must also be available so we need to ensure all
do_build of the image dependencies has been complete.

Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/image_types_wic.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 222ae00433..4d7305a3a3 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -41,6 +41,9 @@ WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 
+# We ensure all artfacts are deployed (e.g virtual/bootloader)
+do_image_wic[recrdeptask] += "do_build"
+
 WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
-- 
2.15.1


