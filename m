Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXB7h-00011v-Dq
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 14:57:05 +0200
Received: by wgbds1 with SMTP id ds1so4451236wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=j1qQVDC6D3DrqwNQkSfJJ9qXANEjVNryPrebv3xFGfk=;
	b=lXjXVA5yt31k87DuZSoGrsbB7Jbc8SWhSv4HuMPzPWG3TMR2QKaFiZObIGtEitI5eD
	AhlJ4D+zc79/g2Q6fWY5d5t1UxGJP8SHOLUrcQ/E8lbTJdi9AqM8WX746ZKd5Jr7sBVv
	T9M/LtCn6bnkswtbD3oyVwRihStu3nVNuFcWstWv0Z9DIDw9ZJ8xOJsWqyyePnj87ahF
	o/sLtekZ2dOTn+2CNwOyEj47BKwz8vFE2GCUifMETPpqYhtcKX4pUMpjm5xaOQgoJeMC
	21z3W3kNfan5oHug8edpuMW9Fah1hqsSL1+DnC+HZhxaJru5sFfB4aYJlkhoKzmOxWoB
	eKAw==
Received: by 10.180.24.39 with SMTP id r7mr45665674wif.9.1337777215675;
	Wed, 23 May 2012 05:46:55 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id fl2sm63182939wib.2.2012.05.23.05.46.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 05:46:54 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 14:46:40 +0200
Message-Id: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2] valgrind: Enable valgrind for armv7
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
X-List-Received-Date: Wed, 23 May 2012 12:57:05 -0000

Valgrind supports the armv7 architecture, this patch allows armv7 users to build and use Valgrind

This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
* The test consisted of running valgrinds memcheck (memory leakage detection),
* and callgrind (profiling) on a Qt 4 application

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index d7c7b24..0998f72 100644
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
+RRECOMMENDS_${PN}_armv7a += "libc6-dbg"
-- 
1.7.5.4



