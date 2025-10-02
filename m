Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF3CCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:14:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.11829.1759418050172118132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=DdDAQ2t6;
 spf=pass (domain: inovex.de, ip: 209.85.128.51, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so5005085e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1759418048; x=1760022848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPx1DSI+Agw14U7XThEHBGiQZepqH4gwu8Q8sRqAN6s=;
        b=DdDAQ2t6Ye9Ffi3iWRaOGjaHoNOU6VkzexVMDe/bBrwCAiL/4j3jrhB836CcOmTtDP
         9NPuo5neYVtwnpYdZdhPxP0wWrzjZzQZQEHdbn+s+xtTeVHblpg9pwkspLbQb/n2HL8k
         t1PVthyuOA2ExA+sUlx9uOR5RcMw+EgZVrapJsARMz+24toFRGSt0UoEGfAVyN2LNW27
         FiSzjSy9nPEypo/OX5jGS5jBPZLRtvJzJ9NRWCKPXasBXvfglglUb88JMDrOXPWzfnBZ
         8matFY6i7L8az12a1+mNdbY0DznuxPcpEObSxHlrUKAEz5lPQkoMpdmJkcHGjHG4fNTi
         aXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759418048; x=1760022848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPx1DSI+Agw14U7XThEHBGiQZepqH4gwu8Q8sRqAN6s=;
        b=p3fXTNRl7aNpSogXVpyHZ+QckSDWLgbqSGArxcRRq+FiBrrhZaH4rp37EIaIxrITbq
         8rljEmyVyQpsn716woml7VeGDU3WcmJcJt1TcmisODkeJm7Exa635qbNYWPO3Vv7rH9a
         fC1ZaeLhZVFdJuXNC1DUFPzZwfqd+EDRjXSApjNREOfmn6fTUmw5IQHCr8+xUYsCsfac
         7OzdXbmAJCoKgKRj/97D+OPSqd3xAahFtdqJ1R8Y8NKT7K7IOBAdq+aksys7GVq76eCw
         vDUTDNbNHmjqtVjptXQzRFLN/vS6hmkZIbPk7XqNmkJYrNPdiOOWR1E7dWI+YKzHYbl5
         O0jg==
X-Forwarded-Encrypted: i=1; AJvYcCXDlmc4E7tJTFvyJ5x5JA4NSJGictFd48znn0Na/5cgjPHKdTSCVE26FcManZu57sGAPO3fuWaBqYxZ35mv1+b/sg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxihwHmvir55e+NJKcg+Ry1zy7h0aIqWaLh9WHQ2DA9vQCcHrUL
	SUkG3qOZbBHNZOMyPYw+j42fooCX40wqxDyrbHowsbV9x21yOJTIvyAZCanUe/+UwsI=
X-Gm-Gg: ASbGnctjgSTbuPNfqof4Q6h3gnnHLE/gYyEKC2okmwIJ3td6Pic2Co6GBKm3+CIcFxW
	cWQJHHo3oDyATqVYINEX7GU1nlkFd0U+LwvSNThrDQsvThytcRnGD6q5ON58OO2rH8ipLdPAy0+
	EPjOYVn/Z96g6IuI3byEGsyIkf6930Hf+7lW3CHWalaws+RZV8m4nlCOQUaNhRvfVmCzewi/A1f
	BMHL7XCgDX0IkpkATDPslGGDpXrNaJTGJMOisQfU2je+h7DZouxuyQhEto3j5uT9kwXQsFmInpk
	s58sdYqZYOp47Iae57NAGwOknCVoJmr2yp0qYTD5davSdkjDQNBomCmaAY57UU6zyJf1WbZCNs9
	xVLjPhXKnFTnxQOry3AKZ9cszvawYMBJSTc2ylRiTUp1OM9RzRjPmcw0uVG6GJGnq
X-Google-Smtp-Source: AGHT+IEHjdvYUvNJFWALS6vvedGcELlrOzqTmGcm6ZaBC4knYTriqTVw39g8CdA7Z1hRzZ0r4EG7cA==
X-Received: by 2002:a05:600c:6094:b0:45d:d88b:cca with SMTP id 5b1f17b1804b1-46e6125cf67mr54255105e9.1.1759418048436;
        Thu, 02 Oct 2025 08:14:08 -0700 (PDT)
Received: from Phoenix.fritz.box ([2001:16b8:cc61:1500:28a2:775e:40f8:152c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b63b407sm61885475e9.2.2025.10.02.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 08:14:08 -0700 (PDT)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: mathieu.dubois-briand@bootlin.com,
	openembedded-core@lists.openembedded.org
Cc: Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
Date: Thu,  2 Oct 2025 17:13:53 +0200
Message-ID: <20251002151353.88813-1-anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224366

With the upgrade to 3.50.4, some configure options changed
as the project switched from `autotools` to `autosetup`.
The PACKAGECONFIG "dyn_ext" is not longer available.
Besides, the default CONFIGUREOPTS "target", "exec_prefix"
and "oldincludedir" became invalid.

Changelog: https://sqlite.org/releaselog/3_50_4.html

Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 14 ++++++---
 .../0001-hack-disable-rpath-in-sqlite3.patch  | 31 +++++++++++++++++++
 .../{sqlite3_3.48.0.bb => sqlite3_3.50.4.bb}  |  6 ++--
 3 files changed, 45 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-hack-disable-rpath-in-sqlite3.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.4.bb} (51%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae..591d00e7a5 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -23,8 +23,8 @@ CVE_PRODUCT = "sqlite"
 inherit autotools pkgconfig siteinfo
 
 # enable those which are enabled by default in configure
-PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
-PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
+PACKAGECONFIG ?= "fts4 fts5 rtree"
+PACKAGECONFIG:class-native ?= "fts4 fts5 rtree"
 
 PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
@@ -33,15 +33,21 @@ PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
-PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
 PACKAGECONFIG[zlib] = ",,zlib"
 
 CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
 
+# The configure options target, exec_prefix and oldincludedir
+# are not supported by sqlite3 anymore.
+CONFIGUREOPTS:remove = "--target=${TARGET_SYS}"
+CONFIGUREOPTS:remove = "--exec_prefix=${exec_prefix}"
+CONFIGUREOPTS:remove = "--oldincludedir=${includedir}"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
     --disable-static-shell \
+    --soname=legacy \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -51,7 +57,7 @@ CFLAGS += "-DUSE_PREAD"
 CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 
 # Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
-# huristics, which are not always correct
+# heuristics, which are not always correct
 CFLAGS += "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEORDER=1234', '-DSQLITE_BYTEORDER=4321', d)}"
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-hack-disable-rpath-in-sqlite3.patch b/meta/recipes-support/sqlite/sqlite3/0001-hack-disable-rpath-in-sqlite3.patch
new file mode 100644
index 0000000000..4170c10ed8
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0001-hack-disable-rpath-in-sqlite3.patch
@@ -0,0 +1,31 @@
+From c50f1a09056bd3e74b937a00216bc3148c25f16f Mon Sep 17 00:00:00 2001
+From: Anna-Lena Marx <anna-lena.marx@inovex.de>
+Date: Thu, 2 Oct 2025 16:11:10 +0200
+Subject: [PATCH] hack: disable rpath in sqlite3
+
+sqlite3 does not implement disabling rpath as an option right now.
+This hack uncomments parts of the partially existing structure
+to do so for disabling it for Yocto.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
+---
+ autosetup/sqlite-config.tcl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index 85fe414..d1b24de 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -2131,8 +2131,8 @@ proc sqlite-handle-rpath {} {
+ #  if {[proj-opt-truthy rpath]} {
+ #    proj-check-rpath
+ #  } else {
+-#    msg-result "Disabling use of rpath."
+-#    define LDFLAGS_RPATH ""
++   msg-result "Disabling use of rpath."
++   define LDFLAGS_RPATH ""
+ #  }
+ }
+ 
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
similarity index 51%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.4.bb
index bd2ac6614d..65052ae069 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
@@ -3,6 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-hack-disable-rpath-in-sqlite3.patch \
+           "
+SRC_URI[sha256sum] = "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
 
-- 
2.51.0


