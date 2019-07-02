Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D735B7E83D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 20:16:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x62KGAok022254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2019 13:16:11 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Jul 2019 13:16:09 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2019 13:16:07 -0700
Message-ID: <20190702201609.78379-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702201609.78379-1-jason.wessel@windriver.com>
References: <20190702201609.78379-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] psmisc: Fix dependency for USE_NLS=no
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
X-List-Received-Date: Tue, 02 Jul 2019 20:16:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When using USE_NLS="no" in the local.conf psmisc will fail to
compile as follows:

| autoreconf: Entering directory `.'
| autoreconf: running: autopoint --force
| autoreconf: failed to run autopoint: No such file or directory
| autoreconf: autopoint is needed because this package uses Gettext
| ERROR: autoreconf execution failed.

This is because the gettext.bbclass returns gettext-minimal-native for
the host dependency which does not include autopoint.  The autopoint
utility is required to build psmisc, so it needs to list
gettext-native as a dependency.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 82ef947709..594a10cf22 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl"
+DEPENDS = "ncurses virtual/libintl gettext-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-- 
2.21.0


