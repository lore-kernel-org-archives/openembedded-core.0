Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXC3R-00048E-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:56:46 +0200
Received: by wgbdr1 with SMTP id dr1so6353897wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2RPr0vI8YmZhQoGHOUaevHTaAmnLSlu+PkuCT9lZ0ls=;
	b=vrfZS1z1vaft3jeqcE6lg2pQIyGKMuAHEWvsr5SodQmQcvZqGWYv3ihRor4e+XH+bw
	VF/GP/kgFwGT3Ooz7GAwsYl0CllCjMb18MhNSnZY/6FUAVpypfaLtnjcCjEAjoKCwTsT
	gh8RM+BB7fahnuvIrM+LXUnRkaa4ryXYWfGX3cVQJcsaMM+dU4dWBvJeL+riwcZZrjmg
	5ZCdibg1hpDTiZxx782TNNQ1f7a5ZxNEI7A2lJJYC55cWvY/tpjKO7jg8PTJrkVbQyZy
	r/maVdqKeP43SVFVOvDIaabniYAa5AO56K0Ax8mVEnLf2L4IpdfhbVyagIKlPZniuKg8
	ppAg==
Received: by 10.180.100.230 with SMTP id fb6mr45416335wib.3.1337780796028;
	Wed, 23 May 2012 06:46:36 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id bn9sm40230917wib.5.2012.05.23.06.46.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 06:46:35 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 15:46:28 +0200
Message-Id: <1337780788-30178-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v3] valgrind: Enable valgrind for armv7
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
X-List-Received-Date: Wed, 23 May 2012 13:56:46 -0000

Valgrind supports the armv7 architecture, this patch allows armv7 users to build and use Valgrind

This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
* The test consisted of running valgrinds memcheck (memory leakage detection),
* and callgrind (profiling) on a Qt 4 application

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index d7c7b24..6b54472 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -23,13 +23,16 @@ SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
 
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
 inherit autotools
 
 EXTRA_OECONF = "--enable-tls"
+EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi"
 EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
 RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
 RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
+RRECOMMENDS_${PN}_armv7a += "${TCLIBC}-dbg"
-- 
1.7.5.4



