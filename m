Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREN-0007b3-Sh
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPCmd026670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:12 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:03 -0500
Message-ID: <5d1c5365256d9042d35d01980c838de2a989eb21.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 09/40] kernel.bbclass: Add support for perf-dbg package
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:49 -0000
Content-Type: text/plain

The perf component is built with the kernel, so ensure that it gets the
debug information associated with it.

Also bump the PR in the linux-yocto-* to ensure they get rebuilt.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/kernel.bbclass                     |    3 ++-
 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1bb69f5..aaf341b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -496,6 +496,7 @@ addtask deploy before do_build after do_install
 EXPORT_FUNCTIONS do_deploy
 
 # perf must be enabled in individual kernel recipes
-PACKAGES =+ "perf"
+PACKAGES =+ "perf-dbg perf"
 FILES_perf = "${bindir}/* \
               ${libexecdir}"
+FILES_perf-dbg = "${FILES_${PN}-dbg}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
index 66991ae..4891463 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
@@ -22,7 +22,7 @@ SRCREV_machine_qemux86-64 = "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_machine = "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_meta = "ec26387cb168e9e0976999b528b5a9dd62e3157a"
 
-PR = "r1"
+PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index f6abc9e..ba85208 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -22,7 +22,7 @@ SRCREV_machine_qemux86-64 = "1950ea205407d8950475a37404173572d55fd27f"
 SRCREV_machine = "697d84759be192403a8a87ab269196c67a0c2c88"
 SRCREV_meta = "46a1be20b01e50d5d0646e5622e9dd06433238c2"
 
-PR = "r18"
+PR = "r19"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-- 
1.7.3.4



