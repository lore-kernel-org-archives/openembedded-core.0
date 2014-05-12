Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 6330E61F16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:35 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:38 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id C42F23A205;
	Mon, 12 May 2014 15:55:44 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:26 +0200
Message-Id: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 01/13] systemtap: remove usage of FILESPATH
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
X-List-Received-Date: Mon, 12 May 2014 14:28:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../systemtap/systemtap-uprobes_git.bb             |    2 ++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index ab9acba..4d2bec4 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -11,6 +11,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 inherit module-base gettext
 
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemtap:"
+
 FILES_${PN} += "${datadir}/systemtap/runtime/uprobes"
 
 EXTRA_OEMAKE = ""
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 78439c1..717d66f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,8 +8,6 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://obsolete_automake_macros.patch \
           "
 
-FILESPATH = "${FILE_DIRNAME}/systemtap"
-
 # systemtap doesn't support mips
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
 
-- 
1.7.9.5


