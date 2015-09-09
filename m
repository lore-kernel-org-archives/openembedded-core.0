Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id BD67A74197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 12:31:10 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so12698603igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 05:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4PJVg8f0OZDYlWlYck2vLkxrVAgKwrXvDRpdaGgsyok=;
	b=mmsWYN2HhG0W5Ll21k51IA4wBJ2Moh9ARpQZpU54u4k5gi/5L+AKGlunMHyrNYOShB
	nN6j/tMWZ+ii9sIhRtm5Mg/jUEv3C2SB7lEqRBALHjl90uJQOyulxrvOmnZnZr/V9OVp
	ElCSJuKrPrHnLCx/TfWEProG4x43ynApQOgUSbjWq1e3POhV1+vJPLKuh+7XNBOuzqpu
	y5IpoZy4RTS/uNtmhZEWLDxF3mXumZjdgec9tzp3SIqlqjZf9NEacPcXspMaM9yETbZx
	CBcPD2AaHR95YFKLViSKV8h6u5vWmnumVkiPXyE9pUU8eVyDd605G7egb9kRq1gky4JO
	s2AA==
X-Gm-Message-State: ALoCoQmIDzcbhiAdvg4FxKKQFsBLwSmi9rXg8UTe7Gldzegv7SweviifOijM5fMi7crNXlGK0GT3
X-Received: by 10.50.50.240 with SMTP id f16mr51498775igo.95.1441801870375;
	Wed, 09 Sep 2015 05:31:10 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51]) by smtp.gmail.com with ESMTPSA id
	r40sm4442073ioe.20.2015.09.09.05.31.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 05:31:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 14:31:30 +0200
Message-Id: <1441801890-3769-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Revert "boot-directdisk.bbclass: use rootfs UUID by default"
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
X-List-Received-Date: Wed, 09 Sep 2015 12:31:11 -0000

This reverts commit 8ca8e2e5bf4a9f01dc48300149a8e1d71d715400.

Further testing showed the kernel does not support root=UUID; it is
something typically handled by the initramfs.

Because boot-directdisk.bbclass cannot know whether it is using a
suitable initramfs, root=UUID cannot be the default. Instead, it will
have to be set in image recipes on a case-by-case basis.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/boot-directdisk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 7cb0ab0..600e21a 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -60,7 +60,7 @@ inherit ${EFI_CLASS}
 
 AUTO_SYSLINUXCFG = "1"
 DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-SYSLINUX_ROOT ?= "root=UUID=<<uuid-of-rootfs>>"
+SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
 IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "true", "false", d)}'
-- 
2.1.4


