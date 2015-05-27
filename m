Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id DAFAB73232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:06:23 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so97637028igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DHJ38kRNMn0k8jS92Dyy4hv3A8kkBhZCzEOdRIqfVJk=;
	b=hQgUtddEPVsbGUHqayk3CPCdtVvBBGF+GwQLjg2C9PfomhoIPYfaCSPY8vixe9CxmW
	YnR/pZf/F3I0AESGU7wevqSCX1CJkdvJuOuPQdg/IGEC+SnM5f5oDO78YJQy3lZM6Nsv
	2CbA0Q0rrYnFYgnjlr16mxtGan/tzIxLuDnMIDrY0GNAODcvjTzWcWKy0aX3Lg53dglj
	8UNHJnkfUHxIzuiVxAUUWIQVdTLeiSi2gOYaH9J3zeO9r/Ty3ErxXMOCjoDTGsDQGoQ7
	qOoMtuO7yLA2hc4kOvCNTBp+nzOS9Zh8AkeRvI15feyHZ3OdOyTJj2CLn9jfWOYWX+U0
	TctQ==
X-Received: by 10.43.59.80 with SMTP id wn16mr5842875icb.40.1432760784395;
	Wed, 27 May 2015 14:06:24 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ot6sm2656466igb.11.2015.05.27.14.06.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 14:06:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 14:06:11 -0700
Message-Id: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 1/3] gnu-config: improve detection of perl setup errors
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
X-List-Received-Date: Wed, 27 May 2015 21:06:27 -0000

Read 'autoconf --trace' output via a temp file to improve error detection.

If the command's output is read via a pipe to Autom4te::XFile then perl
setup errors (e.g. mixing host and OE perl libs) which cause the autoconf
command to segfault may go undetected.

Add a -k / --continue command line option to simulate the old behaviour.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gnu-config/gnu-config/gnu-configize.in         | 32 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in b/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
index d4908fc..c3dcd74 100755
--- a/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
+++ b/meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
@@ -45,6 +45,7 @@ use Autom4te::General;
 use Autom4te::XFile;
 # Do not use Cwd::chdir, since it might hang.
 use Cwd 'cwd';
+use File::Temp qw/ tempfile /;
 use strict;
 
 ## ----------- ##
@@ -64,6 +65,7 @@ Operation modes:
   -V, --version            print version number, then exit
   -v, --verbose            verbosely report processing
   -f, --force              consider all files obsolete
+  -k, --continue           ignore errors when running autoconf
   -s, --symlink            install symbolic links instead of copies
   -W, --warnings=CATEGORY  report the warnings falling in CATEGORY [syntax]
 
@@ -86,6 +88,8 @@ my $configdir  = '@gnu-configdir@';
 #'/home/kergoth/code/build-arm/tmp/staging/i686-linux/share/gnu-config';
 my $autoconf   = $ENV{'AUTOCONF'}     || 'autoconf';
 
+my $ignore_autoconf_errors = 0;
+
 # use symlinks instead.
 my $symlink = 0;
 
@@ -109,6 +113,7 @@ sub parse_args ()
 {
   my $srcdir;
 
+  getopt ('k|continue'           => \$ignore_autoconf_errors);
   getopt ('s|symlink'            => \$symlink);
 
   # Even if the user specified a configure.ac, trim to get the
@@ -152,16 +157,33 @@ sub gnu_configize_current_directory ()
   my $dest;
 
   verb "$configure_ac: tracing";
-  my $traces = new Autom4te::XFile
-    ("$autoconf"
+
+  my $autoconf_cmd = "$autoconf"
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
+  # Read 'autoconf --trace' output via a temp file to improve error detection.
+  # If the command's output is read via a pipe to Autom4te::XFile then perl
+  # setup errors (e.g. mixing host and OE perl libs) which cause the autoconf
+  # command to segfault may go undetected.
+
+  my $tmp = File::Temp->new();
+
+  if ($ignore_autoconf_errors)
+    {
+      xsystem ("$autoconf_cmd > $tmp || true");
+    }
+  else
+    {
+      xsystem ("$autoconf_cmd > $tmp");
+    }
+
+  my $traces = new Autom4te::XFile ("< $tmp");
   while ($_ = $traces->getline)
     {
       $aux_dir = $1                 if /AC_CONFIG_AUX_DIR:(.*)/;
@@ -169,6 +191,8 @@ sub gnu_configize_current_directory ()
       push @subdir, split (' ', $1) if /AC_CONFIG_SUBDIRS:(.*)/;
     }
 
+  close $tmp;
+
   # The subdirs are *optional*, they may not exist.
   foreach (@subdir)
     {
-- 
1.9.1


