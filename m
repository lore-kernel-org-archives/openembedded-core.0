Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBqAA-0001Vg-N4
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 18:24:15 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so1877654dad.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2013 09:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pLJ752IHwiZ8fQ5Mvq9jyMU8cX/Fc7+Ozx0Y4yLSlCo=;
	b=ZPOddAy6QtXKSH7aMJM6gmJsYxU7HlQKvQGff7Q6fEq1zItXdh/Q+DuqiSoxRYxVaL
	FNIiCI9fB4R8I/mrDteJvXsbxOlAe2lrDpjCjZUPWhdsNhGzrbWaBP9pVTi4I9aAVCp8
	3ZNk7o7SVG7FcrKtwmfFUt3AUA5kP2wP2sVpzvAuZPT5K5sJyuPxk4KfuGwQqQQXV7II
	ivXm503Dr+4N1coMwu2wjJJyPWT8gMXlkfyGDkQWKIcYUQlTxTWkx3P7XQn6iZ2FXiMj
	s5bfDDJ0aN+6UxzYJJDSQHF7Q8fDjxjQTMrtkp8yftKeBepZQqh/giLuzyUx5DqyZAuP
	d3Jw==
X-Received: by 10.66.154.162 with SMTP id vp2mr24168303pab.138.1362244052981; 
	Sat, 02 Mar 2013 09:07:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t6sm17317840paz.11.2013.03.02.09.07.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 09:07:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2013 18:06:58 +0100
Message-Id: <1362244018-27333-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1362244018-27333-1-git-send-email-Martin.Jansa@gmail.com>
References: <1362244018-27333-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] eglibc: move RPROVIDES to eglibc-package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2013 17:24:17 -0000

* PROVIDES_${PN}-dbg doesn't look correct, it should be RPROVIDES
  and that was already in eglibc-package
* RPROVIDES_${PN}-dev was overwritten in eglibc-package, but add
  those 2 entries now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc | 2 +-
 meta/recipes-core/eglibc/eglibc_2.17.bb     | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 72ff6b8..88a00a4 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -24,7 +24,7 @@ RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
 RPROVIDES_${PN}-utils = "glibc-utils"
 RPROVIDES_${PN}-mtrace = "glibc-mtrace libc-mtrace"
 RPROVIDES_${PN}-pic = "glibc-pic"
-RPROVIDES_${PN}-dev = "glibc-dev"
+RPROVIDES_${PN}-dev = "glibc-dev libc6-dev virtual-libc-dev"
 RPROVIDES_${PN}-staticdev = "glibc-staticdev"
 RPROVIDES_${PN}-doc = "glibc-doc"
 RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index 6526978..22129e6 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -52,9 +52,6 @@ B = "${WORKDIR}/build-${TARGET_SYS}"
 
 PACKAGES_DYNAMIC = ""
 
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
-- 
1.8.1.4



