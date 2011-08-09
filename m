Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/yKH85j0RHs/7DFSnQFVSUadWUuJzIlZs=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqdQo-0007ZX-3c
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 05:56:42 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p793qBZD010215
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 22:52:11 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 22:52:11 -0500
Message-Id: <1312861931-5656-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] eglibc: force GLIBC_EXTRA_OECONF to not be uset for nativesdk
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
X-List-Received-Date: Tue, 09 Aug 2011 03:56:42 -0000

Don't use GLIBC_EXTRA_OECONF for the nativesdk builds.  Easiest solution
is to just override it settings.  Otherwise we might pickup configure
options ment for the target build.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-core/eglibc/eglibc.inc     |    1 +
 meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 0f97f82..9088d02 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -31,6 +31,7 @@ require eglibc-options.inc
 LEAD_SONAME = "libc.so"
 
 GLIBC_EXTRA_OECONF ?= ""
+GLIBC_EXTRA_OECONF_virtclass-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index ce16bd6..1a69bdc 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r21"
+PR = "r22"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index b0a8bfd..915eb32 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r11"
+PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.7.3.4



