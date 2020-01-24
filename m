Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 150AC7FDBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:19:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p9so402188plk.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 23:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pmWZqC7n68Ie1hHnlX/7ZqysFSHeaEck521WUtNu7SQ=;
	b=cQNm0LYtoku3zOZ5wBnqUFRB+bOgHuuO85GISTz8E2n1+AWSzbOPLiDNTU5EJ1SRL2
	wPHqyjEjPFHFkfJquXOlkyz3qRDMspwyO2+B3EJOX7YCPOnGLP9hw53t7uVQ2D3mdyY2
	WlJLc4wfp1E+g0Nwf9yGZVR23kBfL49/knjfYbY62RJm1sStVFSdcZ7Y2QYUwa9fahzq
	wNQ//deG2uDL8L+AslsBks+BCuHFtKpst/UQXoj2VVZsAs1q7MHmj75WwPSu0aDCZRUe
	hzWzITCWrNIuhdARLQ3IMNXIDq2EeW/b0Yzh6Tyz8qLJh4FemMTxfwlgDe8Eq4NJlK+0
	YwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pmWZqC7n68Ie1hHnlX/7ZqysFSHeaEck521WUtNu7SQ=;
	b=hnGtWNI/2ke5vnBtPx9lgbZWc1gw47jojxWfY6Zl1Tj+SMnnUCEY1e/L1aIh6VXXWJ
	cub5fbVWojFF7zqRAHYDpH1yjR58gE09A3DR3npCJLiecRD8+BAyfFF35C20srwFfqOo
	ES7hRGcINq1BiH3nBeV1UL9xap1Qt1fbytqSC8OBwH1rG/ZccYm1hKRagf/esGigVCOl
	w/347Fx+jlMziqWo57tadbMkhTemr7UyAvI33TSmzLKGHgy26s4jafyyDZM76SFzBVlK
	1+fMQz0mUHT344fmpdDrw3iY7JLg/L+M0rc+MY5QiSjQtL9QC9KuWrjHw5DZalfKnb9r
	SubA==
X-Gm-Message-State: APjAAAXp3c59SY1pJmqCYocHgvooK4pvao71Qj1twT73JQjg7nK2Aiqg
	yOz6ry0t56NsatBw4lzdLwVbIdYWnyg=
X-Google-Smtp-Source: APXvYqyK1mCCQN/93yIi6cPpcxYMvHs9MYi2v1SxYtVUi1YOLXXuERdP9dwbwuPkJ/G55JSD6pYbfQ==
X-Received: by 2002:a17:902:d688:: with SMTP id
	v8mr2265427ply.238.1579850373555; 
	Thu, 23 Jan 2020 23:19:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id 3sm5152097pjg.27.2020.01.23.23.19.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 23:19:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 23:19:33 -0800
Message-Id: <20200124071933.191525-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH V2] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Fri, 24 Jan 2020 07:19:33 -0000
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
v2: Patch makefile instead of running it pre-compile, since this file
    can be regenerated during do_compile

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


