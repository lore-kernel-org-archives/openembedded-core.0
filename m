Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaatW-0001j4-QI
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 01:04:35 +0200
Received: by dalh21 with SMTP id h21so3474705dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7YXKdTd1ZVSoMPiv1rdF7mJxTLTupU7YNQ39/e/2pjk=;
	b=CeqDPsm6EWVAdTed90oRngGpAs0isH9iamcPg1IYB7pOu2GxtGYVEVbkV00R0hguHc
	8RfoMPPirb1CPz/PgUW6SAa6V+/zxJxzeK3iXeoL5rvUitQxaNLle/dSB0l+/PIIoYKf
	s4W8s4OIGN+uqKOPv0/V/F1qCLbaWQFBLoENqXRAqpTUyyBG+DwKbK3532Lrhlo3auAs
	lUyWz0awNiGfIK+igVNMdKjO3wrJgifl8HznK3+i1WjFJ8TuMmiy+Kdn3h7gcOm9jiW3
	CuVQB7n1ZIV+cGpGsPqJkkq41MWmNeJDSIW80vcryQs7nw0LSk4ueUXfHF4E7y7ho5XU
	NnDQ==
Received: by 10.68.194.105 with SMTP id hv9mr14548378pbc.126.1338591252620;
	Fri, 01 Jun 2012 15:54:12 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id vc6sm2635772pbc.6.2012.06.01.15.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 15:54:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 15:53:57 -0700
Message-Id: <ce0421aac114a6ca1ad914b8fb9585e203595982.1338591147.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.10.3
In-Reply-To: <cover.1338591147.git.chris_larson@mentor.com>
References: <cover.1338591147.git.chris_larson@mentor.com>
In-Reply-To: <cover.1338591147.git.chris_larson@mentor.com>
References: <cover.1338591147.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] tcmode-external-sourcery: pass -msgxx-glibc for x86
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
X-List-Received-Date: Fri, 01 Jun 2012 23:04:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is needed to work around an issue with the toolchain search paths. It can
pick up the wrong features.h without it, it seems, even with the system32
symlink in the oe sysroot. Investigate this further in the future.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../distro/include/tcmode-external-sourcery.inc    |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
index ede4403..1635eec 100644
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -56,11 +56,8 @@ EXTERNAL_TOOLCHAIN_SYSROOT ??= "${@exttc_run(d, EXTERNAL_TOOLCHAIN_SYSROOT_CMD)}
 # These bits are here temporarily to sidestep the need to use a separate set
 # of tune files to pass the appropriate multilib selection arguments to the
 # sourcery toolchain, as is needed to extract the sysroot content.
-CSL_MULTILIB_ARGS[i586] ?= "-msgxx-glibc"
-CSL_MULTILIB_ARGS[i686] ?= "-msgxx-glibc"
-CSL_MULTILIB_ARGS[core2] ?= "-msgxx-glibc"
-CSL_MULTILIB_ARGS[x86] ?= "-msgxx-glibc"
-CSL_MULTILIB_ARGS[x86-64] ?= "-msgxx-glibc"
+TUNE_CCARGS_append_x86 = " -msgxx-glibc"
+
 CSL_MULTILIB_ARGS[ppce500] ?= "-te500v1"
 CSL_MULTILIB_ARGS[ppce500mc] ?= "-te500mc"
 CSL_MULTILIB_ARGS[ppce500v2] ?= "-te500v2"
-- 
1.7.4.1



