Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 528A17FF24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:50 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k3so4051564pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wXcbU9jw2QFiFw9v/H7aG3+moRv8kXhdJBE4hrPouOs=;
	b=SMTUjb4jySodIxy5kFCXj3Is5jYkC1mKf5ZVIKyBivk3YE9bvI1qiaXesAxbdTGHsP
	RrJgL7/bRAa6p2B6k9DLmgSEBWKkzmMu0RjEJlMb8VbR1ddN6qRrgom6T7X7TGA5VXcR
	k/gH9MR5bEhdCa5Su2UwngDtFbVMvgR64Z0WY4bABwKMpa5VTEdfbjI9yS9HJezg31c9
	v6DiMuqRdomYuc8i5OurFjNboTkd89B4RGBCTX9Tb54sfEd21Hw5OjF9RnspY3J6UJfc
	tDJGnPYWn9nsMf4wWKAHxcLmQIMkFWaL34+QqgbPQleBsnsKcvZUdSNmg/icsjSyMAM+
	n6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wXcbU9jw2QFiFw9v/H7aG3+moRv8kXhdJBE4hrPouOs=;
	b=FbtYrPW/iOVraVue+txGEcBaSIPEfKgXJWMwU6bAmjJlIvvyq548Naqygm86faJiat
	dn+P9xpMSlIoBb2RLpC9bPMtudUgeu67C4xsZzrAcRrpmlKE9vhSV0RmhTPOVe3UueDN
	Wm0ku3Zf4dsQgykDBG281imUnq/h3KyXwHfl7vmTS1NM2eud9oC9MlOUabuR3gaHLyIM
	oc6ApvnG1HggJp4QSLlv6q178S4qVt19XaPTMcdIeTrTcV84aPK7fPNI64RTb3VorIC1
	EaW20r/kqF67uUYpIHhxjzczexDulSpycEq0shkGBe96Ikdora90Pv9J+EXalO1x8GMC
	0AbQ==
X-Gm-Message-State: APjAAAVoYay3J0bMuIV4m5SOMWYNXqBReloRGMyXDBhUCyUX3nZdwdCB
	axK+fiNDEnUz2LaAHCsD/nJcTkPKGW4=
X-Google-Smtp-Source: APXvYqzF44XWwhaPrv4OgDu8KWGeeEK0YZ2pRk2aKesQIAyYCO5JIGJGFY00MlU5h/GE670JiXfa/g==
X-Received: by 2002:a63:5243:: with SMTP id s3mr15036651pgl.449.1580066871096; 
	Sun, 26 Jan 2020 11:27:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:40 -0800
Message-Id: <9e134fdf6fb952e2bd05637f08b14f005cfc2a4a.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:50 -0000
Content-Transfer-Encoding: 8bit

one of the build steps ruby has is that it generated rb_mjit_header.h
during configure using gcc preprocessor using -dD which emits built-in
defines as well, problem happens when this header is later included in
subsequent compiles, where compiler errors out stating that an existing
internal define is redefined

| /tmp/20200123-2021083-2c601q.h:13849:9: error: "__has_include" cannot be used as a macro name
| 13849 | #define __has_include __has_include
|       |         ^~~~~~~~~~~~~
| compilation terminated due to -Wfatal-errors.

Since compiler already will take care of it internally we can edit it
out from this header file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ruby/ruby/remove_has_include_macros.patch | 26 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.6.5.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch

diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
new file mode 100644
index 0000000000..a1e6330445
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
@@ -0,0 +1,26 @@
+Filter out __has_include* compiler defines
+
+They are internal to compiler and this header is later on includes in C
+files, but newer gcc >= 10 complains about it.
+
+error in initial header file:
+| In file included from /tmp/20200124-86625-14hiju4.c:1:
+| /tmp/20200124-86625-11y6l6i.h:13849:9: error: "__has_include" cannot be used as a macro name
+| 13849 | #define __has_include __has_include
+|       |         ^~~~~~~~~~~~~
+| compilation terminated due to -Wfatal-errors.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/common.mk
++++ b/common.mk
+@@ -221,6 +221,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT
+ 		$(TIMESTAMPDIR)/$(arch)/.time
+ 	$(ECHO) building $(@F:.time=.h)
+ 	$(Q) $(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
++	$(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=.h).new
++	$(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@F:.time=.h).new
+ 	$(Q) $(IFCHANGE) "--timestamp=$@" $(@F:.time=.h) $(@F:.time=.h).new
+ 
+ $(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time
diff --git a/meta/recipes-devtools/ruby/ruby_2.6.5.bb b/meta/recipes-devtools/ruby/ruby_2.6.5.bb
index 1828f65d51..0cdf6ee09f 100644
--- a/meta/recipes-devtools/ruby/ruby_2.6.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.6.5.bb
@@ -2,6 +2,7 @@ require ruby.inc
 
 SRC_URI += " \
            file://0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
+           file://remove_has_include_macros.patch \
            file://run-ptest \
            "
 
-- 
2.25.0


