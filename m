Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAB6E787BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:56:46 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d8so3046208qtm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=vJP5fhszq7gvvYyAtfFW60RyO2hLZroZ4PAwc8agaeM=;
	b=gR1dtTlnNHcex1MRjAOyFyiNkeUUInSpiH5hgyLGwxW+wLvyV3FRWQN2tKj2/AHdxm
	+X8R8y8BOj2NnN6IjtyqV4dMxsbUl3xRxrxcJscOAM138AUqrtjRwacU0MTdaAB/c2IS
	Mwne8F5etATgckqmx6uj/vU4NquZB+xBtlVRTNbZn1Vao2j3btCWMOw2M60K4FylH1VT
	rgGVO918MxYntqy7v2yeYND8LeEu+8cBwkP72VZVcBee0mFyy1PrquGZU5OW0kYDDoAx
	AvnXGZf/9dUDChwVSH5D3sCs1KLdKfVnrgEgHeYjFpDE3MSsnTOITWRRnjvmuJgCpj6O
	jT0w==
X-Gm-Message-State: AKwxytfn7OQXo17/K6puLXe+wI3SWfjkqQUL7Uslih3RxEMn9GisojAn
	iJTHS+pHPx+xNedrqt4iphcVnw==
X-Google-Smtp-Source: AH8x225eAIQdakQ4DrCu9cXSdVSfEsSm/CLMdpqcKWwL75GP6mtR1fK/S78DawCo8d6qfjf6IciQqg==
X-Received: by 10.55.75.216 with SMTP id y207mr4458905qka.7.1516726607550;
	Tue, 23 Jan 2018 08:56:47 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n81sm12766222qki.68.2018.01.23.08.56.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:56:46 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:56:42 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:19 -0200
Message-Id: <20180123165625.7352-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 2/8] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 23 Jan 2018 16:56:47 -0000

The 'wic' image may use files which has been deployed (e.g in
do_deploy) for some partitions that may need to be copied in a
specific partition or filesystem (e.g a bootloader).

When using 'bitbake <image> -c image_wic', from a clean build, the
contents of do_deploy must also be available so we need to ensure all
do_deploy of the image dependencies has been complete.

Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f387c28640cbb209b8a8ed5734b21c754d9f7663)
---

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
2.16.1


