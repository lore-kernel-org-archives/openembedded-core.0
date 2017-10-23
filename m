Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBB147198A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 17:39:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9NHdIwb018479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:39:20 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 23 Oct 2017 10:39:17 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Oct 2017 20:39:16 +0300
Message-ID: <20171023173916.271270-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] git: CVE-2017-14867
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
X-List-Received-Date: Mon, 23 Oct 2017 17:39:19 -0000
Content-Type: text/plain

Git before 2.10.5, 2.11.x before 2.11.4, 2.12.x before 2.12.5, 2.13.x before 
2.13.6, and 2.14.x before 2.14.2 uses unsafe Perl scripts to support 
subcommands such as cvsserver, which allows attackers to execute arbitrary 
OS commands via shell metacharacters in a module name. The vulnerable code 
is reachable via git-shell even without CVS support.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-14867

Upstream patches:
https://github.com/git/git/commit/9a42c03cb71eaa9d41ba67275de38c997a791c32
https://github.com/git/git/commit/fce13af5d20cad8dcb2d0e47bcf01b6960f08e55
https://github.com/git/git/commit/27dd73871f814062737c327103ee43f1eb7f30d9
https://github.com/git/git/commit/46203ac24dc7e6b5a8d4f1b024ed93591705d47b
https://github.com/git/git/commit/5b4efea666951efe0770f8d5a301f8917015315f
https://github.com/git/git/commit/8d0fad0a7a6ba34fd706c148fa7ed1f8eb2b8b26

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../git/git/git-CVE-2017-14867-2.patch             | 121 ++++++++++++++++
 .../git/git/git-CVE-2017-14867-3.patch             | 117 ++++++++++++++++
 .../git/git/git-CVE-2017-14867-4.patch             |  60 ++++++++
 .../git/git/git-CVE-2017-14867-5.patch             |  36 +++++
 .../git/git/git-CVE-2017-14867-6.patch             |  44 ++++++
 .../git/git/git-CVE-2017-14867.patch               | 153 +++++++++++++++++++++
 meta/recipes-devtools/git/git_2.13.3.bb            |   9 ++
 7 files changed, 540 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/git-CVE-2017-14867-2.patch
 create mode 100644 meta/recipes-devtools/git/git/git-CVE-2017-14867-3.patch
 create mode 100644 meta/recipes-devtools/git/git/git-CVE-2017-14867-4.patch
 create mode 100644 meta/recipes-devtools/git/git/git-CVE-2017-14867-5.patch
 create mode 100644 meta/recipes-devtools/git/git/git-CVE-2017-14867-6.patch
 create mode 100644 meta/recipes-devtools/git/git/git-CVE-2017-14867.patch

