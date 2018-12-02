Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id A369F6C5B4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:58:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x10so9739187wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hG5zhrZ3qkr83yZJAYThV6zsJbeISG7SO0irnTjQs+8=;
	b=rszIl/Bv80nAH1SAzY9qcnicNYRmFOrdatTjXZRCaEkYD4ipwWGuNva0XWP/UNnKVa
	ZhdHZKB5xzZ96RiLzjnAJyFjtpL7VFT2gANkNk/78fE2DpZ1lAK+Vnw5O4XEzPET8AOW
	BBPxcq3hUYB08tXCzPdrBVzGZ6BXLlCXbdZkfjOsis4w9UjC1HiJctu8mnW9fIW3zXBt
	QrAp+mJbt60yf0wf38M16o3TgDblPPIAWEN6pJEZ93no+iQBJLglhdgRUyqhZljOqjWc
	5QEdV5qmqN9APrWtLn7aOHV6W/To8nPc90DhssFHkiRmEaqa+0dP9ZEsACsRWscNF+X3
	1ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hG5zhrZ3qkr83yZJAYThV6zsJbeISG7SO0irnTjQs+8=;
	b=Smef/qDQl5FdUQWAbzqvzZh3N3RT5a8o0UwSXid2x9DMuKpIqGO3tzhXieebtWVHhW
	mWcOYeoiPsgd5xAcvHo8rVUOssw7rTJfrR3v4lGGYKuJ4YnQYH/OdAaoApjwFcGWaFO5
	Cp8MrFZcq4zgfvo4nNsKBWMkcuvlXRLYp3gfZ+F4QwJ15o9JTRnoUay0yLbEpf2VRAe5
	ryuODsv9b9lJfUNJpSvcCDz1xB3b0N+5WXEWYcn8XkBCE+YlrvDuZ8NUCEoI0k+Rd3V3
	GJwHYarTy2LmMaFeRN4oysHphjm24QxzbMmWqo3B9u/coKZaLSSuE1B5fesQs/FpS++a
	VSxA==
X-Gm-Message-State: AA+aEWbh0t+H9fIODYeBl6tHxL15DoP+J22vg7rUvKAnH0sIsn2g/IHO
	HzhJnSEijUmCaoUoHQyd2epI1kH4
X-Google-Smtp-Source: AFSGD/UPQ8Hn8/YSGjnTLACGXHTPjQ+OblLRXAHYmRMWUjdHLR5Pdo17b9tfQW9ACIKJ3zJV7rqkxw==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr11506735wrr.51.1543769921200; 
	Sun, 02 Dec 2018 08:58:41 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	k135sm6872346wmd.42.2018.12.02.08.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 08:58:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2018 17:58:29 +0100
Message-Id: <239b0b88890c60ee78f242d43d2aeeb6eeea0ee2.1543769657.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
References: <cover.1543769657.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
References: <cover.1543769657.git.alex.kanavin@gmail.com>
Subject: [PATCH 1/4] perl: add a version that builds the recipe using perl-cross, and update to 5.28.0
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
X-List-Received-Date: Sun, 02 Dec 2018 16:58:43 -0000

perl-cross is a build system overlay from buildroot project that aims to bring
a bit of sanity to cross-building perl. The advantage of using that is that we
can drop a lot of custom patches (that no one really understands), and simplify
the perl recipe as well. Also the build time goes down from several minutes to
about 30 seconds. The whole thing becomes maintainable again, in my opinion.

When rewriting the recipe I had two goals in mind:
1. Stay with upstream defaults as much as possible
2. Add custom patches only when their necessity was proven through testing.

http://arsv.github.io/perl-cross/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...er-add-LDFLAGS-when-linking-binary-m.patch |   26 +
 ...ule-breaks-through-the-perl-wrapper-.patch |   34 +
 ...h-do-not-quote-the-argument-to-comma.patch |   29 +
 ...oss-add-LDFLAGS-when-linking-libperl.patch |   27 +
 .../perl-sanity/files/errno_ver.diff          |   37 +
 .../perl-sanity/files/native-perlinc.patch    |   26 +
 .../files/perl-configpm-switch.patch          |   47 +
 .../perl-sanity/files/perl-dynloader.patch    |   38 +
 .../perl-sanity/files/run-ptest               |    2 +
 .../perl-sanity/perl-ptest.inc                |   57 +
 .../perl-sanity/perl-rdepends_5.28.0.inc      | 2173 +++++++++++++++++
 .../perl-sanity/perl_5.28.0.bb                |  224 ++
 12 files changed, 2720 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/errno_ver.diff
 create mode 100644 meta/recipes-devtools/perl-sanity/files/native-perlinc.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/perl-dynloader.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/run-ptest
 create mode 100644 meta/recipes-devtools/perl-sanity/perl-ptest.inc
 create mode 100644 meta/recipes-devtools/perl-sanity/perl-rdepends_5.28.0.inc
 create mode 100644 meta/recipes-devtools/perl-sanity/perl_5.28.0.bb

