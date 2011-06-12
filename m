Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCU-0001kw-3z
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:23:02 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so2424185pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=VrZcciwItvTFmhWilEiqnfZNoaov5BDGrYgp1+oNuyo=;
	b=Fzw5u0gCMvtCfq4G6v4STsrzIs5MDkIulB5fmZjNKx38QI7jsCff5KW+08ZzpMpx7u
	YBuI07qrYpBBdF9HpnuipqPeY5DF9P/MM88YNrdA5uQ9HaYW7R1kh4ckd6qc8yOIvXxL
	LKHwLP1lgWd0SAi3eONIqAiZBHYGX0e+cvB4A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TVlt5QiPdwCykWGAN4QJyVWfC/z5tIPNxI9cb+nPEnCjmhPGsvIBV30vgiPQqQ838o
	x85FIDvA8tyO7BgwkFrnkwjFnKQX8b2ispoJIytjLpFxo/dFQ0oCS7jIX+17T0obX3V/
	/Uo2oYOr54h5CBLyhFHQB8WKbKbsyJ4FRgqHg=
Received: by 10.68.38.98 with SMTP id f2mr1422445pbk.462.1307852381481;
	Sat, 11 Jun 2011 21:19:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm3579520pbb.18.2011.06.11.21.19.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:07 -0700
Message-Id: <6414e9fcad22331e4e51e46c64c0f27a8d645372.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
References: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
In-Reply-To: <cover.1307852182.git.raj.khem@gmail.com>
References: <cover.1307852182.git.raj.khem@gmail.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [PATCH 6/6] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Sun, 12 Jun 2011 04:23:02 -0000

From: Phil Blundell <pb@pbcl.net>

There is no good reason for uclibc to be machine specific.  Remove local
assignment to PACKAGE_ARCH so that it gets the default target
architecture and bump PR for that change.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003064.html

Signed-off-by: Phil Blundell <philb@gnu.org>
Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_git.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 6c88513..78ef4f2 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -2,11 +2,9 @@ SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
 
 require uclibc.inc
 PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
-#recent versions uclibc require real kernel headers
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-- 
1.7.4.1