diff --git a/meta/recipes-devtools/git/git/git-CVE-2017-14867-2.patch b/meta/recipes-devtools/git/git/git-CVE-2017-14867-2.patch
new file mode 100644
index 0000000..0a563a4
--- /dev/null
+++ b/meta/recipes-devtools/git/git/git-CVE-2017-14867-2.patch
@@ -0,0 +1,121 @@
+From fce13af5d20cad8dcb2d0e47bcf01b6960f08e55 Mon Sep 17 00:00:00 2001
+From: Junio C Hamano <gitster@pobox.com>
+Date: Mon, 11 Sep 2017 14:44:24 +0900
+Subject: [PATCH] cvsserver: move safe_pipe_capture() to the main package
+
+As a preparation for replacing `command` with a call to this
+function from outside GITCVS::updater package, move it to the main
+package.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14867
+
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ git-cvsserver.perl | 47 ++++++++++++++++++++++-------------------------
+ 1 file changed, 22 insertions(+), 25 deletions(-)
+
+diff --git a/git-cvsserver.perl b/git-cvsserver.perl
+index d50c85e..8229d9d 100755
+--- a/git-cvsserver.perl
++++ b/git-cvsserver.perl
+@@ -3406,6 +3406,22 @@ sub refHashEqual
+     return $out;
+ }
+ 
++# an alternative to `command` that allows input to be passed as an array
++# to work around shell problems with weird characters in arguments
++
++sub safe_pipe_capture {
++
++    my @output;
++
++    if (my $pid = open my $child, '-|') {
++        @output = (<$child>);
++        close $child or die join(' ',@_).": $! $?";
++    } else {
++        exec(@_) or die "$! $?"; # exec() can fail the executable can't be found
++    }
++    return wantarray ? @output : join('',@output);
++}
++
+ 
+ package GITCVS::log;
+ 
+@@ -3882,7 +3898,7 @@ sub update
+                     # several candidate merge bases. let's assume
+                     # that the first one is the best one.
+ 		    my $base = eval {
+-			    safe_pipe_capture('git', 'merge-base',
++			    ::safe_pipe_capture('git', 'merge-base',
+ 						 $lastpicked, $parent);
+ 		    };
+ 		    # The two branches may not be related at all,
+@@ -4749,7 +4765,7 @@ sub getMetaFromCommithash
+         return $retVal;
+     }
+ 
+-    my($fileHash)=safe_pipe_capture("git","rev-parse","$revCommit:$filename");
++    my($fileHash) = ::safe_pipe_capture("git","rev-parse","$revCommit:$filename");
+     chomp $fileHash;
+     if(!($fileHash=~/^[0-9a-f]{40}$/))
+     {
+@@ -4844,8 +4860,8 @@ sub lookupCommitRef
+         return $commitHash;
+     }
+ 
+-    $commitHash=safe_pipe_capture("git","rev-parse","--verify","--quiet",
+-                                  $self->unescapeRefName($ref));
++    $commitHash = ::safe_pipe_capture("git","rev-parse","--verify","--quiet",
++				      $self->unescapeRefName($ref));
+     $commitHash=~s/\s*$//;
+     if(!($commitHash=~/^[0-9a-f]{40}$/))
+     {
+@@ -4854,7 +4870,7 @@ sub lookupCommitRef
+ 
+     if( defined($commitHash) )
+     {
+-        my $type=safe_pipe_capture("git","cat-file","-t",$commitHash);
++        my $type = ::safe_pipe_capture("git","cat-file","-t",$commitHash);
+         if( ! ($type=~/^commit\s*$/ ) )
+         {
+             $commitHash=undef;
+@@ -4907,7 +4923,7 @@ sub commitmessage
+         return $message;
+     }
+ 
+-    my @lines = safe_pipe_capture("git", "cat-file", "commit", $commithash);
++    my @lines = ::safe_pipe_capture("git", "cat-file", "commit", $commithash);
+     shift @lines while ( $lines[0] =~ /\S/ );
+     $message = join("",@lines);
+     $message .= " " if ( $message =~ /\n$/ );
+@@ -5056,25 +5072,6 @@ sub in_array
+     return $retval;
+ }
+ 
+-=head2 safe_pipe_capture
+-
+-an alternative to `command` that allows input to be passed as an array
+-to work around shell problems with weird characters in arguments
+-
+-=cut
+-sub safe_pipe_capture {
+-
+-    my @output;
+-
+-    if (my $pid = open my $child, '-|') {
+-        @output = (<$child>);
+-        close $child or die join(' ',@_).": $! $?";
+-    } else {
+-        exec(@_) or die "$! $?"; # exec() can fail the executable can't be found
+-    }
+-    return wantarray ? @output : join('',@output);
+-}
+-
+ =head2 mangle_dirname
+ 
+ create a string from a directory name that is suitable to use as
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/git/git/git-CVE-2017-14867-3.patch b/meta/recipes-devtools/git/git/git-CVE-2017-14867-3.patch
new file mode 100644
index 0000000..292c01a
--- /dev/null
+++ b/meta/recipes-devtools/git/git/git-CVE-2017-14867-3.patch
@@ -0,0 +1,117 @@
+From 27dd73871f814062737c327103ee43f1eb7f30d9 Mon Sep 17 00:00:00 2001
+From: joernchen <joernchen@phenoelit.de>
+Date: Mon, 11 Sep 2017 14:45:09 +0900
+Subject: [PATCH] cvsserver: use safe_pipe_capture instead of backticks
+
+This makes the script pass arguments that are derived from end-user
+input in safer way when invoking subcommands.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14867
+
+Reported-by: joernchen <joernchen@phenoelit.de>
+Signed-off-by: joernchen <joernchen@phenoelit.de>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ git-cvsserver.perl | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/git-cvsserver.perl b/git-cvsserver.perl
+index 8229d9d..bd29b26 100755
+--- a/git-cvsserver.perl
++++ b/git-cvsserver.perl
+@@ -841,7 +841,7 @@ sub req_Modified
+     # Save the file data in $state
+     $state->{entries}{$state->{directory}.$data}{modified_filename} = $filename;
+     $state->{entries}{$state->{directory}.$data}{modified_mode} = $mode;
+-    $state->{entries}{$state->{directory}.$data}{modified_hash} = `git hash-object $filename`;
++    $state->{entries}{$state->{directory}.$data}{modified_hash} = safe_pipe_capture('git','hash-object',$filename);
+     $state->{entries}{$state->{directory}.$data}{modified_hash} =~ s/\s.*$//s;
+ 
+     #$log->debug("req_Modified : file=$data mode=$mode size=$size");
+@@ -1463,7 +1463,7 @@ sub req_update
+                 # transmit file, format is single integer on a line by itself (file
+                 # size) followed by the file contents
+                 # TODO : we should copy files in blocks
+-                my $data = `cat $mergedFile`;
++                my $data = safe_pipe_capture('cat', $mergedFile);
+                 $log->debug("File size : " . length($data));
+                 print length($data) . "\n";
+                 print $data;
+@@ -1579,7 +1579,7 @@ sub req_ci
+                 $branchRef = "refs/heads/$stickyInfo->{tag}";
+             }
+ 
+-            $parenthash = `git show-ref -s $branchRef`;
++            $parenthash = safe_pipe_capture('git', 'show-ref', '-s', $branchRef);
+             chomp $parenthash;
+             if ($parenthash !~ /^[0-9a-f]{40}$/)
+             {
+@@ -1704,7 +1704,7 @@ sub req_ci
+     }
+     close $msg_fh;
+ 
+-    my $commithash = `git commit-tree $treehash -p $parenthash < $msg_filename`;
++    my $commithash = safe_pipe_capture('git', 'commit-tree', $treehash, '-p', $parenthash, '-F', $msg_filename);
+     chomp($commithash);
+     $log->info("Commit hash : $commithash");
+ 
+@@ -2854,12 +2854,12 @@ sub transmitfile
+ 
+     die "Need filehash" unless ( defined ( $filehash ) and $filehash =~ /^[a-zA-Z0-9]{40}$/ );
+ 
+-    my $type = `git cat-file -t $filehash`;
++    my $type = safe_pipe_capture('git', 'cat-file', '-t', $filehash);
+     chomp $type;
+ 
+     die ( "Invalid type '$type' (expected 'blob')" ) unless ( defined ( $type ) and $type eq "blob" );
+ 
+-    my $size = `git cat-file -s $filehash`;
++    my $size = safe_pipe_capture('git', 'cat-file', '-s', $filehash);
+     chomp $size;
+ 
+     $log->debug("transmitfile($filehash) size=$size, type=$type");
+@@ -3040,7 +3040,7 @@ sub ensureWorkTree
+     chdir $work->{emptyDir} or
+         die "Unable to chdir to $work->{emptyDir}\n";
+ 
+-    my $ver = `git show-ref -s refs/heads/$state->{module}`;
++    my $ver = safe_pipe_capture('git', 'show-ref', '-s', "refs/heads/$state->{module}");
+     chomp $ver;
+     if ($ver !~ /^[0-9a-f]{40}$/)
+     {
+@@ -3287,7 +3287,7 @@ sub open_blob_or_die
+             die "Need filehash\n";
+         }
+ 
+-        my $type = `git cat-file -t $name`;
++        my $type = safe_pipe_capture('git', 'cat-file', '-t', $name);
+         chomp $type;
+ 
+         unless ( defined ( $type ) and $type eq "blob" )
+@@ -3296,7 +3296,7 @@ sub open_blob_or_die
+             die ( "Invalid type '$type' (expected 'blob')" )
+         }
+ 
+-        my $size = `git cat-file -s $name`;
++        my $size = safe_pipe_capture('git', 'cat-file', '-s', $name);
+         chomp $size;
+ 
+         $log->debug("open_blob_or_die($name) size=$size, type=$type");
+@@ -3813,10 +3813,10 @@ sub update
+     # first lets get the commit list
+     $ENV{GIT_DIR} = $self->{git_path};
+ 
+-    my $commitsha1 = `git rev-parse $self->{module}`;
++    my $commitsha1 = ::safe_pipe_capture('git', 'rev-parse', $self->{module});
+     chomp $commitsha1;
+ 
+-    my $commitinfo = `git cat-file commit $self->{module} 2>&1`;
++    my $commitinfo = ::safe_pipe_capture('git', 'cat-file', 'commit', $self->{module});
+     unless ( $commitinfo =~ /tree\s+[a-zA-Z0-9]{40}/ )
+     {
+         die("Invalid module '$self->{module}'");
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/git/git/git-CVE-2017-14867-4.patch b/meta/recipes-devtools/git/git/git-CVE-2017-14867-4.patch
new file mode 100644
index 0000000..4b44491
--- /dev/null
+++ b/meta/recipes-devtools/git/git/git-CVE-2017-14867-4.patch
@@ -0,0 +1,60 @@
+From 46203ac24dc7e6b5a8d4f1b024ed93591705d47b Mon Sep 17 00:00:00 2001
+From: Junio C Hamano <gitster@pobox.com>
+Date: Mon, 11 Sep 2017 14:45:54 +0900
+Subject: [PATCH] cvsserver: use safe_pipe_capture for `constant commands` as
+ well
+
+This is not strictly necessary, but it is a good code hygiene.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14867
+
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ git-cvsserver.perl | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/git-cvsserver.perl b/git-cvsserver.perl
+index bd29b26..ae10442 100755
+--- a/git-cvsserver.perl
++++ b/git-cvsserver.perl
+@@ -356,7 +356,7 @@ sub req_Root
+        return 0;
+     }
+ 
+-    my @gitvars = `git config -l`;
++    my @gitvars = safe_pipe_capture(qw(git config -l));
+     if ($?) {
+        print "E problems executing git-config on the server -- this is not a git repository or the PATH is not set correctly.\n";
+         print "E \n";
+@@ -943,7 +943,7 @@ sub req_co
+ 
+     # Provide list of modules, if -c was used.
+     if (exists $state->{opt}{c}) {
+-        my $showref = `git show-ref --heads`;
++        my $showref = safe_pipe_capture(qw(git show-ref --heads));
+         for my $line (split '\n', $showref) {
+             if ( $line =~ m% refs/heads/(.*)$% ) {
+                 print "M $1\t$1\n";
+@@ -1181,7 +1181,7 @@ sub req_update
+     # projects (heads in this case) to checkout.
+     #
+     if ($state->{module} eq '') {
+-        my $showref = `git show-ref --heads`;
++        my $showref = safe_pipe_capture(qw(git show-ref --heads));
+         print "E cvs update: Updating .\n";
+         for my $line (split '\n', $showref) {
+             if ( $line =~ m% refs/heads/(.*)$% ) {
+@@ -1687,7 +1687,7 @@ sub req_ci
+         return;
+     }
+ 
+-    my $treehash = `git write-tree`;
++    my $treehash = safe_pipe_capture(qw(git write-tree));
+     chomp $treehash;
+ 
+     $log->debug("Treehash : $treehash, Parenthash : $parenthash");
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/git/git/git-CVE-2017-14867-5.patch b/meta/recipes-devtools/git/git/git-CVE-2017-14867-5.patch
new file mode 100644
index 0000000..b665708
--- /dev/null
+++ b/meta/recipes-devtools/git/git/git-CVE-2017-14867-5.patch
@@ -0,0 +1,36 @@
+From 5b4efea666951efe0770f8d5a301f8917015315f Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Mon, 11 Sep 2017 10:24:26 -0400
+Subject: [PATCH] cvsimport: shell-quote variable used in backticks
+
+We run `git rev-parse` though the shell, and quote its
+argument only with single-quotes. This prevents most
+metacharacters from being a problem, but misses the obvious
+case when $name itself has single-quotes in it. We can fix
+this by applying the usual shell-quoting formula.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14867
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ git-cvsimport.perl | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/git-cvsimport.perl b/git-cvsimport.perl
+index 1e4e65a..3692992 100755
+--- a/git-cvsimport.perl
++++ b/git-cvsimport.perl
+@@ -642,6 +642,7 @@ sub is_sha1 {
+ 
+ sub get_headref ($) {
+ 	my $name = shift;
++	$name =~ s/'/'\\''/;
+ 	my $r = `git rev-parse --verify '$name' 2>/dev/null`;
+ 	return undef unless $? == 0;
+ 	chomp $r;
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/git/git/git-CVE-2017-14867-6.patch b/meta/recipes-devtools/git/git/git-CVE-2017-14867-6.patch
new file mode 100644
index 0000000..c4e9a4c
--- /dev/null
+++ b/meta/recipes-devtools/git/git/git-CVE-2017-14867-6.patch
@@ -0,0 +1,44 @@
+From 8d0fad0a7a6ba34fd706c148fa7ed1f8eb2b8b26 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Mon, 11 Sep 2017 10:24:11 -0400
+Subject: [PATCH] archimport: use safe_pipe_capture for user input
+
+Refnames can contain shell metacharacters which need to be
+passed verbatim to sub-processes. Using safe_pipe_capture
+skips the shell entirely.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14867
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ git-archimport.perl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git-archimport.perl b/git-archimport.perl
+index 9cb123a..b7c173c 100755
+--- a/git-archimport.perl
++++ b/git-archimport.perl
+@@ -983,7 +983,7 @@ sub find_parents {
+ 	# check that we actually know about the branch
+ 	next unless -e "$git_dir/refs/heads/$branch";
+ 
+-	my $mergebase = `git-merge-base $branch $ps->{branch}`;
++	my $mergebase = safe_pipe_capture(qw(git-merge-base), $branch, $ps->{branch});
+ 	if ($?) {
+ 	    # Don't die here, Arch supports one-way cherry-picking
+ 	    # between branches with no common base (or any relationship
+@@ -1074,7 +1074,7 @@ sub find_parents {
+ 
+ sub git_rev_parse {
+     my $name = shift;
+-    my $val  = `git-rev-parse $name`;
++    my $val  = safe_pipe_capture(qw(git-rev-parse), $name);
+     die "Error: git-rev-parse $name" if $?;
+     chomp $val;
+     return $val;
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/git/git/git-CVE-2017-14867.patch b/meta/recipes-devtools/git/git/git-CVE-2017-14867.patch
new file mode 100644
index 0000000..daea3b2
--- /dev/null
+++ b/meta/recipes-devtools/git/git/git-CVE-2017-14867.patch
@@ -0,0 +1,153 @@
+From 9a42c03cb71eaa9d41ba67275de38c997a791c32 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Mon, 11 Sep 2017 11:27:51 -0400
+Subject: [PATCH] shell: drop git-cvsserver support by default
+
+The git-cvsserver script is old and largely unmaintained
+these days. But git-shell allows untrusted users to run it
+out of the box, significantly increasing its attack surface.
+
+Let's drop it from git-shell's list of internal handlers so
+that it cannot be run by default.  This is not backwards
+compatible. But given the age and development activity on
+CVS-related parts of Git, this is likely to impact very few
+users, while helping many more (i.e., anybody who runs
+git-shell and had no intention of supporting CVS).
+
+There's no configuration mechanism in git-shell for us to
+add a boolean and flip it to "off". But there is a mechanism
+for adding custom commands, and adding CVS support here is
+fairly trivial. Let's document it to give guidance to
+anybody who really is still running cvsserver.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14867
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Documentation/git-shell.txt     | 16 ++++++++++++++
+ shell.c                         | 14 ------------
+ t/t9400-git-cvsserver-server.sh | 48 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 64 insertions(+), 14 deletions(-)
+
+diff --git a/Documentation/git-shell.txt b/Documentation/git-shell.txt
+index 2e30a3e..54cf256 100644
+--- a/Documentation/git-shell.txt
++++ b/Documentation/git-shell.txt
+@@ -79,6 +79,22 @@ EOF
+ $ chmod +x $HOME/git-shell-commands/no-interactive-login
+ ----------------
+ 
++To enable git-cvsserver access (which should generally have the
++`no-interactive-login` example above as a prerequisite, as creating
++the git-shell-commands directory allows interactive logins):
++
++----------------
++$ cat >$HOME/git-shell-commands/cvs <<\EOF
++if ! test $# = 1 && test "$1" = "server"
++then
++	echo >&2 "git-cvsserver only handles \"server\""
++	exit 1
++fi
++exec git cvsserver server
++EOF
++$ chmod +x $HOME/git-shell-commands/cvs
++----------------
++
+ SEE ALSO
+ --------
+ ssh(1),
+diff --git a/shell.c b/shell.c
+index fe2d314..234b2d4 100644
+--- a/shell.c
++++ b/shell.c
+@@ -25,19 +25,6 @@ static int do_generic_cmd(const char *me, char *arg)
+ 	return execv_git_cmd(my_argv);
+ }
+ 
+-static int do_cvs_cmd(const char *me, char *arg)
+-{
+-	const char *cvsserver_argv[3] = {
+-		"cvsserver", "server", NULL
+-	};
+-
+-	if (!arg || strcmp(arg, "server"))
+-		die("git-cvsserver only handles server: %s", arg);
+-
+-	setup_path();
+-	return execv_git_cmd(cvsserver_argv);
+-}
+-
+ static int is_valid_cmd_name(const char *cmd)
+ {
+ 	/* Test command contains no . or / characters */
+@@ -134,7 +121,6 @@ static struct commands {
+ 	{ "git-receive-pack", do_generic_cmd },
+ 	{ "git-upload-pack", do_generic_cmd },
+ 	{ "git-upload-archive", do_generic_cmd },
+-	{ "cvs", do_cvs_cmd },
+ 	{ NULL },
+ };
+ 
+diff --git a/t/t9400-git-cvsserver-server.sh b/t/t9400-git-cvsserver-server.sh
+index 432c61d..c30660d 100755
+--- a/t/t9400-git-cvsserver-server.sh
++++ b/t/t9400-git-cvsserver-server.sh
+@@ -588,4 +588,52 @@ test_expect_success 'cvs annotate' '
+     test_cmp ../expect ../actual
+ '
+ 
++#------------
++# running via git-shell
++#------------
++
++cd "$WORKDIR"
++
++test_expect_success 'create remote-cvs helper' '
++	write_script remote-cvs <<-\EOF
++	exec git shell -c "cvs server"
++	EOF
++'
++
++test_expect_success 'cvs server does not run with vanilla git-shell' '
++	(
++		cd cvswork &&
++		CVS_SERVER=$WORKDIR/remote-cvs &&
++		export CVS_SERVER &&
++		test_must_fail cvs log merge
++	)
++'
++
++test_expect_success 'configure git shell to run cvs server' '
++	mkdir "$HOME"/git-shell-commands &&
++
++	write_script "$HOME"/git-shell-commands/cvs <<-\EOF &&
++	if ! test $# = 1 && test "$1" = "server"
++	then
++		echo >&2 "git-cvsserver only handles \"server\""
++		exit 1
++	fi
++	exec git cvsserver server
++	EOF
++
++	# Should not be used, but part of the recommended setup
++	write_script "$HOME"/git-shell-commands/no-interactive-login <<-\EOF
++	echo Interactive login forbidden
++	EOF
++'
++
++test_expect_success 'cvs server can run with recommended config' '
++	(
++		cd cvswork &&
++		CVS_SERVER=$WORKDIR/remote-cvs &&
++		export CVS_SERVER &&
++		cvs log merge
++	)
++'
++
+ test_done
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/git/git_2.13.3.bb b/meta/recipes-devtools/git/git_2.13.3.bb
index b3e3887..bf679c9 100644
--- a/meta/recipes-devtools/git/git_2.13.3.bb
+++ b/meta/recipes-devtools/git/git_2.13.3.bb
@@ -9,3 +9,12 @@ SRC_URI[tarball.md5sum] = "d2dc550f6693ba7e5b16212b2714f59f"
 SRC_URI[tarball.sha256sum] = "1497001772f630d49809e981672edfe3e3ce1a1d18e905cd539c4d2f4dbcd75a"
 SRC_URI[manpages.md5sum] = "3037d11a4f4cdd19435871c267ca48b4"
 SRC_URI[manpages.sha256sum] = "f9b302eeb08ce08934e7afb42280ce9294411fbf5f7b6ac3fcc236e8031f10c5"
+
+SRC_URI += "\
+    file://git-CVE-2017-14867.patch \
+    file://git-CVE-2017-14867-2.patch \
+    file://git-CVE-2017-14867-3.patch \
+    file://git-CVE-2017-14867-4.patch \
+    file://git-CVE-2017-14867-5.patch \
+    file://git-CVE-2017-14867-6.patch \
+    "
-- 
2.10.2


