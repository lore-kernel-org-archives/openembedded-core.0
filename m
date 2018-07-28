Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8DD78CB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 20:39:31 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j8-v6so2903387pff.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A11H0U3D4k3qw8kKxlybV61XY6OpgC9KcnzfyRDeGrg=;
	b=U+OGuKV6xU0PhEKLGBjTZDmP6Kww0bxuTP5078yzp8i/+R67IRPHNIlAhfGlTb+lnE
	Ek4f7ox5NHYDfOhULXMFaJFyJkp2DaJXNPxcJk9nJpOZb4ivfxtyQHj0w7Pew0vbfgUl
	6VP8ruI5LOiEwZXktz+FNMKhSm94ucXtHeQWYtvNRezMQ6tPcw7TdCKZ4cgFA6NwDwFO
	0imbjfRi8L/WEMCxHo/UJsy7tx7SIhGUEpRrLLS0kbP8xtV8MLR3wJr5Lop9pZQnrPm/
	iYsuEwBMhretUUT6OSWmRecQoep38f4eS0wjp8yaMG7VNlvavtbl2fUNa6xVnl9AwK4D
	Y1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A11H0U3D4k3qw8kKxlybV61XY6OpgC9KcnzfyRDeGrg=;
	b=ClX/fRrOHdBdBKPWr6sbg/q1u5wHD0TCfgaJ54fgDJY7c/kBUHxR1UDEFV/fmZ6+9N
	1TlR5fEqHvR/sHn/pIJDp18Wkwo/93tNSc6EszLq446MwXefUZiBldnfNsMe73K7LZ7N
	SwgVGjjVc0SY3sF/nG9BCIuBu8Dzte5TZywfQ6X/Wpcqmh5uWCbq+UXAOQ/KcEUjma6o
	HOxRS6Le25Wd5YRnZIfuzrWbEFix81tCoU1Sju7oeE5i4sGCBoqktXVJXYNbsD0jJo2H
	BcbmzlNGCMJxNjJRy5bxLWOiz5kBmDeytW+p2R1yUIETzHXPWkFzDR2Uc5E7VxXU4uQ6
	EACg==
X-Gm-Message-State: AOUpUlH4AQ8QGTQLi2+4CIx6ss6wrnaeoZ8EYAGEb1HokYL3T/P4mW/S
	cdMBm27hq29JLXiAiQ6ZNFtU9/M1
X-Google-Smtp-Source: AAOMgpfo/iKyqyZJHYf7Z/+8uSxSlPz4eUbyX7B/RTxFL5Hnofld4PASNaaZ4xoKRqkbHNKBs3w38Q==
X-Received: by 2002:a63:214f:: with SMTP id
	s15-v6mr10674777pgm.267.1532810372550; 
	Sat, 28 Jul 2018 13:39:32 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-111.dsl.dynamic.fusionbroadband.com. [173.228.90.111])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm8102393pgp.13.2018.07.28.13.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 13:39:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 13:39:20 -0700
Message-Id: <1532810363-23110-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
References: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/5] openssl_1.0: drop obsolete exporting of AS, EX_LIBS and DIRS
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
X-List-Received-Date: Sat, 28 Jul 2018 20:39:31 -0000

Previously (when EXTRA_OEMAKE contained -e) exporting these variables
over-rode default values in the top-level openssl Makefile. However,
since -e was removed from EXTRA_OEMAKE as part of:

  http://git.openembedded.org/openembedded-core/commit/?id=537a404cfbb811fcb526cdb5f2e059257de6ef13

exporting these variables does nothing. The comment from that commit
that only AR is affected by removing -e wasn't correct, but the
effects of letting the openssl Makefile also control AS, EX_LIBS and
DIRS seem to be either benign or beneficial.

Since without -e make ignores DIRS from the environment and always
runs for all subdirs (including "test"), adding "test" to DIRS and
calling "make depend" again from do_compile_ptest() can be dropped.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index ee1c1f7..c2d9264 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -72,9 +72,6 @@ PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryp
 # vulnerability
 EXTRA_OECONF = "no-ssl3"
 
-export DIRS = "crypto ssl apps engines"
-export AS = "${CC} -c"
-export EX_LIBS = "-lgcc -ldl"
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
@@ -222,9 +219,6 @@ do_compile_class-target () {
 }
 
 do_compile_ptest () {
-	# build dependencies for test directory too
-	export DIRS="$DIRS test"
-	oe_runmake depend
 	oe_runmake buildtest
 }
 
-- 
1.9.1


