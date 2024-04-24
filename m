Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E63BC25B5E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:04 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11780.1713948176774387245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H1zNfg0O;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948176; x=1745484176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kuf/gzJwvypDjCYsdzwEhcpjndoPkOi6h/8qpItQtnY=;
  b=H1zNfg0OXC5xtAN+qct7LGtq1PhYOkY+f/QpNq7Di69FtxGtpn3+KEtm
   akw9QWY09JAjbAuv0zTEIU6v0RASH2K7VtEKmE1oyLdbY9GgVYnLDuLoS
   4/Kl44oOqA5wq7YmKIsGmA8l8qFzZQWTTGFR61DLL2Sk7b70nLroz64a5
   AvNmBDc9n0lEEfxNKx/8h7va+22sQDVnRvn1b1XKsYB5ofbnGQyh9OF6y
   qeBncdmmj+RyFYrjgIRSbhjGrdw6iUvjbXOJb96clh33ueKDIRHUJ9e3J
   pLTkhsYD0T9maKofjtMprb+VEpOyT8Xnzsmt/p5Lxv2FnysBuhLSJ34yv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151910"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151910"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 61514C53D6
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AA54BF4C2
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37FCE1EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D45DA1A000A;
	Wed, 24 Apr 2024 16:42:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/38] diffoscope: upgrade 260 -> 265
Date: Wed, 24 Apr 2024 16:41:57 +0800
Message-Id: <1713948152-13501-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--3.575000-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrMVVFhl7NwvOAI7Mvq/sL5/AF
	43IXaj2gnArxARns8VwAjeDwXx2MYgYpfnr4kd9OOUdMzbeJ0VgaJDwYgQY/f2zUivg1nMWazw5
	qWkMkRCVrEa7qYFnQ961mm4/cOEK2h2Em++ruuH9ZRmuDptXfZxA5wxKjT3bqyIKHzIGoT62/he
	W4eDfXP20vWkztKNqEDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZf6s0mJyOVUvZSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXJhjgtazAaiAepFSm4eIYCeGHJf
	LVN83lGx/4HSA9KrsYukVztZc9+zwHIU20O2g0JYY/hKYpwFq9DjPGCYGBkw4ZX4SOKls3n+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198648

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Ensure that tests with ">=" version constraints actually print the
  corresponding tool name.
* Prevent odt2txt tests from always being skipped due to an impossibly new
  version requirement.
* Avoid nested parens-in-parens when printing "skipping" messages
  in the testsuite.
* Don't crash on invalid zipfiles, even if we encounter 'badness'
  halfway through the file.
* Fix a crash when there are (invalid) duplicate entries in .zip files.
* Add note when there are duplicate entries in ZIP files.
* Add an external tool reference for GNU Guix for zipdetails.
* Add support for the zipdetails(1) tool included in the Perl distribution.
* Don't use parenthesis within test "skipping" messages; PyTest adds its own
  parenthesis, so we were ending up with double nested parens.
* Fix the .epub tests after supporting zipdetails(1).
* Update copyright years and debian/tests/control.
* Fix MozillaZipContainer's monkeypatch after Python's zipfile module changed
  to detect potentially insecure overlapping entries within .zip files.
* Factor out Python version checking in test_zip.py.
* Also skip some zip tests under 3.10.14 as well; a potential regression may
  have been backported to the 3.10.x series. The underlying cause is still to
  be investigated.
* Don't crash if we encounter an .rdb file without an equivalent .rdx file.
* In addition, don't identify Redis database dumps (etc.) as GNU R database
  files based simply on their filename.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_260.bb => diffoscope_265.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_260.bb => diffoscope_265.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_260.bb b/meta/recipes-support/diffoscope/diffoscope_265.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_260.bb
rename to meta/recipes-support/diffoscope/diffoscope_265.bb
index 297a53fb53..6af5abc974 100644
--- a/meta/recipes-support/diffoscope/diffoscope_260.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_265.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "405a55502c8b2c988e46c0800d6a93e8e4e7632c1542b0a540dda50aeea41dac"
+SRC_URI[sha256sum] = "7bdcbd7fc5bc4c821bf6ab5ffbbeb265103b04e6908ea4bb12144d7e5ca002ff"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


