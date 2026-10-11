Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA74CA9ECA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23430.1791708068664376024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zs7NHLvD;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so522746f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708067; x=1792312867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NpyJ2DiLmDmuyE538UrY92LmM1UpOwjvEvp109tUFJI=;
        b=zs7NHLvDcSO1cWWcneSnSJYe8CEPjVOjPLSu0UVfx0oEvGnljzlyspo7mMuqAlwRZB
         +ty7JKZVmA75bBFdo6oDmLNT+Ajh8yu6XzIkWb8EfuyqcYNvS+PnazydSep9bx4D0nc6
         b3lNOlKp6bQdEggLfKBDNMVyZVmrZljvQemAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708067; x=1792312867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NpyJ2DiLmDmuyE538UrY92LmM1UpOwjvEvp109tUFJI=;
        b=Ko2L+HsGl1rT6E7b8K7qbCH1KkYPkk5gpiP7fnb3INIbsnlqjxGFqEUDAPyvg8lYuY
         yXd/CslL6+ekkavp77b+XxpTYedzs/HyIx46yLRu85VK4yNhWILz8jWOXsP1uDPgudYz
         TYwOuJODGyYKNirbUlPdqDgvllxUxTxR1/24H+hHNSMPL8mvtodWRBomj6gtRgiqiepB
         FhMy6wq+IeVwYnnroSWzvk+ZGgU8VGePL2GICErbjm1vZQeNJbzFbjO+o/+JXoDkil2F
         1YWpSApkZtwjIthhmqHYmFY9Ys4YZqMDSdB3d3qHOIEdzayQtPCOYOgC9WPX0hmvo9Ce
         PxPQ==
X-Gm-Message-State: AFq9FYKVn4hm9iqP4dq9SZG6D21RTRLtEZH1Ryb58RZhyT+IaMwdKH+g
	5j9Z2Th/h5N7mTsbIgbE6rUTuCciyeLMZxQlKA3rpw7coA8mCQv9SEPjbO5d4ZGjJtA5Zs1lD0I
	YFCYv6eY=
X-Gm-Gg: AYBFou08dOEKCIPzjRe8oxAXELKx7TZT6JdQJn1fIckI84s/0IxPXxEGKXEQqRgDSMa
	Ug470/E4HXw6s6F6c0jmhdJtKXVbQLc952ch0unUevAHjoQBTBUjKSv4R5LCQrwCMxZWlVogMJ/
	BiYt6g3w8ouLM9p6+AaI5HzdeFJ6pOotzcomp+gj15GFuJfVj0lzHJAlNA19msJ78FGJeMq3QXG
	g2iO4H0EmXH0gKHfjyUbmVxU+DDWiTW5n+fizJcTCpooLIqjsGQJ0mw6EFvoFRwrgMJecLCPUje
	/1HgneqZDJCezK6w2zTLeTjLssxRtLd/4ACRgQrT+bNnxveuZQ2YUYLlq6W6iK4u+grxBM0JUhx
	PPxDsiA0NOKVletyM3wT5YNtwermfN1vbKuXGkTp2k+v9LOriBe6XbSIRd9GaMLGRbjLokGonMf
	Neoj1NvYOycVN8obRqZp+30Maw5njcXaG8LcNEIBCReXCQuuFKHw4+cEA7udY3ubdizARQvW+D+
	VL7ExuGu0CIkoitfNtTpisdqksydsbCTUunqHnOsKlDiggKyIcvvEPbIsiGKiuzAqvb7v3J+w==
X-Received: by 2002:a05:6000:491c:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48dba9bdd09mr12638956f8f.16.1791708066620;
        Sun, 11 Oct 2026 01:41:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/60] bind: upgrade 9.20.27 -> 9.20.29
Date: Sun, 11 Oct 2026 10:39:45 +0200
Message-ID: <ca37a0912d4eb4f7bdd2b4650bd975837cec2a2e.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247521

From: Richard Purdie <richard.purdie@linuxfoundation.org>

BIND 9.20.28
------------

   The BIND 9.20.28 release was withdrawn after the discovery of a
   regression in it during pre-release testing.

BIND 9.20.29
------------

Security Fixes
~~~~~~~~~~~~~~

- [CVE-2026-19668] Prevent excessive CPU use validating crafted DNSSEC
  responses. ``a0a61dba9e``

- [CVE-2026-19033] Require a TSIG on every message of incoming zone
  transfers. ``9404cd2b8c``

- [CVE-2026-77119] Prevent a DNSSEC downgrade of secure delegations via
  unrelated NSEC3. ``3bed9c8e9e``

- [CVE-2026-19941] Prevent forged DNSSEC-validated NXDOMAIN responses.
  ``a36bf58daf``

- [CVE-2026-19666] DNS64 with break-dnssec could cause an assertion
  failure. ``4cec4965c4``

- [CVE-2026-19667] Reject negative cache records that do not fit in a
  dns_rdata_t. ``dbf08c8581``

- [CVE-2026-19662] Prevent resolver crash with cached DNSSEC proofs.
  ``c884cc1ba0``

- [CVE-2026-75029] Discard repeated SOA, CNAME, and DNAME records when
  parsing DNS messages. ``0d630758c2``

- [CVE-2026-77692] Fix an unauthenticated crash on HTTPS using SIG(0)
  ``5a24401c5c``

- [CVE-2026-81736] Cached HTTPS/SVCB aliases could exhaust resolver CPU.
  ``20bbb1639a``

- [CVE-2026-76163] Prevent TKEY queries from terminating named without
  global options. ``7645138538``

- [CVE-2026-78301] Out-of-zone records in a zone database could be
  served as authoritative. ``72a10c3a0b``

