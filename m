Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SWAZW-0008W1-7x
	for openembedded-core@lists.openembedded.org;
	Sun, 20 May 2012 20:09:38 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4KHxUWP007934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 19:59:30 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1SWAPh-0007aY-4P
	for openembedded-core@lists.openembedded.org;
	Sun, 20 May 2012 19:59:29 +0200
Resent-To: openembedded-core@lists.openembedded.org
Resent-From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Resent-Date: Sun, 20 May 2012 19:59:29 +0200
Resent-Message-ID: <lyk406rawu.fsf@ensc-virt.intern.sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailbox.sigma-chemnitz.de (Cyrus v2.3.16-2.sigma) with LMTPA;
	Sun, 20 May 2012 19:54:42 +0200
X-Sieve: CMU Sieve 2.3
X-Envelope-From: ensc@sigma-chemnitz.de
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4KHsd5a007423
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 20 May 2012 19:54:40 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SWAL0-0002Yv-8R; Sun, 20 May 2012 19:54:38 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2012 19:54:37 +0200
Message-Id: <1337536477-7047-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.7.6
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-DSPAM-Confidence: 0.995
X-Spam-Score: -6.3
X-Spam-Score: -5.3
X-Spam-Level: ------
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, RCVD_IN_DNSWL_MED, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
X-Scanned-By: MIMEDefang 2.73
Resent-Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] libtool: fixed parallel build related race
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
X-List-Received-Date: Sun, 20 May 2012 18:09:38 -0000

While building libtool, the libtool script itself will be regenerated
because OE modifies a dependency[1]. With -jX, this operation (-->
removal, creation of non-x file, 'chmod a+x') can happen at a time when
the script is going to be executed.  This can cause errors like:

| arm-linux-gnueabi-libtool: compile:  ccache arm-linux-gnueabi-gcc ...
| ...
| /bin/sh ./config.status libtool
| ...
| arm-linux-gnueabi-libtool: compile:  ccache arm-linux-gnueabi-gcc ...
| /bin/sh: ./arm-linux-gnueabi-libtool: Permission denied
| make[2]: *** [libltdl/libltdl_libltdl_la-lt__alloc.lo] Error 126

I am not sure whether the custom do_compile_prepend() is still needed.
For now only the issue above will be fixed by executing ./config.status
yet again.

[1] see 648290d5bf4d6ff50d3643bb7ad902dfc23aa702

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 084062a..c1ef7c4 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
@@ -27,6 +27,7 @@ do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
 	rm -f ${S}/libltdl/config/ltmain.sh
 	make libltdl/config/ltmain.sh
+	./config.status
 }
 
 inherit autotools
-- 
1.7.7.6



