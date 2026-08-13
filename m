Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26206C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21785.1786634545066047827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bcn17SDE;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f71156e1aso403206f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634543; x=1787239343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cj/PBLo4eHtJwjsHzKWIcs3jeW5+VxLwnie4cwnwJKc=;
        b=bcn17SDEi8RvqXiTC32QAvpxx9Iw4GH1M9oeUfkY9ups5lnWziQMYbqgnFJYaxkjtI
         /eyC19VWA1PqGDM239QEkmB8ouR1gpsfcLPXwa9S8lQ22ugPnTjciAZybH1I2/FUoxUg
         W1ePRw7Jhf+cm4Igzt36POoh6P/YvUIBsNicQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634543; x=1787239343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cj/PBLo4eHtJwjsHzKWIcs3jeW5+VxLwnie4cwnwJKc=;
        b=PFGvpQ9FHg6tLiXmKUZPCI0gA5I8WxnBULNf7L7r20HqlLqby0IV+Ikd+4fY8764Nl
         PvjbCF7rzXGyspWxRREX26xbuCb/uJNo/llWKGCHwszjtZRyvbkXO3h09N8h5yF5XKkQ
         gup7aVD4JjDBivb2yT0zRPJs8xD91eF21rjg/QvOcihT5RU1kZ/dewRXCkeQGcbKTKO+
         Qyfwlkfi9qiAi5jEkl8HjEM2rptM22YqHH9Egs/tzYrSOCJ7RSEJLDbGp6reOXHuR+kQ
         XMqm5WiqczmyMPjeZ4YiuPggO/zVragmtIhtHKbLnSeHfEHeA+q43zEAPRvrsh00Nxae
         4gGA==
X-Gm-Message-State: AOJu0YwNP0yB8Dcql26Yjxrm8lNzzK1ZtI6A6tvbIwVI6+ojH2EVe1tQ
	Os3kDKFFiJVoTq61K7dMq0by8PYRSnPjZYPVvd8kfE1wAdCofW3fYsVZQ2u4AmZlc1KC/UAFRGo
	TpSWftvb3jA==
X-Gm-Gg: AR+sD12n3nk7yg2jiYHdaps54MNnZigIYse3kBuPtogdzJyOLNEu9xOiAAvD3mKxJMj
	Y7H89378F7yVa7UL89Y0c0zCwwgque3un8zI+s9DMPjvFZF/mYasW3XpEdjEj1N9dgtrzKshaNJ
	T3eJo7hOyl5lkahQIDaRxPzKghx+s7reuPxYq+jmJxefRFOhgftrVbsLRzhbXfmBRWlEYo4jCGq
	eHKFlvgSzGV3uD8nZDWjuSoZwX1mqAtsL8Zey9h8jZrdW6WgE0P6OjgGXiaHZsdoEgH0AftUA6i
	rl4c3ZUBdqS/Fgr6vZ7z6aWjT6FuYCUujap9Kht9kGXTzJmkhqoqbqC7p1r+EYp9vbrFt+syWpQ
	/CrQcCmoNFZ750k+E8TiSxbgo6qawzKwM1XSfOivVvpOQGYc9Rxj1jMvDozA+sAX8EmZAxxeChW
	0njjKBgFB7o08ORITbDUGASR0TOtbcVZE/XRMNa7K85r7Z8WR+46OgrBm5ZIb832djK/8Q2INga
	SuN0oP+V5n9HoB0B8ES6hxFbKMAi4P2ipglV7XdvFEJFHVxY/orNgJdejd6PlEPKOJbdEjZ+VKw
	sXLBAT9Y6zs2gc4+eqYfYXDVYyo7zPdkq3xSYT0p
X-Received: by 2002:a5d:58f1:0:b0:47f:8b9e:f44e with SMTP id ffacd0b85a97d-48159eb6d7fmr7862642f8f.12.1786634543103;
        Thu, 13 Aug 2026 08:22:23 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:22 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/17] bind: upgrade 9.20.23 -> 9.20.26
Date: Thu, 13 Aug 2026 17:21:52 +0200
Message-ID: <e9c66d46cbd3a3c3c8495be65b9619bd51fd6294.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243359

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Changelog: https://ftp.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html

This upgrade fixes the following CVEs:

- [CVE-2026-11331] Fix handling of rpz CNAME expansion that returns name
  too long.

  Previously, if the expansion of a wildcard CNAME RPZ policy resulted
  in a name that exceeded the length limit, a self referential CNAME and
  the original address record were returned, allowing the policy to be
  bypassed.

- [CVE-2026-11721] Invalid signed wildcard records were being accepted.

  Signed wildcard responses in which the Labels field in the RRSIG
  record was less than the number of labels in the Signer Name field
  were being incorrectly accepted.

- [CVE-2026-13321] Fix DNSSEC validation bypass via out-of-zone NSEC
  Next Field.

  A malicious zone with out-of-zone NSEC next owner names can cause a
  DNSSEC validating resolver to cache such record and generate negative
  answers for any zone that is covered by the range.

- [CVE-2026-10723] Correct verification of NSEC3 signer name.

  BIND 9 accepted child-zone NSEC3 records where the first label equals
  the hash of the parent zone as valid parent-zone closest encloser
  proofs.

- [CVE-2026-12617] Do not assert for some specific CNAME and DNAME
  queries.

  A bug in the resolver's handling of certain cached DNAME and CNAME
  responses could cause named to trigger an assertion failure and exit.

- [CVE-2026-10822] Malformed DNSKEY records could trigger an assertion.

  Previously, dns_name_fromwire() did not honor the record boundary
  when reading names from the wire, allowing malformed records to be
  accepted when they should not have been.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch   | 2 +-
 ...01-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 meta/recipes-connectivity/bind/bind/conf.patch              | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch           | 2 +-
 .../bind/{bind_9.20.23.bb => bind_9.20.26.bb}               | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.23.bb => bind_9.20.26.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a594..7ed4c5fd2f 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From a67ac281cd86d8d9ca27e64a5944deb5578e5087 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 7279a73e87..da4cdef696 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From 16608520c9d946223404165732eacd79b59de471 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..07acce9cba 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From d925183807ae182cf332124ff5a617d257e184f9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index af020f0..f461229 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..4e90e97271 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From af229781e60d6779c76d5a61d26a4597b2a42f6c Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,10 +32,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index f47ce7b..af020f0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
+@@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c4..3425742d1b 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From bde3a4cb010f459a9ef92817c7e6e6e2d871794a Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448..9b55afb5d3 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From 8876e722beda701a0de021360ff381347120c6ff Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110..33d5d34f15 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From 26c988eee9d2eae7c7dec8c529176352017b2ce1 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.23.bb b/meta/recipes-connectivity/bind/bind_9.20.26.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.23.bb
rename to meta/recipes-connectivity/bind/bind_9.20.26.bb
index ebc4422b67..fe2ae3f002 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.23.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.26.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be92918ea46908371"
+SRC_URI[sha256sum] = "55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

