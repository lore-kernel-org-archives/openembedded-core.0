Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id C77D5741CF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:41 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so31930731pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OZ9KbamWtPzwYTCxc2tdhd1VycPUWzdERUrmB+PYQhU=;
	b=LX1zYZs7tjWyEnzYfOg2F1yThbq1g393c2MrPP5wamH3YFXOmEs7g7gSP5tz2FJGAH
	TxGc/UhLKaNxDAmJimalWsv51x/83VyeZTew0obF5dPXsd4ex7s363QRwrlG5A7JU5kZ
	DoveqiWOsIOpUoSEMyqudWandigydx1wLYxrIJTJHRu317/Hp+ZU+U7TH4zWqKZ0fLRj
	oHxqR+vxnzJHdE6kkTd54odBmJGnPyEeHHIRpLGY+DwVFEnvjQ68nC76w3jhYIVS47KC
	1KjqfCqBBkTp/7yjdgeAMIdCPlN8yDJTU18L1U4H2/piw5/bpNgA/Ce+6kYSSR+c/kQS
	FpFQ==
X-Received: by 10.68.142.42 with SMTP id rt10mr40259855pbb.27.1437232602277;
	Sat, 18 Jul 2015 08:16:42 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ml6sm14616785pdb.69.2015.07.18.08.16.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:41 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 22581FC12E9; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:08 -0700
Message-Id: <58d15b54e5aee6aa05a2614084eaa0cb04b2220e.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 01/25] neard: fix the install path in init scripts
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:45 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

The neard make scripts will place the daemon executable
in /usr/lib/neard/nfc/neard. Change the path accordingly
in init scripts.

Fixes [YOCTO #7390].

(From OE-Core rev: bd277f3a46e7fc764cc55c5354d2136fcfddc3c1)

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/neard/neard.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index e714cad..983a022 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -21,7 +21,7 @@ do_install() {
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
+		sed "s:@installpath@:${libexecdir}/nfc:" ${WORKDIR}/neard.in \
 		  > ${D}${sysconfdir}/init.d/neard
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
-- 
1.9.1


