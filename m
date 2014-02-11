Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 407236E927
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:33:07 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id up15so7123663pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mX636KQ6dmREFZnQoOzsTL6VZZ8PFXrylpTsYR0TUn4=;
	b=wZdeKT5chH50YAcNO3mjTehRh97vpQ5FdwRrEDtBEXQFKkLylCoQ1fOdUKvgkc5wcY
	9wNwYlOBJ3iHdqCoHNnQy/1iYmo+D8cty3SggMZ0a/GMQfWcuM8Mf75vOczw1zVVMBlu
	OV7ccecfI5mkGcMLkWeKKQrETH6vNm156eVCWVYzJRwGL9lsJm4He/OKrA+FlEG9+QX7
	FtnkCAAWUm9+NyBr/uugku11v0ra69NwO50uHfwTGcP3GdQ26eoHRcnMxlTsqvMeTs6X
	0vmwlEFniS014//aEZakXunsBr/YYcsYjq5+pK+QqWSm8ofiigtQkB2VxwupCukv7ZFK
	gjAQ==
X-Received: by 10.66.25.101 with SMTP id b5mr29829380pag.101.1392089588471;
	Mon, 10 Feb 2014 19:33:08 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nv7sm47591469pbc.31.2014.02.10.19.33.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 19:33:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2014 19:33:37 -0800
Message-Id: <5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <d26f2923a8f23a7fed4f22bdc6aaa178d39a5add.1392089446.git.raj.khem@gmail.com>
References: <d26f2923a8f23a7fed4f22bdc6aaa178d39a5add.1392089446.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392089446.git.raj.khem@gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 03:33:07 -0000

This enabled journald-gatewayd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_208.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index f94ce56..fe88a7a 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -58,6 +58,7 @@ DEPENDS += "libgcrypt"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
+PACKAGECONFIG[microhttpd] = "--enable-microhttpd,,libmicrohttpd"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
@@ -149,6 +150,7 @@ SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} += "--system systemd-journal-gateway"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-- 
1.7.10.4


