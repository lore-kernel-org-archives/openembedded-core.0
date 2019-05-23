Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E1AD87D5C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:55:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so6397678wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G+tEaz/CREhUGau7cuKEq5mrMQ5CyhFiIYss9A3aZik=;
	b=WDwHuWJjTepaCYNh3n7Lu5PUbJsJznOYknzyn89VArbe02rCGH7XJ7sbnycP577R7B
	MzWzHrMOvo9kesqGyxMqcPZ5v8uhzNSoHHxPz4hOWHUWg7g7Y8tKVJpxhh6teXE795Hz
	7qs7l8W+kAwz1rBIs1fuQXnn4O8zsz7HmfOAdu/4wAn8APbrACX+qbraoQQiPwEPPMzp
	EeGzTh5dASvAyzWiE07MHNWw30zLXJdgWAtVqhCKBaWiBB1XjWZjfS1Pf+OmH23aUOKv
	CwQZ1ZR3lElovh56AitMc3rVHyQ2glZ8cqNrJTo6rVekFklqiyBWT9nAhHgRIteZ9V+s
	rnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G+tEaz/CREhUGau7cuKEq5mrMQ5CyhFiIYss9A3aZik=;
	b=ecxndhmVfdKZwVGcvFB3Y1cMB764hdrFePN9uxP/VHuH7okrxzZ5fAGShT5YT8UBtG
	SvStgnRIqu20jY9zcpBxQTe0Taycm7FxXHlQerLxktcrul3Tgt98jzOfp/WFo4Rl8eY8
	PIUNsl/TjnEZCJGO9VoUFqTJi+2zcBftdHzq8g4vagBCAql8lY+nYYgUdlzVcRrgJI1u
	LqbXhcVBJ2IAsp1J/CJ99Ahm3wYF1r5gKFA8nDqdzp6lDWEQfUurNkUXFjXJeZiqpyF+
	gRGg9Og/xbseTZG0Pwn80iEP+s2ZtyY4KTJ59LBpxGgt6H9AJwuDyN6Jj4yp9JZkPGdR
	jYjQ==
X-Gm-Message-State: APjAAAXFAOffKZDDm5JZH4E85kvDP3/YdsZmkORgWCj+HZPOSTMPqepK
	Aa9iv2RceJwndVS179BPYZG0ZHsJ
X-Google-Smtp-Source: APXvYqxOp9o3QOskvatT2CX39ZYBCUGOWfr+HwzywP5C0T4JlFpBqvTbTkkOvh2YLWZc3HdgSU6JyA==
X-Received: by 2002:adf:9b94:: with SMTP id d20mr3058760wrc.275.1558619707440; 
	Thu, 23 May 2019 06:55:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	d72sm7447996wmd.12.2019.05.23.06.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 06:55:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 13:55:14 +0000
Message-Id: <20190523135514.20622-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] autotools, cmake, meson, waf: define PACKAGECONFIG_CONFARGS before appending it
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
X-List-Received-Date: Thu, 23 May 2019 13:55:07 -0000

* just to make sure it's expaned by bitbake before it gets executed in shell
* e.g. with cmake.bbclass and cmake recipe (any recipe without
  PACKAGECONFIG options have this issue) it looks like this:
  bitbake -e cmake | grep EXTRA_OECMAKE=
  EXTRA_OECMAKE="     -DCMAKE_DOC_DIR=share/doc/cmake-3.14
    -DCMAKE_USE_SYSTEM_LIBRARIES=1     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0
    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0
    -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0     -DKWSYS_CHAR_IS_SIGNED=1
    -DBUILD_CursesDialog=0     -DKWSYS_LFS_WORKS=1
    \${PACKAGECONFIG_CONFARGS}"

* there are some other places where PACKAGECONFIG_CONFARGS is used, but
  looks like all of them started to use it only after adding
  PACKAGECONFIG options in the recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/autotools.bbclass | 1 +
 meta/classes/cmake.bbclass     | 1 +
 meta/classes/meson.bbclass     | 1 +
 meta/classes/waf.bbclass       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 8768a6ad68..32961320a5 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -129,6 +129,7 @@ autotools_postconfigure(){
 
 EXTRACONFFUNCS ??= ""
 
+PACKAGECONFIG_CONFARGS ??= ""
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
 do_configure[prefuncs] += "autotools_preconfigure autotools_aclocals ${EXTRACONFFUNCS}"
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index d3f0d70847..b5deb7da70 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -56,6 +56,7 @@ OECMAKE_EXTRA_ROOT_PATH ?= ""
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
+PACKAGECONFIG_CONFARGS ??= ""
 EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 
 EXTRA_OECMAKE_BUILD_prepend_task-compile = "${PARALLEL_MAKE} "
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 115d1aedcb..4f03a51e09 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -35,6 +35,7 @@ MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
 MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
 MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
 
+PACKAGECONFIG_CONFARGS ??= ""
 EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 900244004e..f7178b28e9 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -3,6 +3,7 @@ DISABLE_STATIC = ""
 
 B = "${WORKDIR}/build"
 
+PACKAGECONFIG_CONFARGS ??= ""
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
 def waflock_hash(d):
-- 
2.17.1


