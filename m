Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DAAAF7FC33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:00:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so26792011wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KGGzqCS/VKikJ16p1Wa12d9ZWIUeUVYWghVbO5fR1ck=;
	b=hkkDScN0VHqaqmov63kF9vWleU5ZS7wCE/jLys22deO7aLyGKD7/LNN/kWLPnzjXNf
	WQSrEIpR73aAjVhLlBrGb1fwKp/Aqo5+0TUH85lYY2z/evFhwB1SEVI7EgK1BTTDzrsm
	+/CpzTb23VbSNeeWU9VxIndio2DoDpuA3t9dw9+zfDaRXydD8fo+N4vslh3niqHCWbWp
	kTSahx5l6n3DSWLnyULfxSmK6nH6GseeGk2VXczZ8TZPAHKqvrfw470oiEWWAwoeiC0c
	Cszumw9jt2ve5lasEFjgExbfjPqzdR/1/i1sHrcvgyHI4mXCU0ypBzRJcyBh5DcSLtbk
	ve8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KGGzqCS/VKikJ16p1Wa12d9ZWIUeUVYWghVbO5fR1ck=;
	b=awSw1X4p2Ok9aYNdIaUhmenbP14Wn9bTDmp7XNCaR3dP2Xl8E1n5QYnxzKZoQzHVJ1
	nr9+8b7ZiS8qibZPEyocW6LyizUh7sBmDVE3XWNy2l6++rsinOJMYFN7pUKu8FYy7jOe
	UKEX24lPK6rHvl+mqaBzcfYZVmQIKVqAnJi/Av/+/bvzKwj1JpEGbk5V25pQfeV4gF6v
	zVqNaUJq2aBGiqX6qiXGS8FqvcdMkBE8FPg8O7Z4kSTsU0f+xm0nVRCQ+/1qyzzwkrdH
	89CCcm8+L9g4S5BPIldhUlg6uOVmtJEquRKc1WvPLaqTOEa8B3tZR+nFCzMbdIKzGPUx
	YNAw==
X-Gm-Message-State: APjAAAXZnE6vzcYeWSu9GdrhECXVVAYgk5XPofC/kkvOmPzfzU0TADI3
	vbr7/7gO4H8gYJxjDqFcdV4Snr32dDA=
X-Google-Smtp-Source: APXvYqw4VULfFNPc2hD4MPKgCk3g7ujs9vW7OQxVzCclYhJAjA0waESWwaP7ZXKq0QymWvUZ/1Y6ng==
X-Received: by 2002:a05:6000:104:: with SMTP id
	o4mr12264757wrx.309.1574863241228; 
	Wed, 27 Nov 2019 06:00:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o1sm19372284wrs.50.2019.11.27.06.00.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:00:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:00:30 +0000
Message-Id: <20191127140030.7838-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127140030.7838-1-ross.burton@intel.com>
References: <20191127140030.7838-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] python: use PYTHON_FOR_BUILD, don't add HOSTPYTHON
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
X-List-Received-Date: Wed, 27 Nov 2019 14:00:41 -0000
Content-Transfer-Encoding: 8bit

There's already a variable for "the host python to use during the build
when cross-compiling", so there's no need to add another.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../01-use-proper-tools-for-cross-build.patch | 34 -------------------
 .../fix_for_using_different_libdir.patch      | 14 ++++----
 meta/recipes-devtools/python/python_2.7.17.bb |  3 +-
 3 files changed, 8 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 56992210a23..b02c09458f1 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -25,40 +25,6 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Create build directory and generate the sysconfig build-time data there.
  # pybuilddir.txt contains the name of the build dir and is used for
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
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
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
index b4e72193ff8..d41b6cfc744 100644
--- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -41,37 +41,37 @@ Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
 --- Python-2.7.9.orig/Makefile.pre.in
 +++ Python-2.7.9/Makefile.pre.in
-@@ -1046,27 +1046,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+@@ -1037,27 +1037,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
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
 +	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
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
- 		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
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
index b3bdcba1a89..be7c6d2d2bf 100644
--- a/meta/recipes-devtools/python/python_2.7.17.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -1,6 +1,6 @@
 require python.inc
 
-DEPENDS = "python-native libffi bzip2 gdbm openssl \
+DEPENDS = "libffi bzip2 gdbm openssl \
            readline sqlite3 zlib virtual/crypt"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -48,7 +48,6 @@ PACKAGECONFIG[tk] = ",,tk"
 
 # pgen isn't needed in the current build, but use the binary from python-native just in case.
 EXTRA_OEMAKE = "PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
-                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
                 CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
                 STAGING_LIBDIR=${STAGING_LIBDIR} \
                 STAGING_INCDIR=${STAGING_INCDIR} \
-- 
2.20.1


