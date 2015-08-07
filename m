Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3097D767D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 20:18:56 +0000 (UTC)
Received: by igfj19 with SMTP id j19so18995034igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2/tdm6ZpJ3XD8693/njXpLTpUcMCbvYEC+O8RMLEFxQ=;
	b=x75+eswXLL9y4njZ/N0Du7ZP3j6vx9zUUQXeGOT8MFHe4f0I+Fr+2qDo0G7ztLq8fI
	UlXI2KxUvFNwv2fIfhc1LwSHjNUSKWpCb8ws4YS3uGuZNjBFh6OTJihVypZuG2kxzQK6
	TpbYeGe39rlrcYGGZkQVfXveszJbvDcErFeUf5AiOewNbXDfAXh23Ksg16pTind6oHP+
	SSaqpiYDblmnznQ3/ZaMuwZkevQiDvJARm43Qz8pLkIiLzwDea0E0y3SvNctFJJuicd9
	VuuN2OO2ic0QJVv6Wuc1kg3qbClkdHE6v7uHkWvhuRFG1iWknGrLZKAU7SzMz71Y6GAZ
	Yijw==
X-Received: by 10.50.43.196 with SMTP id y4mr186igl.14.1438978736771;
	Fri, 07 Aug 2015 13:18:56 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	m134sm7550995ioe.42.2015.08.07.13.18.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Aug 2015 13:18:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 13:18:47 -0700
Message-Id: <1438978727-2172-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438978727-2172-1-git-send-email-raj.khem@gmail.com>
References: <1438978727-2172-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] gnu-config: Update git version to latest and use it
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
X-List-Received-Date: Fri, 07 Aug 2015 20:19:00 -0000

latest gnu-config code has all the patches to support
musl/uclibc upstreamed so lets use it after upgrading to latest
its GPLv3 with autoconf exception but the GPLv2 copy of recipe
is left in as well to not break non-GPLv3 builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 754a99a..3d5f2b8 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -1,27 +1,24 @@
 SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
 SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=0e6ca0501b27177f3bc640f7225e3ead"
+LICENSE = "GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://config.guess;beginline=7;endline=27;md5=9bac8b1743c2240ae07cce6e546ac2f2"
 
 DEPENDS_class-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "a47f842264fc19837f8a00eb1d2d254a4c527334"
-PV = "1.0+git${SRCPV}"
+SRCREV = "b576fa87c140b824466ef1638e945e87dc5c0343"
+PV = "20150728+git${SRCPV}"
 
 SRC_URI = "git://git.sv.gnu.org/config.git \
-	   file://config-guess-uclibc.patch \
            file://gnu-configize.in"
 
 S = "${WORKDIR}/git"
 
 CLEANBROKEN = "1"
 
-do_compile() {
-	:
-}
+do_compile[noexec] = "1"
 
 do_install () {
 	install -d ${D}${datadir}/gnu-config \
@@ -40,4 +37,4 @@ do_install () {
 PACKAGES = "${PN}"
 FILES_${PN} = "${bindir} ${datadir}/gnu-config"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


