Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1RlNfG-0000zE-N4
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:38:19 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q0CGUT8W032567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2012 17:30:30 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Thu, 12 Jan 2012 17:30:29 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 17:30:21 +0100
Message-Id: <1326385824-32201-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.7.5
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] openssl: build always with -Wa,--noexecstack
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
X-List-Received-Date: Thu, 12 Jan 2012 16:38:19 -0000

There is no reason to disable exec-stack only for -native builds;
binaries on the target will suffer from the same SELinux ACLs.

OpenSSL does not use executable stack so this option can be disabled
unconditionally.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-connectivity/openssl/openssl.inc |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 771f146..65bb671 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -19,11 +19,7 @@ S = "${WORKDIR}/openssl-${PV}"
 
 AR_append = " r"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
-	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
-
-# Avoid binaries being marked as requiring an executable stack (which causes 
-# issues with SELinux on the host)
-CFLAG_append_virtclass-native = " -Wa,--noexecstack"
+	-DTERMIO ${FULL_OPTIMIZATION} -Wall -Wa,--noexecstack"
 
 # -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
 CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
-- 
1.7.7.5



