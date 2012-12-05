Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJth-0006W8-Nq
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:40:52 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3064473eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qOktyd/fVvaWb6gtP9gBuFvmMqwru5rHxp69lsB2HOw=;
	b=o2HgQcH7P3SKlCBZ4wJGGigvf4qTDhzrhWSKpSkiEiEmueupwJJq88yQe4s6kpHeL5
	6kSkxwlKUgH2j7131/qlldzn/PyvezapmQvxzFzI+7Rr+TV2wgFhJOOl0IJwFoIZo5yd
	w0eEBp0z1gEVeEEF888yj0e3AXrxnPq9DPRtABYPDLVBDUkqUusHdXRfRsU71WbXGLDi
	L5+r6iJftSNl61+tZTCS3wzEuKsEPEDd0+uVKPSJavgdKbCwy8PYc/BqCDJkZe7JGx2R
	Ghku5E97wv1kbJEVfW88ZK6IViPjYr4bY6qChN0Ob/TgRHyFaTe+gpdYDd5ymU2erACF
	VI/g==
Received: by 10.14.175.133 with SMTP id z5mr63448407eel.15.1354731977775;
	Wed, 05 Dec 2012 10:26:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm10646062eeo.13.2012.12.05.10.26.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:26:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:26:03 +0100
Message-Id: <7ff1ad8ec38bc42b2067e13b56c4daaee6e31232.1354731942.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] at: change initscript dependency from build time to runtime
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
X-List-Received-Date: Wed, 05 Dec 2012 18:41:04 -0000

* doesn't look like build dependency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/at/at_3.1.13.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index 3580e09..198b46e 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -4,14 +4,19 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex flex-native initscripts \
-	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
+DEPENDS = "flex flex-native \
+           ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"                                                                                                                 
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
+                  ${VIRTUAL-RUNTIME_initscripts} \
+"
+
 PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
-- 
1.8.0



