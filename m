Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtElg-0000tT-IM
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:17 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so83755dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DiIdZIOpGwuKgNVQJ73u21j33J7nNOGZIOzOB7xMc8s=;
	b=P39l8TNZ7YP8kq7aCrgXbaH9P/Oq9ilo882d2rKxXgiKeL9k4NGebMhTfAHdn6+Q7o
	qcxzUdt2WwR1nigMoYdDFgHAZKyvkRNkxe3b/U/MvISpjImtYZSbDTPSz4pUimhD5e+M
	RWR7cl7Dg01x3AFSmHJdZ+UtFcKwygWd8IJaU=
Received: by 10.68.210.12 with SMTP id mq12mr15977365pbc.2.1328258241360;
	Fri, 03 Feb 2012 00:37:21 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:11 -0800
Message-Id: <52aab0673d5c5241b666a6dcefbb09f40e0d8f4d.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 06/14] uclibc: Get the thumb features from tune flags
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc |    4 +++-
 meta/recipes-core/uclibc/uclibc.inc        |    1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 8bb0948..f32e6ee 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -95,15 +95,17 @@ def uclibc_cfg(feature, features, tokens, cnf, rem):
 def features_to_uclibc_settings(d):
 	cnf, rem = ([], [])
 	distro_features = d.getVar('DISTRO_FEATURES', True).split()
+	tune_features = d.getVar('AVAILTUNES', True).split()
 	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
 	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
 	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
 	uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
-	uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
 	uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
 	uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
 	uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
 	uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
+	uclibc_cfg('thumbmode', tune_features,'COMPILE_IN_THUMB_MODE', cnf, rem)
+	uclibc_cfg('thumb-interwork', tune_features,'USE_BX', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 5e9e2e9..b797d3f 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -124,7 +124,6 @@ configmangle = '/^KERNEL_HEADERS/d; \
                 /^SHARED_LIB_LOADER_PREFIX/d; \
                 /^UCLIBC_EXTRA_CFLAGS/d; \
                 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][d.getVar("ARM_INSTRUCTION_SET", 1) != "arm"]} \
                 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][d.getVar("USE_NLS", 1) == "yes"]} \
                 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][d.getVar("TARGET_ARCH", 1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
                 /^CROSS/d; \
-- 
1.7.5.4



