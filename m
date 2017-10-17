Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 798CB78307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:11:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 17 Oct 2017 12:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="161566046"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga005.jf.intel.com with ESMTP; 17 Oct 2017 12:11:32 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 12:11:26 -0700
Message-Id: <20171017191130.41996-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
Subject: [PATCH v3 1/5] perl-native: upgrade from 5.24.1 to 5.26.1
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
X-List-Received-Date: Tue, 17 Oct 2017 19:11:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Patch Name # Status at 5.26.1

file://Configure-multilib.patch        # Already merged in 5.26.1, so removed it
file://perl-configpm-switch.patch      # Applies as it is
file://native-nopacklist.patch         # Rebased it to 5.26.1
file://native-perlinc.patch            # Already merged in 5.26.1, so removed it
file://MM_Unix.pm.patch                # Rebased it to 5.26.1
file://debian/errno_ver.diff           # Applies as it is
file://dynaloaderhack.patch            # Applies as it is
lfile://perl-PathTools-don-t-filter-out-blib-from-INC.patch            # Already merged in 5.26.1, so removed it
file://0001-Configure-Remove-fstack-protector-strong-for-native-.patch # Applies as it is

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 ...perl-native_5.24.1.bb => perl-native_5.26.1.bb} | 10 +++---
 ...emove-fstack-protector-strong-for-native-.patch |  1 +
 meta/recipes-devtools/perl/perl/MM_Unix.pm.patch   |  9 ++---
 .../perl/perl/native-nopacklist.patch              | 40 +++++++++++++++-------
 4 files changed, 37 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/perl/{perl-native_5.24.1.bb => perl-native_5.26.1.bb} (93%)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb b/meta/recipes-devtools/perl/perl-native_5.26.1.bb
similarity index 93%
rename from meta/recipes-devtools/perl/perl-native_5.24.1.bb
rename to meta/recipes-devtools/perl/perl-native_5.26.1.bb
index e01d11fbed..8f5b872cbc 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.26.1.bb
@@ -7,19 +7,17 @@ DEPENDS += "gdbm-native zlib-native"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 SRC_URI += "\
-           file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
            file://native-nopacklist.patch \
-           file://native-perlinc.patch \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
            file://0001-Configure-Remove-fstack-protector-strong-for-native-.patch \
-          "
+           "
+
+SRC_URI[md5sum] = "70e988b4318739b0cf3ad5e120bfde88"
+SRC_URI[sha256sum] = "fe8208133e73e47afc3251c08d2c21c5a60160165a8ab8b669c43a420e4ec680"
 
-SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
-SRC_URI[sha256sum] = "03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f"
 
 inherit native
 
diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
index 14a05d291b..36cd8939c3 100644
--- a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
+++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
@@ -15,6 +15,7 @@ Upstream-Status: Inappropriate [configuration]
 [1] http://errors.yoctoproject.org/Errors/Details/109589/
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
 ---
  Configure | 54 ------------------------------------------------------
  1 file changed, 54 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch b/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
index eb92ccb678..cdae438d2c 100644
--- a/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
+++ b/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
@@ -7,16 +7,17 @@ To get the MakeMaker.pm works in this case, we need perl wrapper here
 instead of real perl binary.
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
 ===================================================================
 --- perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig	2011-08-12 16:07:30.000000000 +0800
 +++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2011-08-12 16:08:56.000000000 +0800
