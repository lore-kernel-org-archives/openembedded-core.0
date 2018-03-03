Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C52D978A62
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 17:08:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23H8lYd025243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 17:08:48 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1esAeN-0003LO-4r; Sat, 03 Mar 2018 17:08:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 17:08:44 +0000
Message-Id: <1520096924-12804-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520096924-12804-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1520096924-12804-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/3] base: Handle backfilling in anonymous python code, not event handler
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
X-List-Received-Date: Sat, 03 Mar 2018 17:08:48 -0000

Handling of backfilling is trickier than you'd think. We need this to execute
early enough that the user will see the changes in bitbake -e and other output
yet late enough that the virtclass extensions have changed the tunes before
it executes.

It makes more sense to execute this at anonymous python time now bitbake -e
correctly handles this and that unbreaks multilib corruption of these variables.

[YOCTO #12373]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b0a72c7..e0b76f0 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -222,8 +222,6 @@ python base_eventhandler() {
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
         d.setVar('BB_VERSION', bb.__version__)
-        oe.utils.features_backfill("DISTRO_FEATURES", d)
-        oe.utils.features_backfill("MACHINE_FEATURES", d)
         # Works with the line in layer.conf which changes PATH to point here
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
@@ -382,6 +380,10 @@ def set_packagetriplet(d):
 python () {
     import string, re
 
+    # Handle backfilling
+    oe.utils.features_backfill("DISTRO_FEATURES", d)
+    oe.utils.features_backfill("MACHINE_FEATURES", d)
+
     # Handle PACKAGECONFIG
     #
     # These take the form:
-- 
2.7.4


