Return-Path: <mario.goulart@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id C070A601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 20:20:53 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id t59so1500903yho.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=uYhW3+dgPZggzv9bOSg7HDN/bEGzZGeZETttB3HHwOc=;
	b=z/b3iV74s89MdiWF0KiqzCJz7+F9YSxx6xJSQMg6c2JJF7Je7w6BP+SIl79jOKtYSr
	gAG5Jdx6vuMSwJ0e6oE3gRpJEcN2Kl4sgk6YhL7k6JVsivXyMXR//S1ek9EnxavPvVb0
	nnsubkZrFCTUFof8dZcpt41pKxmcr5vFNoywWJ4yGoql8Ns5IVNsvrDXy/Z8UQdlz1d2
	Nf+ef4uVNtRJRDs3FTDDbdP2PB/ZqhSSHLDSDK88FWE4NxBSICZZ3B8dSzswuPvs9Qxw
	32nNKTB/pZJHl3Pw754xQ6QI0FX+eJQZLjqGifq/yPvi/mMujOAxeVkknTY+V/K5++2T
	z8yQ==
X-Received: by 10.236.84.134 with SMTP id s6mr20827744yhe.38.1408047653991;
	Thu, 14 Aug 2014 13:20:53 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	m29sm12701355yhb.31.2014.08.14.13.20.52 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 14 Aug 2014 13:20:53 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 17:20:39 -0300
Message-Id: <1408047639-18852-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] libxml2: explicitly disable zlib for native builds
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
X-List-Received-Date: Thu, 14 Aug 2014 20:20:54 -0000

Without this change, meta-openembedded's php recipe (as of 45e62fb8 --
"php 5.4.14: use pkg-config for libxml2 detection") breaks with this
error on my system:

   tmp/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference
   to `gzopen64@ZLIB_1.2.3.3'

It seems that the host's zlib is leaking into libxml2's build.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/recipes-core/libxml/libxml2.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 9aa640b..2992a76 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -39,8 +39,8 @@ do_configure_prepend_class-nativesdk () {
 }
 
 EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --without-zlib"
+EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --without-zlib"
 EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-docbook --with-c14n --without-lzma"
 
 # required for pythong binding
-- 
1.7.10.4


