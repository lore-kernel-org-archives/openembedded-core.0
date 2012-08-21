Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T3tqT-0005Am-69
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:10:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7LIwSNe013662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:58:28 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 21 Aug 2012 11:58:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 13:58:24 -0500
Message-ID: <3bd2da551c6918ebeb06df21076cd4d961d65c44.1345575401.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1345575401.git.mark.hatle@windriver.com>
References: <cover.1345575401.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1 denzil] recipes-core/eglibc-2.13: Patch for locale-base-tt-ru packaging
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
X-List-Received-Date: Tue, 21 Aug 2012 19:10:33 -0000
Content-Type: text/plain

From: Jeff Polk <jeff.polk@windriver.com>

The eglibc-2.13 build can fail because locale-base-tt-ru is in
PACKAGES twice. This is because the SUPPORTED list and the i18n
directories are out of sync with each other; the SUPPORTED list
expects a directory named "tt_RU.UTF8", but the directory is
actually named "tt_RU", and likewise for the @iqtelif variants.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../eglibc/eglibc-2.13/supported-tt-ru.patch       |   13 +++++++++++++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/supported-tt-ru.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.13/supported-tt-ru.patch b/meta/recipes-core/eglibc/eglibc-2.13/supported-tt-ru.patch
new file mode 100644
index 0000000..c65e38f
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/supported-tt-ru.patch
@@ -0,0 +1,13 @@
+--- a/localedata/SUPPORTED
++++ b/localedata/SUPPORTED
+@@ -385,8 +385,8 @@
+ tr_TR.UTF-8/UTF-8 \
+ tr_TR/ISO-8859-9 \
+ ts_ZA/UTF-8 \
+-tt_RU.UTF-8/UTF-8 \
+-tt_RU.UTF-8@iqtelif/UTF-8 \
++tt_RU/UTF-8 \
++tt_RU@iqtelif/UTF-8 \
+ ug_CN/UTF-8 \
+ uk_UA.UTF-8/UTF-8 \
+ uk_UA/KOI8-U \
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 690f99d..d0bac6b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r28"
+PR = "r29"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -14,6 +14,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://stack-protector-test.patch \
            file://armv4-eabi-compile-fix.patch \
            file://etc/ld.so.conf \
+           file://supported-tt-ru.patch \
            file://generate-supported.mk \
            file://ppc-sqrt.patch \
            file://multilib_readlib.patch \
-- 
1.7.3.4



