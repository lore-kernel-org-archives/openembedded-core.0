Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888BFC2BA1B
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:13:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.15931.1741875218345223851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWujVuAF;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6421425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741875216; x=1742480016; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwkH+akqEM/sl7hthMHgdzFvfW9jjqRRcMUORZZW/0c=;
        b=eWujVuAFNKyKYQlbTEJC6fSXi+AEMWOvuUbPBWkFXF1BzxmCMq75PXuoHMfSeh49po
         98+ae+pIkARWoZEYkwSNbTnDoeXBaVhBKb6IO+uxwmYr1KweXACiYAYNz0CoB5da6e21
         Xou4oNp8S219SI3fLDULHNfr3ygCkWm/i1qWfkU1UgYcfMjCfgDv/s+4UQ5Gp1V2ylhd
         mdy8+S1lUcq1/dr1oFnh6MlGTID4QXdpvgZr9oyzNzK16TXiLcXfh82f36zWzXm6PH+6
         dhriKwN2Sej6ftVMTzmQoiKWcnwEShgfRv2bLpn+UT7fabGqHbpkhARUFRPMeKWZU1ZQ
         fXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875216; x=1742480016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwkH+akqEM/sl7hthMHgdzFvfW9jjqRRcMUORZZW/0c=;
        b=qMtXI8NICg51aIzxN/C0S2vGq6VY83R0aN0ht4TxXX2spjNIT26pcFm58f730MBU0j
         3E6WdgIuBzZchnZ/Z+Ts19cfqlf/GZE2VhZCsTe8Ln4BjxHmVu+TKm4a8ngjlvCkLPM5
         JmouQy1Mph6Gig2+iW/f371ibKl2Qx0rgwIbZOsoGqo+rAMrcOR6vGdCvSPO5UADGFC0
         OJMhd+Os3BuW9bMy7V/lYjDia9Wmq1Qpj9Rd+ygHUNPa1k5g5+/suuIfsWUHyfQw0GFV
         p+sW43BoGuXVXZKtD16YettzzmAZ4ynVK4mvDC0LSOY7XEK1Ho/RNw7GX/Px+bPUzPkP
         Hm+A==
X-Gm-Message-State: AOJu0Yx/7VbIETZ1/5qK9hcdzLpCICsQm3WunBqNEqoanz+jXzqFvzIg
	4KTzQfNmP2+666vK2bMRa6VIGc+7XBgSWa4aeUXPMUjzWsMRH3SHY6+Z1oUm
X-Gm-Gg: ASbGncviLrgiXsLxG0iVoAOKtHDX2vgg0qOoji8wroRgCO6Bdd1AABahfwdHy39hEvs
	92VOPOA79hxOQeMjAlhVhoQFSMS1dhXPGogmfO33LBl4ewqz/BdHCYwynCh5vwQdn/GHvyWGc0P
	akB3z3b7h+EDfqL9PHspmemsK0ds00Nx34lg0TTJlMV0BZPIrDXH7vjman2ZeslOyySROI7QKxs
	33Kxlbr3TOb6wrzK2s6om8gzZNWktmlnLWm1f7mdTWSHo74Cwb6s0EAQzAuniyURwb66sZ86Jf2
	q4ZIRSL42GXdFYo2u1NB3gSwWKYPQB0j97GzlIT/Su3kdW9yZ5ug1UGJEP6DHr9pGZfbX0gDjJU
	Cn3y+BiTMxxY=
X-Google-Smtp-Source: AGHT+IHT9YHjoY/RhmjZlxqFhjmjVVyM7RGaKdqEZM8ZwxfAKzkXaZ1MMm1g/IbMb83XicctGzPSyQ==
X-Received: by 2002:a05:600c:524f:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-43d01c25c31mr99908125e9.28.1741875216076;
        Thu, 13 Mar 2025 07:13:36 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c613sm21845565e9.40.2025.03.13.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:13:35 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 14:13:21 +0000
Subject: [PATCH OE-Core v3 1/4] scdoc: Import from meta-wayland
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-kmod-v3-1-a8b5d73c83a5@gmail.com>
References: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
In-Reply-To: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212772

scdoc is a simple man page generator for POSIX systems written in C99.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../0001-Makefile-dont-add-static-to-LDFLAGS.patch | 27 ++++++++++++++++++++++
 meta/recipes-extended/scdoc/scdoc_git.bb           | 25 ++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5515d46ca5b1aad22c46665c78e4707bc22e3a0a..2b47d3103c03b1b8a11f40566fdd5334d906860d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -761,6 +761,7 @@ RECIPE_MAINTAINER:pn-sassc = "Simone Weiß <simone.p.weiss@posteo.com>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-scdoc = "Alex Kiernan <alex.kiernan@gmail.com>"
 RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-seatd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
new file mode 100644
index 0000000000000000000000000000000000000000..b520e949c0b31c0908118cba4f6c2b6ea26f5a26
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
@@ -0,0 +1,27 @@
+From 2cac433806d9622dbc005fe5738f1ae8c33a98cb Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 13 Jul 2023 19:26:40 +0200
+Subject: [PATCH] Makefile: dont add -static to LDFLAGS
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 60a80b8..49021fa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,6 @@
+ VERSION=1.11.2
+ CFLAGS?=-g
+ MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
+-LDFLAGS+=-static
+ INCLUDE+=-Iinclude
+ PREFIX?=/usr/local
+ BINDIR?=$(PREFIX)/bin
+-- 
+2.39.3
+
diff --git a/meta/recipes-extended/scdoc/scdoc_git.bb b/meta/recipes-extended/scdoc/scdoc_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..224e5417342e9db820456ec54476a1e3cac0e4e4
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "scdoc is a simple man page generator for POSIX systems written in C99."
+HOMEPAGE = "https://github.com/ddevault/scdoc"
+BUGTRACKER = "https://github.com/ddevault/scdoc/issues"
+SECTION = "base/doc"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
+
+SRC_URI = " \
+	git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
+	file://0001-Makefile-dont-add-static-to-LDFLAGS.patch \
+"
+
+DEPENDS = "scdoc-native"
+
+S = "${WORKDIR}/git"
+PV = "1.11.2"
+SRCREV = "afeda241f3f9b2c27e461f32d9c2a704ab82ef61"
+
+EXTRA_OEMAKE:class-native = "PREFIX=${prefix}"
+EXTRA_OEMAKE:class-target = "PREFIX=${prefix} HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+
+inherit autotools-brokensep
+	
+BBCLASSEXTEND = "native"
+

-- 
2.25.1


