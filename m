Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BF4CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:12 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48969.1781893983971106208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=G9frKBpZ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Xej6N1ma;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3AE027A0053
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:33:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 19 Jun 2026 14:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781893983;
	 x=1781980383; bh=BxqZLwOMU/sRR7nyPJXovyHlKEUxmLO8PphwJk713Qs=; b=
	G9frKBpZxgpQDplJTF1d3uJ5WnVrZcruuaPOdolwQzfem1n97zCVRTly0EZTGvYZ
	FqgySNaKrCzMQtDCRamrZydfySNajs2SV2/53pePpZXceBoeZzd/eEze6k0i8upG
	bJpRE7SDVh5vu1Gx2gN+gLt1SKzg1zo3MLpItucldb2eCqZyNfGzrVTUpIAwt+NS
	6QEc3X0DFWHdoxsCfX5foqP9jd8Tu/9HZxyPhnFgyRzaRFKzoY8gbJfj4g14mwx5
	eACKcUi+zvlthkZF84l1KD5jYUUVqavyV7ZC2tDp5sl861x3Wwls+RrHhNtw8b9/
	ok4fQkNh/BzFTGVulxuxpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781893983; x=1781980383; bh=B
	xqZLwOMU/sRR7nyPJXovyHlKEUxmLO8PphwJk713Qs=; b=Xej6N1mawThi4GHPF
	HTao55UY7B4tfNqMGlMXOSCg8B3Wx0XBZ37U1w32oEh3OCmhhIO+8Xf9HcNUzyu7
	3fd6wEwraIcFRTlm97Yonwvu/6JcMinLM3lEGuYVeRYS9GmuroSf5lega7GDa/hJ
	QxHpWsCC67qC5QrvzTrjMGxxTEmDIjzFWdeRgjyBpkb9ShP+AekT21KagdtvUQ/r
	uOSdrRF15IBdX7zezumPZcmVr+1JxG1E4USGggkq3W8/7cRcJ/FHPOJg2zYsrWbu
	cot2jBEswVakSMn//KKJ3kzNeIogrKQ8PA0ort7pd32NJZvZBi2HM/QRSDxP2Mw0
	1BKww==
X-ME-Sender: <xms:Xos1agF-KbQXC4inxpRcf8V4VW8hFMopElgtLfUrIXjEybjUt1Ipdw>
    <xme:Xos1agSha6pxAJ6jPsMWeanqHM1U8UtCMZzlAw2hiQv6FJp0NCmkgVhIzaYRELByJ
    CFkAYkXnQDVnmeXoiJ8P64rsokFKdPeA59VDHnWBkr0awx-b-fsBg>
X-ME-Received: <xmr:Xos1avyRT6YNfTmmXmWTmcRREQQZ5ZhfL5vXnKy30HUenXXmljSKa3D5sX5B1QV3jXdqdiKTWDSvl22CU16WhOaWmXwkAys>
X-ME-Proxy-Cause: dmFkZTGrmpBo2uDvBDcM3ZrmwO5eBl5cMsq7c0vIFJrlAqL3P3TLW3OE2FtCF6+E3DZ+gp
    KIM3QFlnHstwZ7gcv2SlNQWK4/RhxPDznw+xxoLCVULv3vcURAOKmSGiErEPAIaiyPF9WW
    JR+E3zMb8dfYBGwT1/1wKKJ/M+a9gECsYUpSPLsOH2pMnZbK/TKF/svl3mhiztAX/qU3y1
    GiyxBLpuwKh0FOPXVbhCxdOPnNmv9ozNmx4OuJxV5Ql4hneLbWCJkf19Hw3leafbetZJse
    F7Ep2OQLSnEFWqdW/xsggsJnLT/qNe1ELfXxHdYiYkrXT2IETVVQhwfLlJLS7bYxq3Ehsq
    RSQdOfkfFU08xo5x87s7uOY9Lu1pDUsS9IPXIeWoTZYTbscp4ddzrbB52GmCMpSzKlxR0U
    IuJcvqs0nOink0ZL4XjEWfUUmDYCBpJbSQ1k5NM0Afi1XmnfWAJOSegJRs8ekSKB4f9EFp
    jqQ/18QYmMZDYLKGFQI4wmwlnulfL1JfeQ+MXnQPjLfr8/9OWV1V9AXnJc/MXpwXy6T1i1
    Jc8hjBkDhTwNdj3oYU/lbOr36Io3jQXSjzbckH7O8anHQZ6GhFFV7j/ebPX8SArLYtZ8/E
    JXj29ME9LV7Ixt8KsJ4emMfjuLajgWL0SZA6clE+1ktt5ALwiS7APwxt3cSg
