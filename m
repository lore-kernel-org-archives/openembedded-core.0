Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B66AE7FACA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:22:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so19133124wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+WBdAtMaTGMryk4osfL4HqBTCJ74uYiuLKpUXblHBbE=;
	b=Opu7U41vB0IqCBQS+AOqGXZn4lu2ykqifih1NpcKVqiD+IIEVlKfuDb38lgSeHR1G3
	1/P9xhIMd4GToxj5pcfZ8WWmW38KGq9kusKQPmcx8Kjzx9xTi4U3b5wRPLwnv1BmT8vm
	qncVTTxW9fPjXwDg1JLyPFR57YpQS+tmZJwe9sluYgTEIQDax7mH/vXoA+Hdd7c8V9Wk
	HAkDsHNFl8DUsEals5sLuMpaHPxHDHErwIPVOqwAfnpAjmB90EyMMCBUnZ7pKWBlMKA2
	RQ1SJ+ALvc73u2/XUPsXn+Z16U+Iy2f0uWpQaTMn9BEhAH4iiu1HY4bKy7bEkgxoVxxp
	EDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+WBdAtMaTGMryk4osfL4HqBTCJ74uYiuLKpUXblHBbE=;
	b=lwfjQLio4G2K9kU2lw6stnyF+tqH93UQ93gzASRcwxdeJYZD6L5FcFD5Vu+zvtOLJY
	kfrnRnOWWcaUjdyaRkman83UFQYCfkeLyH84Nz2kjE8qNH5QcAufCDZ/JwD+Tid/yzXn
	hstrsrU8ThrDWFB4PcY8Fxk1WSo69QsvgJ6Cm7U5o85hlJsgDzqw+cm09Dl4fsp+R769
	uT2/0BXy4Dj0OTvFvEzkJUt79pBEE0kImAPm/KrmxfwZc3j+GJUxhY/iXs3nGlSGaurj
	CTjsYRQYssFJ4NmhtUxz7cRNZ+I3YIPLP6PTxew2j1mqQn3tcannJRWIRC5A4+ssDOYw
	uFtg==
X-Gm-Message-State: APjAAAWgZBv3NGkOH8+f7JYO2v4ufQwvyU5/RjL00Ij2E5zW5HJj1QO7
	cz+NTPIjtt0VKOFoxxdSJT6yIqAt
X-Google-Smtp-Source: APXvYqxUKNePJeaSiuxCviXnLUAiLc4Gu8M7uiWN3z309L8pYjwQtNDUZfMPrafsg77J4Z0uzo8jqQ==
X-Received: by 2002:adf:d842:: with SMTP id k2mr32840625wrl.163.1574702550303; 
	Mon, 25 Nov 2019 09:22:30 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f140sm9693357wme.21.2019.11.25.09.22.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 09:22:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 18:22:21 +0100
Message-Id: <20191125172224.82269-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125172224.82269-1-alex.kanavin@gmail.com>
References: <20191125172224.82269-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] python-native: don't cause a full regeneration of the built sources
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
X-List-Received-Date: Mon, 25 Nov 2019 17:22:30 -0000

From: Ross Burton <ross.burton@intel.com>

When cross-compiling Python 2 you need a native pgen binary, but the cross
recipe can't do this on it's own so we build it in python-native and install it.

The rule to build pgen was also causing a complete rebuild of all of the
generated sources, which meant that building Python 2 needs a *host* Python 2.

This can be fixed by simply building pgen, as this is all we need to install.

[ YOCTO #13645 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.17.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.17.bb b/meta/recipes-devtools/python/python-native_2.7.17.bb
index 936810d9806..98805d998d5 100644
--- a/meta/recipes-devtools/python/python-native_2.7.17.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.17.bb
@@ -35,10 +35,9 @@ do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
-# Regenerate all of the generated files
-# This ensures that pgen and friends get created during the compile phase
-do_compile_prepend() {
-    oe_runmake regen-all
+# Cross-compiling Python needs a native pgen, build it here for use later.
+do_compile_append() {
+	oe_runmake Parser/pgen
 }
 
 do_install() {
-- 
2.17.1


