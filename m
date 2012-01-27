Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUY-0005Wb-MB
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:38 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kW4rRe8iaPbW6+49anKtC2gqrRVedKl1DYHMgTECiP4=;
	b=rSUxvYm92l6ML1e8IohrFZnPCKwv/Gh5Wbh2COVovcZzt7XG5Q1ahvaraAkFsu44bt
	AiZ6hvxBDTjE30QxKPhPYMYI0o/b1aHxSF2jnvjGJCl+SPytP7hAT1M8/kl50QblHIeg
	W36NfhYf1rSjaI3ZO7fzeKPIpcxSXLwwjN5gg=
Received: by 10.101.5.16 with SMTP id h16mr3577825ani.48.1327684431615;
	Fri, 27 Jan 2012 09:13:51 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:51 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:41 -0600
Message-Id: <a36fa8d970d1a2eceb16774604e5b5b7aff0b2cb.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 03/10] binutils: fixes for build with an external csl toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 17:21:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/binutils/binutils.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 6130ab4..e343242 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -51,6 +51,7 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --enable-install-libbfd \
                 --enable-shared \
+                --disable-werror \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
 EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
@@ -113,11 +114,11 @@ do_install () {
 	cd ${D}${bindir}
 
 	# Symlinks for ease of running these on the native target
-	for p in ${TARGET_SYS}-* ; do
+	for p in ${TARGET_PREFIX}* ; do
 		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
 	done
 
-	rm ${D}${bindir}/ar ${D}${bindir}/strings
+	rm -f ${D}${bindir}/ar ${D}${bindir}/strings
 
 	oe_multilib_header bfd.h
 }
-- 
1.7.8.rc4



