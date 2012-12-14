Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6b-0003rJ-8q
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:50 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2485950pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=43f3FZDfi+GEp7kZpQCF6Tbgi1wjDu5hdCOEmbCWUhA=;
	b=yVauEqnAvMvbYxm9gt49HUNPsBGqEV15ygjFXsr4/ZphzZ1Px52JqF/81+mfjFH5kl
	WwkvF0pZTbcShz85GbEjDstmk1YhnzIpE8Gl33f1KwF7j/A2h/EEMB8KVarilp0ywB1N
	EQMCD1cXx/zaWjgjByyW2nwtnl9FsIEheSJFukoJHOAmovR2gtjzi2w+A3VB76uwO4ae
	uQQYhvTOiGzk/TEF5G7a99jUw5q7VvCY8OpGeDHnPsj6XvopTC+AQtcQsF5a/i1ho2wk
	nGn3oygRx8JexfJ/3SZCztviUhgTDJ/XlNL2dgwtypjNi+ULt/AHTq0Tv1EgLngUU9z2
	SZjw==
Received: by 10.66.76.8 with SMTP id g8mr66081paw.40.1355528471818;
	Fri, 14 Dec 2012 15:41:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i1sm3950265pav.35.2012.12.14.15.41.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:41:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:45 +0100
Message-Id: <c5b7c61e7f529b7fc53347a04a58b606c70f3a90.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/10] kernel.bbclass: Allow modules*.tar.gz generation to be inhibited
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
X-List-Received-Date: Fri, 14 Dec 2012 23:55:52 -0000

From: Phil Blundell <philb@gnu.org>

The modules.tar.gz archive is sometimes of no value and it can take
a noticeable time to build if many modules were enabled in the kernel
configuration.  The extraneous file also contributes to deploy/ clutter
and is a waste of disk space.

Allow it to be suppressed by setting MODULE_TARBALL_DEPLOY="0".

Signed-off-by: Phil Blundell <pb@pbcl.net>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9c70e70..96b23bc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -501,6 +501,7 @@ MODULE_TARBALL_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tg
 # Don't include the DATETIME variable in the sstate package signatures
 MODULE_TARBALL_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_DEPLOY ?= "1"
 
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
@@ -529,7 +530,7 @@ addtask uboot_mkimage before do_install after do_compile
 
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
 	fi
-- 
1.8.0.2



