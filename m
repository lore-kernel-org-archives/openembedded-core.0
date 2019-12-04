Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id DA6F77F7BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:25:18 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 2so375218pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eWev4vORW0sS40StCKcTW7QDL1mwCqF9hImccrdANws=;
	b=KvB/HwtpvGwLXX6ZSCnHoDDres6nw41ZPXh4eGcfZwU0abG3d7UeSETf3KHBjWL7+v
	uZIy0LhyWEKPt8I1Sq8sXpT1ezrKu++qtg9ezrGAF7qMY6qV1AH6JaJ5LT0z90EXFJmH
	f4rBqLAFv8Q6Jh1p7HF02oMWySa2xlcwCnrIDElsNGhnywtuC1w2SVNGZfXxpfKdJNhY
	MQ2xnAORuHHKoijvOzoce7t/ZTxJtuZ9UaT3s7fLCIZkz0MITVVMUXvo765G1jJeyDWs
	oA8rep2em4sH9Gv2ChUsLSlgpe95FGTyEQNnO6qfw9NfFvSgmcoCvmcSeNJkU8raOcKE
	6N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eWev4vORW0sS40StCKcTW7QDL1mwCqF9hImccrdANws=;
	b=Lh6EaJIXE56MIUF2Q+7M4JD4Pou6hpLResbysBZIlkdQWUKjf9lRgzg7gYDL7Lyxo4
	zyKcbiNIeDt1IutN/rRrSqFgjrZ+ARCtIEgl8YPkvdiR62ishPvE7c/I7wOem7ROLN/m
	48nP4dXXvHrvmWsRuV6fYAtSFGNo6iSQKX3oKyjK5NCFgUXg3+9GCuISaVjv4xVhpi3Y
	jc3J9vdrPBp6Zzy5Uc0vRMuArS30T2gOnWZshkJ4x2K7PVzVUl7+h+/7bthMBGEI9s9z
	KaMtt2/DccQz7PZKtD1JgJ3VoA1O7/XQUokkkkzwSZ8JvNUsM9h4I7pwTadq+biFCUhS
	jMRw==
X-Gm-Message-State: APjAAAV+zf5NOVlaoUr2aAUvlxzanQetkBGhw3vhlpqWXq0ONZfBpnvT
	MaH/vkNxakCySZ8jLmofjbd5EpPQbGY=
X-Google-Smtp-Source: APXvYqxbYbf1sj1kIKXQ3CYrTLBOCHSAbNSI+KuzGTkmPGfFNuV2V0j3IzG+no8usaz1l1PO6q8qGw==
X-Received: by 2002:a63:fd48:: with SMTP id m8mr5529214pgj.76.1575491119274;
	Wed, 04 Dec 2019 12:25:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id w11sm5097581pfn.4.2019.12.04.12.25.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 12:25:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 12:25:00 -0800
Message-Id: <20191204202500.234688-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH V2] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Wed, 04 Dec 2019 20:25:18 -0000
Content-Transfer-Encoding: 8bit

Use PCRE, this enables using posix extended Regexps on cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Turn it into packageconfig and enable it for native/nativesdk alone

 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1fa82363b1..8262217fc1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -106,6 +106,7 @@ EXTRA_OECONF_append_class-target = " --enable-setpriv"
 EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
 
+PACKAGECONFIG ?= "pcre2"
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 # inherit manpages requires this to be present, however util-linux does not have 
 # configuration options, and installs manpages always
@@ -117,6 +118,8 @@ PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_s
 PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+# PCRE support in hardlink
+PACKAGECONFIG[pcre2] = ",,libpcre2"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-- 
2.24.0


