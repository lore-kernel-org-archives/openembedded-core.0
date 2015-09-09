Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id A08F576F58
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:10:20 +0000 (UTC)
Received: by ioii196 with SMTP id i196so21023230ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5s+Txra8jMfbIuv6k0aYnFiGbgknkO3L/354kzB6ffA=;
	b=UF5igLQBISzM5ZNFW4o7E4/lvY/Zvc7L62sWFgH7gEFFEF5+dyo6DxkD32bXsLZ2On
	LDXbjIzsr2V7O5zDr4+bRDYbm8tyQ+eCcAjnaNt9Ym/8kvGWVwBjvkNRrK2VWnRk1Xz3
	A8urClZnihGHU3aCaTkqza2WZ061F6yKhwVlsFpk6eymu7Iec1bxtrWkIDAtGpKbiDC2
	Nb55aJywxK1Uig8gCIQEx2o2006Z+FfhrpKKAGBReZGAdIG8DTrWIJC0/znXn+i8sIpi
	2r0qVWj8GKZkzoV6JFJyUECGvb7ckXHPlWbD1WFQiIG13xP+1qUXKjl84i4FyD29bn1L
	tp5g==
X-Gm-Message-State: ALoCoQn3SQJLgMLU0VTo7/w2NUoQw1ShLuAfqstxApII17Rlco4obuC/8qB/wtYiYfIJ9XVvoUZL
X-Received: by 10.107.150.80 with SMTP id y77mr48359105iod.188.1441804220592; 
	Wed, 09 Sep 2015 06:10:20 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51]) by smtp.gmail.com with ESMTPSA id
	k21sm4513409ioi.10.2015.09.09.06.10.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 06:10:20 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 15:10:43 +0200
Message-Id: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
Subject: [PATCH 1/4] initramfs-framework: support rootflags and rootfstype boot parameter
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
X-List-Received-Date: Wed, 09 Sep 2015 13:10:23 -0000

These two parameters are supported by the kernel
(https://www.kernel.org/doc/Documentation/kernel-parameters.txt). When
an initramfs is used, the kernel does not mount the rootfs and the
initramfs needs to react to them.

The boot parameters can be set both by the image creator and
by users.

Supporting these two parameters is useful:
- rootflags is needed to ensure that the rootfs is already mounted as
  intended in the time between starting init and init remounting
  it (as systemd does); this is critical for IMA where iversion must be
  active already when system starts writing files.
- setting it correctly up-front avoids messages from the kernel ("cannot
  mount ... as ext2 because ...") when trying to guess the desired type.

For example, assuming that only one of ext4/ext3/ext2 is set,
rootfstype could be set in an image recipe with:
APPEND_append = "${@''.join([' rootfstype=' + i for i in ['ext4', 'ext3', 'ext2'] if i in d.getVar('IMAGE_FSTYPES', True).split()])}"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 325f47b..006aef2 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -22,7 +22,14 @@ finish_run() {
 			fi
 
 			if [ -e "$bootparam_root" ]; then
-				mount $bootparam_root $ROOTFS_DIR
+				flags=""
+				if [ -n "$bootparam_rootflags" ]; then
+					flags="$flags -o$bootparam_rootflags"
+				fi
+				if [ -n "$bootparam_rootfstype" ]; then
+					flags="$flags -t$bootparam_rootfstype"
+				fi
+				mount $flags $bootparam_root $ROOTFS_DIR
 			else
 				debug "root '$bootparam_root' doesn't exist."
 			fi
-- 
2.1.4


