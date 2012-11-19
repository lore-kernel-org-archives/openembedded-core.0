Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TabCJ-0003Zl-6t for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 00:56:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJNgAkB000314
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:42:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32710-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:42:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJNg0RO032742
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:42:01 GMT
Message-ID: <1353368519.3709.209.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 23:41:59 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf: Simplify FILESPATH
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
X-List-Received-Date: Mon, 19 Nov 2012 23:56:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Files are very rarely, if ever placed in ${PF}. If a recipe needs to do this,
it can easily append to FILESPATH so it makes sense to drop this from the
default search path.

Equally, using FILE_DIR as part of the search path leads to 'bad' SRC_URI
entries and/or file layouts which are not preferred. I'm therefore of the
opinion we should also remove this from FILESPATH and encourage people to
cleanup any places this breaks my correcting the layouts to match the standard
or worst case adding to FILESPATH in recipes that need it.

These changes work towards making the system more friendly as users won't be
greeted with huge search paths we rearely use making the "correct" layout
more obvious.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 783b64d..6037f90 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -80,7 +80,7 @@ BASEDEPENDS = "${@base_dep_prepend(d)}"
 
 DEPENDS_prepend="${BASEDEPENDS} "
 
-FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
+FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
 # THISDIR only works properly with imediate expansion as it has to run
 # in the context of the location its used (:=)
 THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"




