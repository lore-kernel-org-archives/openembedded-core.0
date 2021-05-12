Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: w6hTiTZrPA7dREh/8XRChRv0opbM4tJ/IIHBh436n1mYUA0ulvRG+N3yWnOQFXNht2MTYmM29N
 l+0Cvucxi+7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917815"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917815"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:17 -0700
IronPort-SDR: whfh9poTpSdj2mu38s/7VpzfgKuu+IZP+f4yz3DENWIlwlIEGumrhl9AuyNGfZiN4wGFuiPOXp
 jlwXvYmFTdBw==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645815"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/15] grub2.inc: remove '-O2' from CFLAGS
Date: Wed, 12 May 2021 16:35:43 +0800
Message-Id: <7520bd4f72d550052774042c542a3d3ee874b363.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It fails to boot grub after upgrade grub to 2.06. According to
description in

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14367

it is introduced by a commit to fix CVE. So remove option '-O2' from
CFLAGS rather than revert the commit to avoid the failure.

[YOCTO #14367]

CC: Tony Battersby <tonyb@cybernetics.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69805629b8f47fd46a37b7c5cc435982e2ac3d1d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 590deb8d92..6de683ee1c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -49,6 +49,8 @@ GRUBPLATFORM ??= "pc"
 
 inherit autotools gettext texinfo pkgconfig
 
+CFLAGS_remove = "-O2"
+
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \
                 --program-prefix="" \
-- 
2.31.1