- [CVE-2026-80274] Crash on wildcard answers carrying both NSEC and
  NSEC3 proofs. ``0e44451b1a``

- [CVE-2026-81563] Following HTTPS/SVCB aliases could leak resolver
  cache memory. ``3162df369e``

New Features
~~~~~~~~~~~~

- Add an agent skill for the isc_job/isc_async/isc_work APIs.
  ``fe32990b06``

Removed Features
~~~~~~~~~~~~~~~~

- Remove unused closest encloser proof caching. ``abd8b5bfd8``

Feature Changes
~~~~~~~~~~~~~~~

- Reject oversized and malformed DNSKEY records up front. ``6c22109924``

Bug Fixes
~~~~~~~~~

- Prevent a crash when using both dns64 and filter-a. ``bce5d10d18``

- Fix update-policy grant external address passing. ``b1e955c326``

- Missing required NSEC3 for delegation not detected. ``e84ed2e9d7``

- Tighten EUI48 and EUI48 text parsing. ``ff50f2cdf1``

- GeoIP ACL state can be stale or wrong after reload. ``63baf425b3``

- Honor DNSSEC policy key tag ranges. ``b82e5834b7``

- Fix double free in mdig when EDNS options are specified.
  ``af5bd0b0ff``

- Fix a crash when an IXFR falls back to AXFR with updates still
  pending. ``e34062bc7e``

- Fix DS requests to parental agents over TLS. ``55830d30f6``

- Fix a crash when resolving names below a cached DNAME. ``b94e940f52``

- Rndc-confgen `-q` (quiet) option is documented but doesn't work.
  ``7e4a7ca1a7``

- Enforce query ACLs for redirect zones and searched DLZs.
  ``bc69876b2e``

- Check "asnum" validity in GeoIP ACLs. ``28c2bfdc7b``

- Prevent crashes while reporting DNSSEC signing statistics.
  ``c190514f0a``

- Fix various nits in the netmgr code. ``c28cdad51b``

  The MR consists of couple of small fixes and uncaught errors in the
  Network Manager. :gl:`#6257` :gl:`!12576`

- Fix a crash on remote-servers lists that reference themselves.
  ``aaae614f9d``

- A record from outside a response policy zone could stop named.
  ``d135513b37``

- "rndc flushtree ." failed to flush the cache. ``96e8b585ed``

- Invalid key-store configuration could abort the DNSSEC tools.
  ``1d796ab072``

- NSEC signature set could bypass the secure-delegation check.
  ``c966177f6c``

- Fix a possible nsupdate issue when using GSS-TSIG. ``4ddcab2d3c``

- Fix isccc_alist_define error paths. ``af1349552a``

- Check for empty 'endpoints' list. ``23f58af443``

- Named could crash with a single-element geoip sortlist. ``0e996a4d3b``

- Prevent out-of-bailiwick CNAMEs from evicting cached records.
  ``cdedd4acd5``

- Restore periodic cleanup of stale resolver address data.
  ``356f4013f8``

- Fix named-checkconf/named crash with malformed key name.
  ``9f218f6aaf``

- Fix -Wformat-truncation warning in totext_in_wks() ``f97c2bea40``

- Fix off-by-one errors caused by magic hardcoded values. ``726c6cb795``

- Hmac_verify() now accepts truncated HMACs only when requested.
  ``c81b111496``

- Prevent resolver crashes while processing DNS over TCP. ``81b3b6d89f``

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c366449b3b6cb47dc418cf65340a35ea3a047621)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.27.bb => bind_9.20.29.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.27.bb => bind_9.20.29.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 30da1e9fd3e..15796a15fba 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 7682cbc2fa624fbeeb088736e154090d92c8b524 Mon Sep 17 00:00:00 2001
+From 95141cf9494292fc5645165ef3d5e9e2ed2208c6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index f1d8a8e5691..99e781799da 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From a633e336c248ceab41d3182848b65c95e90ef88c Mon Sep 17 00:00:00 2001
+From 06e9624eb7e474a08ed7e1a456bfe9759ba211da Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index da4057064e1..80a4f2abded 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4b870f60338fe45e036b8a76d47f053338920048 Mon Sep 17 00:00:00 2001
+From f28920a59b658fcda24efde1c45322f785a0b0fe Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 56bca5b..4fd62ed 100644
+index 0bc3965..e1c2b12 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 9adc101247e..323985a4025 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From f3736e5535236cf978fd368b6905098ff6e4fd84 Mon Sep 17 00:00:00 2001
+From f003f396067e6cc1e2ec609b296bb642b8ddf47b Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c06a0d7..56bca5b 100644
+index 26c442a..0bc3965 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 803456c0b33..28ee4ae74d3 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 450187e8feac041de02afd4c0c9039cc41e04cb9 Mon Sep 17 00:00:00 2001
+From 5fc3dfd3f994b5fd97e97837eee2ad808cd8af93 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index a2c1fbb8f70..b373251c47e 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 582334d31432969be7e10906de7540f1dc64b17e Mon Sep 17 00:00:00 2001
+From 42c109317070d19fda70635b7043cbc6f9ec36ef Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index dc1f8f5a9a6..74cf947787a 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 50601a7ee8fd19ddbe9a592c57ae6197782d4c2f Mon Sep 17 00:00:00 2001
+From 2e1314f2e71be15704ba18756250185b36a5c0da Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.27.bb b/meta/recipes-connectivity/bind/bind_9.20.29.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.27.bb
rename to meta/recipes-connectivity/bind/bind_9.20.29.bb
index 6d2b88e0123..5ce94d597b4 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.29.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0"
+SRC_URI[sha256sum] = "587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

