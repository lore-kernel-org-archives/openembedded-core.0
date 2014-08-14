Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 07D3065D5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 05:02:01 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so935831pab.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KS8O44PouYVmKYnDZjgkNxLoazAZMZVnYPGqO+UngMc=;
	b=z4CpwjOm4+ie+hNTgTsO1C/reW9i5Eo/c2b0DHK13KDlV9WBIkYsPcwayW1LBuzNbU
	LR7b07lSqjhyjJZl3DkntXhmNsKKbEt1QUQnmMUyNEQ0PHDzZCtcSE4o49b6CoawE8y2
	VtFQcfwZ4EvOT0C/TfhscX86Zun7VtCmwWGv+PKuzT2Xqgf4ly9q/0r5KpRgaMRYeWMe
	+F9tF+QY8fIjMw/GNr1OYpltqGr2WA+4ZBBZdI+qbII6ZmK5N7OvvAzfDto48ZRx/sAv
	G1qeqXu5wpCj3EvaGtmSTMZtZpu34vVadMGtRzmmaw9h/nW5b3Mn6NLOXVceQREPLlAM
	awuQ==
X-Received: by 10.68.69.69 with SMTP id c5mr200348pbu.155.1407992522641;
	Wed, 13 Aug 2014 22:02:02 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id u1sm5773604pdm.82.2014.08.13.22.02.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 22:02:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 22:05:15 -0700
Message-Id: <276a924664f8404d4e360e6af0ecb29d4d7403ab.1407992030.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1407992030.git.raj.khem@gmail.com>
References: <cover.1407992030.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] gcc-cross-initial: Use good old bfd linker by default
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
X-List-Received-Date: Thu, 14 Aug 2014 05:02:04 -0000

We already indicate our intentions to use ld.bfd by
specifying it in configure using --with-ld which works
ok unless here where we manually create symlinks to
binutils-cross components, when we use ld-is-gold feature
default ld points to gold and this symlinking has to be
aware of the fact that we configured binutils and gcc-cross to use
gold as default ld but gcc-cross-initial uses BFD ld

This would be visible when using gold and rebuilding
eglibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 5a6da8b..23a6d4b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -57,7 +57,9 @@ do_install () {
 	# found. These need to be relative paths so they work in different locations.
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+	useld=${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '.bfd', '', d)}
+	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld${useld} ${dest}ld
+	for t in ar as nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
 	done
 	# fixed limits.h infact includes the so called real limits.h
-- 
1.7.10.4


