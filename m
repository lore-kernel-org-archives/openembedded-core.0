Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id D5E3560438
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:34:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id A1511316129B;
	Thu, 14 Aug 2014 13:34:44 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 13:34:24 +0200
Message-Id: <1408016064-22174-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] cml1.bbclass: fix diffconfig diff command
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
X-List-Received-Date: Thu, 14 Aug 2014 11:34:52 -0000

Commit 6a7b98993350d0d24eae0058ae26ae19cfdf7c4c introduced a typo in
command, a whitespace was missing between --new-line-format and path to
original file. As a result, diffconfig task did not work, diff failed
with exit status 2, resulting in empty fragment.cfg.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 0d4b10b..b5adc47 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -58,7 +58,7 @@ python do_diffconfig() {
         bb.fatal("No config files found. Did you do menuconfig ?\n%s" % e)
 
     if isdiff:
-        statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L"' + configorig + ' ' + config + '>' + fragment
+        statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
         subprocess.call(statement, shell=True)
 
         shutil.copy(configorig, config)
-- 
1.9.0


