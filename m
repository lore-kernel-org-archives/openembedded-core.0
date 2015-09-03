Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 746417701F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:27 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so55992729igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hFifYHU4yEtX4JxXMObgPpkkU40KkY90X+Q42gjB0po=;
	b=FO+aoRgRcANm/Ngl4Ym3VcSHJqGkXyee9CGOdFxjJg64zfGAv6YssQYXpXczJEaOry
	bzu3eDhQU0iDMZuv+4DDUi0D89c2i51LbuzjAuFiqvFNw93greVZtbYJTU8efKMbQxK7
	89o3t0cgHYfMHtuLl74Cg2y26+ZcRd2AbK8Afw3oZ+42OLFYwl+JyrFtfCbXY+TuZF1H
	zaVDJEc+3S2SCFVBJgJ9JX68x+nfNM5QiLsDQb15WHMfGRnTuKaXugi8ButZtydZSiqt
	Wt//rDBo1EIn6OmzS3c26VMMh7jeMolt5Vx/NL4xzFFOGr9eV4yPc2oliXMoTqCIgdd9
	23dA==
X-Gm-Message-State: ALoCoQkHqo+3NMQDA7Lb7PpmYwkeX/i4QZrtoj8wNkI1fe8jWkmTi/HSTkvw8dG22EYiv6dCGtWm
X-Received: by 10.50.142.98 with SMTP id rv2mr967871igb.41.1441305747400;
	Thu, 03 Sep 2015 11:42:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:33 +0200
Message-Id: <e48f2ed62e179f5f099f5c38f326b6d39a7e4fba.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 8/8] boot-directdisk.bbclass: use rootfs UUID by default
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:27 -0000

This changes the default SYSLINUX_ROOTFS such that the rootfs is no
longer expected under a fixed device path. Instead, the UUID is used
to find it. This makes the resulting .hdddirect (and thus also the
vdi/vdmk/qcow2 images derived from that) more flexible.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/boot-directdisk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 600e21a..7cb0ab0 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -60,7 +60,7 @@ inherit ${EFI_CLASS}
 
 AUTO_SYSLINUXCFG = "1"
 DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-SYSLINUX_ROOT ?= "root=/dev/sda2"
+SYSLINUX_ROOT ?= "root=UUID=<<uuid-of-rootfs>>"
 SYSLINUX_TIMEOUT ?= "10"
 
 IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "true", "false", d)}'
-- 
2.1.4


