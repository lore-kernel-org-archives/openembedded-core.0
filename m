Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id CB8DB71AC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:50:28 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id EED59B81F65; Wed, 30 Nov 2016 19:50:27 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 19:50:26 +0100
Message-Id: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] bash: use update-alternatives for the bash binary
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
X-List-Received-Date: Wed, 30 Nov 2016 18:50:29 -0000

Busybox may offer a bash applet. If enabled, the alternatives mechanism
avoids breaking logins if bash gets deinstalled while /bin/bash is configured
as a login shell.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-extended/bash/bash.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 1d08526..a05b987 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -14,9 +14,11 @@ EXTRA_OECONF = "--enable-job-control --without-bash-malloc"
 # This is what other major distros do. And this is what we wanted. See bug#5359 and bug#7137.
 CFLAGS += "-DNON_INTERACTIVE_LOGIN_SHELLS"
 
-ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_${PN} = "bash sh"
+ALTERNATIVE_LINK_NAME[bash] = "${base_bindir}/bash"
+ALTERNATIVE_TARGET[bash] = "${base_bindir}/bash"
 ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
-ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash.${BPN}"
 ALTERNATIVE_PRIORITY = "100"
 
 RDEPENDS_${PN} += "base-files"
-- 
2.7.4