diff --git a/meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch b/meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
new file mode 100644
index 00000000000..7d5c079b2d0
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
@@ -0,0 +1,26 @@
+From 2f74a899474f428a4a5368a94accf801c5f97ae4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 4 Jun 2018 18:33:50 +0300
+Subject: [PATCH] ExtUtils-MakeMaker: add $(LDFLAGS) when linking binary
+ modules
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index fe53be1..249c048 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -1050,7 +1050,7 @@ sub xs_make_dynamic_lib {
+     }
+ 
+     push @m, sprintf <<'MAKE', $ld_run_path_shell, $ldrun, $dlsyms_arg, $ldfrom, $self->xs_obj_opt('$@'), $libs, $exportlist;
+-	%s$(LD) %s $(LDDLFLAGS) %s %s $(OTHERLDFLAGS) %s $(MYEXTLIB) \
++	%s$(LD) %s $(LDDLFLAGS) %s %s $(LDFLAGS) $(OTHERLDFLAGS) %s $(MYEXTLIB) \
+ 	  $(PERL_ARCHIVE) %s $(PERL_ARCHIVE_AFTER) %s \
+ 	  $(INST_DYNAMIC_FIX)
+ 	$(CHMOD) $(PERM_RWX) $@
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
new file mode 100644
index 00000000000..ed8ec1d4168
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -0,0 +1,34 @@
+From e8e095b9c71c58f8197d6315359446b6b084cb2b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 5 Jun 2018 14:58:42 +0300
+Subject: [PATCH] Somehow this module breaks through the perl wrapper and
+ declares perl binary to be 'perl.real'. This patch forces it back to perl.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index 948c476..f537526 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -1110,6 +1110,9 @@ WARNING
+     }
+ 
+     foreach my $name (@$names){
++        # Getting MakeMaker.pm use perl wrapper instead of 'perl.real' directly
++        $name =~ s/perl\.real/perl/ if ($name =~ /perl\.real/);
++
+         my ($abs, $use_dir);
+         if ($self->file_name_is_absolute($name)) {     # /foo/bar
+             $abs = $name;
+@@ -2006,6 +2009,7 @@ sub init_PERL {
+ 
+     $self->{PERL} ||=
+         $self->find_perl(5.0, \@perls, \@defpath, $Verbose );
++    
+ 
+     my $perl = $self->{PERL};
+     $perl =~ s/^"//;
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
new file mode 100644
index 00000000000..0aaeaa29ebb
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
@@ -0,0 +1,29 @@
+From a66811c487ecf8ba8724879c253bb10dfa82aeb5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 1 Jun 2018 19:57:32 +0300
+Subject: [PATCH] configure_tool.sh: do not quote the argument to 'command'
+
+As it seems to break things if the argument has spaces and arguments in it.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ cnf/configure_tool.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cnf/configure_tool.sh b/cnf/configure_tool.sh
+index 32201c0..461bc68 100644
+--- a/cnf/configure_tool.sh
++++ b/cnf/configure_tool.sh
+@@ -2,7 +2,7 @@
+ 
+ tryprog() {
+ 	log "trying $1=$2"
+-	if command -v "$2" 1>/dev/null 2>/dev/null; then
++	if command -v $2 1>/dev/null 2>/dev/null; then
+ 		define "$1" "$2"
+ 		result "$2"
+ 		return 0
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
new file mode 100644
index 00000000000..e7985036a03
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
@@ -0,0 +1,27 @@
+From f824cbec9ac8f113a4ae35d57bd18625d415a71b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Nov 2018 15:37:40 +0100
+Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 01644cd..be811a7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -180,7 +180,7 @@ endif
+ 
+ ifeq ($(useshrplib),true)
+ $(LIBPERL):
+-	$(CC) $(LDDLFLAGS) -o $@ $(filter %$o,$^) $(LIBS)
++	$(CC) $(LDFLAGS) $(LDDLFLAGS) -o $@ $(filter %$o,$^) $(LIBS)
+ else
+ $(LIBPERL):
+ 	$(AR) cru $@ $(filter %$o,$^)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/perl-sanity/files/errno_ver.diff b/meta/recipes-devtools/perl-sanity/files/errno_ver.diff
new file mode 100644
index 00000000000..a965fbeeecf
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/errno_ver.diff
@@ -0,0 +1,37 @@
+From 8e1efba7560d8d55524c7a0f1b0539ddce419b86 Mon Sep 17 00:00:00 2001
+From: Brendan O'Dea <bod@debian.org>
+Date: Fri, 16 Dec 2005 01:32:14 +1100
+Subject: [PATCH 6/8] Remove Errno version check due to upgrade problems with
+ long-running processes.
+
+Bug-Debian: http://bugs.debian.org/343351
+
+Remove version check which can cause problems for long running
+processes embedding perl when upgrading to a newer version,
+compatible, but built on a different machine.
+
+Patch-Name: debian/errno_ver.diff
+Upstream-Status: Pending
+---
+ ext/Errno/Errno_pm.PL | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
+index 6251a3c..eeed445 100644
+--- a/ext/Errno/Errno_pm.PL
++++ b/ext/Errno/Errno_pm.PL
+@@ -294,11 +294,6 @@ EDQ
+     # they've already declared perl doesn't need to worry about this risk.
+     if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
+         print <<"CONFIG_CHECK_END";
+-use Config;
+-"\$Config{'archname'}-\$Config{'osvers'}" eq
+-"$archname-$Config{'osvers'}" or
+-	die "Errno architecture ($archname-$Config{'osvers'}) does not match executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
+-
+ CONFIG_CHECK_END
+ }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/perl-sanity/files/native-perlinc.patch b/meta/recipes-devtools/perl-sanity/files/native-perlinc.patch
new file mode 100644
index 00000000000..f0bb1f65969
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/native-perlinc.patch
@@ -0,0 +1,26 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
+===================================================================
+--- perl-5.12.3.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
++++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
+@@ -1597,6 +1597,19 @@
+ 	$self->{PERL_LIB}     ||= $Config{privlibexp};
+ 	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
+ 	$self->{PERL_INC}     = $self->catdir("$self->{PERL_ARCHLIB}","CORE"); # wild guess for now
++	# Check for environment override so we'll find the headers in the correct place
++        if (defined $ENV{PERL_LIB})
++        {
++            $self->{PERL_LIB} = $ENV{PERL_LIB};
++        }
++        if (defined $ENV{PERL_ARCHLIB})
++        {
++            $self->{PERL_ARCHLIB} = $ENV{PERL_ARCHLIB};
++        }
++        if (defined $ENV{PERL_INC})
++        {
++            $self->{PERL_INC} = $ENV{PERL_INC};
++        }
+ 	my $perl_h;
+ 
+ 	if (not -f ($perl_h = $self->catfile($self->{PERL_INC},"perl.h"))
diff --git a/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
new file mode 100644
index 00000000000..c6cc15c93f0
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
@@ -0,0 +1,47 @@
+Upstream-Status:Inappropriate [native]
+
+This patch is used for perl-native only. It enables the switching of
+configuration files between Config_heavy.pl and
+Config_heavy-target.pl by setting the environment variables
+PERLCONFIGTARGET - the later containing settings for the target while
+the former contains those for the host. This will allow cpan.bbclass
+to use the settings appropriate for the native and/or target builds
+as required. This also disables the use of the cache since the cached
+values would be valid for the host only.
+
+Index: perl-5.14.2/configpm
+===================================================================
+--- perl-5.14.2.orig/configpm
++++ perl-5.14.2/configpm
+@@ -658,7 +658,7 @@ sub FETCH {
+     my($self, $key) = @_;
+ 
+     # check for cached value (which may be undef so we use exists not defined)
+-    return exists $self->{$key} ? $self->{$key} : $self->fetch_string($key);
++    return $self->fetch_string($key);
+ }
+ 
+ ENDOFEND
+@@ -816,7 +816,21 @@ $config_txt .= sprintf <<'ENDOFTIE', $fa
+ sub DESTROY { }
+ 
+ sub AUTOLOAD {
+-    require 'Config_heavy.pl';
++    my $cfgfile = 'Config_heavy.pl';
++    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} eq "yes")
++    {
++        $cfgfile = 'Config_heavy-target.pl';
++    }
++    if (defined $ENV{PERL_ARCHLIB})
++    {
++        push @INC, $ENV{PERL_ARCHLIB};
++        require $cfgfile;
++        pop @INC;
++    }
++    else
++    {
++        require $cfgfile;
++    }
+     goto \&launcher unless $Config::AUTOLOAD =~ /launcher$/;
+     die "&Config::AUTOLOAD failed on $Config::AUTOLOAD";
+ }
diff --git a/meta/recipes-devtools/perl-sanity/files/perl-dynloader.patch b/meta/recipes-devtools/perl-sanity/files/perl-dynloader.patch
new file mode 100644
index 00000000000..6bb832a4266
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/perl-dynloader.patch
@@ -0,0 +1,38 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+Allow the location that .so files are searched for for dynamic
+loading to be changed via an environment variable. This is to allow
+us to load .so's from the host system while building for the target
+system.
+
+Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
+
+Index: perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
+===================================================================
+--- perl-5.24.1.orig/dist/XSLoader/XSLoader_pm.PL
++++ perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
+@@ -52,6 +52,24 @@ sub load {
+     my ($caller, $modlibname) = caller();
+     my $module = $caller;
+ 
++    # OE: Allow env to form dynamic loader to look in a different place
++    # This is so it finds the host .so files, not the targets
++    if (defined $ENV{PERLHOSTLIB})
++    {
++        my $hostlib = $ENV{PERLHOSTLIB};
++        my $hostarchlib = $ENV{PERLHOSTARCHLIB};
++        print STDERR "*** Module name IN: $modlibname\n";
++        ($p1, $p2, $p3, $p4, $p5, $p6, $p7) = $modlibname =~ m/(^(.*lib\w*\/)?)((perl5\/[0-9\.]*\/)?)(([^\/]*)\/)?(.*)$/;
++        print STDERR "*** p1: $p1  p3: $p3  p5: $p5 p7: $p7\n";
++        if ( $p1 ne "" ) {
++            $modlibname = $hostlib.$p7;
++        }
++        if ( $p6 ne "" ) {
++            $modlibname = $hostarchlib.$p7;
++        }
++        print STDERR "*** Module name OUT: $modlibname\n";
++    }
++
+     if (@_) {
+         $module = $_[0];
+     } else {
diff --git a/meta/recipes-devtools/perl-sanity/files/run-ptest b/meta/recipes-devtools/perl-sanity/files/run-ptest
new file mode 100644
index 00000000000..dad4d429160
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+cd t && PERL_BUILD_PACKAGING=1 ./TEST | sed -u -e 's|\(.*\) .* ok$|PASS: \1|' -e 's|\(.*\) .* skipped|SKIP: \1|' -e 's|\(.*\) \.\(.*\)|FAIL: \1|'
diff --git a/meta/recipes-devtools/perl-sanity/perl-ptest.inc b/meta/recipes-devtools/perl-sanity/perl-ptest.inc
new file mode 100644
index 00000000000..5d4422053c8
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/perl-ptest.inc
@@ -0,0 +1,57 @@
+inherit ptest
+
+SRC_URI += "file://run-ptest \
+           "
+do_install_ptest () {
+	mkdir -p ${D}${PTEST_PATH}
+	sed -e "s:\/usr\/local:${bindir}:g" -i cpan/version/t/*
+	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
+	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
+	tar -c --exclude=try --exclude=a.out --exclude='*.o' --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \
+	    --exclude=cygwin --exclude=os2 --exclude=djgpp --exclude=qnx --exclude=symbian --exclude=haiku \
+	    --exclude=vms --exclude=vos --exclude=NetWare --exclude=amigaos4  --exclude=buildcustomize.pl \
+	    --exclude='win32/config.*' --exclude=plan9 --exclude=README.plan9 --exclude=perlplan9.pod --exclude=Configure \
+	    --exclude=veryclean.sh --exclude=realclean.sh  --exclude=getioctlsizes \
+	    --exclude=dl_aix.xs --exclude=sdbm.3 --exclude='cflags.SH' --exclude=makefile.old \
+		--exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x )
+
+	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
+
+	# Remove build host references from various scattered files...
+	find "${D}${PTEST_PATH}" \
+	     \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name '*.pl' -o -name '*.sh' -o -name '*.pm' \
+	     -o -name 'h2xs' -o -name 'h2ph' \
+	     -o -name '*.h' -o -name 'config.sh-*' -o -name 'pod2man'  -o -name 'pod2text' \) \
+	    -type f -exec sed -i \
+	       -e "s,${D},,g" \
+	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
+	       -e "s,-isystem${STAGING_INCDIR} ,,g" \
+	       -e 's|${DEBUG_PREFIX_MAP}||g' \
+	       -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
+	       -e "s,${STAGING_LIBDIR},${libdir},g" \
+	       -e "s,${STAGING_BINDIR},${bindir},g" \
+	       -e "s,${STAGING_INCDIR},${includedir},g" \
+	       -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
+	       -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
+	       -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	       -e 's:${RECIPE_SYSROOT}::g' \
+	        {} +
+
+	 # Remove a useless timestamp...
+	 sed -i -e '/Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/unicore/mktables.lst
+}
+
+python populate_packages_prepend() {
+    # Put all *.t files from the lib dir in the ptest package
+    # do_split_packages requires a pair of () in the regex, but we have nothing
+    # to match, so use an empty pair.
+    if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+        do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
+            '${PN}-ptest%s', '%s', recursive=True, match_path=True)
+}
+
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc sed"
+
+# The perl-ptest package contains Perl internal modules and generating file
+# dependencies for it causes problems.
+SKIP_FILEDEPS_${PN}-ptest = '1'
diff --git a/meta/recipes-devtools/perl-sanity/perl-rdepends_5.28.0.inc b/meta/recipes-devtools/perl-sanity/perl-rdepends_5.28.0.inc
new file mode 100644
index 00000000000..d4df95b8f88
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/perl-rdepends_5.28.0.inc
@@ -0,0 +1,2173 @@
+# To create/update the perl-rdepends_5.28.0.inc use this piece of ugly script (modified for your arch/paths etc):
+
+#jiahongxu:5.20.0-r1$ pwd
+#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl/5.20.0-r1
+
+#1 cp -r packages-split packages-split.new && cd packages-split.new
+#2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
+#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm"
+#| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:]
+#| awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'
+#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix
+#| sort -u
+#| sed 's/^/RDEPENDS_/;s/perl-module-/perl-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
+#| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rdepends
+
+RDEPENDS_perl-misc += "perl perl-modules"
+RDEPENDS_perl-pod += "perl"
+
+# Some additional dependencies that the above doesn't manage to figure out
+RDEPENDS_perl-module-file-spec += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-bigint-calc"
+RDEPENDS_perl-module-thread-queue += "perl-module-attributes"
+RDEPENDS_perl-module-overload += "perl-module-overloading"
+
+# Generated depends list beyond this line
+RDEPENDS_perl-module-anydbm-file += "perl-module-strict"
+RDEPENDS_perl-module-anydbm-file += "perl-module-warnings"
+RDEPENDS_perl-module-app-cpan += "perl-module-config"
+RDEPENDS_perl-module-app-cpan += "perl-module-constant"
+RDEPENDS_perl-module-app-cpan += "perl-module-cpan"
+RDEPENDS_perl-module-app-cpan += "perl-module-cwd"
+RDEPENDS_perl-module-app-cpan += "perl-module-data-dumper"
+RDEPENDS_perl-module-app-cpan += "perl-module-file-basename"
+RDEPENDS_perl-module-app-cpan += "perl-module-file-find"
+RDEPENDS_perl-module-app-cpan += "perl-module-getopt-std"
+RDEPENDS_perl-module-app-cpan += "perl-module-if"
+RDEPENDS_perl-module-app-cpan += "perl-module-net-ping"
+RDEPENDS_perl-module-app-cpan += "perl-module-strict"
+RDEPENDS_perl-module-app-cpan += "perl-module-user-pwent"
+RDEPENDS_perl-module-app-cpan += "perl-module-vars"
+RDEPENDS_perl-module-app-cpan += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove += "perl-module-app-prove-state"
+RDEPENDS_perl-module-app-prove += "perl-module-base"
+RDEPENDS_perl-module-app-prove += "perl-module-constant"
+RDEPENDS_perl-module-app-prove += "perl-module-getopt-long"
+RDEPENDS_perl-module-app-prove += "perl-module-strict"
+RDEPENDS_perl-module-app-prove += "perl-module-tap-harness"
+RDEPENDS_perl-module-app-prove += "perl-module-tap-harness-env"
+RDEPENDS_perl-module-app-prove += "perl-module-text-parsewords"
+RDEPENDS_perl-module-app-prove += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove-state += "perl-module-app-prove-state-result"
+RDEPENDS_perl-module-app-prove-state += "perl-module-base"
+RDEPENDS_perl-module-app-prove-state += "perl-module-constant"
+RDEPENDS_perl-module-app-prove-state += "perl-module-file-find"
+RDEPENDS_perl-module-app-prove-state += "perl-module-strict"
+RDEPENDS_perl-module-app-prove-state += "perl-module-tap-parser-yamlish-reader"
+RDEPENDS_perl-module-app-prove-state += "perl-module-tap-parser-yamlish-writer"
+RDEPENDS_perl-module-app-prove-state += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-app-prove-state-result-test"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-constant"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-strict"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove-state-result-test += "perl-module-strict"
+RDEPENDS_perl-module-app-prove-state-result-test += "perl-module-warnings"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-constant"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-exporter"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-io-compress-bzip2"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-strict"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-time-local"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-warnings"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-archive-tar"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-archive-tar-constant"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-file-basename"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-io-file"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-strict"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-vars"
+RDEPENDS_perl-module-archive-tar += "perl-module-archive-tar-constant"
+RDEPENDS_perl-module-archive-tar += "perl-module-archive-tar-file"
+RDEPENDS_perl-module-archive-tar += "perl-module-config"
+RDEPENDS_perl-module-archive-tar += "perl-module-cwd"
+RDEPENDS_perl-module-archive-tar += "perl-module-exporter"
+RDEPENDS_perl-module-archive-tar += "perl-module-file-path"
+RDEPENDS_perl-module-archive-tar += "perl-module-io-file"
+RDEPENDS_perl-module-archive-tar += "perl-module-io-zlib"
+RDEPENDS_perl-module-archive-tar += "perl-module-strict"
+RDEPENDS_perl-module-archive-tar += "perl-module-vars"
+RDEPENDS_perl-module-arybase += "perl-module-xsloader"
+RDEPENDS_perl-module-attribute-handlers += "perl-module-strict"
+RDEPENDS_perl-module-attribute-handlers += "perl-module-warnings"
+RDEPENDS_perl-module-attributes += "perl-module-exporter"
+RDEPENDS_perl-module-attributes += "perl-module-strict"
+RDEPENDS_perl-module-attributes += "perl-module-warnings"
+RDEPENDS_perl-module-attributes += "perl-module-xsloader"
+RDEPENDS_perl-module-autodie-exception += "perl-module-constant"
+RDEPENDS_perl-module-autodie-exception += "perl-module-fatal"
+RDEPENDS_perl-module-autodie-exception += "perl-module-fcntl"
+RDEPENDS_perl-module-autodie-exception += "perl-module-overload"
+RDEPENDS_perl-module-autodie-exception += "perl-module-strict"
+RDEPENDS_perl-module-autodie-exception += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-parent"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-strict"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-hints += "perl-module-b"
+RDEPENDS_perl-module-autodie-hints += "perl-module-constant"
+RDEPENDS_perl-module-autodie-hints += "perl-module-strict"
+RDEPENDS_perl-module-autodie-hints += "perl-module-warnings"
+RDEPENDS_perl-module-autodie += "perl-module-constant"
+RDEPENDS_perl-module-autodie += "perl-module-lib"
+RDEPENDS_perl-module-autodie += "perl-module-parent"
+RDEPENDS_perl-module-autodie += "perl-module-strict"
+RDEPENDS_perl-module-autodie += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-scope-guard += "perl-module-strict"
+RDEPENDS_perl-module-autodie-scope-guard += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-scope-guardstack += "perl-module-autodie-scope-guard"
+RDEPENDS_perl-module-autodie-scope-guardstack += "perl-module-strict"
+RDEPENDS_perl-module-autodie-scope-guardstack += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-skip += "perl-module-strict"
+RDEPENDS_perl-module-autodie-skip += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-util += "perl-module-autodie-scope-guardstack"
+RDEPENDS_perl-module-autodie-util += "perl-module-exporter"
+RDEPENDS_perl-module-autodie-util += "perl-module-strict"
+RDEPENDS_perl-module-autodie-util += "perl-module-warnings"
+RDEPENDS_perl-module-autoloader += "perl-module-strict"
+RDEPENDS_perl-module-autosplit += "perl-module-config"
+RDEPENDS_perl-module-autosplit += "perl-module-exporter"
+RDEPENDS_perl-module-autosplit += "perl-module-file-basename"
+RDEPENDS_perl-module-autosplit += "perl-module-file-path"
+RDEPENDS_perl-module-autosplit += "perl-module-strict"
+RDEPENDS_perl-module-base += "perl-module-strict"
+RDEPENDS_perl-module-b-concise += "perl-module-b"
+RDEPENDS_perl-module-b-concise += "perl-module-b-op-private"
+RDEPENDS_perl-module-b-concise += "perl-module-config"
+RDEPENDS_perl-module-b-concise += "perl-module-exporter"
+RDEPENDS_perl-module-b-concise += "perl-module-feature"
+RDEPENDS_perl-module-b-concise += "perl-module-strict"
+RDEPENDS_perl-module-b-concise += "perl-module-warnings"
+RDEPENDS_perl-module-b-debug += "perl-module-b"
+RDEPENDS_perl-module-b-debug += "perl-module-config"
+RDEPENDS_perl-module-b-debug += "perl-module-strict"
+RDEPENDS_perl-module-benchmark += "perl-module-exporter"
+RDEPENDS_perl-module-benchmark += "perl-module-strict"
+RDEPENDS_perl-module-bigint += "perl-module-constant"
+RDEPENDS_perl-module-bigint += "perl-module-exporter"
+RDEPENDS_perl-module-bigint += "perl-module-math-bigint"
+RDEPENDS_perl-module-bigint += "perl-module-math-bigint-trace"
+RDEPENDS_perl-module-bigint += "perl-module-overload"
+RDEPENDS_perl-module-bigint += "perl-module-strict"
+RDEPENDS_perl-module-bigint += "perl-module-warnings"
+RDEPENDS_perl-module-bignum += "perl-module-bigint"
+RDEPENDS_perl-module-bignum += "perl-module-exporter"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigfloat-trace"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigint"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigint-trace"
+RDEPENDS_perl-module-bignum += "perl-module-overload"
+RDEPENDS_perl-module-bignum += "perl-module-strict"
+RDEPENDS_perl-module-bignum += "perl-module-warnings"
+RDEPENDS_perl-module-bigrat += "perl-module-bigint"
+RDEPENDS_perl-module-bigrat += "perl-module-exporter"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigint"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigint-trace"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigrat"
+RDEPENDS_perl-module-bigrat += "perl-module-overload"
+RDEPENDS_perl-module-bigrat += "perl-module-strict"
+RDEPENDS_perl-module-bigrat += "perl-module-warnings"
+RDEPENDS_perl-module-blib += "perl-module-cwd"
+RDEPENDS_perl-module-b += "perl-module-exporter"
+RDEPENDS_perl-module-b += "perl-module-xsloader"
+RDEPENDS_perl-module-b-showlex += "perl-module-b"
+RDEPENDS_perl-module-b-showlex += "perl-module-b-concise"
+RDEPENDS_perl-module-b-showlex += "perl-module-b-terse"
+RDEPENDS_perl-module-b-showlex += "perl-module-strict"
+RDEPENDS_perl-module-b-terse += "perl-module-b"
+RDEPENDS_perl-module-b-terse += "perl-module-b-concise"
+RDEPENDS_perl-module-b-terse += "perl-module-strict"
+RDEPENDS_perl-module-b-xref += "perl-module-b"
+RDEPENDS_perl-module-b-xref += "perl-module-config"
+RDEPENDS_perl-module-b-xref += "perl-module-strict"
+RDEPENDS_perl-module-bytes += "perl-module-bytes-heavy"
+RDEPENDS_perl-module--charnames += "perl-module-bytes"
+RDEPENDS_perl-module-charnames += "perl-module-bytes"
+RDEPENDS_perl-module-charnames += "perl-module--charnames"
+RDEPENDS_perl-module--charnames += "perl-module-re"
+RDEPENDS_perl-module-charnames += "perl-module-re"
+RDEPENDS_perl-module--charnames += "perl-module-strict"
+RDEPENDS_perl-module-charnames += "perl-module-strict"
+RDEPENDS_perl-module--charnames += "perl-module-warnings"
+RDEPENDS_perl-module-charnames += "perl-module-warnings"
+RDEPENDS_perl-module-class-struct += "perl-module-exporter"
+RDEPENDS_perl-module-class-struct += "perl-module-strict"
+RDEPENDS_perl-module-class-struct += "perl-module-warnings-register"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-bytes "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-constant"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-dynaloader"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-exporter"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-strict "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-warnings "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-xsloader"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-bytes "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-constant"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-dynaloader"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-exporter"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-strict "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-warnings "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-xsloader"
+RDEPENDS_perl-module-compress-zlib += "perl-module-bytes "
+RDEPENDS_perl-module-compress-zlib += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-compress-zlib += "perl-module-constant"
+RDEPENDS_perl-module-compress-zlib += "perl-module-exporter"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-compress-gzip"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-handle "
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-uncompress-gunzip"
+RDEPENDS_perl-module-compress-zlib += "perl-module-strict "
+RDEPENDS_perl-module-compress-zlib += "perl-module-warnings "
+RDEPENDS_perl-module-config-extensions += "perl-module-config"
+RDEPENDS_perl-module-config-extensions += "perl-module-exporter"
+RDEPENDS_perl-module-config-extensions += "perl-module-strict"
+RDEPENDS_perl-module-config += "perl-module-strict"
+RDEPENDS_perl-module-config += "perl-module-warnings"
+RDEPENDS_perl-module-config-perl-v += "perl-module-config"
+RDEPENDS_perl-module-config-perl-v += "perl-module-exporter"
+RDEPENDS_perl-module-config-perl-v += "perl-module-strict"
+RDEPENDS_perl-module-config-perl-v += "perl-module-vars"
+RDEPENDS_perl-module-config-perl-v += "perl-module-warnings"
+RDEPENDS_perl-module-constant += "perl-module-strict"
+RDEPENDS_perl-module-constant += "perl-module-warnings-register"
+RDEPENDS_perl-module-corelist += "perl-module-list-util"
+RDEPENDS_perl-module-corelist += "perl-module-corelist"
+RDEPENDS_perl-module-corelist += "perl-module-strict"
+RDEPENDS_perl-module-corelist += "perl-module-version"
+RDEPENDS_perl-module-corelist += "perl-module-warnings"
+RDEPENDS_perl-module-cpan += "perl-module-b"
+RDEPENDS_perl-module-cpan += "perl-module-config"
+RDEPENDS_perl-module-cpan += "perl-module-cwd"
+RDEPENDS_perl-module-cpan += "perl-module-data-dumper"
+RDEPENDS_perl-module-cpan += "perl-module-dirhandle"
+RDEPENDS_perl-module-cpan += "perl-module-errno"
+RDEPENDS_perl-module-cpan += "perl-module-exporter"
+RDEPENDS_perl-module-cpan += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-cpan += "perl-module-extutils-manifest"
+RDEPENDS_perl-module-cpan += "perl-module-fcntl"
+RDEPENDS_perl-module-cpan += "perl-module-file-basename"
+RDEPENDS_perl-module-cpan += "perl-module-file-copy"
+RDEPENDS_perl-module-cpan += "perl-module-file-find"
+RDEPENDS_perl-module-cpan += "perl-module-filehandle"
+RDEPENDS_perl-module-cpan += "perl-module-file-path"
+RDEPENDS_perl-module-cpan += "perl-module-lib"
+RDEPENDS_perl-module-cpan += "perl-module-net-ping"
+RDEPENDS_perl-module-cpan += "perl-module-overload"
+RDEPENDS_perl-module-cpan += "perl-module-posix"
+RDEPENDS_perl-module-cpan += "perl-module-safe"
+RDEPENDS_perl-module-cpan += "perl-module-strict"
+RDEPENDS_perl-module-cpan += "perl-module-sys-hostname"
+RDEPENDS_perl-module-cpan += "perl-module-term-readline"
+RDEPENDS_perl-module-cpan += "perl-module-text-parsewords"
+RDEPENDS_perl-module-cpan += "perl-module-text-wrap"
+RDEPENDS_perl-module-cpan += "perl-module-time-local"
+RDEPENDS_perl-module-cpan += "perl-module-vars"
+RDEPENDS_perl-module-cpan += "perl-module-warnings"
+RDEPENDS_perl-module-cwd += "perl-module-errno"
+RDEPENDS_perl-module-cwd += "perl-module-exporter"
+RDEPENDS_perl-module-cwd += "perl-module-strict"
+RDEPENDS_perl-module-cwd += "perl-module-xsloader"
+RDEPENDS_perl-module-data-dumper += "perl-module-config"
+RDEPENDS_perl-module-data-dumper += "perl-module-constant"
+RDEPENDS_perl-module-data-dumper += "perl-module-exporter"
+RDEPENDS_perl-module-data-dumper += "perl-module-xsloader"
+RDEPENDS_perl-module-dbm-filter-compress += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-compress += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-encode += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-encode += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-int32 += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-int32 += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-null += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-null += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-utf8 += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-utf8 += "perl-module-warnings"
+RDEPENDS_perl-module-db += "perl-module-strict"
+RDEPENDS_perl-module-deprecate += "perl-module-strict"
+RDEPENDS_perl-module-deprecate += "perl-module-warnings"
+RDEPENDS_perl-module-devel-peek += "perl-module-exporter"
+RDEPENDS_perl-module-devel-peek += "perl-module-xsloader"
+RDEPENDS_perl-module-devel-ppport += "perl-module-file-find"
+RDEPENDS_perl-module-devel-ppport += "perl-module-getopt-long"
+RDEPENDS_perl-module-devel-ppport += "perl-module-strict"
+RDEPENDS_perl-module-devel-ppport += "perl-module-vars"
+RDEPENDS_perl-module-devel-selfstubber += "perl-module-selfloader"
+RDEPENDS_perl-module-diagnostics += "perl-module-config"
+RDEPENDS_perl-module-diagnostics += "perl-module-getopt-std"
+RDEPENDS_perl-module-diagnostics += "perl-module-strict"
+RDEPENDS_perl-module-diagnostics += "perl-module-text-tabs"
+RDEPENDS_perl-module-digest-base += "perl-module-mime-base64"
+RDEPENDS_perl-module-digest-base += "perl-module-strict"
+RDEPENDS_perl-module-digest-base += "perl-module-vars"
+RDEPENDS_perl-module-digest-file += "perl-module-digest"
+RDEPENDS_perl-module-digest-file += "perl-module-exporter"
+RDEPENDS_perl-module-digest-file += "perl-module-strict"
+RDEPENDS_perl-module-digest-file += "perl-module-vars"
+RDEPENDS_perl-module-digest-md5 += "perl-module-digest-base"
+RDEPENDS_perl-module-digest-md5 += "perl-module-exporter"
+RDEPENDS_perl-module-digest-md5 += "perl-module-strict"
+RDEPENDS_perl-module-digest-md5 += "perl-module-vars"
+RDEPENDS_perl-module-digest-md5 += "perl-module-xsloader"
+RDEPENDS_perl-module-digest += "perl-module-strict"
+RDEPENDS_perl-module-digest += "perl-module-vars"
+RDEPENDS_perl-module-digest-sha += "perl-module-digest-base"
+RDEPENDS_perl-module-digest-sha += "perl-module-dynaloader"
+RDEPENDS_perl-module-digest-sha += "perl-module-exporter"
+RDEPENDS_perl-module-digest-sha += "perl-module-fcntl"
+RDEPENDS_perl-module-digest-sha += "perl-module-integer"
+RDEPENDS_perl-module-digest-sha += "perl-module-strict"
+RDEPENDS_perl-module-digest-sha += "perl-module-vars"
+RDEPENDS_perl-module-digest-sha += "perl-module-warnings"
+RDEPENDS_perl-module-digest-sha += "perl-module-xsloader"
+RDEPENDS_perl-module-dynaloader += "perl-module-config"
+RDEPENDS_perl-module-encode-alias += "perl-module-constant"
+RDEPENDS_perl-module-encode-alias += "perl-module-encode"
+RDEPENDS_perl-module-encode-alias += "perl-module-exporter"
+RDEPENDS_perl-module-encode-alias += "perl-module-strict"
+RDEPENDS_perl-module-encode-alias += "perl-module-warnings"
+RDEPENDS_perl-module-encode-byte += "perl-module-encode"
+RDEPENDS_perl-module-encode-byte += "perl-module-strict"
+RDEPENDS_perl-module-encode-byte += "perl-module-warnings"
+RDEPENDS_perl-module-encode-byte += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-exporter"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-strict"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-warnings"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-encode"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-parent"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-strict"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-utf8"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-vars"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-warnings"
+RDEPENDS_perl-module-encode-cn += "perl-module-encode"
+RDEPENDS_perl-module-encode-cn += "perl-module-encode-cn-hz"
+RDEPENDS_perl-module-encode-cn += "perl-module-strict"
+RDEPENDS_perl-module-encode-cn += "perl-module-warnings"
+RDEPENDS_perl-module-encode-cn += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-config += "perl-module-strict"
+RDEPENDS_perl-module-encode-config += "perl-module-warnings"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-encode"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-strict"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-warnings"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-encoder += "perl-module-constant"
+RDEPENDS_perl-module-encode-encoder += "perl-module-encode"
+RDEPENDS_perl-module-encode-encoder += "perl-module-exporter"
+RDEPENDS_perl-module-encode-encoder += "perl-module-overload"
+RDEPENDS_perl-module-encode-encoder += "perl-module-strict"
+RDEPENDS_perl-module-encode-encoder += "perl-module-warnings"
+RDEPENDS_perl-module-encode-encoding += "perl-module-constant"
+RDEPENDS_perl-module-encode-encoding += "perl-module-encode"
+RDEPENDS_perl-module-encode-encoding += "perl-module-encode-mime-name"
+RDEPENDS_perl-module-encode-encoding += "perl-module-strict"
+RDEPENDS_perl-module-encode-encoding += "perl-module-warnings"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-encode"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-parent"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-strict"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-utf8"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-vars"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-warnings"
+RDEPENDS_perl-module-encode-guess += "perl-module-bytes"
+RDEPENDS_perl-module-encode-guess += "perl-module-constant"
+RDEPENDS_perl-module-encode-guess += "perl-module-encode"
+RDEPENDS_perl-module-encode-guess += "perl-module-encode-unicode"
+RDEPENDS_perl-module-encode-guess += "perl-module-parent"
+RDEPENDS_perl-module-encode-guess += "perl-module-strict"
+RDEPENDS_perl-module-encode-guess += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-strict"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-vars"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-bytes"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-encode"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-encode-jp-h2z"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-parent"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-strict"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp += "perl-module-encode"
+RDEPENDS_perl-module-encode-jp += "perl-module-encode-jp-jis7"
+RDEPENDS_perl-module-encode-jp += "perl-module-strict"
+RDEPENDS_perl-module-encode-jp += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-encode"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-parent"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-strict"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-warnings"
+RDEPENDS_perl-module-encode-kr += "perl-module-encode"
+RDEPENDS_perl-module-encode-kr += "perl-module-encode-kr-2022-kr"
+RDEPENDS_perl-module-encode-kr += "perl-module-strict"
+RDEPENDS_perl-module-encode-kr += "perl-module-warnings"
+RDEPENDS_perl-module-encode-kr += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-constant"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-parent"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-strict"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-warnings"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-encode"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-mime-base64"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-parent"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-strict"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-warnings"
+RDEPENDS_perl-module-encode-mime-name += "perl-module-strict"
+RDEPENDS_perl-module-encode-mime-name += "perl-module-warnings"
+RDEPENDS_perl-module-encode += "perl-module-bytes"
+RDEPENDS_perl-module-encode += "perl-module-constant"
+RDEPENDS_perl-module-encode += "perl-module-encode-alias"
+RDEPENDS_perl-module-encode += "perl-module-encode-config"
+RDEPENDS_perl-module-encode += "perl-module-encode-configlocal-pm"
+RDEPENDS_perl-module-encode += "perl-module-encode-mime-name"
+RDEPENDS_perl-module-encode += "perl-module-exporter"
+RDEPENDS_perl-module-encode += "perl-module-parent"
+RDEPENDS_perl-module-encode += "perl-module-storable"
+RDEPENDS_perl-module-encode += "perl-module-strict"
+RDEPENDS_perl-module-encode += "perl-module-warnings"
+RDEPENDS_perl-module-encode += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-symbol += "perl-module-encode"
+RDEPENDS_perl-module-encode-symbol += "perl-module-strict"
+RDEPENDS_perl-module-encode-symbol += "perl-module-warnings"
+RDEPENDS_perl-module-encode-symbol += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-tw += "perl-module-encode"
+RDEPENDS_perl-module-encode-tw += "perl-module-strict"
+RDEPENDS_perl-module-encode-tw += "perl-module-warnings"
+RDEPENDS_perl-module-encode-tw += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-unicode += "perl-module-encode"
+RDEPENDS_perl-module-encode-unicode += "perl-module-parent"
+RDEPENDS_perl-module-encode-unicode += "perl-module-strict"
+RDEPENDS_perl-module-encode-unicode += "perl-module-warnings"
+RDEPENDS_perl-module-encode-unicode += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-encode"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-mime-base64"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-parent"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-re"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-strict"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-warnings"
+RDEPENDS_perl-module-encoding += "perl-module-config"
+RDEPENDS_perl-module-encoding += "perl-module-constant"
+RDEPENDS_perl-module-encoding += "perl-module-encode"
+RDEPENDS_perl-module-encoding += "perl-module-filter-util-call"
+RDEPENDS_perl-module-encoding += "perl-module-i18n-langinfo"
+RDEPENDS_perl-module-encoding += "perl-module-posix"
+RDEPENDS_perl-module-encoding += "perl-module-strict"
+RDEPENDS_perl-module-encoding += "perl-module-utf8"
+RDEPENDS_perl-module-encoding += "perl-module-warnings"
+RDEPENDS_perl-module-encoding-warnings += "perl-module-strict"
+RDEPENDS_perl-module-encoding-warnings += "perl-module-warnings"
+RDEPENDS_perl-module-english += "perl-module-exporter"
+RDEPENDS_perl-module-env += "perl-module-config"
+RDEPENDS_perl-module-env += "perl-module-tie-array"
+RDEPENDS_perl-module-errno += "perl-module-exporter"
+RDEPENDS_perl-module-errno += "perl-module-strict"
+RDEPENDS_perl-module-experimental += "perl-module-strict"
+RDEPENDS_perl-module-experimental += "perl-module-version"
+RDEPENDS_perl-module-experimental += "perl-module-warnings"
+RDEPENDS_perl-module-exporter-heavy += "perl-module-exporter"
+RDEPENDS_perl-module-exporter-heavy += "perl-module-strict"
+RDEPENDS_perl-module-exporter += "perl-module-exporter-heavy"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-config"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-dynaloader"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-extutils-mksymlists"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-file-temp"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-ipc-cmd"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-text-parsewords"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-config"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-darwin += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-darwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-darwin += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-os2 += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-os2 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-os2 += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-unix += "perl-module-extutils-cbuilder-base"
+RDEPENDS_perl-module-extutils-cbuilder-platform-unix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-unix += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-config"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-extutils-cbuilder-base"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-bcc += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-bcc += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-gcc += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-gcc += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-msvc += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-msvc += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-extutils-cbuilder-base"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-io-file"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-extutils-command"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-extutils-install"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-getopt-long"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-strict"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-test-harness"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-command += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-copy"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-command += "perl-module-strict"
+RDEPENDS_perl-module-extutils-command += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-constant"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-text-wrap"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-constant += "perl-module-extutils-constant-proxysubs"
+RDEPENDS_perl-module-extutils-constant += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant += "perl-module-extutils-constant-xs"
+RDEPENDS_perl-module-extutils-constant += "perl-module-filehandle"
+RDEPENDS_perl-module-extutils-constant += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-extutils-constant-xs"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-constant"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-posix"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-data-dumper"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-extutils-constant"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-extutils-constant-base"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-vars"
+RDEPENDS_perl-module-extutils-embed += "perl-module-config"
+RDEPENDS_perl-module-extutils-embed += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-embed += "perl-module-extutils-liblist"
+RDEPENDS_perl-module-extutils-embed += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-embed += "perl-module-getopt-std"
+RDEPENDS_perl-module-extutils-embed += "perl-module-strict"
+RDEPENDS_perl-module-extutils-installed += "perl-module-config"
+RDEPENDS_perl-module-extutils-installed += "perl-module-data-dumper"
+RDEPENDS_perl-module-extutils-installed += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-installed += "perl-module-extutils-packlist"
+RDEPENDS_perl-module-extutils-installed += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-installed += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-installed += "perl-module-strict"
+RDEPENDS_perl-module-extutils-installed += "perl-module-vars"
+RDEPENDS_perl-module-extutils-install += "perl-module-autosplit"
+RDEPENDS_perl-module-extutils-install += "perl-module-config"
+RDEPENDS_perl-module-extutils-install += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-install += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-install += "perl-module-extutils-packlist"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-compare"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-copy"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-install += "perl-module-strict"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-strict"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-text-parsewords"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-liblist += "perl-module-extutils-liblist-kid"
+RDEPENDS_perl-module-extutils-liblist += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker-config += "perl-module-config"
+RDEPENDS_perl-module-extutils-makemaker-config += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-base"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-encode"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-encode-alias"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-i18n-langinfo"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-b"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-cpan"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-makemaker-version"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-manifest"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-mm"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-my"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-version"
+RDEPENDS_perl-module-extutils-makemaker-version += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker-version += "perl-module-vars"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-config"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-copy"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-strict"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-miniperl += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-miniperl += "perl-module-extutils-embed"
+RDEPENDS_perl-module-extutils-miniperl += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-config"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-dynaloader"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-config"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-aix += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-aix += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-aix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-autosplit"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-cpan"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-data-dumper"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-version"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-extutils-mm-win32"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-darwin += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-darwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-dos += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-dos += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-dos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-macos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-extutils-mm-win32"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm += "perl-module-extutils-liblist"
+RDEPENDS_perl-module-extutils-mm += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-qnx += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-qnx += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-encode"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-liblist"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-vars"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-version"
+RDEPENDS_perl-module-extutils-mm-uwin += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-uwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-liblist-kid"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-vos += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-vos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-win95 += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-win95 += "perl-module-extutils-mm-win32"
+RDEPENDS_perl-module-extutils-mm-win95 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-my += "perl-module-extutils-mm"
+RDEPENDS_perl-module-extutils-my += "perl-module-strict"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-config"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-strict"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-vars"
+RDEPENDS_perl-module-extutils-parsexs-constants += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-constants += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-parsexs-countlines += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-eval += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-eval += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-config"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-constants"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-countlines"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-eval"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-utilities"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-re"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-extutils-parsexs-constants"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-extutils-typemaps"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-lib"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-strict"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-extutils-typemaps"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-inputmap += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-inputmap += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-outputmap += "perl-module-re"
+RDEPENDS_perl-module-extutils-typemaps-outputmap += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-outputmap += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-parsexs"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-parsexs-constants"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-typemaps-inputmap"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-typemaps-outputmap"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-typemaps-type"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-type += "perl-module-extutils-typemaps"
+RDEPENDS_perl-module-extutils-typemaps-type += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-type += "perl-module-warnings"
+RDEPENDS_perl-module-fatal += "perl-module-autodie"
+RDEPENDS_perl-module-fatal += "perl-module-autodie-exception-system"
+RDEPENDS_perl-module-fatal += "perl-module-autodie-hints"
+RDEPENDS_perl-module-fatal += "perl-module-autodie-util"
+RDEPENDS_perl-module-fatal += "perl-module-config"
+RDEPENDS_perl-module-fatal += "perl-module-constant"
+RDEPENDS_perl-module-fatal += "perl-module-fcntl"
+RDEPENDS_perl-module-fatal += "perl-module-posix"
+RDEPENDS_perl-module-fatal += "perl-module-strict"
+RDEPENDS_perl-module-fatal += "perl-module-tie-refhash"
+RDEPENDS_perl-module-fatal += "perl-module-warnings"
+RDEPENDS_perl-module-fcntl += "perl-module-exporter"
+RDEPENDS_perl-module-fcntl += "perl-module-strict"
+RDEPENDS_perl-module-fcntl += "perl-module-xsloader"
+RDEPENDS_perl-module-fields += "perl-module-base"
+RDEPENDS_perl-module-fields += "perl-module-hash-util"
+RDEPENDS_perl-module-fields += "perl-module-strict"
+RDEPENDS_perl-module-file-basename += "perl-module-exporter"
+RDEPENDS_perl-module-file-basename += "perl-module-re"
+RDEPENDS_perl-module-file-basename += "perl-module-strict"
+RDEPENDS_perl-module-file-basename += "perl-module-warnings"
+RDEPENDS_perl-module-filecache += "perl-module-parent"
+RDEPENDS_perl-module-filecache += "perl-module-strict"
+RDEPENDS_perl-module-file-compare += "perl-module-exporter"
+RDEPENDS_perl-module-file-compare += "perl-module-strict"
+RDEPENDS_perl-module-file-compare += "perl-module-warnings"
+RDEPENDS_perl-module-file-copy += "perl-module-config"
+RDEPENDS_perl-module-file-copy += "perl-module-exporter"
+RDEPENDS_perl-module-file-copy += "perl-module-file-basename"
+RDEPENDS_perl-module-file-copy += "perl-module-strict"
+RDEPENDS_perl-module-file-copy += "perl-module-warnings"
+RDEPENDS_perl-module-file-dosglob += "perl-module-strict"
+RDEPENDS_perl-module-file-dosglob += "perl-module-text-parsewords"
+RDEPENDS_perl-module-file-dosglob += "perl-module-warnings"
+RDEPENDS_perl-module-file-dosglob += "perl-module-xsloader"
+RDEPENDS_perl-module-file-fetch += "perl-module-constant"
+RDEPENDS_perl-module-file-fetch += "perl-module-cwd"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-basename"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-copy"
+RDEPENDS_perl-module-file-fetch += "perl-module-filehandle"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-path"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-temp"
+RDEPENDS_perl-module-file-fetch += "perl-module-ipc-cmd"
+RDEPENDS_perl-module-file-fetch += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-file-fetch += "perl-module-load"
+RDEPENDS_perl-module-file-fetch += "perl-module-params-check"
+RDEPENDS_perl-module-file-fetch += "perl-module-strict"
+RDEPENDS_perl-module-file-fetch += "perl-module-vars"
+RDEPENDS_perl-module-file-find += "perl-module-config"
+RDEPENDS_perl-module-file-find += "perl-module-cwd"
+RDEPENDS_perl-module-file-find += "perl-module-exporter"
+RDEPENDS_perl-module-file-find += "perl-module-file-basename"
+RDEPENDS_perl-module-file-find += "perl-module-strict"
+RDEPENDS_perl-module-file-find += "perl-module-warnings"
+RDEPENDS_perl-module-file-find += "perl-module-warnings-register"
+RDEPENDS_perl-module-file-globmapper += "perl-module-file-glob"
+RDEPENDS_perl-module-file-globmapper += "perl-module-strict"
+RDEPENDS_perl-module-file-globmapper += "perl-module-warnings"
+RDEPENDS_perl-module-file-glob += "perl-module-exporter"
+RDEPENDS_perl-module-file-glob += "perl-module-strict"
+RDEPENDS_perl-module-file-glob += "perl-module-warnings"
+RDEPENDS_perl-module-file-glob += "perl-module-xsloader"
+RDEPENDS_perl-module-filehandle += "perl-module-exporter"
+RDEPENDS_perl-module-filehandle += "perl-module-fcntl"
+RDEPENDS_perl-module-filehandle += "perl-module-io-file"
+RDEPENDS_perl-module-filehandle += "perl-module-strict"
+RDEPENDS_perl-module-file-path += "perl-module-cwd"
+RDEPENDS_perl-module-file-path += "perl-module-exporter"
+RDEPENDS_perl-module-file-path += "perl-module-file-basename"
+RDEPENDS_perl-module-file-path += "perl-module-strict"
+RDEPENDS_perl-module-file-path += "perl-module-vars"
+RDEPENDS_perl-module-file-stat += "perl-module-class-struct"
+RDEPENDS_perl-module-file-stat += "perl-module-constant"
+RDEPENDS_perl-module-file-stat += "perl-module-exporter"
+RDEPENDS_perl-module-file-stat += "perl-module-fcntl"
+RDEPENDS_perl-module-file-stat += "perl-module-overload "
+RDEPENDS_perl-module-file-stat += "perl-module-strict"
+RDEPENDS_perl-module-file-stat += "perl-module-warnings"
+RDEPENDS_perl-module-file-stat += "perl-module-warnings-register"
+RDEPENDS_perl-module-file-temp += "perl-module-constant"
+RDEPENDS_perl-module-file-temp += "perl-module-cwd"
+RDEPENDS_perl-module-file-temp += "perl-module-errno"
+RDEPENDS_perl-module-file-temp += "perl-module-exporter"
+RDEPENDS_perl-module-file-temp += "perl-module-fcntl"
+RDEPENDS_perl-module-file-temp += "perl-module-file-path"
+RDEPENDS_perl-module-file-temp += "perl-module-io-seekable"
+RDEPENDS_perl-module-file-temp += "perl-module-overload"
+RDEPENDS_perl-module-file-temp += "perl-module-parent"
+RDEPENDS_perl-module-file-temp += "perl-module-posix"
+RDEPENDS_perl-module-file-temp += "perl-module-strict"
+RDEPENDS_perl-module-file-temp += "perl-module-vars"
+RDEPENDS_perl-module-filter-simple += "perl-module-filter-util-call"
+RDEPENDS_perl-module-filter-simple += "perl-module-text-balanced"
+RDEPENDS_perl-module-filter-util-call += "perl-module-exporter"
+RDEPENDS_perl-module-filter-util-call += "perl-module-strict"
+RDEPENDS_perl-module-filter-util-call += "perl-module-warnings"
+RDEPENDS_perl-module-filter-util-call += "perl-module-xsloader"
+RDEPENDS_perl-module-findbin += "perl-module-cwd"
+RDEPENDS_perl-module-findbin += "perl-module-exporter"
+RDEPENDS_perl-module-findbin += "perl-module-file-basename"
+RDEPENDS_perl-module-getopt-long += "perl-module-constant"
+RDEPENDS_perl-module-getopt-long += "perl-module-exporter"
+RDEPENDS_perl-module-getopt-long += "perl-module-overload"
+RDEPENDS_perl-module-getopt-long += "perl-module-pod-usage"
+RDEPENDS_perl-module-getopt-long += "perl-module-strict"
+RDEPENDS_perl-module-getopt-long += "perl-module-text-parsewords"
+RDEPENDS_perl-module-getopt-long += "perl-module-vars"
+RDEPENDS_perl-module-getopt-long += "perl-module-warnings"
+RDEPENDS_perl-module-getopt-std += "perl-module-exporter"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-exporter"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-strict"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-warnings"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-xsloader"
+RDEPENDS_perl-module-hash-util += "perl-module-exporter"
+RDEPENDS_perl-module-hash-util += "perl-module-hash-util-fieldhash"
+RDEPENDS_perl-module-hash-util += "perl-module-strict"
+RDEPENDS_perl-module-hash-util += "perl-module-warnings"
+RDEPENDS_perl-module-hash-util += "perl-module-warnings-register"
+RDEPENDS_perl-module-hash-util += "perl-module-xsloader"
+RDEPENDS_perl-module-i18n-collate += "perl-module-exporter"
+RDEPENDS_perl-module-i18n-collate += "perl-module-overload"
+RDEPENDS_perl-module-i18n-collate += "perl-module-posix"
+RDEPENDS_perl-module-i18n-collate += "perl-module-strict"
+RDEPENDS_perl-module-i18n-collate += "perl-module-warnings-register"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-exporter"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-strict"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-warnings"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-xsloader"
+RDEPENDS_perl-module-i18n-langtags-detect += "perl-module-i18n-langtags"
+RDEPENDS_perl-module-i18n-langtags-detect += "perl-module-strict"
+RDEPENDS_perl-module-i18n-langtags-list += "perl-module-strict"
+RDEPENDS_perl-module-i18n-langtags += "perl-module-exporter"
+RDEPENDS_perl-module-i18n-langtags += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-compress-raw-bzip2"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-encode"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-file-globmapper"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-utf8"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-base += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-base += "perl-module-io-file"
+RDEPENDS_perl-module-io-compress-base += "perl-module-io-handle "
+RDEPENDS_perl-module-io-compress-base += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-base += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-io-compress-adapter-bzip2"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-io-compress-base"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-rawdeflate"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-zlib-constants"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-rawdeflate"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-fcntl"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-io-compress-base"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-config"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-fcntl"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-adapter-identity"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-bzip2 "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-rawdeflate"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-zip-constants"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-warnings"
+RDEPENDS_perl-module-io-dir += "perl-module-exporter"
+RDEPENDS_perl-module-io-dir += "perl-module-file-stat"
+RDEPENDS_perl-module-io-dir += "perl-module-io-file"
+RDEPENDS_perl-module-io-dir += "perl-module-strict"
+RDEPENDS_perl-module-io-dir += "perl-module-tie-hash"
+RDEPENDS_perl-module-io-file += "perl-module-exporter"
+RDEPENDS_perl-module-io-file += "perl-module-fcntl"
+RDEPENDS_perl-module-io-file += "perl-module-io-seekable"
+RDEPENDS_perl-module-io-file += "perl-module-selectsaver"
+RDEPENDS_perl-module-io-file += "perl-module-strict"
+RDEPENDS_perl-module-io-handle += "perl-module-exporter"
+RDEPENDS_perl-module-io-handle += "perl-module-io"
+RDEPENDS_perl-module-io-handle += "perl-module-io-file"
+RDEPENDS_perl-module-io-handle += "perl-module-selectsaver"
+RDEPENDS_perl-module-io-handle += "perl-module-strict"
+RDEPENDS_perl-module-io += "perl-module-strict"
+RDEPENDS_perl-module-io += "perl-module-warnings"
+RDEPENDS_perl-module-io += "perl-module-xsloader"
+RDEPENDS_perl-module-io-pipe += "perl-module-fcntl"
+RDEPENDS_perl-module-io-pipe += "perl-module-io-handle"
+RDEPENDS_perl-module-io-pipe += "perl-module-strict"
+RDEPENDS_perl-module-io-poll += "perl-module-exporter"
+RDEPENDS_perl-module-io-poll += "perl-module-io-handle"
+RDEPENDS_perl-module-io-poll += "perl-module-strict"
+RDEPENDS_perl-module-io-seekable += "perl-module-exporter"
+RDEPENDS_perl-module-io-seekable += "perl-module-fcntl"
+RDEPENDS_perl-module-io-seekable += "perl-module-io-handle"
+RDEPENDS_perl-module-io-seekable += "perl-module-strict"
+RDEPENDS_perl-module-io-select += "perl-module-exporter"
+RDEPENDS_perl-module-io-select += "perl-module-strict"
+RDEPENDS_perl-module-io-select += "perl-module-warnings-register"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-errno"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-exporter"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-io-socket"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-socket"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-strict"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-base"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-constant"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-errno"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-posix"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-socket"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-strict"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-warnings"
+RDEPENDS_perl-module-io-socket += "perl-module-errno"
+RDEPENDS_perl-module-io-socket += "perl-module-exporter"
+RDEPENDS_perl-module-io-socket += "perl-module-io-handle"
+RDEPENDS_perl-module-io-socket += "perl-module-io-select"
+RDEPENDS_perl-module-io-socket += "perl-module-io-socket-inet"
+RDEPENDS_perl-module-io-socket += "perl-module-io-socket-unix"
+RDEPENDS_perl-module-io-socket += "perl-module-socket"
+RDEPENDS_perl-module-io-socket += "perl-module-strict"
+RDEPENDS_perl-module-io-socket-unix += "perl-module-io-socket"
+RDEPENDS_perl-module-io-socket-unix += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-compress-raw-bzip2"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-io-compress-zip-constants "
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-adapter-inflate"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-gunzip"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-inflate"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-unzip"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-constant"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-io-file "
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-list-util"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-io-uncompress-adapter-bunzip2"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-io-compress-zlib-constants"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-io-uncompress-adapter-inflate"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-constant"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-fcntl"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-compress-zip-constants"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-file"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-uncompress-adapter-identity"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-uncompress-adapter-inflate"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-posix"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-warnings"
+RDEPENDS_perl-module-io-zlib += "perl-module-fcntl"
+RDEPENDS_perl-module-io-zlib += "perl-module-io-handle"
+RDEPENDS_perl-module-io-zlib += "perl-module-strict"
+RDEPENDS_perl-module-io-zlib += "perl-module-tie-handle"
+RDEPENDS_perl-module-io-zlib += "perl-module-vars"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-constant"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-filehandle"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-io-handle"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-io-select"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-ipc-open3"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-load"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-params-check"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-posix"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-socket"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-strict"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-text-parsewords"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-time-hires"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-vars"
+RDEPENDS_perl-module-ipc-msg += "perl-module-class-struct"
+RDEPENDS_perl-module-ipc-msg += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-ipc-msg += "perl-module-strict"
+RDEPENDS_perl-module-ipc-msg += "perl-module-vars"
+RDEPENDS_perl-module-ipc-open2 += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-open2 += "perl-module-ipc-open3"
+RDEPENDS_perl-module-ipc-open2 += "perl-module-strict"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-constant"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-fcntl"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-io-pipe"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-posix"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-strict"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-class-struct"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-strict"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-vars"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-class-struct"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-strict"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-vars"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-config"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-dynaloader"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-strict"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-vars"
+RDEPENDS_perl-module-json-pp-boolean += "perl-module-overload"
+RDEPENDS_perl-module-json-pp-boolean += "perl-module-strict"
+RDEPENDS_perl-module-json-pp += "perl-module-b"
+RDEPENDS_perl-module-json-pp += "perl-module-bytes"
+RDEPENDS_perl-module-json-pp += "perl-module-constant"
+RDEPENDS_perl-module-json-pp += "perl-module-encode"
+RDEPENDS_perl-module-json-pp += "perl-module-exporter"
+RDEPENDS_perl-module-json-pp += "perl-module-json-pp-boolean"
+RDEPENDS_perl-module-json-pp += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-json-pp += "perl-module-math-bigint"
+RDEPENDS_perl-module-json-pp += "perl-module-overload"
+RDEPENDS_perl-module-json-pp += "perl-module-strict"
+RDEPENDS_perl-module-json-pp += "perl-module-subs"
+RDEPENDS_perl-module-less += "perl-module-strict"
+RDEPENDS_perl-module-less += "perl-module-warnings"
+RDEPENDS_perl-module-lib += "perl-module-config"
+RDEPENDS_perl-module-lib += "perl-module-strict"
+RDEPENDS_perl-module-list-util += "perl-module-exporter"
+RDEPENDS_perl-module-list-util += "perl-module-strict"
+RDEPENDS_perl-module-list-util += "perl-module-warnings"
+RDEPENDS_perl-module-list-util += "perl-module-xsloader"
+RDEPENDS_perl-module-list-util-xs += "perl-module-list-util"
+RDEPENDS_perl-module-list-util-xs += "perl-module-strict"
+RDEPENDS_perl-module-list-util-xs += "perl-module-warnings"
+RDEPENDS_perl-module-loaded += "perl-module-strict"
+RDEPENDS_perl-module-loaded += "perl-module-vars"
+RDEPENDS_perl-module-load += "perl-module-config"
+RDEPENDS_perl-module-load += "perl-module-constant"
+RDEPENDS_perl-module-load += "perl-module-exporter"
+RDEPENDS_perl-module-load += "perl-module-filehandle"
+RDEPENDS_perl-module-load += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-load += "perl-module-corelist"
+RDEPENDS_perl-module-load += "perl-module-load"
+RDEPENDS_perl-module-load += "perl-module-params-check"
+RDEPENDS_perl-module-load += "perl-module-strict"
+RDEPENDS_perl-module-load += "perl-module-vars"
+RDEPENDS_perl-module-load += "perl-module-version"
+RDEPENDS_perl-module-load += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-constant"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-country-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-country-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-country-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-country-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-country-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-country-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-currency-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-currency-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-currency-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-currency-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-currency-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-currency-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langext-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langext-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langext-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langext-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langext-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langext-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langfam-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langfam-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langfam-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langfam-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langfam-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-language-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-language-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-language-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-language-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-language-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-language-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langvar-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langvar-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langvar-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langvar-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langvar-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langvar-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes += "perl-module-if"
+RDEPENDS_perl-module-locale-codes += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-script-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-script-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-script-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-script-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-script-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-script-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-country += "perl-module-exporter"
+RDEPENDS_perl-module-locale-country += "perl-module-if"
+RDEPENDS_perl-module-locale-country += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-country += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-country += "perl-module-strict"
+RDEPENDS_perl-module-locale-country += "perl-module-warnings"
+RDEPENDS_perl-module-locale-currency += "perl-module-exporter"
+RDEPENDS_perl-module-locale-currency += "perl-module-if"
+RDEPENDS_perl-module-locale-currency += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-currency += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-currency += "perl-module-strict"
+RDEPENDS_perl-module-locale-currency += "perl-module-warnings"
+RDEPENDS_perl-module-locale-language += "perl-module-exporter"
+RDEPENDS_perl-module-locale-language += "perl-module-if"
+RDEPENDS_perl-module-locale-language += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-language += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-language += "perl-module-strict"
+RDEPENDS_perl-module-locale-language += "perl-module-warnings"
+RDEPENDS_perl-module-locale-maketext-gutsloader += "perl-module-locale-maketext"
+RDEPENDS_perl-module-locale-maketext-guts += "perl-module-locale-maketext"
+RDEPENDS_perl-module-locale-maketext += "perl-module-i18n-langtags"
+RDEPENDS_perl-module-locale-maketext += "perl-module-i18n-langtags-detect"
+RDEPENDS_perl-module-locale-maketext += "perl-module-integer"
+RDEPENDS_perl-module-locale-maketext += "perl-module-strict"
+RDEPENDS_perl-module-locale-maketext-simple += "perl-module-base"
+RDEPENDS_perl-module-locale-maketext-simple += "perl-module-strict"
+RDEPENDS_perl-module-locale += "perl-module-config"
+RDEPENDS_perl-module-locale-script += "perl-module-exporter"
+RDEPENDS_perl-module-locale-script += "perl-module-if"
+RDEPENDS_perl-module-locale-script += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-script += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-script += "perl-module-strict"
+RDEPENDS_perl-module-locale-script += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-math-bigint"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-math-complex"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-overload"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-strict"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-overload"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-strict"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-calcemu += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-calcemu += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-constant"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-integer"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-math-bigint-lib"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-math-bigint-calc"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-xsloader"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-overload"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-complex"
+RDEPENDS_perl-module-math-bigint += "perl-module-overload"
+RDEPENDS_perl-module-math-bigint += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-math-bigint"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-overload"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigrat += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-math-bigrat += "perl-module-math-bigint"
+RDEPENDS_perl-module-math-bigrat += "perl-module-overload"
+RDEPENDS_perl-module-math-bigrat += "perl-module-strict"
+RDEPENDS_perl-module-math-bigrat += "perl-module-warnings"
+RDEPENDS_perl-module-math-complex += "perl-module-config"
+RDEPENDS_perl-module-math-complex += "perl-module-exporter"
+RDEPENDS_perl-module-math-complex += "perl-module-overload"
+RDEPENDS_perl-module-math-complex += "perl-module-strict"
+RDEPENDS_perl-module-math-complex += "perl-module-warnings"
+RDEPENDS_perl-module-math-trig += "perl-module-exporter"
+RDEPENDS_perl-module-math-trig += "perl-module-math-complex"
+RDEPENDS_perl-module-math-trig += "perl-module-strict"
+RDEPENDS_perl-module-memoize-anydbm-file += "perl-module-vars"
+RDEPENDS_perl-module-memoize += "perl-module-config"
+RDEPENDS_perl-module-memoize += "perl-module-exporter"
+RDEPENDS_perl-module-memoize += "perl-module-strict"
+RDEPENDS_perl-module-memoize += "perl-module-vars"
+RDEPENDS_perl-module-memoize-sdbm-file += "perl-module-sdbm-file"
+RDEPENDS_perl-module-memoize-storable += "perl-module-storable"
+RDEPENDS_perl-module-mime-base64 += "perl-module-exporter"
+RDEPENDS_perl-module-mime-base64 += "perl-module-strict"
+RDEPENDS_perl-module-mime-base64 += "perl-module-vars"
+RDEPENDS_perl-module-mime-base64 += "perl-module-xsloader"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-exporter"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-mime-base64"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-strict"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-vars"
+RDEPENDS_perl-module-mro += "perl-module-strict"
+RDEPENDS_perl-module-mro += "perl-module-warnings"
+RDEPENDS_perl-module-mro += "perl-module-xsloader"
+RDEPENDS_perl-module-net-cmd += "perl-module-constant"
+RDEPENDS_perl-module-net-cmd += "perl-module-errno"
+RDEPENDS_perl-module-net-cmd += "perl-module-exporter"
+RDEPENDS_perl-module-net-cmd += "perl-module-strict"
+RDEPENDS_perl-module-net-cmd += "perl-module-warnings"
+RDEPENDS_perl-module-net-config += "perl-module-exporter"
+RDEPENDS_perl-module-net-config += "perl-module-socket"
+RDEPENDS_perl-module-net-config += "perl-module-strict"
+RDEPENDS_perl-module-net-config += "perl-module-warnings"
+RDEPENDS_perl-module-net-domain += "perl-module-exporter"
+RDEPENDS_perl-module-net-domain += "perl-module-net-config"
+RDEPENDS_perl-module-net-domain += "perl-module-posix"
+RDEPENDS_perl-module-net-domain += "perl-module-socket"
+RDEPENDS_perl-module-net-domain += "perl-module-strict"
+RDEPENDS_perl-module-net-domain += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-net-ftp-dataconn"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-errno"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-e += "perl-module-net-ftp-i"
+RDEPENDS_perl-module-net-ftp-e += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-e += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-net-ftp-dataconn"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-l += "perl-module-net-ftp-i"
+RDEPENDS_perl-module-net-ftp-l += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-l += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp += "perl-module-constant"
+RDEPENDS_perl-module-net-ftp += "perl-module-fcntl"
+RDEPENDS_perl-module-net-ftp += "perl-module-file-basename"
+RDEPENDS_perl-module-net-ftp += "perl-module-io-socket"
+RDEPENDS_perl-module-net-ftp += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-config"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-ftp-a"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-netrc"
+RDEPENDS_perl-module-net-ftp += "perl-module-socket"
+RDEPENDS_perl-module-net-ftp += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp += "perl-module-time-local"
+RDEPENDS_perl-module-net-ftp += "perl-module-warnings"
+RDEPENDS_perl-module-net-hostent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-hostent += "perl-module-exporter"
+RDEPENDS_perl-module-net-hostent += "perl-module-socket"
+RDEPENDS_perl-module-net-hostent += "perl-module-strict"
+RDEPENDS_perl-module-net-netent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-netent += "perl-module-exporter"
+RDEPENDS_perl-module-net-netent += "perl-module-socket"
+RDEPENDS_perl-module-net-netent += "perl-module-strict"
+RDEPENDS_perl-module-net-netrc += "perl-module-filehandle"
+RDEPENDS_perl-module-net-netrc += "perl-module-strict"
+RDEPENDS_perl-module-net-netrc += "perl-module-warnings"
+RDEPENDS_perl-module-net-nntp += "perl-module-io-socket"
+RDEPENDS_perl-module-net-nntp += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-nntp += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-nntp += "perl-module-net-config"
+RDEPENDS_perl-module-net-nntp += "perl-module-strict"
+RDEPENDS_perl-module-net-nntp += "perl-module-time-local"
+RDEPENDS_perl-module-net-nntp += "perl-module-warnings"
+RDEPENDS_perl-module-net-ping += "perl-module-constant"
+RDEPENDS_perl-module-net-ping += "perl-module-exporter"
+RDEPENDS_perl-module-net-ping += "perl-module-fcntl"
+RDEPENDS_perl-module-net-ping += "perl-module-filehandle"
+RDEPENDS_perl-module-net-ping += "perl-module-io-socket-inet"
+RDEPENDS_perl-module-net-ping += "perl-module-posix"
+RDEPENDS_perl-module-net-ping += "perl-module-socket"
+RDEPENDS_perl-module-net-ping += "perl-module-strict"
+RDEPENDS_perl-module-net-ping += "perl-module-time-hires"
+RDEPENDS_perl-module-net-pop3 += "perl-module-io-socket"
+RDEPENDS_perl-module-net-pop3 += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-pop3 += "perl-module-mime-base64"
+RDEPENDS_perl-module-net-pop3 += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-pop3 += "perl-module-net-config"
+RDEPENDS_perl-module-net-pop3 += "perl-module-net-netrc"
+RDEPENDS_perl-module-net-pop3 += "perl-module-strict"
+RDEPENDS_perl-module-net-pop3 += "perl-module-warnings"
+RDEPENDS_perl-module-net-protoent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-protoent += "perl-module-exporter"
+RDEPENDS_perl-module-net-protoent += "perl-module-strict"
+RDEPENDS_perl-module-net-servent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-servent += "perl-module-exporter"
+RDEPENDS_perl-module-net-servent += "perl-module-strict"
+RDEPENDS_perl-module-net-smtp += "perl-module-io-socket"
+RDEPENDS_perl-module-net-smtp += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-smtp += "perl-module-mime-base64"
+RDEPENDS_perl-module-net-smtp += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-smtp += "perl-module-net-config"
+RDEPENDS_perl-module-net-smtp += "perl-module-socket"
+RDEPENDS_perl-module-net-smtp += "perl-module-strict"
+RDEPENDS_perl-module-net-smtp += "perl-module-warnings"
+RDEPENDS_perl-module-net-time += "perl-module-exporter"
+RDEPENDS_perl-module-net-time += "perl-module-io-select"
+RDEPENDS_perl-module-net-time += "perl-module-io-socket"
+RDEPENDS_perl-module-net-time += "perl-module-net-config"
+RDEPENDS_perl-module-net-time += "perl-module-strict"
+RDEPENDS_perl-module-net-time += "perl-module-warnings"
+RDEPENDS_perl-module-next += "perl-module-overload"
+RDEPENDS_perl-module-next += "perl-module-strict"
+RDEPENDS_perl-module-next += "perl-module-warnings"
+RDEPENDS_perl-module-ok += "perl-module-strict"
+RDEPENDS_perl-module-ok += "perl-module-test-more"
+RDEPENDS_perl-module-opcode += "perl-module-exporter"
+RDEPENDS_perl-module-opcode += "perl-module-strict"
+RDEPENDS_perl-module-opcode += "perl-module-subs"
+RDEPENDS_perl-module-opcode += "perl-module-xsloader"
+RDEPENDS_perl-module-open += "perl-module-encode"
+RDEPENDS_perl-module-open += "perl-module-encoding"
+RDEPENDS_perl-module-open += "perl-module-warnings"
+RDEPENDS_perl-module-o += "perl-module-b"
+RDEPENDS_perl-module-ops += "perl-module-opcode"
+RDEPENDS_perl-module-overloading += "perl-module-overload-numbers"
+RDEPENDS_perl-module-overloading += "perl-module-warnings"
+RDEPENDS_perl-module-overload += "perl-module-mro"
+RDEPENDS_perl-module-overload += "perl-module-warnings-register"
+RDEPENDS_perl-module-params-check += "perl-module-exporter"
+RDEPENDS_perl-module-params-check += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-params-check += "perl-module-strict"
+RDEPENDS_perl-module-params-check += "perl-module-vars"
+RDEPENDS_perl-module-parent += "perl-module-strict"
+RDEPENDS_perl-module-parent += "perl-module-vars"
+RDEPENDS_perl-module-perlfaq += "perl-module-strict"
+RDEPENDS_perl-module-perlfaq += "perl-module-warnings"
+RDEPENDS_perl-module-perlio-encoding += "perl-module-strict"
+RDEPENDS_perl-module-perlio-encoding += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-mmap += "perl-module-strict"
+RDEPENDS_perl-module-perlio-mmap += "perl-module-warnings"
+RDEPENDS_perl-module-perlio-mmap += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-scalar += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-via += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-via-quotedprint += "perl-module-mime-quotedprint"
+RDEPENDS_perl-module-perlio-via-quotedprint += "perl-module-strict"
+RDEPENDS_perl-module-pod-checker += "perl-module-base"
+RDEPENDS_perl-module-pod-checker += "perl-module-exporter"
+RDEPENDS_perl-module-pod-checker += "perl-module-strict"
+RDEPENDS_perl-module-pod-checker += "perl-module-warnings"
+RDEPENDS_perl-module-pod-escapes += "perl-module-exporter"
+RDEPENDS_perl-module-pod-escapes += "perl-module-strict"
+RDEPENDS_perl-module-pod-escapes += "perl-module-vars"
+RDEPENDS_perl-module-pod-escapes += "perl-module-warnings"
+RDEPENDS_perl-module-pod-find += "perl-module-config"
+RDEPENDS_perl-module-pod-find += "perl-module-cwd"
+RDEPENDS_perl-module-pod-find += "perl-module-exporter"
+RDEPENDS_perl-module-pod-find += "perl-module-file-find"
+RDEPENDS_perl-module-pod-find += "perl-module-strict"
+RDEPENDS_perl-module-pod-find += "perl-module-vars"
+RDEPENDS_perl-module-pod-functions += "perl-module-exporter"
+RDEPENDS_perl-module-pod-functions += "perl-module-strict"
+RDEPENDS_perl-module-pod-inputobjects += "perl-module-strict"
+RDEPENDS_perl-module-pod-inputobjects += "perl-module-vars"
+RDEPENDS_perl-module-pod-man += "perl-module-file-basename"
+RDEPENDS_perl-module-pod-man += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-man += "perl-module-strict"
+RDEPENDS_perl-module-pod-man += "perl-module-subs"
+RDEPENDS_perl-module-pod-man += "perl-module-vars"
+RDEPENDS_perl-module-pod-man += "perl-module-warnings"
+RDEPENDS_perl-module-pod-parselink += "perl-module-exporter"
+RDEPENDS_perl-module-pod-parselink += "perl-module-strict"
+RDEPENDS_perl-module-pod-parselink += "perl-module-vars"
+RDEPENDS_perl-module-pod-parselink += "perl-module-warnings"
+RDEPENDS_perl-module-pod-parser += "perl-module-exporter"
+RDEPENDS_perl-module-pod-parser += "perl-module-pod-inputobjects"
+RDEPENDS_perl-module-pod-parser += "perl-module-strict"
+RDEPENDS_perl-module-pod-parser += "perl-module-vars"
+RDEPENDS_perl-module-pod-parseutils += "perl-module-strict"
+RDEPENDS_perl-module-pod-parseutils += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-config"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-getoptsoo += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-getoptsoo += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-config"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-encode"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-fcntl"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-file-basename"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-file-temp"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-pod-perldoc-getoptsoo"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-text-parsewords"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-pod-text-color"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-pod-checker"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-encode"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-io-handle"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-io-select"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-ipc-open3"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-pod-man"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-pod-perldoc-topod"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-pod-man"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-pod-text-termcap"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-warnings"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-pod-select"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-strict"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-vars"
+RDEPENDS_perl-module-pod-select += "perl-module-pod-parser"
+RDEPENDS_perl-module-pod-select += "perl-module-strict"
+RDEPENDS_perl-module-pod-select += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-integer"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-pod-simple-transcode"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-pod-simple-methody"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-text-wrap"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-dumpastext += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-dumpastext += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-text-wrap"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-overload"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-pod-simple-blackbox"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-methody += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-methody += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-methody += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple += "perl-module-integer"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-escapes"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-simple-blackbox"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-simple-linksection"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-simple-tiedoutfh"
+RDEPENDS_perl-module-pod-simple += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-progress += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserendtoken += "perl-module-pod-simple-pullparsertoken"
+RDEPENDS_perl-module-pod-simple-pullparserendtoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserendtoken += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparserendtoken"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparserstarttoken"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparsertexttoken"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-pod-simple-pullparsertoken"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-pullparsertexttoken += "perl-module-pod-simple-pullparsertoken"
+RDEPENDS_perl-module-pod-simple-pullparsertexttoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparsertexttoken += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-pullparsertoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-integer"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-pod-simple-pullparser"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-config"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-cwd"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-file-basename"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-pod-simple-methody"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-text-wrap"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-transcodedumb += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcodedumb += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-transcode += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcode += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-encode"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-color += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-text-color += "perl-module-strict"
+RDEPENDS_perl-module-pod-text-color += "perl-module-term-ansicolor"
+RDEPENDS_perl-module-pod-text-color += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-color += "perl-module-warnings"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-strict"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-warnings"
+RDEPENDS_perl-module-pod-text += "perl-module-encode"
+RDEPENDS_perl-module-pod-text += "perl-module-exporter"
+RDEPENDS_perl-module-pod-text += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-text += "perl-module-strict"
+RDEPENDS_perl-module-pod-text += "perl-module-vars"
+RDEPENDS_perl-module-pod-text += "perl-module-warnings"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-posix"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-strict"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-term-cap"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-warnings"
+RDEPENDS_perl-module-pod-usage += "perl-module-config"
+RDEPENDS_perl-module-pod-usage += "perl-module-exporter"
+RDEPENDS_perl-module-pod-usage += "perl-module-strict"
+RDEPENDS_perl-module-pod-usage += "perl-module-vars"
+RDEPENDS_perl-module-posix += "perl-module-exporter"
+RDEPENDS_perl-module-posix += "perl-module-fcntl"
+RDEPENDS_perl-module-posix += "perl-module-strict"
+RDEPENDS_perl-module-posix += "perl-module-tie-hash"
+RDEPENDS_perl-module-posix += "perl-module-warnings"
+RDEPENDS_perl-module-posix += "perl-module-xsloader"
+RDEPENDS_perl-module-re += "perl-module-exporter"
+RDEPENDS_perl-module-re += "perl-module-strict"
+RDEPENDS_perl-module-re += "perl-module-term-cap"
+RDEPENDS_perl-module-re += "perl-module-warnings"
+RDEPENDS_perl-module-re += "perl-module-xsloader"
+RDEPENDS_perl-module-safe += "perl-module-b"
+RDEPENDS_perl-module-safe += "perl-module-opcode"
+RDEPENDS_perl-module-safe += "perl-module-strict"
+RDEPENDS_perl-module-safe += "perl-module-utf8"
+RDEPENDS_perl-module-sdbm-file += "perl-module-exporter"
+RDEPENDS_perl-module-sdbm-file += "perl-module-strict"
+RDEPENDS_perl-module-sdbm-file += "perl-module-tie-hash"
+RDEPENDS_perl-module-sdbm-file += "perl-module-warnings"
+RDEPENDS_perl-module-sdbm-file += "perl-module-xsloader"
+RDEPENDS_perl-module-search-dict += "perl-module-exporter"
+RDEPENDS_perl-module-search-dict += "perl-module-feature"
+RDEPENDS_perl-module-search-dict += "perl-module-strict"
+RDEPENDS_perl-module-selfloader += "perl-module-exporter"
+RDEPENDS_perl-module-selfloader += "perl-module-io-handle"
+RDEPENDS_perl-module-selfloader += "perl-module-strict"
+RDEPENDS_perl-module-socket += "perl-module-exporter"
+RDEPENDS_perl-module-socket += "perl-module-strict"
+RDEPENDS_perl-module-socket += "perl-module-warnings-register"
+RDEPENDS_perl-module-socket += "perl-module-xsloader"
+RDEPENDS_perl-module-sort += "perl-module-strict"
+RDEPENDS_perl-module-storable += "perl-module-exporter"
+RDEPENDS_perl-module-storable += "perl-module-io-file"
+RDEPENDS_perl-module-storable += "perl-module-xsloader"
+RDEPENDS_perl-module-sub-util += "perl-module-exporter"
+RDEPENDS_perl-module-sub-util += "perl-module-list-util"
+RDEPENDS_perl-module-sub-util += "perl-module-strict"
+RDEPENDS_perl-module-sub-util += "perl-module-warnings"
+RDEPENDS_perl-module-sys-hostname += "perl-module-exporter"
+RDEPENDS_perl-module-sys-hostname += "perl-module-posix"
+RDEPENDS_perl-module-sys-hostname += "perl-module-strict"
+RDEPENDS_perl-module-sys-hostname += "perl-module-warnings"
+RDEPENDS_perl-module-sys-hostname += "perl-module-xsloader"
+RDEPENDS_perl-module-sys-syslog += "perl-module-config"
+RDEPENDS_perl-module-sys-syslog += "perl-module-constant"
+RDEPENDS_perl-module-sys-syslog += "perl-module-dynaloader"
+RDEPENDS_perl-module-sys-syslog += "perl-module-exporter"
+RDEPENDS_perl-module-sys-syslog += "perl-module-fcntl"
+RDEPENDS_perl-module-sys-syslog += "perl-module-file-basename"
+RDEPENDS_perl-module-sys-syslog += "perl-module-posix"
+RDEPENDS_perl-module-sys-syslog += "perl-module-socket"
+RDEPENDS_perl-module-sys-syslog += "perl-module-strict"
+RDEPENDS_perl-module-sys-syslog += "perl-module-sys-hostname"
+RDEPENDS_perl-module-sys-syslog += "perl-module-vars"
+RDEPENDS_perl-module-sys-syslog += "perl-module-warnings"
+RDEPENDS_perl-module-sys-syslog += "perl-module-warnings-register"
+RDEPENDS_perl-module-sys-syslog += "perl-module-xsloader"
+RDEPENDS_perl-module-tap-base += "perl-module-base"
+RDEPENDS_perl-module-tap-base += "perl-module-constant"
+RDEPENDS_perl-module-tap-base += "perl-module-strict"
+RDEPENDS_perl-module-tap-base += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-posix"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-tap-formatter-color"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-constant"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-constant"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-file-path"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-posix"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-posix"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-tap-formatter-file-session"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-session += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-session += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-session += "perl-module-warnings"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-constant"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-strict"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-tap-object"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-text-parsewords"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-warnings"
+RDEPENDS_perl-module-tap-harness += "perl-module-base"
+RDEPENDS_perl-module-tap-harness += "perl-module-file-path"
+RDEPENDS_perl-module-tap-harness += "perl-module-io-handle"
+RDEPENDS_perl-module-tap-harness += "perl-module-strict"
+RDEPENDS_perl-module-tap-harness += "perl-module-warnings"
+RDEPENDS_perl-module-tap-object += "perl-module-strict"
+RDEPENDS_perl-module-tap-object += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-benchmark"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-parser-resultfactory"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-parser-yamlish-reader"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-file-basename"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-config"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-io-handle"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-io-select"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser += "perl-module-base"
+RDEPENDS_perl-module-tap-parser += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-grammar"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-iterator"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-result"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-resultfactory"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-source"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-executable"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-file"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-handle"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-perl"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-rawtap"
+RDEPENDS_perl-module-tap-parser += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-bailout"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-comment"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-plan"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-pragma"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-test"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-unknown"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-version"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-yaml"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-tap-parser-scheduler-job"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-tap-parser-scheduler-spinner"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-iterator-stream"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-iterator-stream"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-tap-parser-iterator"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-config"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-text-parsewords"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-iterator-array"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-file-basename"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-warnings"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-exporter"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-strict"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-warnings"
+RDEPENDS_perl-module-term-cap += "perl-module-strict"
+RDEPENDS_perl-module-term-cap += "perl-module-vars"
+RDEPENDS_perl-module-term-complete += "perl-module-exporter"
+RDEPENDS_perl-module-term-complete += "perl-module-strict"
+RDEPENDS_perl-module-term-readline += "perl-module-strict"
+RDEPENDS_perl-module-term-readline += "perl-module-term-cap"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-warnings"
+RDEPENDS_perl-module-test-builder-module += "perl-module-exporter"
+RDEPENDS_perl-module-test-builder-module += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-module += "perl-module-test-builder"
+RDEPENDS_perl-module-test-builder += "perl-module-data-dumper"
+RDEPENDS_perl-module-test-builder += "perl-module-overload"
+RDEPENDS_perl-module-test-builder += "perl-module-strict"
+RDEPENDS_perl-module-test-builder += "perl-module-test-builder-formatter"
+RDEPENDS_perl-module-test-builder += "perl-module-test-builder-tododiag"
+RDEPENDS_perl-module-test-builder += "perl-module-warnings"
+RDEPENDS_perl-module-test-builder-tester-color += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-tester-color += "perl-module-test-builder-tester"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-exporter"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-test-builder"
+RDEPENDS_perl-module-test-builder-tododiag += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-tododiag += "perl-module-warnings"
+RDEPENDS_perl-module-test-harness += "perl-module-base"
+RDEPENDS_perl-module-test-harness += "perl-module-config"
+RDEPENDS_perl-module-test-harness += "perl-module-constant"
+RDEPENDS_perl-module-test-harness += "perl-module-strict"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-harness"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-aggregator"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-source"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-sourcehandler-perl"
+RDEPENDS_perl-module-test-harness += "perl-module-text-parsewords"
+RDEPENDS_perl-module-test-harness += "perl-module-warnings"
+RDEPENDS_perl-module-test-more += "perl-module-strict"
+RDEPENDS_perl-module-test-more += "perl-module-test-builder-module"
+RDEPENDS_perl-module-test-more += "perl-module-warnings"
+RDEPENDS_perl-module-test += "perl-module-exporter"
+RDEPENDS_perl-module-test += "perl-module-file-temp"
+RDEPENDS_perl-module-test += "perl-module-strict"
+RDEPENDS_perl-module-test-simple += "perl-module-strict"
+RDEPENDS_perl-module-test-simple += "perl-module-test-builder-module"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-config"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-strict"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-test-builder"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-threads-shared"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-vars"
+RDEPENDS_perl-module-test-tester-capturerunner += "perl-module-exporter"
+RDEPENDS_perl-module-test-tester-capturerunner += "perl-module-strict"
+RDEPENDS_perl-module-test-tester-capturerunner += "perl-module-test-tester-capture"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-strict"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-vars"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-warnings"
+RDEPENDS_perl-module-test-tester += "perl-module-exporter"
+RDEPENDS_perl-module-test-tester += "perl-module-strict"
+RDEPENDS_perl-module-test-tester += "perl-module-test-builder"
+RDEPENDS_perl-module-test-tester += "perl-module-test-tester-capturerunner"
+RDEPENDS_perl-module-test-tester += "perl-module-test-tester-delegate"
+RDEPENDS_perl-module-test-tester += "perl-module-vars"
+RDEPENDS_perl-module-text-abbrev += "perl-module-exporter"
+RDEPENDS_perl-module-text-balanced += "perl-module-exporter"
+RDEPENDS_perl-module-text-balanced += "perl-module-overload"
+RDEPENDS_perl-module-text-balanced += "perl-module-selfloader"
+RDEPENDS_perl-module-text-balanced += "perl-module-strict"
+RDEPENDS_perl-module-text-balanced += "perl-module-vars"
+RDEPENDS_perl-module-text-parsewords += "perl-module-exporter"
+RDEPENDS_perl-module-text-parsewords += "perl-module-strict"
+RDEPENDS_perl-module-text-tabs += "perl-module-exporter"
+RDEPENDS_perl-module-text-tabs += "perl-module-strict"
+RDEPENDS_perl-module-text-tabs += "perl-module-vars"
+RDEPENDS_perl-module-text-wrap += "perl-module-exporter"
+RDEPENDS_perl-module-text-wrap += "perl-module-re"
+RDEPENDS_perl-module-text-wrap += "perl-module-strict"
+RDEPENDS_perl-module-text-wrap += "perl-module-text-tabs"
+RDEPENDS_perl-module-text-wrap += "perl-module-vars"
+RDEPENDS_perl-module-text-wrap += "perl-module-warnings-register"
+RDEPENDS_perl-module-thread += "perl-module-config"
+RDEPENDS_perl-module-thread += "perl-module-exporter"
+RDEPENDS_perl-module-thread += "perl-module-strict"
+RDEPENDS_perl-module-thread += "perl-module-threads"
+RDEPENDS_perl-module-thread += "perl-module-threads-shared"
+RDEPENDS_perl-module-thread += "perl-module-warnings"
+RDEPENDS_perl-module-thread-queue += "perl-module-strict"
+RDEPENDS_perl-module-thread-queue += "perl-module-threads-shared"
+RDEPENDS_perl-module-thread-queue += "perl-module-warnings"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-strict"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-threads-shared"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-warnings"
+RDEPENDS_perl-module-threads += "perl-module-config"
+RDEPENDS_perl-module-threads += "perl-module-overload"
+RDEPENDS_perl-module-threads += "perl-module-strict"
+RDEPENDS_perl-module-threads += "perl-module-warnings"
+RDEPENDS_perl-module-threads += "perl-module-xsloader"
+RDEPENDS_perl-module-threads-shared += "perl-module-strict"
+RDEPENDS_perl-module-threads-shared += "perl-module-warnings"
+RDEPENDS_perl-module-threads-shared += "perl-module-xsloader"
+RDEPENDS_perl-module-tie-array += "perl-module-strict"
+RDEPENDS_perl-module-tie-file += "perl-module-fcntl"
+RDEPENDS_perl-module-tie-file += "perl-module-posix"
+RDEPENDS_perl-module-tie-file += "perl-module-strict"
+RDEPENDS_perl-module-tie-handle += "perl-module-tie-stdhandle"
+RDEPENDS_perl-module-tie-handle += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-strict"
+RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-xsloader"
+RDEPENDS_perl-module-tie-hash += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-memoize += "perl-module-strict"
+RDEPENDS_perl-module-tie-memoize += "perl-module-tie-hash"
+RDEPENDS_perl-module-tie-refhash += "perl-module-config"
+RDEPENDS_perl-module-tie-refhash += "perl-module-overload"
+RDEPENDS_perl-module-tie-refhash += "perl-module-strict"
+RDEPENDS_perl-module-tie-refhash += "perl-module-tie-hash"
+RDEPENDS_perl-module-tie-refhash += "perl-module-vars"
+RDEPENDS_perl-module-tie-scalar += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-stdhandle += "perl-module-strict"
+RDEPENDS_perl-module-tie-stdhandle += "perl-module-tie-handle"
+RDEPENDS_perl-module-tie-substrhash += "perl-module-integer"
+RDEPENDS_perl-module-time-gmtime += "perl-module-exporter"
+RDEPENDS_perl-module-time-gmtime += "perl-module-strict"
+RDEPENDS_perl-module-time-gmtime += "perl-module-time-tm"
+RDEPENDS_perl-module-time-hires += "perl-module-exporter"
+RDEPENDS_perl-module-time-hires += "perl-module-strict"
+RDEPENDS_perl-module-time-hires += "perl-module-xsloader"
+RDEPENDS_perl-module-time-local += "perl-module-config"
+RDEPENDS_perl-module-time-local += "perl-module-constant"
+RDEPENDS_perl-module-time-local += "perl-module-exporter"
+RDEPENDS_perl-module-time-local += "perl-module-parent"
+RDEPENDS_perl-module-time-local += "perl-module-strict"
+RDEPENDS_perl-module-time-localtime += "perl-module-exporter"
+RDEPENDS_perl-module-time-localtime += "perl-module-strict"
+RDEPENDS_perl-module-time-localtime += "perl-module-time-tm"
+RDEPENDS_perl-module-time-piece += "perl-module-constant"
+RDEPENDS_perl-module-time-piece += "perl-module-exporter"
+RDEPENDS_perl-module-time-piece += "perl-module-integer"
+RDEPENDS_perl-module-time-piece += "perl-module-overload"
+RDEPENDS_perl-module-time-piece += "perl-module-strict"
+RDEPENDS_perl-module-time-piece += "perl-module-time-local"
+RDEPENDS_perl-module-time-piece += "perl-module-time-seconds"
+RDEPENDS_perl-module-time-piece += "perl-module-xsloader"
+RDEPENDS_perl-module-time-seconds += "perl-module-constant"
+RDEPENDS_perl-module-time-seconds += "perl-module-exporter"
+RDEPENDS_perl-module-time-seconds += "perl-module-overload"
+RDEPENDS_perl-module-time-seconds += "perl-module-strict"
+RDEPENDS_perl-module-time-tm += "perl-module-class-struct"
+RDEPENDS_perl-module-time-tm += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-big5 += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-big5 += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-gb2312 += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-gb2312 += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-jisx0208 += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-jisx0208 += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-korean += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-korean += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-pinyin += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-pinyin += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-stroke += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-stroke += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-zhuyin += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-zhuyin += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-base"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate += "perl-module-constant"
+RDEPENDS_perl-module-unicode-collate += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate += "perl-module-xsloader"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-exporter"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-strict"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-xsloader"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-charnames"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-exporter"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-feature"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-if"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-integer"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-strict"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-unicode-normalize"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-utf8-heavy"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-warnings"
+RDEPENDS_perl-module-user-grent += "perl-module-class-struct"
+RDEPENDS_perl-module-user-grent += "perl-module-exporter"
+RDEPENDS_perl-module-user-grent += "perl-module-strict"
+RDEPENDS_perl-module-user-pwent += "perl-module-class-struct"
+RDEPENDS_perl-module-user-pwent += "perl-module-config"
+RDEPENDS_perl-module-user-pwent += "perl-module-exporter"
+RDEPENDS_perl-module-user-pwent += "perl-module-strict"
+RDEPENDS_perl-module-user-pwent += "perl-module-warnings"
+RDEPENDS_perl-module-utf8 += "perl-module-utf8-heavy"
+RDEPENDS_perl-module-version += "perl-module-strict"
+RDEPENDS_perl-module-version += "perl-module-version-regex"
+RDEPENDS_perl-module-version += "perl-module-warnings-register"
+RDEPENDS_perl-module-version-regex += "perl-module-strict"
+RDEPENDS_perl-module-xsloader += "perl-module-dynaloader"
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.0.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.0.bb
new file mode 100644
index 00000000000..d765db8d1bb
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.0.bb
@@ -0,0 +1,224 @@
+SUMMARY = "Perl scripting language"
+HOMEPAGE = "http://www.perl.org/"
+SECTION = "devel"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
+                    file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
+                    "
+
+
+SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
+           https://github.com/arsv/perl-cross/releases/download/1.2/perl-cross-1.2.tar.gz;name=perl-cross \
+           file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
+           file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
+           file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
+           file://perl-configpm-switch.patch \
+           file://errno_ver.diff \
+           file://native-perlinc.patch \
+           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
+           file://perl-dynloader.patch \
+           "
+
+SRC_URI[perl.md5sum] = "c7c63781745e280e08401a306a83bfb8"
+SRC_URI[perl.sha256sum] = "7e929f64d4cb0e9d1159d4a59fc89394e27fa1f7004d0836ca0d514685406ea8"
+SRC_URI[perl-cross.md5sum] = "2d702f8fa1dba84d0a62de30e8a9c263"
+SRC_URI[perl-cross.sha256sum] = "599077beb86af5e6097da8922a84474a5484f61475d2899eae0f8634e9619109"
+
+S = "${WORKDIR}/perl-${PV}"
+
+inherit upstream-version-is-even
+
+do_unpack_append() {
+    bb.build.exec_func('do_copy_perlcross', d)
+}
+
+do_copy_perlcross() {
+    cp -rf ${WORKDIR}/perl-cross*/* ${S}
+}
+
+do_configure_class-target() {
+    ./configure --prefix=${prefix} \
+    --target=${TARGET_SYS} \
+    -Duseshrplib \
+    -Dsoname=libperl.so.5 \
+    -Dvendorprefix=${prefix} \
+    -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-${TARGET_OS}
+}
+
+do_configure_class-nativesdk() {
+    ./configure --prefix=${prefix} \
+    --target=${TARGET_SYS} \
+    -Duseshrplib \
+    -Dsoname=libperl.so.5 \
+    -Dvendorprefix=${prefix} 
+
+}
+
+do_configure_class-native() {
+    ./configure --prefix=${prefix} \
+    -Duseshrplib \
+    -Dsoname=libperl.so.5 \
+    -Dvendorprefix=${prefix}
+}
+
+do_compile() {
+    oe_runmake miniperl
+    oe_runmake config-pm
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+
+    install -d ${D}${libdir}/perl5
+    install -d ${D}${libdir}/perl5/${PV}/
+    install -d ${D}${libdir}/perl5/${PV}/ExtUtils/
+
+    # Save native config
+    install config.sh ${D}${libdir}/perl5
+    install lib/Config.pm ${D}${libdir}/perl5/${PV}/
+    install lib/ExtUtils/typemap ${D}${libdir}/perl5/${PV}/ExtUtils/
+
+    # Fix up shared library
+    rm ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-${TARGET_OS}/CORE/libperl.so
+    ln -sf ../../../../libperl.so.${PV} ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-${TARGET_OS}/CORE/libperl.so
+}
+
+do_install_append_class-target() {
+    # This is used to substitute target configuration when running native perl via perl-configpm-switch.patch
+    ln -s Config_heavy.pl ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-${TARGET_OS}/Config_heavy-target.pl
+
+}
+
+do_install_append_class-native () {
+    # Those wrappers mean that perl installed from sstate (which may change
+    # path location) works and that in the nativesdk case, the SDK can be
+    # installed to a different location from the one it was built for.
+    create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl5/site_perl/${PV}:${STAGING_LIBDIR}/perl5/vendor_perl/${PV}:${STAGING_LIBDIR}/perl5/${PV}'
+    create_wrapper ${D}${bindir}/perl${PV} PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl5/site_perl/${PV}:${STAGING_LIBDIR}/perl5/vendor_perl/${PV}:${STAGING_LIBDIR}/perl5/${PV}'
+}
+
+require perl-ptest.inc
+require perl-rdepends_${PV}.inc
+
+FILES_${PN}_append = " ${libdir}/libperl.so* \
+               ${libdir}/perl5/site_perl \
+               ${libdir}/perl5/${PV}/Config.pm \
+               ${libdir}/perl5/${PV}/*/Config_heavy-target.pl \
+               ${libdir}/perl5/config.sh \
+               ${libdir}/perl5/${PV}/strict.pm \
+               ${libdir}/perl5/${PV}/warnings.pm \
+               ${libdir}/perl5/${PV}/warnings \
+               ${libdir}/perl5/${PV}/vars.pm \
+               ${libdir}/perl5/site_perl \
+               "
+
+FILES_${PN}-staticdev_append = " ${libdir}/perl5/${PV}/*/CORE/libperl.a"
+
+FILES_${PN}-dev_append = " ${libdir}/perl5/${PV}/*/CORE"
+
+FILES_${PN}-doc_append = " ${libdir}/perl5/${PV}/Unicode/Collate/*.txt \
+                           ${libdir}/perl5/${PV}/*/.packlist \
+                           ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
+                           ${libdir}/perl5/${PV}/ExtUtils/xsubpp \
+                           ${libdir}/perl5/${PV}/ExtUtils/typemap \
+                           ${libdir}/perl5/${PV}/Encode/encode.h \
+                         "
+
+PACKAGES_append = " ${PN}-pod"
+
+FILES_${PN}-pod = "${libdir}/perl5/${PV}/pod \
+                   ${libdir}/perl5/${PV}/*.pod \
+                   ${libdir}/perl5/${PV}/*/*.pod \
+                   ${libdir}/perl5/${PV}/*/*/*.pod \ 
+                   ${libdir}/perl5/${PV}/*/*/*/*.pod \ 
+                  "
+
+PACKAGES_append = " ${PN}-module-cpan ${PN}-module-unicore"
+
+FILES_${PN}-module-cpan += "${libdir}/perl5/${PV}/CPAN \
+                          "
+FILES_${PN}-module-unicore += "${libdir}/perl5/${PV}/unicore"
+
+# Create a perl-modules package recommending all the other perl
+# packages (actually the non modules packages and not created too)
+ALLOW_EMPTY_${PN}-modules = "1"
+PACKAGES_append = " ${PN}-modules "
+
+PACKAGESPLITFUNCS_prepend = "split_perl_packages "
+
+python split_perl_packages () {
+    libdir = d.expand('${libdir}/perl5/${PV}')
+    do_split_packages(d, libdir, '.*/auto/([^.]*)/[^/]*\.(so|ld|ix|al)', '${PN}-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
+    do_split_packages(d, libdir, '.*linux/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, 'Module/([^\/]*)/.*', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, '.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+
+    # perl-modules should recommend every perl module, and only the
+    # modules. Don't attempt to use the result of do_split_packages() as some
+    # modules are manually split (eg. perl-module-unicore).
+    packages = filter(lambda p: '${PN}-module-' in p, d.getVar('PACKAGES').split())
+    d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
+}
+
+PACKAGES_DYNAMIC_class-target += "^${PN}-module-.*"
+PACKAGES_DYNAMIC_class-nativesdk += "^${PN}-module-.*"
+
+PACKAGES_append = " ${PN}-misc"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
+
+do_create_rdepends_inc() {
+    cd ${WORKDIR}
+    cat <<'EOPREAMBLE' > ${WORKDIR}/perl-rdepends.inc
+# To create/update the perl-rdepends_${PV}.inc use this piece of ugly script (modified for your arch/paths etc):
+
+#jiahongxu:5.20.0-r1$ pwd
+#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl/5.20.0-r1
+
+#1 cp -r packages-split packages-split.new && cd packages-split.new
+#2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
+#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm"
+#| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:]
+#| awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'
+#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix
+#| sort -u
+#| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
+#| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rdepends
+
+RDEPENDS_perl-misc += "perl perl-modules"
+RDEPENDS_${PN}-pod += "perl"
+
+# Some additional dependencies that the above doesn't manage to figure out
+RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
+RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigint-calc"
+RDEPENDS_${PN}-module-thread-queue += "${PN}-module-attributes"
+RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
+
+# Generated depends list beyond this line
+EOPREAMBLE
+    test -e packages-split.new && rm -rf packages-split.new
+    cp -r packages-split packages-split.new && cd packages-split.new
+    find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
+    egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" | \
+    sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] | \
+    awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'| \
+    grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix | \
+    sort -u | \
+    sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | \
+    egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-socket-inet6|module-io-socket-ssl|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-test2|module-text-unidecode|module-unicore|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' | \
+    egrep -wv '=>|module-algorithm-diff|module-carp|module-c<extutils-mm-unix>|module-encode-hanextra|module-extutils-makemaker-version-regex|module-file-spec|module-io-compress-lzma|module-locale-maketext-lexicon|module-log-agent|module-meta-notation|module-net-localcfg|module-net-ping-external|module-b-deparse|module-scalar-util|module-some-module|module-symbol|module-uri|module-win32api-file' >> ${WORKDIR}/perl-rdepends.inc
+    cp ${WORKDIR}/perl-rdepends.inc ${THISDIR}/perl-rdepends_${PV}.inc
+}
+
+# bitbake perl -c create_rdepends_inc
+addtask do_create_rdepends_inc
+
+# Make sure we have native python ready when we create a new manifest
+do_create_rdepends_inc[depends] += "python3:do_prepare_recipe_sysroot"
+do_create_rdepends_inc[depends] += "python3:do_package"
+do_create_rdepends_inc[depends] += "python3:do_patch"
-- 
2.17.1


