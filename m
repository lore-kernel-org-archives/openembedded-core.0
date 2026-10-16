Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB9BCCF2C0
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:45 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14168.1792122761166508507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FXAjA5mk;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9801; q=dns/txt;
  s=iport01; t=1792122761; x=1793332361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qTj2lgruXwSDN0TnhERdlula0qs6/B9Q9nwwq4mVXfI=;
  b=FXAjA5mkdxH1zDNvsYzAReNh8sWOiV8/WdLa/33pzQ9HBv50qd2WDX/n
   yU8HonlzHs6NJBrBkdFFkGHYp5g3OarsBeZ732Gmq1uPzji0Yq026tWlf
   h28pS68/zOI31WKjbTfaNCEa1/UIWN9LtILuGC1OmL2XFfpwLILO/P1TE
   ZJIuVEYSgfsCS+VnU3Emy0MN/nOGcjqTKdnoSiX2BzoM3X4cYM2ytwKvl
   NPb8YBfhYVlvcglW/aajPUz7vSNlVL2kSaPyvpayAfojUjg8haH3CL/NV
   rR47FHHuLCQCEGdh+E6JpGpJgp4mGaURuMb05mqCFw/6j8soW21Pqqrzu
   Q==;
X-CSE-ConnectionGUID: EoZiaW5pSrivbh/Urkvlyg==
X-CSE-MsgGUID: lmQbKYm/SK26DEKrEMatkg==
X-IPAS-Result: =?us-ascii?q?A0BJAgAtn9Fq/5T/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGR6CZAGCdAMRvHKBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAgOIIgSCI?=
 =?us-ascii?q?noSgVoelSlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CXgcBWTQBK?=
 =?us-ascii?q?0Z/SB+TP5I2oQ8KKIN2jCKVOhozqm8LmH2OCpZPhGmBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i4LC4NghRPJRycyCwMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:xBgkg6MEwaSJATvvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUojhjZWm
 GYYDG3QPPaON2X9eI91YYi38kMHucTUnIVhHnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69hpPkA/AtAAwfx2H2tOs
 sECKy4Jfx/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEqjuG8YICIJbRmQ+1Rm3+Sh
 VPDuF/aWE82Gf+F5B+M7nGj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOL9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:pHk8uq2Q2X9cH/x+i1cnYQqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3AzJHRImiHber7Tv50keyDMXi/8jJuX3rvzX7vfle?=
 =?us-ascii?q?DE2d3Qr3SdEWT5qd1nJ87?=
X-Talos-MUID: 9a23:5jcwEgp3U/wcDSYDlfcezzVnDc1L0qHpM2NXz7krmNOpECVsODjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536198257"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 4A1691800016D;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id E6F37CBF202; Thu, 15 Oct 2026 20:52:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 02/10] openssh: Fix CVE-2026-106586
Date: Thu, 15 Oct 2026 20:52:28 -0700
Message-Id: <20261016035236.442896-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247922

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/991f1f31dde2797416acaf4319dbebe764446c6f
[2] https://ubuntu.com/security/CVE-2026-106586

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106586_p1.patch  |  39 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  | 101 ++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  |  39 +++++++
 .../openssh/openssh_10.3p1.bb                 |   3 +
 4 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
