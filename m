Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id C88D1787E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 12:10:43 +0000 (UTC)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])
	by msfrf2603.sfr.fr (SMTP Server) with ESMTP id 09C011C001826
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 14:10:44 +0200 (CEST)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2603.sfr.fr (SMTP Server) with ESMTPSA;
	Thu, 14 Jun 2018 14:10:42 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Ovidiu Panait' <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
In-Reply-To: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
Date: Thu, 14 Jun 2018 14:10:38 +0200
Message-ID: <002e01d403d8$b811f1b0$2835d510$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQMm0QNrb4sapHzB2tQR4rf39Ym55KG6Dj8w
X-sfr-mailing: LEGIT
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Thu, 14 Jun 2018 12:10:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi,

I believe I solved that same problem by just adding, in the case of armv8
(which I believe may be the new architecture you're referring to):
MUTEX_armv8 = ""
This way, it allows previous versions to work just like they did before,
without having to disable ARM assembler mutex code for architectures that
support it correctly - up to armv7ve I believe.
Of course, we might need to also have a good definition for armv8, which is
the object of another thread.

Cheers,
Herve

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
Ovidiu Panait
Sent: jeudi 14 juin 2018 13:55
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex code

The swpb in macro MUTEX_SET will cause "undefined instruction" error on the
new arm arches which don't support this assembly instruction any more. If
use ldrex/strex to replace swpb, the old arm arches don't support them. So
to avoid this issue, just disable the ARM assembler mutex code, and use the
default pthreads mutex.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb
b/meta/recipes-support/db/db_5.3.28.bb
index 093ee44909..15b4155a29 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -59,18 +59,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so
${libdir}/libdb_cxx.so"
 # All the --disable-* options replace --enable-smallbuild, which breaks a
bunch of stuff (eg. postfix)  DB5_CONFIG ?= "--enable-o_direct
--disable-cryptography --disable-queue --disable-replication
--disable-verify --disable-compat185 --disable-sql"
 
-EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
-
-# Override the MUTEX setting here, the POSIX library is -# the default -
"POSIX/pthreads/library".
-# Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code, this won't -# work with thumb
compilation...
-ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
-MUTEX = ""
-MUTEX_arm = "${ARM_MUTEX}"
-MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX} STRIP=true"
+EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot
STRIP=true"
 EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
 
 EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal
-I${S}/dist/aclocal_java"
--
2.17.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


