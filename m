Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id CC52D731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 05:10:49 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id is5so135101398obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 21:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6U3GQFfOJueesUJ2koUshMESHgV7amWD/755UY8r8wE=;
	b=YSS5gjWlYFgvyy9GBH24dVKaQMIcuYbOZh2YsUrjRDbdpng7X5r088NrHPu7ZYMQor
	zBdxYoWH/0vVuRLu554tj/uIjDA4Ji4gsY+hoI1yMUbJbyUqNwVuXpMD0F0b7SvHl8Aa
	vDAoFpwxp7fBLUz0sjxIAECqUD25EPT37iWcOsXuq8ZyAEbXdHVVZx3PAPiyehU2OUyR
	pTb1MFrRcFR+ar7uVivGNwBacCZKWs05Pf7SVmF2H/obuB/TCvgoKkINXpj/ifES7qII
	oUAdOOmy7CC61ahKFUo6mLZJ3Y7Bmy/FsiY2joGpr5dEV7Nno9IgzYb49pYWXSKRVW+N
	nvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6U3GQFfOJueesUJ2koUshMESHgV7amWD/755UY8r8wE=;
	b=fnhLed771UwFXgqVU+fVej5VRvJzKj/d+/hdbDeatEs42aaMbVtMhP1TrTR7iWuc7z
	FTKGI8hJIjxoeOom3aNmBmkKGrBRRFEOicVXA51Cy4mwWFuuB4RoK3GCQ5irNZuSgz0k
	DMm/kwEQBbOiauN4EeU2CeV8hCZUn3KKoEdY23k0tIMwCNw0mHskR27TYZI9e6HeW6w4
	BvPXEh1fPg5nbEY2/a0bQ6HUuDDct5WXAOKtItRZ8fg/wWOR62dml3fNY3BLoluSE4Uo
	DvSA1ib1kg79c5qcplERUa9VtTGyWOn/o5RstGNriq+OeHX0PXV4U8bFIO9pUsIw79zN
	jVag==
X-Gm-Message-State: AG10YOThe0HSXbaRIG0g9e24VfN7nyThLDNSMic16tqycs+SScMYFIdLpy5CAw8ku5P7Ow==
X-Received: by 10.182.254.34 with SMTP id af2mr17101529obd.60.1453785049135;
	Mon, 25 Jan 2016 21:10:49 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	m131sm12171963oif.18.2016.01.25.21.10.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 21:10:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 21:10:46 -0800
Message-Id: <1453785046-9017-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [RFC][PATCH] gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
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
X-List-Received-Date: Tue, 26 Jan 2016 05:10:49 -0000

Experimental hack, not expected to be merged.

Without this, the http://www.cplusplus.com/reference/string/string/append/
example fails to build with -std=c++11 and it's not clear why (it's as if we
build a version of libstdc++ which supports only the old ABI but with headers
which try to use the new ABI when compiled with -std=c++11 ?). As a workaround,
force libstdc++ to provide, and default to using, the old ABI in all cases.

See also:

  https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
  https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
  https://wiki.debian.org/GCC5

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index f20d298..3a476cd 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -10,6 +10,19 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
+# gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
+# Experimental hack. Without this, the http://www.cplusplus.com/reference/string/string/append/
+# example fails to build with -std=c++11 and it's not clear why (it's as if we
+# build a version of libstdc++ which supports only the old ABI but with headers
+# which try to use the new ABI when compiled with -std=c++11 ?). As a workaround,
+# force libstdc++ to provide, and default to using, the old ABI in all cases.
+# See also:
+# https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
+# https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
+# https://wiki.debian.org/GCC5
+#
+EXTRA_OECONF_append = " --disable-libstdcxx-dual-abi --with-default-libstdcxx-abi=gcc4-compatible"
+
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
-- 
1.9.1


