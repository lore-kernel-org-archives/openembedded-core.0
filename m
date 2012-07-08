Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFl-0001HK-0m
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:33 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cU45p5mT2hN32A8PPzrgLQ2qL/d9c+nCY1EWH2ragNU=;
	b=D/rj1kygXOgPyNYEPWSJajOhY8erEGoi+IfacGp5NU3g1tJdSuzvuab5n/llAA8txh
	2ayx9KHXohUt8wNMQ/ozIFuK0fUSC5Xo5Smf+2O2LVM7gOb7E3ilfuOIVxNuj17rW9Ye
	AFEjtv+N5Mijf5ZB6ItfzpTPGYPoMpCT59NHLu6QvH5mRyK4UE4PflB7jnhd5Yr7gylK
	6VF5p6bca/RmXocdQHiel+63qg9iioWoRKfbvNgS6YeSJdAmjn9KakFU+/Ig0/IeIIvA
	hucv6MIb4V2zsBgNv95g8cMcqCKnme5qM+mWWELpgLClNT+86y5ymavXG3Hwg3WswRai
	2VBQ==
Received: by 10.66.87.136 with SMTP id ay8mr59564911pab.25.1341763886665;
	Sun, 08 Jul 2012 09:11:26 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:32 -0700
Message-Id: <13db716c4a42462b95a8637dd8ef095af1afbdef.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 14/19] gcc-cross-initial.inc: Use BFD ld as default always
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
X-List-Received-Date: Sun, 08 Jul 2012 16:27:17 -0000

When using gold as default linker in final toolchain
gcc-cross-initial still needs to use BFD ld since it
will link eglibc-initial

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index faec391..10cb512 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -21,6 +21,7 @@ EXTRA_OECONF = "--with-newlib \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
 		${EXTRA_OECONF_INITIAL} \
+		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
 		${@get_gcc_fpu_setting(bb, d)}"
 
 do_compile () {
-- 
1.7.9.5