-@@ -1019,6 +1019,9 @@
+@@ -1110,6 +1110,9 @@ WARNING
      }
  
      foreach my $name (@$names){
 +        # Getting MakeMaker.pm use perl wrapper instead of 'perl.real' directly
 +        $name =~ s/perl\.real/perl/ if ($name =~ /perl\.real/);
 +
-         foreach my $dir (@$dirs){
-             next unless defined $dir; # $self->{PERL_SRC} may be undefined
-             my ($abs, $val);
+         my ($abs, $use_dir);
+         if ($self->file_name_is_absolute($name)) {     # /foo/bar
+             $abs = $name;
diff --git a/meta/recipes-devtools/perl/perl/native-nopacklist.patch b/meta/recipes-devtools/perl/perl/native-nopacklist.patch
index 5482dcb79c..993f3302bf 100644
--- a/meta/recipes-devtools/perl/perl/native-nopacklist.patch
+++ b/meta/recipes-devtools/perl/perl/native-nopacklist.patch
@@ -3,15 +3,16 @@ Upstream-Status:Inappropriate [debian patch]
 Part of 52_debian_extutils_hacks.patch just to exclude the installation of .packlist files
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |   35 ++---------------------
- 1 file changed, 3 insertions(+), 32 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 41 ++-----------------------
+ 1 file changed, 3 insertions(+), 38 deletions(-)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index f63145c..a589710 100644
+index 66a24d7..f9dbc6e 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2122,11 +2122,6 @@ pure_perl_install :: all
+@@ -2227,11 +2227,6 @@ pure_perl_install :: all
  };
  
      push @m,
@@ -23,18 +24,31 @@ index f63145c..a589710 100644
  q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
  		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
  		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
-@@ -2158,10 +2153,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
- pure_vendor_install :: all
+@@ -2246,11 +2241,6 @@ pure_site_install :: all
  	$(NOECHO) $(MOD_INSTALL) \
  };
+     push @m,
+-q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLSITEARCH)','auto','$(FULLEXT)','.packlist').q{" \
+-} unless $self->{NO_PACKLIST};
+-
 -    push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
+ 		"$(INST_ARCHLIB)" "$(DESTINSTALLSITEARCH)" \
+ 		"$(INST_BIN)" "$(DESTINSTALLSITEBIN)" \
+@@ -2264,11 +2254,6 @@ pure_vendor_install :: all
+ 	$(NOECHO) $(MOD_INSTALL) \
+ };
+     push @m,
 -q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
 -		write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','.packlist').q{" \
 -} unless $self->{NO_PACKLIST};
- 
-     push @m,
+-
+-    push @m,
  q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
-@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
+ 		"$(INST_ARCHLIB)" "$(DESTINSTALLVENDORARCH)" \
+ 		"$(INST_BIN)" "$(DESTINSTALLVENDORBIN)" \
+@@ -2292,37 +2277,19 @@ doc_vendor_install :: all
  
      push @m, q{
  doc_perl_install :: all
@@ -42,7 +56,7 @@ index f63145c..a589710 100644
 -	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
 -	-$(NOECHO) $(DOC_INSTALL) \
 -		"Module" "$(NAME)" \
--		"installed into" $(INSTALLPRIVLIB) \
+-		"installed into" "$(INSTALLPRIVLIB)" \
 -		LINKTYPE "$(LINKTYPE)" \
 -		VERSION "$(VERSION)" \
 -		EXE_FILES "$(EXE_FILES)" \
@@ -55,7 +69,7 @@ index f63145c..a589710 100644
 +	-$(NOECHO) $(MKPATH) "$(DESTINSTALLSITEARCH)"
  	-$(NOECHO) $(DOC_INSTALL) \
  		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLSITELIB) \
+ 		"installed into" "$(INSTALLSITELIB)" \
  		LINKTYPE "$(LINKTYPE)" \
  		VERSION "$(VERSION)" \
  		EXE_FILES "$(EXE_FILES)" \
@@ -67,7 +81,7 @@ index f63145c..a589710 100644
 -	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
 -	-$(NOECHO) $(DOC_INSTALL) \
 -		"Module" "$(NAME)" \
--		"installed into" $(INSTALLVENDORLIB) \
+-		"installed into" "$(INSTALLVENDORLIB)" \
 -		LINKTYPE "$(LINKTYPE)" \
 -		VERSION "$(VERSION)" \
 -		EXE_FILES "$(EXE_FILES)" \
@@ -75,7 +89,7 @@ index f63145c..a589710 100644
  
  } unless $self->{NO_PERLLOCAL};
  
-@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
+@@ -2331,13 +2298,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
  	$(NOECHO) $(NOOP)
  
  uninstall_from_perldirs ::
-- 
2.12.3


