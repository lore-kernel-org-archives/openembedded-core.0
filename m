Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE6971997
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 23:28:08 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c206so110721720wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2cYNu0f0Y77CIroJXQNjJgl1PwrM6acgd7J0DGe114I=;
	b=n1dM1Q/TOh8BiV758p0lG/034pDs581S2zYHn3TMgQrbNjiaoqe7ByNiCWGm4ZmCNE
	ZRZ7ZFx3bOKAM8FkTHWxkCc0BjeQGj0sod8qJiOq0yJcb+l30hbOC6Yvf+2v5YHHqZQo
	1TL9ieV3sPuE+ey4Y+b+Bbr+efZeSTxhdzvqjAoM9EpPRsLFt8u4vB2n31CKNuazxwbx
	IpxmyVbReBZLbcjFHd/3NWdLhWtAAsmpRPyB5YCwhPsdbRvlh/OOL7w9e3UK2QQwvMUI
	y3vPIwNwILogk57PW7EO+6bclK3uZOfCx4q2vNrF4+O5SaJ17f0OqcigA6JiJlMYNZf8
	B1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2cYNu0f0Y77CIroJXQNjJgl1PwrM6acgd7J0DGe114I=;
	b=svrHeP1Ene3jQd3k+jv/3gjMGRA8z+Z8DL+klrtwMhoMmi0/TNJY7t/aThd5nLMqWZ
	uP09uXlmOJgXLjy803c/N2z26SeAKksExBAFDf1ry/7osdxAdV/4mWA+58LElYjJ3J5J
	CeT+onSoo8MeZngXwqbG4uPEGpYi97LTy3CdYq8JJxjG3JEnTiVEfyyZsDf9G9jH9OtR
	/UNAuOvQcQ/V9W7CNxwD6K1mgYzYuefagFa9d55l9mZIub0cmd3de5hMA0KpwWBxdr2f
	b8ZO5NuNZQ9uHatVhJL81zKPXhlmrmen07SN9J1sNI15OSrMdyn1ARzqsSUyYdT3h3Mn
	cUBQ==
X-Gm-Message-State: AIkVDXKvXANrL6nIVu+N19hBZ6o3rDo24ugIzxe9Rp2DVvKY/s95RrBUKacToeDdxw04rKP6
X-Received: by 10.223.139.213 with SMTP id w21mr4871569wra.108.1485473287700; 
	Thu, 26 Jan 2017 15:28:07 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e74sm896175wmd.2.2017.01.26.15.28.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 15:28:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 23:28:05 +0000
Message-Id: <1485473285-2479-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] default-distrovars: add acl to DISTRO_FEATURES
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
X-List-Received-Date: Thu, 26 Jan 2017 23:28:08 -0000

ACLs are pretty useful in the modern world, with security systems such as
SELinux and Smack that use them extensively.  As the overhead is minimal, add
ACL to DEFAULT_DISTRO_FEATURES so that support for them is enabled by default.

The overhead for core-image-sato is that coreutils, libarchive, and opkg link
against libacl. The size increase of those packages is minimal, and libacl is
35kb.

[ YOCTO #8200 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f7ed943..08542a7 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -9,7 +9,7 @@ ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 
-DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
-- 
2.8.1


