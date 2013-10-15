Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E73A06CBA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:55:23 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so6197556wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=x8IYZIIgbgGVT+Cg+KyijmHYDSEoMrp65YuufiiIO3Q=;
	b=BE4jGZsepczTkAhNNbMoOUyopLsn+jQLe160lrFhaQKHYJnfftwO70a2v9ikfh9One
	eSRZsKLIp2W3Kd7hAYaNrkrVUU/oCeCexrMojq6gcZPT/63v0xl+RMlQxt3XyOjIz5fs
	udC0/TNuAnZgQP20++tdeZAdNr2YGMZ08Hd5e0GMI8Ljh7J3kX6dIpD7uYcPvTWp8D71
	56WW9VBnYJB/M0h123D5HfFaIkBX3KaGyVWAVThii73W5AchSmnlEMH5QmXYZetWd04K
	XWyQIYQ4NlQgLZ/kFwQpxJ9FpX7nq2YodRO4cqxhbeTjy5t3kOAYrEMmB2tVxgefo7wF
	hXDA==
X-Gm-Message-State: ALoCoQl65AR4mmsX6BoVbWzKDnFWM4Sjo5UR1kTtYFFmcrMQGlKZo5618iv8eYhxYyYtBl01JmfT
X-Received: by 10.194.239.40 with SMTP id vp8mr2279812wjc.45.1381845324972;
	Tue, 15 Oct 2013 06:55:24 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id e5sm273493wiy.2.2013.10.15.06.55.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Oct 2013 06:55:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:55:18 +0200
Message-Id: <1381845318-11254-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] openssl: switch ARM builds from linux-elf-arm to linux-armv4 config
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
X-List-Received-Date: Tue, 15 Oct 2013 13:55:24 -0000

This enables aes and sha1 assembly at buildtime. Openssl does a
runtime check to see which portion gets enabled.

'./Configure TABLE' gives the following:

*** linux-elf-arm
$cc           =
$cflags       = -DL_ENDIAN      -DTERMIO  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
$unistd       =
$thread_cflag = -D_REENTRANT
$sys_id       =
$lflags       = -ldl
$bn_ops       = BN_LLONG DES_RISC1
$cpuid_obj    =
$bn_obj       =
$des_obj      =
$aes_obj      =
$bf_obj       =
$md5_obj      =
$sha1_obj     =
$cast_obj     =
$rc4_obj      =
$rmd160_obj   =
$rc5_obj      =
$wp_obj       =
$cmll_obj     =
$modes_obj    =
$engines_obj  =
$perlasm_scheme = void
$dso_scheme   = dlfcn
$shared_target= linux-shared
$shared_cflag = -fPIC
$shared_ldflag =
$shared_extension = .so.$(SHLIB_MAJOR).$(SHLIB_MINOR)
$ranlib       =
$arflags      =
$multilib     =

*** linux-armv4
$cc           = gcc
$cflags       = -DTERMIO -O3 -Wall
$unistd       =
$thread_cflag = -D_REENTRANT
$sys_id       =
$lflags       = -ldl
$bn_ops       = BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR
$cpuid_obj    = armcap.o armv4cpuid.o
$bn_obj       = bn_asm.o armv4-mont.o armv4-gf2m.o
$des_obj      =
$aes_obj      = aes_cbc.o aes-armv4.o bsaes-armv7.o
$bf_obj       =
$md5_obj      =
$sha1_obj     = sha1-armv4-large.o sha256-armv4.o sha512-armv4.o
$cast_obj     =
$rc4_obj      =
$rmd160_obj   =
$rc5_obj      =
$wp_obj       =
$cmll_obj     =
$modes_obj    = ghash-armv4.o
$engines_obj  =
$perlasm_scheme = void
$dso_scheme   = dlfcn
$shared_target= linux-shared
$shared_cflag = -fPIC
$shared_ldflag =
$shared_extension = .so.$(SHLIB_MAJOR).$(SHLIB_MINOR)
$ranlib       =
$arflags      =
$multilib     =

Build tested on armv7a/angstrom and armv8/distroless

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 78ff7ae..8fb7fc6 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -61,7 +61,7 @@ do_configure () {
 	target="$os-${HOST_ARCH}"
 	case $target in
 	linux-arm)
-		target=linux-elf-arm
+		target=linux-armv4
 		;;
 	linux-armeb)
 		target=linux-elf-armeb
-- 
1.8.3.1


