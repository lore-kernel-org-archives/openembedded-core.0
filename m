Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 131376FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 19:40:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3RJeuHT017793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 12:40:56 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Apr 2017 12:40:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Apr 2017 14:41:04 -0500
Message-ID: <1493322064-68129-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [master & pyro][PATCH] useradd-statids.bbclass: Add support for -P / --clear-password option
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
X-List-Received-Date: Thu, 27 Apr 2017 19:40:56 -0000
Content-Type: text/plain

The commit 31dee7946340bf0f1e94e4e714191d3d6ca3bf6a added a new useradd and
groupadd option to specify a clear text password.  The parsing logic in the
useradd-staticid class did not understand this new option.  If the
meta-skeleton examples were run with the class enabled an error would be
generated, as an example uses the -P option.

Note, the code has a check that we do not attempt to set both a crypt and
clear text password.  It is not allowed that these two options are set
at the same time, so we prefer the crypt option if they happen to be.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/useradd-staticids.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index c156a12..2d282c0 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -77,6 +77,7 @@ def update_useradd_static_config(d):
         parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
         parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
         parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
+        parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")
         parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
         parser.add_argument("-r", "--system", help="create a system account", action="store_true")
         parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
@@ -195,7 +196,10 @@ def update_useradd_static_config(d):
             newparam += ['', ' --no-create-home'][uaargs.create_home is False]
             newparam += ['', ' --no-user-group'][uaargs.user_group is False]
             newparam += ['', ' --non-unique'][uaargs.non_unique]
-            newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
+            if uaargs.password != None:
+                newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
+            elif uaargs.clear_password:
+                newparam += ['', ' --clear-password %s' % uaargs.clear_password][uaargs.clear_password != None]
             newparam += ['', ' --root %s' % uaargs.root][uaargs.root != None]
             newparam += ['', ' --system'][uaargs.system]
             newparam += ['', ' --shell %s' % uaargs.shell][uaargs.shell != None]
@@ -216,6 +220,7 @@ def update_useradd_static_config(d):
         parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
         parser.add_argument("-o", "--non-unique", help="allow to create groups with duplicate (non-unique) GID", action="store_true")
         parser.add_argument("-p", "--password", metavar="PASSWORD", help="use this encrypted password for the new group")
+        parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new group")
         parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
         parser.add_argument("-r", "--system", help="create a system account", action="store_true")
         parser.add_argument("GROUP", help="Group name of the new group")
@@ -277,7 +282,10 @@ def update_useradd_static_config(d):
             newparam += ['', ' --gid %s' % gaargs.gid][gaargs.gid != None]
             newparam += ['', ' --key %s' % gaargs.key][gaargs.key != None]
             newparam += ['', ' --non-unique'][gaargs.non_unique]
-            newparam += ['', ' --password %s' % gaargs.password][gaargs.password != None]
+            if gaargs.password != None:
+                newparam += ['', ' --password %s' % gaargs.password][gaargs.password != None]
+            elif gaargs.clear_password:
+                newparam += ['', ' --clear-password %s' % gaargs.clear_password][gaargs.clear_password != None]
             newparam += ['', ' --root %s' % gaargs.root][gaargs.root != None]
             newparam += ['', ' --system'][gaargs.system]
             newparam += ' %s' % gaargs.GROUP
-- 
1.8.3.1


