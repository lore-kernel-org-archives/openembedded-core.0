Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 53DDE6BE1F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 11:04:11 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r84B3lsB028884; 
	Wed, 4 Sep 2013 06:04:12 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 16:05:03 +0500
Message-Id: <1378292703-10358-5-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1378292703-10358-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1378292703-10358-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 5/5] [v6] systemd: Remove base_libdir if installed only for systemd_unitdir
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
X-List-Received-Date: Wed, 04 Sep 2013 11:04:11 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

If a recipe installs systemd_unitdir and it is a non-systemd build than
systemd.bbclass deletes systemd_unitdir (/lib/systemd/) but not
base_libdir (/lib). In this case if base_libdir is empty than following
QA Issue is reported.

ERROR: QA Issue: openssh: Files/directories were installed but not shipped
  /lib

If base_libdir was installed due to systemd_unitdir installation than for
non-systemd build it should also be removed.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/classes/systemd.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 76f0e7d..8ec4992 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -168,6 +168,9 @@ python rm_systemd_unitdir (){
         systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
         if os.path.exists(systemd_unitdir):
             shutil.rmtree(systemd_unitdir)
+        base_libdir = oe.path.join(d.getVar("D", True), d.getVar('base_libdir', True))
+        if (os.path.exists(base_libdir) and not os.listdir(base_libdir)):
+            os.rmdir(base_libdir)
 }
 do_install[postfuncs] += "rm_systemd_unitdir "
 
-- 
1.7.9.5


