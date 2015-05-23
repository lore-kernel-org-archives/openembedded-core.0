Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9490E6E26B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 May 2015 01:21:59 +0000 (UTC)
Received: by iepj10 with SMTP id j10so42468312iep.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 18:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=690p2frXcOrmCK9r20mPNzyfgcpB7+HZArXW9kKWw4s=;
	b=XP63fGuRceeSgusIT47Ic4tV4xVqED9E4EstjoKSP/b7gHs0+fkpS/mwb8P1I5cB72
	xg/HHUXwg9BnhZP2Drksoiv1tRm46iiSAycvGBAVvoLbJN3ZyyLPLvxULuEGCE9VCSyh
	oo52rwz8Fy+gokt/tfTKmTAS6Ns0tFbEsdXZdTwh1vw2vo8j9b+3aikZh09fZ9xIpaAo
	k0bMNyk9B1PXl/22FSAdD7CeCr4/KABotaG3DXuhMYC8511lVloCo/zsKmLVRWG2xncZ
	RqYFvJO/5T/X/xYdVKEiFYB8lUnx3jk3oZaQ3ubwNSQh5QKEe9RmU/1Q7z2wUdLBVkHX
	4HKA==
X-Received: by 10.107.155.81 with SMTP id d78mr14328383ioe.29.1432344120696;
	Fri, 22 May 2015 18:22:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id p4sm437470igg.20.2015.05.22.18.21.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 18:21:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 18:21:28 -0700
Message-Id: <1432344088-10846-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gnu-config: improve detection of perl setup errors
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
X-List-Received-Date: Sat, 23 May 2015 01:22:03 -0000

Dry-run the 'autoconf --trace ...' command to improve error detection.

If we only read the command's output via a pipe to Autom4te::XFile then
perl setup errors (e.g. mixing host and OE perl libs) which cause the
autoconf command to segfault may go undetected.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---

Warning: This patch causes building of some packages to fail if OE and
host perl versions differ, so should not be merged until those issues
are resolved. To reproduce the current issues:

  - Use a host with perl 5.18 (e.g. Ubuntu 14.04)
  - Apply this patch to oe-core master or fido
  - bitbake -fc configure intltool

 .../gnu-config/gnu-config/gnu-configize.in               | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in b/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
index d4908fc..087fcfc 100755
--- a/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
+++ b/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
@@ -146,22 +146,30 @@ sub gnu_configize_current_directory ()
       return;
     }
 
+  my $autoconf_cmd;
   my $aux_dir;
   my @subdir;
   my $cmd;
   my $dest;
 
   verb "$configure_ac: tracing";
-  my $traces = new Autom4te::XFile
-    ("$autoconf"
+
+  $autoconf_cmd = "$autoconf"
      . join (' --trace=', '',
 	     # If you change this list, update the
 	     # `Autoreconf-preselections' section of autom4te.in.
 	     'AC_CONFIG_AUX_DIR:AC_CONFIG_AUX_DIR:\$1',
 	     'AC_CONFIG_SUBDIRS:AC_CONFIG_SUBDIRS:\$1',
 	     'AC_INIT',
-	    )
-     . ' |');
+	    );
+
+  # Dry-run the 'autoconf --trace ...' command to improve error detection.
+  # If we only read the command's output via a pipe to Autom4te::XFile then
+  # perl setup errors (e.g. mixing host and OE perl libs) which cause the
+  # autoconf command to segfault may go undetected.
+  xsystem ("$autoconf_cmd >/dev/null 2>&1");
+
+  my $traces = new Autom4te::XFile ("$autoconf_cmd |");
   while ($_ = $traces->getline)
     {
       $aux_dir = $1                 if /AC_CONFIG_AUX_DIR:(.*)/;
-- 
1.9.1


