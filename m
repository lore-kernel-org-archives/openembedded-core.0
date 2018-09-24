Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id C1AC47469B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4my1WZ2BtHi8ar/8dNSusf/nHs+L4Vq4mJWi5axSEmU=;
	b=ZfetSLww9J5qb9JrRXAP5L0kcF
	JLobS1YhKCevk56/TJO/obuG7G6N/j6del/h1rOJ6JBI+g9xo/pEQTfIvKKynzUWUZl+/UEd6TQnE
	VwMyDs3z9qKaBtTvrA3P5DGrlwPo7Xtni/BlGe4rZg4jRPuB1uy7Y2oGhU1Jk/GPEj+esy2sP2WW9
	Qcc3YV650h9T9eiLTavjdqcPbTa0HwJbx9W39/R/uwhMhpeWSPCaDvIatqA4ObUte5OEBKidUlva/
	HFSD8mptPREme1g1v/C89URXDSoVpydrN7mgHWsrmUCi3wvCo0MvDLmsJy9bcI/T+orbY6dOvoUhJ
	8h2OeYiQ==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1g4LuU-00060N-Ae; Mon, 24 Sep 2018 11:08:03 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1g4LuA-0002tU-76; Mon, 24 Sep 2018 11:07:42 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 11:07:33 +0300
Message-Id: <1537776453-9248-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.1
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Cc: Michael Ho <michael.ho@bmw.de>, Thomas Witt <thomas.witt@bmw.de>
Subject: [PATCH v2] openssl10: remove extra slash from libdir path
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
X-List-Received-Date: Mon, 24 Sep 2018 08:08:06 -0000

The configure script ended up creating Makefile with

LIBDIR=/lib

which got leaked into various places including all
pkg-config .pc files where lines like (note the
double slash //):

libdir=${exec_prefix}//lib
...
Libs: -L${libdir} -lcrypto

which causes pkg-config --libs to include the full absolute path
to the recipe specific sysroot. This isn't a big problem
until something like CMake projects start generating
their own .cmake modules using this absolute path and exposing
them to sysroots of other bitbake recipes thus escaping
their recipe specific sysroots.

Then the fun begins when these users of the .cmake module start
to randomly fail builds with error messages like:

/home/builder/src/base/build/tmp/work/corei7-64-linux/package/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-linux/../../libexec/x86_64-linux/gcc/x86_64-linux/7.3.0/ld: cannot find /lib/libpthread.so.0
/home/builder/src/base/build/tmp/work/corei7-64-linux/package/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-linux/../../libexec/x86_64-linux/gcc/x86_64-linux/7.3.0/ld: cannot find /usr/lib/libpthread_nonshared.a
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

As luck has it, this problem goes away by recompiling the recipes
alone but repeats with multiple recipes here and there when full
images are build.

A careful inspection of multi page linker command lines shows
that some linker paramaters point to libraries in a different
recipes sysroot than what bitbake was building when the task
failed.

So, fix is to remove this one extra slash from openssl
library path configuration option. This changes openssl
Makefile to have:

LIBDIR=lib

and all users of LIBDIR variable in the Makefile are already
adding slashes as path separators if that is needed.

With this the generated .pc files have:

libdir=${exec_prefix}/lib

and pkg-config --libs knows to strip the already default
sysroot path away.

This then fixes the generated .cmake files to not include
these absolute paths and fixes the random build failures
when building images.

Thanks to Thomas, Michael and Ross for debugging support!

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Thomas Witt <thomas.witt@bmw.de>
Cc: Michael Ho <michael.ho@bmw.de>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v1: http://lists.openembedded.org/pipermail/openembedded-core/2018-September/156019.html

v2: use syntax proposed by peter.kjellerstedt@axis.com in
    http://lists.openembedded.org/pipermail/openembedded-core/2018-September/156020.html

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
index b7297fc..4920e12 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
@@ -191,7 +191,7 @@ do_configure () {
 	if [ "x$useprefix" = "x" ]; then
 		useprefix=/
 	fi
-	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
+	libdirleaf="$( echo "${libdir}" | sed "s:^$useprefix/*::" )"
 	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
 }
 
-- 
1.9.1


