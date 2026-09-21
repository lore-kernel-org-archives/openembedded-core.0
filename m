Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BA6C982F1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:21 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43673.1789974434132061366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YGa77U79;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so17759725e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974432; x=1790579232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FynEXRbNqUjnguxbCsqWp284ECJ+BYQUI/vA7H+ZFXg=;
        b=YGa77U793RCrtTtdxZ/gSCFp18FxIeiQGDYjv7O0sg3zg7H2hFn46W9ITfORfATK+R
         9yd+eRvTmZrrQykDFCkPB0/kdqIXIU7gTuOdOwqHO/RdoW1DOwYLtwl2zWif4pZb90hx
         wee7vLegU38DbEt4FBEga2+i1CGFQBSstyxs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974432; x=1790579232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FynEXRbNqUjnguxbCsqWp284ECJ+BYQUI/vA7H+ZFXg=;
        b=EmMKhxLXtMMaxI7tGuQ3giw71y97tptAwYgzYFpO/Vb0pVku3MuXAuKc4TZdN5Dzzk
         gyJoxQTtrQpgyMQ09umfWMA5RTNeEyi3yZC3sZdTZ4CV5TynRgfxPBRjLLik+dw0OhJ1
         6N38Q9PwQm04emq4WkPM/jUuaLuhIgSWf90FVIXilonV58Vij8aLtm0k4HBxLTCqEv/x
         ZmUDwZRu50VKgAZdEtLgdBp3J5E53SZ7of8G+qRSen0sykfzStr/xLHUj+d/HApvKRKG
         UW8XCYYPnUIivDi7HxvKe7tZC61K14Yw52ErzFzJrP7EPORChmjH5hmtmtZ/1M/4bQxf
         IZpw==
X-Gm-Message-State: AFuF++lClEynmXoe+JVTEmekhOMP5FKJa5Bq8QmwqNq4wviy+QytWDM9
	ZjEsTrAUWaIiXLzq25WoGFtiAabstEt2sNbPH+YROC/3uLd63GB3FVdB2dcRLiWUUYw3jgJ05sX
	QQJPcgq0=
X-Gm-Gg: AYBFou2y0LXhhnog+BAfQQZwHORm0kIeEbdIVrSN3DMbQbQKHvafcI7q3YTDKuEYSqR
	j6Qi6ol/p0lq7AYAGgkCQY9OJO510GYCdOGGFm3ohfdrHbR0NwTqjx2Pld6RP811vOqXNhp5kZJ
	6HOaBPWwIjsTCiRuHjbQK0gO1nxPyKtDQ+ESwC8CAYdJArVFQEzqH09m7Xcl+njS5hRcoz1bJMN
	bFiMJpTIAu1/62ZgVPPtiVnlHk61AzDUMSkEM7hFFq2zswGvgBXvhopTQ7OJptRHZec0Mkf2U3n
	btAXSBq/5Tr5yTcyCVkqWo6iZS0/jF/NWuCRNFLutsb0Yhmap1MrPa7rtqiHBq2sWNgPNl7Llki
	9gkoZBgs6c8DfmbLVnT7/wwi30A6VlmH6p4dFzISi9r+3Z0WCaz1fDxFfSn4UwU+w+yGu68YkDt
	3QaYRqpmFmXi+0igxifbJd7LQplTnWetGSIol4t/UOjvS41dMWqv2MhmWQcv59joOn2FCjKmDvo
	IARTP2EFovX3ITjcBTBzdaOug+gRKFamgg9QQ==
X-Received: by 2002:a05:600c:3ba1:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fc56b5754mr170037625e9.12.1789974432261;
        Mon, 21 Sep 2026 00:07:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/20] bind: upgrade 9.20.27 -> 9.20.29
Date: Mon, 21 Sep 2026 08:06:47 +0100
Message-ID: <20260921070656.521680-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246298

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
index e915161d8cd..c280d5b98d4 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.29.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0"
+SRC_URI[sha256sum] = "587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