X-ME-Proxy: <xmx:Xos1anMRz9GkAgrsD5eGF9_28zj-TmRx7kS3wqk9cLFHdK30Ls8BfQ>
    <xmx:Xos1amO1ANBYttXI-1n0hfC59FhXbyZu8gOhWDB_TmJx8E1B2qjqBw>
    <xmx:Xos1ahQaMwba6BHHKJ_JP4O0uucYk7RiPcdpO7c7ReuLbbLHZS-S_Q>
    <xmx:Xos1agAcn_467zMR9ZrUrNSLhXjP9YpXK7nK8NxeRVVlwEaRGNaLCg>
    <xmx:X4s1avmdymDcXGF6Y9bES1DfkGhYjLG_O_1hZgFcG6IDdtnfLX2A1Y8z>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 19 Jun 2026 14:33:02 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 19 Jun 2026 19:32:20 +0100
Subject: [PATCH 2/5] bind: upgrade 9.20.23 -> 9.20.24
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-auh-v1-2-62299dbd8231@pbarker.dev>
References: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
In-Reply-To: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8495; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=2XkDAlTpUgE9CzFIqRqG7d5jY//H3gylJr8pm2OyARg=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSZdkdvkK+4v3mq4mKpqe1evbbN6z4yxb+5dsZw+nLdz
 zsfG5eydZSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAiYXMY/qewMHlNkZnzNyf9
 zO/7//y9skxZ2FROxi/kf+tsMzXhqhbDfx92lhvuyks3zHBI+i4dsGm9z25+F5Wvez8F/7ut0bt
 rOy8A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239186

Removed Features:
- Remove ineffective TCP fallback after repeated UDP timeouts. [GL #5529]

Feature Changes:
- Fall back to TCP on receipt of a UDP response with a mismatched query ID. [GL #5449]
- Limit the number of glue records cached from a referral. [GL #5701]
- Fix a resolver stall on a CNAME response to a DS query. [GL #5878]

Bug Fixes:
- The resolver now removes other RRsets at the same name when caching a CNAME. [GL #5302]
- Fix `nxdomain-redirect` combined with `dns64`. [GL #5789]
- Fix DNS64 owner case after DNAME restart. [GL #5934]
- Clear REDIRECT flag when it isn't needed. [GL #5936]
- Disable output escaping in `bind9.xsl`. [GL #5990]
- Fix crash on badly configured secondary signer. [GL #5993]
- Fix a possible crash on concurrent TKEY DELETE for the same key. [GL #6001]
- Reject RRSIG records covering meta-types. [GL #6002]

For more details, see:
  https://bind9.readthedocs.io/en/stable/notes.html#notes-for-bind-9-20-24

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch           | 2 +-
 .../bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch   | 2 +-
 .../bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch   | 4 ++--
 .../bind/bind-ensure-searching-for-json-headers-searches-sysr.patch   | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                        | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch           | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch                     | 2 +-
 meta/recipes-connectivity/bind/{bind_9.20.23.bb => bind_9.20.24.bb}   | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a59431..806ca9c5bd2b 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From e4886a825c82a7d6f4bd6badeeaeea700e429483 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 7279a73e87cd..9b2870bd38d2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From e5f31670d79906033209d6b30d925dcd0324c95a Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86bf..1bbf17b12e36 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From c18ad4de676ed9350837c4c90a5e53a941712ba4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index c845a8e..d065454 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0b0..352a2f1bc16e 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From 6f0289bc8ee2c5a6d386d6d6921875219b268951 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index 7b9a63b..c845a8e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c467..c7f694190889 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From d308d9b835f4ad11e5824e7333668792980c1357 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448fc..ec9eec6d3e14 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From 23b997fc6276a527e1cf36312cd121170c15978c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110e6..54d948bb1716 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From f5932fde97bb5b47144d926219f3903145a71185 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.23.bb b/meta/recipes-connectivity/bind/bind_9.20.24.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.20.23.bb
rename to meta/recipes-connectivity/bind/bind_9.20.24.bb
index ebc4422b674f..3c5acc972bab 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.23.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.24.bb
@@ -18,10 +18,10 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+           file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be92918ea46908371"
+SRC_URI[sha256sum] = "989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

-- 
2.43.0


