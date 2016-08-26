Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE04734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 02:27:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7Q2RTYW013413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 19:27:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 25 Aug 2016 19:27:29 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2016 10:25:49 +0800
Message-ID: <1472178349-32199-5-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] extutils-makemaker-perl: add new recipe
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
X-List-Received-Date: Fri, 26 Aug 2016 02:27:29 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add extutils-makemaker-perl recipe as
  file-homedir-perl depends on
  extutils-makemaker-perl-native

* Add no-packlist-neither-perllocal-legacy.patch
  to avoid generating of .packlist and perllocal.pod
  files to avoid conflicts between packages writing
  same file

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../no-packlist-neither-perllocal-legacy.patch     | 96 ++++++++++++++++++++++
 .../perl/extutils-makemaker-perl_7.10.bb           | 27 ++++++
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/extutils-makemaker-perl/no-packlist-neither-perllocal-legacy.patch
 create mode 100644 meta/recipes-devtools/perl/extutils-makemaker-perl_7.10.bb

diff --git a/meta/recipes-devtools/perl/extutils-makemaker-perl/no-packlist-neither-perllocal-legacy.patch b/meta/recipes-devtools/perl/extutils-makemaker-perl/no-packlist-neither-perllocal-legacy.patch
new file mode 100644
index 0000000..30e55cb
--- /dev/null
+++ b/meta/recipes-devtools/perl/extutils-makemaker-perl/no-packlist-neither-perllocal-legacy.patch
@@ -0,0 +1,96 @@
+--- a/lib/ExtUtils/MM_Unix.pm	2014-12-02 13:44:33.000000000 +0100
++++ b/lib/ExtUtils/MM_Unix.pm	2015-07-08 12:45:07.000000000 +0200
+@@ -2122,11 +2122,6 @@
+ };
+ 
+     push @m,
+-q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
+-} unless $self->{NO_PACKLIST};
+-
+-    push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
+ 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
+ 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
+@@ -2140,10 +2135,6 @@
+ pure_site_install :: all
+ 	$(NOECHO) $(MOD_INSTALL) \
+ };
+-    push @m,
+-q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLSITEARCH)','auto','$(FULLEXT)','.packlist').q{" \
+-} unless $self->{NO_PACKLIST};
+ 
+     push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
+@@ -2158,10 +2149,6 @@
+ pure_vendor_install :: all
+ 	$(NOECHO) $(MOD_INSTALL) \
+ };
+-    push @m,
+-q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','.packlist').q{" \
+-} unless $self->{NO_PACKLIST};
+ 
+     push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
+@@ -2183,43 +2170,7 @@
+ doc_vendor_install :: all
+ 	$(NOECHO) $(NOOP)
+ 
+-} if $self->{NO_PERLLOCAL};
+-
+-    push @m, q{
+-doc_perl_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLPRIVLIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+-
+-doc_site_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLSITELIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+-
+-doc_vendor_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLVENDORLIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+-
+-} unless $self->{NO_PERLLOCAL};
++};
+ 
+     push @m, q{
+ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
+@@ -2570,14 +2521,6 @@
+ 
+     push @m, q{
+ doc_inst_perl :
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
+-		"Perl binary" "$(MAP_TARGET)" \
+-		MAP_STATIC "$(MAP_STATIC)" \
+-		MAP_EXTRA "`cat $(INST_ARCHAUTODIR)/extralibs.all`" \
+-		MAP_LIBPERL "$(MAP_LIBPERL)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+ 
+ };
+ 
diff --git a/meta/recipes-devtools/perl/extutils-makemaker-perl_7.10.bb b/meta/recipes-devtools/perl/extutils-makemaker-perl_7.10.bb
new file mode 100644
index 0000000..0bcf161
--- /dev/null
+++ b/meta/recipes-devtools/perl/extutils-makemaker-perl_7.10.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This utility is designed to write a Makefile for an extension module \
+from a Makefile.PL. It is based on the Makefile.SH model provided by \
+Andy Dougherty and the perl5-porters."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/ExtUtils-MakeMaker"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "\
+    https://cpan.metacpan.org/authors/id/B/BI/BINGOS/ExtUtils-MakeMaker-${PV}.tar.gz \
+    file://no-packlist-neither-perllocal-legacy.patch \
+"
+
+SRC_URI[md5sum] = "2639a21adee5e0a903730c12dcba08ec"
+SRC_URI[sha256sum] = "83b76cd49e458a55774e2e8d87bd1107bc159ba4219600c8ef10c6b43b0d94c5"
+
+S = "${WORKDIR}/ExtUtils-MakeMaker-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


