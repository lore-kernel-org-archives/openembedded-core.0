Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFD4E73178
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:54:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r201so4005878wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XvPmJ03dPM17durxoxpiQlyOzLzVEqaTB4pO9FNA9sg=;
	b=Lhniv9UvisMf875Y/+KRaA8PGkWC2J8BxcZZflgq8fpI2nX8F7ZpwnGeOsw+HOmusf
	edpM+6TLPleTYBFDxGLXC75WZfQ5Nc2ekX35K4M/7NLnW3+FlJ5NAHRdEoPoz6WuIQfv
	Mqjzgn/eqhbjMk+TMDtlRPau3MaN1uUmJ/mBvhTIlYdArEK+3Fh7E+kiZwcV9vc4zur6
	bkL/hX+1+4PK5o/9c9eT2u6FJwdBc56Q8jx212S3RucWJhPk5bgCQb5SZaASv70xdytE
	EfHUi2m25FTnBBxGuO7vFLA0NUA6r5bbOh8dIAXtVPzN1cIh4YLLM27U8BGlFhf7g1ja
	K7Ug==
X-Gm-Message-State: ALyK8tIyfof7eZqaqbc8Nf2lckB3BctjjUtcRdWqEGJXOgVmTmi5yZbQo7EDC0EqYPCq9w==
X-Received: by 10.28.20.139 with SMTP id 133mr5132645wmu.35.1466765677938;
	Fri, 24 Jun 2016 03:54:37 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id b4sm4588563wjd.16.2016.06.24.03.54.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:54:37 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:54:31 +0100
Message-Id: <1466765671-22371-4-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765671-22371-1-git-send-email-git@andred.net>
References: <1466765671-22371-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/4] uclibc: really enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 10:54:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Things must have changed at some point in the past. V=2 doesn't
give us verbose make output anymore. On the other hand,
adding V=1 to EXTRA_OEMAKE works fine, similar to how things
are done in other recipes that use kbuild.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 71d4bdd..57f87fa 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -52,13 +52,11 @@ EXTRA_OEMAKE = "${OEMAKE_NO_CC} \
                 'HOSTCC=${BUILD_CC}' \
                 'HOST_CFLAGS=${BUILD_CFLAGS}' \
                 'CC=${CC}' \
-                ARCH=${UCLIBC_ARCH}"
+                ARCH=${UCLIBC_ARCH} \
+                V=1"
 
 EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
 
-# enable verbose output:
-export V="2"
-
 # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
-- 
2.8.1


