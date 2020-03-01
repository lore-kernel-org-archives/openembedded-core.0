Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 33EF461A7A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 01:42:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q9so812459pfs.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 17:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dY4TQdfKbsCMlOsVPT40IJMt9UDXLUF3PdQiiveBGwc=;
	b=bXucV7ewo3/g9AqWGNHSvcHyX1DOoF99xhzy31VS5Q+E4KI7n5FU0hpKoiHbwKK9/6
	wmPe8wlRPT1Dqh+2Z/Wd4XAACDG8rjwzR1+hGzxAAswh8jkYVywU6BYo+6apNdBYnVxP
	2YWdSKc0rvtV1oWK3FWe9TDx21gngqjaFzk3OQoL4Y1Ayd8AC7iLf3OEpV+HJgoSVbpj
	GqsEex1EPuHvI3mEFlUy4sL0FVEFsDWcXeYnyf5lZQCcW8F/pEhR6gHNTFubu9BBn81V
	WRDv3Zql9HTE2R36eDD7s7sU1WgfrF5v5myeHNhpcSIQlcr3TjHzUfnBSSzpQRc1vwIU
	N+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dY4TQdfKbsCMlOsVPT40IJMt9UDXLUF3PdQiiveBGwc=;
	b=qFH3xBZYXNTr4TAlWg2ERcgrteEOL9lxWlUx+L31mLVozMaJzmuv3RXJZsW1Ge5LAp
	Ffty9mvGmnHSDx8oSiW8VcuVG5orICHD2F0Qv8LDyDinTy3pnKa8BI7gNM3PWqQTfAtg
	J337dwe0S+nhMogXAZSH5Q5TAa89qW2B/Nl4OAnBAALHLKO6G809DQm0X+/jv7fmol7Z
	450ISqxh3ntK4mkq9IMLLshsU/IAnPFkJFgIe2nqSghlxNvc825MH5F/ffPTnFJ4wYzo
	HD+2Ve/8YwhFNYsjSES65aQ+Laf+RGkvqPnNwEU47wK5jTmcQSX5brvNNBC4qoY7rSic
	bfTQ==
X-Gm-Message-State: APjAAAUqr0T2wZH9cFfqC1XRVCiXVPgkBgNs9vfgld2OIEnn94S9xV67
	mSdupLePEf9Dw9SqdAdck4bmtxzl/Wc=
X-Google-Smtp-Source: APXvYqzX76RV8WTVDLw4XMiPJXhCXK1JV4GxntCIEOKjhcG14Tno5cjwMklBAnlfKa7kArWBxXUJFw==
X-Received: by 2002:aa7:824a:: with SMTP id e10mr11683581pfn.54.1583026971814; 
	Sat, 29 Feb 2020 17:42:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	hg11sm6753702pjb.14.2020.02.29.17.42.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 17:42:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 17:43:00 -0800
Message-Id: <20200301014301.805156-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200301014301.805156-1-raj.khem@gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] strace: Fix host contamination QA errors
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
X-List-Received-Date: Sun, 01 Mar 2020 01:42:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/0001-Evaluate-AC_PROG_LN_S.patch   | 29 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.5.bb    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Evaluate-AC_PROG_LN_S.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Evaluate-AC_PROG_LN_S.patch b/meta/recipes-devtools/strace/strace/0001-Evaluate-AC_PROG_LN_S.patch
new file mode 100644
index 0000000000..c956256bed
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Evaluate-AC_PROG_LN_S.patch
@@ -0,0 +1,29 @@
+From 49e58e2d8ada869ebc75ab6e17c80e20e00ee625 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 29 Feb 2020 13:21:08 -0800
+Subject: [PATCH] Evaluate AC_PROG_LN_S
+
+Fixes
+strace: /usr/lib/strace/ptest/tests/ioctl_evdev-success-Xverbose.gen.test is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 65f000b..c4cbf55 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,7 @@ AC_CONFIG_HEADERS([config.h])
+ AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests subdir-objects 1.13])
+ AM_MAINTAINER_MODE
+ AC_CANONICAL_HOST
++AC_PROG_LN_S
+ 
+ RPM_CHANGELOGTIME="$(LC_TIME=C date -u '+%a %b %d %Y')"
+ AC_SUBST(RPM_CHANGELOGTIME)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/strace/strace_5.5.bb b/meta/recipes-devtools/strace/strace_5.5.bb
index 6e7d63949d..f3b7c4462e 100644
--- a/meta/recipes-devtools/strace/strace_5.5.bb
+++ b/meta/recipes-devtools/strace/strace_5.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
+           file://0001-Evaluate-AC_PROG_LN_S.patch \
            "
 SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
 SRC_URI[sha256sum] = "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
-- 
2.25.1