new file mode 100644
index 0000000000..a694424cf4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
@@ -0,0 +1,39 @@
+From 991f1f31dde2797416acaf4319dbebe764446c6f Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:33:44 +0000
+Subject: [PATCH] upstream: Propagate authorized_keys "resrict" keyword
+
+The "restrict" keyword was not pervasively being applied to TunnelForwarding
+connections (which are administratively disabled by default). This is a
+separate problem to the one fixed in openssh-10.5
+
+reported by several people; ok markus, deraadt
+
+OpenBSD-Commit-ID: 8c36c31dc2bdbc0c432d1056496b2f1ce93198d1
+
+CVE: CVE-2026-106586
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/991f1f31dde2797416acaf4319dbebe764446c6f]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk and retained the
+  Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit 991f1f31dde2797416acaf4319dbebe764446c6f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ auth-options.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/auth-options.c b/auth-options.c
+--- a/auth-options.c
++++ b/auth-options.c
+@@ -604,6 +604,7 @@ sshauthopt_merge(const struct sshauthopt *primary,
+ 	OPTFLAG_AND(no_require_user_presence);
+ 	/* Restrictive flags are logical-OR (i.e. must be set in either) */
+ 	OPTFLAG_OR(require_verify);
++	OPTFLAG_OR(restricted);
+ #undef OPTFLAG_AND
+ 
+ 	/* Earliest expiry time should win */
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
new file mode 100644
index 0000000000..10a2abe497
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
@@ -0,0 +1,101 @@
+From ded92bffa2e2f2db9b83245c5061812791bfa47f Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 04:51:28 +0000
+Subject: [PATCH] upstream: correctly check sshauthopt->restricted merging
+
+OpenBSD-Regress-ID: e81e9267514338d6cf6bd2f83dcb722538af528e
+
+CVE: CVE-2026-106586
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/ded92bffa2e2f2db9b83245c5061812791bfa47f]
+
+Backport Changes:
+- Omitted the upstream tests.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit ded92bffa2e2f2db9b83245c5061812791bfa47f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 41 +++++++++++++++++++++--------------------
+ 1 file changed, 21 insertions(+), 20 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -418,13 +418,14 @@ test_merge(void)
+ 	} while (0)
+ 
+ 	/* Check a single case of merging of flag options */
+-#define FLAG_CASE(keybase, label, keyname, keywords, mostly_off, var, val) \
++#define FLAG_CASE(keybase, label, keyname, keywords, mostly_off, \
++	    rflag, var, val) \
+ 	do { \
+ 		PREPARE(keybase " " label, keyname, keywords); \
+-		expected = mostly_off ? \
+-		    sshauthopt_new() : default_authkey_opts(); \
+-		expected->var = val; \
++		expected = rflag ? default_authkey_restrict_opts() : \
++		    (mostly_off ? sshauthopt_new() : default_authkey_opts()); \
+ 		ASSERT_PTR_NE(expected, NULL); \
++		expected->var = val; \
+ 		CHECK_SUCCESS_AND_CLEANUP(); \
+ 		TEST_DONE(); \
+ 	} while (0)
+@@ -437,40 +438,40 @@ test_merge(void)
+ #define FLAG_TEST(keybase, keyword, var) \
+ 	do { \
+ 		FLAG_CASE(keybase, "keys:default,yes cert:default,no", \
+-		    "no_" keybase, keyword, 0, var, 0); \
++		    "no_" keybase, keyword, 0, 0, var, 0); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:default,no", \
+-		    "no_" keybase, "restrict," keyword, 1, var, 0); \
++		    "no_" keybase, "restrict," keyword, 1, 1, var, 0); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:default,no", \
+-		    "no_" keybase, "no-" keyword, 0, var, 0); \
++		    "no_" keybase, "no-" keyword, 0, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:default,no", \
+-		    "no_" keybase, "restrict,no-" keyword, 1, var, 0); \
++		    "no_" keybase, "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 		FLAG_CASE(keybase, "keys:default,yes cert:-*,yes", \
+-		    "only_" keybase, keyword, 1, var, 1); \
++		    "only_" keybase, keyword, 1, 0, var, 1); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:-*,yes", \
+-		    "only_" keybase, "restrict," keyword, 1, var, 1); \
++		    "only_" keybase, "restrict," keyword, 1, 1, var, 1); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:-*,yes", \
+-		    "only_" keybase, "no-" keyword, 1, var, 0); \
++		    "only_" keybase, "no-" keyword, 1, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:-*,yes", \
+-		    "only_" keybase, "restrict,no-" keyword, 1, var, 0); \
++		    "only_" keybase, "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 		FLAG_CASE(keybase, "keys:default,yes cert:-*", \
+-		    "no_permit", keyword, 1, var, 0); \
++		    "no_permit", keyword, 1, 0, var, 0); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:-*", \
+-		    "no_permit", "restrict," keyword, 1, var, 0); \
++		    "no_permit", "restrict," keyword, 1, 1, var, 0); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:-*", \
+-		    "no_permit", "no-" keyword, 1, var, 0); \
++		    "no_permit", "no-" keyword, 1, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:-*", \
+-		    "no_permit", "restrict,no-" keyword, 1, var, 0); \
++		    "no_permit", "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 		FLAG_CASE(keybase, "keys:default,yes cert:*", \
+-		    "all_permit", keyword, 0, var, 1); \
++		    "all_permit", keyword, 0, 0, var, 1); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:*", \
+-		    "all_permit", "restrict," keyword, 1, var, 1); \
++		    "all_permit", "restrict," keyword, 1, 1, var, 1); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:*", \
+-		    "all_permit", "no-" keyword, 0, var, 0); \
++		    "all_permit", "no-" keyword, 0, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:*", \
+-		    "all_permit", "restrict,no-" keyword, 1, var, 0); \
++		    "all_permit", "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 	} while (0)
+ 	FLAG_TEST("portfwd", "port-forwarding", permit_port_forwarding_flag);
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
new file mode 100644
index 0000000000..6defa83ec6
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
@@ -0,0 +1,39 @@
+From a30bafcbbd44dc4dc91916240c32ecabff899338 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 04:56:12 +0000
+Subject: [PATCH] upstream: simpler
+
+OpenBSD-Regress-ID: c7f30b865abd0b3e0e5514f861509c32e352a760
+
+CVE: CVE-2026-106586
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/a30bafcbbd44dc4dc91916240c32ecabff899338]
+
+Backport Changes:
+- Omitted the upstream tests.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit a30bafcbbd44dc4dc91916240c32ecabff899338)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -422,10 +422,11 @@ test_merge(void)
+ 	    rflag, var, val) \
+ 	do { \
+ 		PREPARE(keybase " " label, keyname, keywords); \
+-		expected = rflag ? default_authkey_restrict_opts() : \
+-		    (mostly_off ? sshauthopt_new() : default_authkey_opts()); \
++		expected = mostly_off ? \
++		    sshauthopt_new() : default_authkey_opts(); \
+ 		ASSERT_PTR_NE(expected, NULL); \
++		expected->restricted = rflag; \
+ 		expected->var = val; \
+ 		CHECK_SUCCESS_AND_CLEANUP(); \
+ 		TEST_DONE(); \
+ 	} while (0)
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index aceaa6420f..7760dae931 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -35,6 +35,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
            file://CVE-2026-106584.patch \
+           file://CVE-2026-106586_p1.patch \
+           file://CVE-2026-106586_p2.patch \
+           file://CVE-2026-106586_p3.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


