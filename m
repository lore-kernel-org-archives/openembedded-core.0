Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 1A45C60D0B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 08:06:18 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 10 May 2014 10:06:13 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-09-01.atm.binero.net (Postfix) with ESMTPSA id 399543A11F;
	Sat, 10 May 2014 10:06:13 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 May 2014 10:05:54 +0200
Message-Id: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399671290.git.petter@technux.se>
References: <cover.1399671290.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv2 01/13] systemtap: remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 08:06:19 -0000
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
index ab9acba..7d76b52 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -11,6 +11,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 inherit module-base gettext
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/systemtap:"
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


