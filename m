Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4178C78439
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:14:29 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c85so9505714qkh.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=aGACzkZF7QwXj3pxH8N20A1Gf3uc5Fp0VUDKkxge8y4=;
	b=U7WoC4ptL4sOu490e0LSzDUrFILUG0h3neawM7XUipjv2LnSVMyd0jAgg1kDIdQ7kf
	pYiIThqlFPvGoFHVEfQSt9wyI4dfs5s1uYHN7EvvBJCzwKzQl195h0fAqb2sqaBpIUYD
	XOfsJ9WWjCKkrQDOHUVwBz57S6nFUjtHaPb+//QodgrrSh0YJ0PZACGCsppRIU+FsNV8
	UMlXk/AC7+fD3p+8L86nT9kWUcAdRnF48QA9ouakHt+d9TrV92T4Z6Ai7i25MygBltKQ
	csqdxFDN0WWhUYZL6FxyMJNL9adopyA4O1I3luqGYUNW/a2z/dMAT1ABJXeSMbLRkw6R
	Q3oA==
X-Gm-Message-State: AKGB3mLem3yooyZrg5rLpgWwqzORlpjRJzhx9abp30AhuFdCXb5zxdYn
	Ar0I5KaMZe9him2yKv0+yYnUQQ==
X-Google-Smtp-Source: ACJfBouLkkeiGnqM9oXzFKnfocMA4bewmxJOpKoneKx2BoMPPEEvrqWPOmbA7mKdbRZcYoVcrVlyZg==
X-Received: by 10.55.159.145 with SMTP id i139mr5994718qke.339.1513707270978; 
	Tue, 19 Dec 2017 10:14:30 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t28sm9978572qtb.83.2017.12.19.10.14.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Dec 2017 10:14:30 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Dec 2017 16:14:23 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Dec 2017 16:14:23 -0200
Message-Id: <20171219181423.32539-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 19 Dec 2017 18:14:30 -0000

The 'wic' image may use files which has been deployed (e.g in
do_deploy) for some partitions that may need to be copied in a
specific partition or filesystem (e.g a bootloader).

When using 'bitbake <image> -c image_wic', from a clean build, the
contents of do_deploy must also be available so we need to ensure all
do_deploy of the image dependencies has been complete.

Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- use 'do_deploy' instead of 'do_build'

 meta/classes/image_types_wic.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 222ae00433..dcf620cee0 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -41,6 +41,9 @@ WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 
+# We ensure all artfacts are deployed (e.g virtual/bootloader)
+do_image_wic[recrdeptask] += "do_deploy"
+
 WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
-- 
2.15.1


