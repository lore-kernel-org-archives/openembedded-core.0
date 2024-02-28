Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCC3C54E59
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8417.1709105608599023021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BklWrVyl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105608; x=1740641608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JuXF6lHTItczVSNkNVsZWCY9Gm5bflppPaCRWt1Gp4c=;
  b=BklWrVyliTcpF7ZbIVCiDJ/Z52//FoULE6hXquUUZINJfm3zULCsmwXa
   Kddj3+AfmkPYXKPuKzgDjl8OBAJ8eJbDy2E8Ukl/KivkWI7EbdBp7AWRq
   aXpdN5+SBFJyK2u15FmwR1YyJSCOJc1WvPDe9aBDzHbRTOK3gBROmvE36
   6Kl7zxZv53cjV6EtXgv1DeXC6LREVXAiX1l8cYtGsjZc3s26FQnOE6qiN
   AFtIUYSBDV3SIqtBPaVd7TH/cDqhbQlrQnSVXA9eS1Aza326kSl/QKE1b
   Nn0rAWi0Yq5H0jQBuOV9hvQF1sWMKhw5Fh097WS0zNlNrGDRIZuQ0blI7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="139129152"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="139129152"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CD26427A80C
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 12521D1EED
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 812BF41180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2EE6C1A006A;
	Wed, 28 Feb 2024 15:33:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/48] libpcre2: upgrade 10.42 -> 10.43
Date: Wed, 28 Feb 2024 15:32:21 +0800
Message-Id: <1709105575-24259-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--8.316400-10.000000
X-TMASE-MatchedRID: N25sXaafkGCjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jL4z
	fTpGjdbaN/cuMNJ8XfZOBA3mkBUxA9X9PZqTDyHckCThXPqsqitPnKxAOPp4WStpVOu3TZGZNIF
	nOX2uaDiB0BNioURLhbV0RxDoKUtZd1GaojREb1h0+657dxGJGAFkGmUzEj/O31GU/N5W5BDBZq
	EdJyZjPXA+RLvN7aU1WqEBIOyGYilNu1NbL3eMXlgowyUWHgGdF4r8H5YrEqwDBQ+XBh4YJYZyU
	XVEGb9A+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Bcsgu/IQFPzv67wpKrIJNBK6HQ
	s3v+pqMWm/gAtjCd7AYUFsN5WfiFjbcgpFl911oDfgpjSDkFN/ioIsi7Sa0guRI/000hJfEDolR
	aRe50icJC+5wMCAzA8M2aPHD77x6tYv/FAmebjp4CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2rl
	3dzGQ1ksGjn0OSaiH92Q7d11COdarn/lfPXNAYTBnqG3peHfP0BXmvLoyOrQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196340

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
============
* The JIT code no longer supports ARMv5 architecture.
* A new function pcre2_get_match_data_heapframes_size() for finer heap control.
* New option flags to restrict the interaction between ASCII and non-ASCII
  characters for caseless matching and \d and friends. There are also new
  pattern constructs to control these flags from within a pattern.
* Upgrade to Unicode 15.0.0.
* Treat a NULL pattern with zero length as an empty string.
* Added support for limited-length variable-length lookbehind assertions, with
  a default maximum length of 255 characters (same as Perl) but with a function
  to adjust the limit.
* Support for LoongArch in JIT.
* Perl changed the meaning of (for example) {,3} which did not used to be
  recognized as a quantifier. Now it means {0,3} and PCRE2 has also changed.
  Note that {,} is still not a quantifier.
* Following Perl, allow spaces and tabs after { and before } in all Perl-
  compatible items that use braces, and also around commas in quantifiers. The
  one exception in PCRE2 is \u{...}, which is from ECMAScript, not Perl, and
  PCRE2 follows ECMAScript usage.
* Changed the meaning of \w and its synonyms and derivatives (\b and \B) in UCP
  mode to follow Perl. It now matches characters whose general categories are L
  or N or whose particular categories are Mn (non-spacing mark) or Pc
  (combining punctuation).
* Changed the default meaning of [:xdigit:] in UCP mode to follow Perl. It now
  matches the "fullwidth" versions of hex digits. PCRE2_EXTRA_ASCII_DIGIT can
  be used to keep it ASCII only.
* Make PCRE2_UCP the default in UTF mode in pcre2grep and add -no_ucp,
  --case-restrict and --posix-digit.
* Add --group-separator and --no-group-separator to pcre2grep.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.42.bb => libpcre2_10.43.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.42.bb => libpcre2_10.43.bb} (92%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.42.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
similarity index 92%
rename from meta/recipes-support/libpcre/libpcre2_10.42.bb
rename to meta/recipes-support/libpcre/libpcre2_10.43.bb
index f471b3f90a..fd0bd79212 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.42.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840"
+SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.34.1


