Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 38104606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 10:29:52 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u206so21622287wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UCbbh9y/6/p9S+LViDl9XrxFiYaaEWIkiQvzcHnYMxo=;
	b=Xhl8ptLk1sT7+cKNA/Spo/q2K6dxPkZsncKYshW2yIf2yrj9EGXEPdnLb/E6vfGD1f
	6OgrlON8ELH/qT7eexAIVu5wlDWfFmqwomcRk1xfWgt9p/NDTJKs4RuggoZUfJM4TB/E
	mM5aI4gV8DA4UGU/TcyM32TiF1+iSAlht8YwDSfvtC294xPIFYi3n5Fs7AhrFTAvE+HD
	tuJEr3OOsu4g3v0o8ntGBqAOIs5KZh6vTVPesjvcW+5yZ6VzLskFxcH3/qagaaPboLyq
	g6ki2iRNaBrQDPVUSpr+vCdyHpc5+qr6nZZ+rFT3ey3g6ZLtV/UNzWdBCS+Fcyja5egS
	A8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UCbbh9y/6/p9S+LViDl9XrxFiYaaEWIkiQvzcHnYMxo=;
	b=N/sc6xT0H6uYt3TkZyOVRsw05X27ASnbKJP58wE98uiJYPip4wtRB40m7yfWUNkkz+
	myhl4edOe5HGee+AbVSmCHjHej7T554SJsdLJCyk+6m6VozdKwWJBW1ZcDNx43oQOS6h
	tCQo4bdQMiUH6RWD94A2a15FsvZ7a982/R+1e6zEjl+ULzdXNUZEVaqNIPt5oRANg/ek
	ZuRZD2o2DqXnQqvBpF5Yb7hrxk654K4dzejii+w+SjblEO7GXnYfQ0WeBsiAVGmeS+N3
	rsqdq0zO/THzBzU0F8yMUg+q1iGNBujJDhbzMJ3jAVhD5NyX3oF243K/ACRsPnxmwWer
	5k6A==
X-Gm-Message-State: AOPr4FXbllD/WFJgAEcslhlnMbTumLemUu11w0w6uv6r5KEm01+L6EvtXFROmIxb3PRwYg==
X-Received: by 10.28.147.135 with SMTP id v129mr22299097wmd.65.1461061793112; 
	Tue, 19 Apr 2016 03:29:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ys9sm68567852wjc.35.2016.04.19.03.29.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 03:29:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 12:31:40 +0200
Message-Id: <1461061900-27444-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <20160419095052.GB2562@jama>
References: <20160419095052.GB2562@jama>
Subject: [PATCH] base.bbclass: Introduce PACKAGECONFIG_CONFARGS variable
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
X-List-Received-Date: Tue, 19 Apr 2016 10:29:56 -0000

* add separate variable for configuration options generated from
  PACKAGECONFIG setting, this helps other bbclasses and recipes
  to take advantage of PACKAGECONFIG mechanism, without including
  other options from EXTRA_OECONF
* e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
  from PACKAGECONFIG:
  EXTRA_QMAKEVARS_PRE +=
  but with
  conf/distro/include/no-static-libs.inc
  it means getting --disable-static as invalid option inside
  EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
  to use poky with meta-qt5.
* once we migrate all bbclasses and recipes to PACKAGECONFIG_CONFARGS
  we should also restrict EXTRA_OECONF append only to autotools.bbclass
  like I did for cmake.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass  | 9 ++++++---
 meta/classes/cmake.bbclass | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f9697a9..0259259 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -428,9 +428,12 @@ python () {
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
-        if bb.data.inherits_class('cmake', d):
-            appendVar('EXTRA_OECMAKE', extraconf)
-        else:
+        appendVar('PACKAGECONFIG_CONFARGS', extraconf)
+
+        # TODO once are all recipes/bbclass abusign EXTRA_OECONF
+        # to get PACKAGECONFIG options fixed to use PACKAGECONFIG_CONFARGS
+        # move this append to autotools.bbclass
+        if not bb.data.inherits_class('cmake', d):
             appendVar('EXTRA_OECONF', extraconf)
 
     pn = d.getVar('PN', True)
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 22cd61e..02f313a 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -27,6 +27,8 @@ OECMAKE_EXTRA_ROOT_PATH ?= ""
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
+EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
+
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
-- 
2.8.1


