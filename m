Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UV0IJ-0003Wu-80
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:03:53 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 796FBD20DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 15:45:10 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 15:45:42 +0200
Message-Id: <1366811142-18844-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] cpan.bbclass: use '|' as sed separator for entry with paths
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
X-List-Received-Date: Wed, 24 Apr 2013 14:04:05 -0000

With normal toolchain it works. But fails badly when external Linaro
toolchain is used. And this is why:

-e "s/^\(CCFLAGS =.*\)/\1  -isystem/home/hrw/devel/canonical/aarch64/openembedded/build/linaro-tcwg/gcc-linaro-aarch64-linux-gnu-4.7-2013.04-20130415_linux//aarch64-linux-gnu/include  -O2 -pipe -g -feliminate-unused-debug-types/" \

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/classes/cpan.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 957a6e2..bef9e82 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -26,7 +26,7 @@ cpan_do_configure () {
 			test -f $f2 || continue
 			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
 				-e 's/perl.real/perl/' \
-				-e "s/^\(CCFLAGS =.*\)/\1 ${CFLAGS}/" \
+				-e "s|^\(CCFLAGS =.*\)|\1 ${CFLAGS}|" \
 				$f2
 		done
 	fi
-- 
1.8.1.2



