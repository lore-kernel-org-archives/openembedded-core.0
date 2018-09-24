Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 426CC7477A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 08:06:11 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id A7C652201C3;
	Mon, 24 Sep 2018 10:06:10 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 10:05:55 +0200
Message-Id: <20180924080555.2407-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH] kernel-yocto.bbclass: fix "referenced before assignment" error
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
X-List-Received-Date: Mon, 24 Sep 2018 08:06:11 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

If "scc --configs" fails, do_kernel_configcheck() crashes like this:

      0338:    try:
      0339:        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
      0340:    except subprocess.CalledProcessError:
  *** 0341:        bb.fatal( "Cannot gather config fragments for audit: %s" % configs)
      0342:
      0343:    try:
      0344:        subprocess.check_call(['kconf_check', '--report', '-o',
      0345:                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s, configs], cwd=s, env=env)
 Exception: UnboundLocalError: local variable 'configs' referenced before assignment

This crash bug was introduced by commit
21de5cc43cfedc703e5bc0515507a6dae36afb74

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 2ecd060093..496c8a7f68 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -337,8 +337,8 @@ python do_kernel_configcheck() {
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
-    except subprocess.CalledProcessError:
-        bb.fatal( "Cannot gather config fragments for audit: %s" % configs)
+    except subprocess.CalledProcessError as e:
+        bb.fatal( "Cannot gather config fragments for audit: %s" % e.output.decode("utf-8") )
 
     try:
         subprocess.check_call(['kconf_check', '--report', '-o',
-- 
2.19.0


