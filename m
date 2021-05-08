Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3815.1620459684473632253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 00:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1487fLHt012790
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 May 2021 00:41:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 8 May 2021 00:41:20 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Sat, 8 May 2021 00:41:19 -0700
From: "kai" <kai.kang@windriver.com>
To: <tonyb@cybernetics.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] grub2.inc: remove '-O2' from CFLAGS
Date: Sat, 8 May 2021 15:41:14 +0800
Message-ID: <20210508074114.1064-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210508074114.1064-1-kai.kang@windriver.com>
References: <20210508074114.1064-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to boot grub after upgrade grub to 2.06. According to
description in

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14367

it is introduced by a commit to fix CVE. So remove option '-O2' from
CFLAGS rather than revert the commit to avoid the failure.

[YOCTO #14367]

CC: Tony Battersby <tonyb@cybernetics.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
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
2.17.1

