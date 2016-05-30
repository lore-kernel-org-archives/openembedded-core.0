Return-Path: <ejo@pengutronix.de>
X-Greylist: delayed 2783 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 May 2016 13:51:53 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id AEC8B771B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 13:51:53 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1b7Mss-0002Oy-Aq; Mon, 30 May 2016 15:05:30 +0200
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.87)
	(envelope-from <ejo@pengutronix.de>)
	id 1b7Mss-0000Pi-18; Mon, 30 May 2016 15:05:30 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 15:04:05 +0200
Message-Id: <1464613445-18617-1-git-send-email-ejo@pengutronix.de>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl-ptest.inc: fix tar call to prevent objcopy failure
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
X-List-Received-Date: Mon, 30 May 2016 13:51:54 -0000

With tar version 1.29, the tar call used to copy the ptest files will
not work anymore. While the call did not match the man page (but worked)
before, anyway, the latest update of tar seems to have a more strict argument
handling.

With the current version of the tar call, the copying of files still
works with latest tar version, but the excludes will not be handled
properly anymore.
This results in having binaries compiled with host GCC in the package.
When doing the strip_and_split files in do_package() with the target
objcopy, bitbake will fail with this error:

  ERROR: objcopy failed with exit code 256 (cmd was [...])
  [...]
  File format not recognized

Thus, the current argument issues and required changes are:

 * Options must be placed _before_ the pathnames.

 * --exclude must be followd by a '=' in order to work properly

 * 'f' options is for providing an archive file, which is unnecessary in
   this case

Note that this could also be a candidate for backporting.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---


I just wanted to send my patch when I saw you had already send it. Will send
this one instead as I added some more changes that might be useful. Maybe we
can squash this into yours if its found to be useful, too.

Best regards, Enrico


 meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 948ea7c..5f0989f 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -7,8 +7,8 @@ do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
-	tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
-		--exclude miniperl --exclude generate_uudmap --exclude patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -c --exclude=\*.o --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \
+		--exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x )
 
 	sed -i -e "s,${D},,g" \
 	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
-- 
2.8.1


