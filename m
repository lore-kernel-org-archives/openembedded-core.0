Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id AA5BA77286
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:43 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so79545827pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ph0NM/YDNXb5AZ36QV2B70uo4HoGqy9RJTfb8sG3cf4=;
	b=Q78DoUHY+WkUSW8zB2m9ybPt21Imq6wGlv4hzeuDVIUkk+Ci6Vj7DPgZb54BVoIHst
	wyqC6oummdfGd98HLpKoxjzETN1HHtJQcf04rKg1Wu9OaYdXaPceXYWqO3R3xBqK3ub6
	bEuQfgEZS8jIJEukpqCU4tqu8jyX4kFjbqASeslqzX6riwQhnUIGC39/GcxeyJn5eQ22
	I7I0GsRcIZ16wtgybMkfnIX4/uDgoUs5cjxN3U0fpgFCH2cPWsWF8TNRvZJAkcElWhwF
	ZTA4z4kdme7RYZ32Y6vrY0b/VK9gKtbUHXXmuZqeysxOinuDR5X6id+XytHq6AZvL3Em
	4alg==
X-Received: by 10.66.165.39 with SMTP id yv7mr19793253pab.108.1447371583638;
	Thu, 12 Nov 2015 15:39:43 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:42 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:14 -0700
Message-Id: <43b8347f1399c0252d752579a09e4f4c5343b490.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 03/11] qemu.bbclass: fix vardeps of QEMU_OPTIONS
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

The variable name for QEMU_EXTRAOPTIONS is constructed programmatically, so we
need an explicit variable dependency, otherwise changes to it won't cause e.g.
qemuwrapper-cross to be rebuilt.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/qemu.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 064b57e..315c17f 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -39,6 +39,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # PACKAGE_ARCH, not overrides and hence have to do this dance. Simply being arch 
 # specific isn't good enough.
 QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 QEMU_EXTRAOPTIONS_iwmmxt    = " -cpu pxa270-c5"
 QEMU_EXTRAOPTIONS_armv6     = " -cpu arm1136"
 QEMU_EXTRAOPTIONS_armv7a    = " -cpu cortex-a8"
-- 
2.2.1


