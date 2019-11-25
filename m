Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id C4CB47FB43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:22:30 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z10so19044119wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FfuG2nIi5PAva8cZaktDmOooPKY+4Ff9yYXCKj0ZuR4=;
	b=ILIwrNbGUTtLkaX3+pAfHQpLJoMr5nlp+7Q8FZIE/JsdxyQRXw7X6rDMD4CDm7ZDaI
	Apagn4eelh/RPnIiLZikOdWnHtCcQi4c/loNNaQKn+QwG42H6BmNtlYHieP2uJI0GNoZ
	88qbmR9tmSkh8RmG62HqHqbwByrxKkoKHuHSWr0aKsbHwOVfjky39sMrfSX91O6dMglk
	UP0D9reDxUOGKaFgu4qSsUdgPSSLMk7nONczBvGbYJ6u8NzsjAKn0RhC8E5zHXcB3u3S
	iM3W5NlLVXFXbqlu6XK3FlmuMB5dqt4i/yhDZH6SFE6jHJwc+sn1Gp2Dat+1Pvd2+ZMn
	jlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FfuG2nIi5PAva8cZaktDmOooPKY+4Ff9yYXCKj0ZuR4=;
	b=ZGSDIGF+0+R03A+KzohCXaDnJaOXwmWfmOvFkxoOTd3cvUEel1a+n5B3VhVdQ4RN6k
	ag9DwxKYhzcBdLCLj/j6R0SVbDWKLxIazZeaT2QLfpfh7pBe70B5mZezzBbeswOE2G0O
	3V/TVqSFmoTWxs9qmSo+0pKsStz3kekdO9065Pi5DAjolVCSKFu4cXx0UW7G7RpvKMml
	s5cORNvQmoHEQnuWWYuKU5YLyrH2aifqs8ZCAvCU4DAKihMVDkRGwk0tvTTHtnPU99cx
	eaPzWWXzK7fvUNNlARWjEwL8TunbC2BGuaLNTwddJT/jnVwZAsMbWHHvWURDf3JPuxGO
	qmvA==
X-Gm-Message-State: APjAAAVJsJpAjMWEdwGD4iIj3iArZxhMjMtK9JIxki+XWmOxOy3ZmviJ
	dDy97iwvtA6uQEToc1qmwPSBT/Ux
X-Google-Smtp-Source: APXvYqyvEaeWwkcXj8gxIEmGgbOmM6riu2UosxCEV2EoJr2ejI/CfDiVe+fp5qkF0Mp6a1Uzc8aFzQ==
X-Received: by 2002:a5d:6746:: with SMTP id l6mr28273928wrw.349.1574702551009; 
	Mon, 25 Nov 2019 09:22:31 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f140sm9693357wme.21.2019.11.25.09.22.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 09:22:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 18:22:22 +0100
Message-Id: <20191125172224.82269-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125172224.82269-1-alex.kanavin@gmail.com>
References: <20191125172224.82269-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] python: clean up command overriding
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
X-List-Received-Date: Mon, 25 Nov 2019 17:22:31 -0000

From: Ross Burton <ross.burton@intel.com>

There's no need to add HOSTPGEN or HOSTPYTHON variables when we can just
override the existing PGEN and PYTHON_FOR_BUILD variables.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../01-use-proper-tools-for-cross-build.patch | 65 +------------------
 .../fix_for_using_different_libdir.patch      | 38 ++++-------
 meta/recipes-devtools/python/python_2.7.17.bb |  9 +--
 3 files changed, 20 insertions(+), 92 deletions(-)

diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index e795a74b911..fa6c5ef1d7f 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -1,29 +1,13 @@
-We need to ensure our host tools get run during build, not the freshly
-built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+Unfortunately the explanation for these changes have been lost to the mists of
+time.
 
 Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Rebased for python-2.7.9
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-Rebased for python-2.7.14
-Signed-off-by: Derek Straka <derek@asterius.io>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Index: Python-2.7.13/Makefile.pre.in
 ===================================================================
 --- Python-2.7.13.orig/Makefile.pre.in
 +++ Python-2.7.13/Makefile.pre.in
-@@ -245,6 +245,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
-+HOSTPGEN=	$(PGEN)$(EXE)
- 
- PSRCS=		\
- 		Parser/acceler.c \
 @@ -512,7 +513,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
  			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
  
@@ -33,49 +17,6 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Create build directory and generate the sysconfig build-time data there.
  # pybuilddir.txt contains the name of the build dir and is used for
-@@ -663,7 +663,7 @@
- 	# Regenerate Include/graminit.h and Python/graminit.c
- 	# from Grammar/Grammar using pgen
- 	@$(MKDIR_P) Include
--	$(PGEN) $(srcdir)/Grammar/Grammar \
-+	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
- 		$(srcdir)/Include/graminit.h \
- 		$(srcdir)/Python/graminit.c
- 
-@@ -1121,27 +1122,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
- 	fi
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
-+		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
-+		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
 Index: Python-2.7.13/setup.py
 ===================================================================
 --- Python-2.7.13.orig/setup.py
diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
index 5f7309367c4..eeb6833186e 100644
--- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -1,19 +1,9 @@
-Upstream-Status: Inappropriate [Embedded specific]
-
 This patch fixes issuing with different libdir like lib64.
 This patch makes the native python binary modules findable
 in the install process of the host python.
 
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2012/03/14
-
-Updated for python 2.7.3
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2012/05/01
-
-Rebased for python-2.7.9
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
+Upstream-Status: Inappropriate [Embedded specific]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Index: Python-2.7.9/Lib/sysconfig.py
 ===================================================================
@@ -37,41 +27,41 @@ Index: Python-2.7.9/Lib/sysconfig.py
          'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
-Index: Python-2.7.9/Makefile.pre.in
-===================================================================
---- Python-2.7.9.orig/Makefile.pre.in
-+++ Python-2.7.9/Makefile.pre.in
-@@ -1046,27 +1046,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 17e6f05..3db0a46 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1133,27 +1133,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
 +	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-+	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}$(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
  
  # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.17.bb
index 5b856a50977..7e9aef556b8 100644
--- a/meta/recipes-devtools/python/python_2.7.17.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -82,8 +82,7 @@ do_compile() {
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
+	oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
@@ -100,16 +99,14 @@ do_install() {
 
 	# After swizzling the makefile, we need to run the build again.
 	# install can race with the build so we have to run this first, then install
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
+	oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		DESTDIR=${D} LIBDIR=${libdir}
 	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
+	oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
-- 
2.17.1


