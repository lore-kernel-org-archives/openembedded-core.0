Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id F1DCC7C34E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:36:43 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n2so3614687pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 19:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bCBSQZQHSUqlkdgts6FjNKOPHkQYTgr6inLrWmjS7fU=;
	b=qpgjazBrble8WmRgknvA/lxrvcNp3iZ0JYrMAivi0fQr1zZWSQRc3hlNhpfC/1CsXe
	5lSDHFVMM6HxAQYA8yEcysedLVjcw3tqgAVJ4q6QRiwVhpl50HhcZMZ9V+7bNMtMNFqV
	vO7jVoyifWe7P3lLtxZk1t9dCik7s6UzQOdFUSIrUPtXQ2tFOR8HNTg+k7hVgdlo97B1
	B1jPYomtEw8KrXP3AJVQEue1BXliMyN9sJwI9EiWkQZ9D33rAMNH6Y8H19BvTJ79Tw0y
	cExrfJu32tF4KzN49dBlbNYGI6MphuCTEoCBebMCVedQTeTyJW70926wFfMnLNuwi7Fh
	yqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bCBSQZQHSUqlkdgts6FjNKOPHkQYTgr6inLrWmjS7fU=;
	b=Dk9SHbzIlr/vbyIE+zpOz9PrAdwceebB/u3Q6vRhLqgKORQYs3Ff/sH5m3MKukCZkW
	CSnzJ5wendcfXDVuCVzTObEaAjF1OXqzBSHHSmg7HrmXN7YNga6rVicfOw/DR59kWWbk
	+YxCxJh5x2aQXkjnQXmVQHr7QUbl7D73dkYj8w74mTdEb2aRAPc6wf9kur0SYpLB90w6
	ZzDTJHOvvincxADRaRUoOv2ZIrpP2deYB9BL1d2e6rk3VkxXxDjrGSYIgTyWei8OrdDZ
	OFoYqajmWFDSoj692Q76y6BVVjNNgYPGFn1CIJccHJK8O3+TEuD9U3XI7B2dgb3iQ5GV
	yttg==
X-Gm-Message-State: AJcUukcdwX18xtFpwZjYUdQ5oQPFeMYBJpGGaysM3DCrKCVhZP3gPn8W
	2E9E3G+HS0cfHuVUjCYKOmGzJI3r5n0=
X-Google-Smtp-Source: ALg8bN5+yoioN4MERpf+fSrrbeGXDa8IK/vjy35GEU72gbvvR9n6UNBQqvC1RlZPOTIjG2EuOBZxdA==
X-Received: by 2002:a63:7512:: with SMTP id q18mr7796339pgc.231.1548387404401; 
	Thu, 24 Jan 2019 19:36:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b601])
	by smtp.gmail.com with ESMTPSA id
	d21sm32451515pfo.162.2019.01.24.19.36.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 19:36:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 19:36:37 -0800
Message-Id: <20190125033637.11236-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] valgrind: Dont strip off -mcpu
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
X-List-Received-Date: Fri, 25 Jan 2019 03:36:44 -0000
Content-Transfer-Encoding: 8bit

Defsault armtunes do not include -march any longer we habe -mcpu
only, therefore to select right ISA we need to keep mcpu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 4d15a50411..54d09f071f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -65,7 +65,6 @@ EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEIN
 
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
-TARGET_CC_ARCH_remove_arm = "${@get_mcpu(d)}"
 
 EXTRA_OEMAKE = "-w"
 
@@ -77,14 +76,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
-def get_mcpu(d):
-    for arg in (d.getVar('TUNE_CCARGS') or '').split():
-        if arg.startswith('-mcpu='):
-            return arg
-        else:
-            continue
-    return ""
-
 do_configure_prepend () {
     rm -rf ${S}/config.h
     sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests/Makefile.am
@@ -96,8 +87,6 @@ do_install_append () {
     oe_multilib_header valgrind/config.h
 }
 
-TUNE = "${@strip_mcpu(d)}"
-
 VALGRINDARCH ?= "${TARGET_ARCH}"
 VALGRINDARCH_aarch64 = "arm64"
 VALGRINDARCH_x86-64 = "amd64"
-- 
2.20.1


