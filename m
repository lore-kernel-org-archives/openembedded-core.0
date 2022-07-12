Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7DAC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:45:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.6388.1657611922208219574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TQJXs3xz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611920; i=@fujitsu.com;
	bh=1dFR13iXUaBniPE5qw3oJT3ylyyDzdggzbdT1peGmjk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TQJXs3xzGqmj1SwqTB9R+tozKB4yJxeWQ2ys5fkDH+ESdRGL215FF6P8TZ4fAo6q6
	 GUSDkdtnqOxxA9S04u6T/huszbh3UZGK6K0ygNKfxKb+YM3rplW2YJdoOpObddJXPh
	 4d//Yk41Osa+ils/wTtvL2Hppr7tsnqm9F0XDyNnfj8FwDbGk92d/zdAAkvIUGSWQq
	 SikELc3ZB03c7YEVcqLZfpokNO57XlFCIsyb9GkfPMDblNM42wHFM0ZcGPO8Yp2uE4
	 Z8u85plp7NU3ZRYQnzwzLbL7y/n3HVUp+Z3AbYg/eZ8wzJ7JkdP1vPP3dv4VQa3dBU
	 XN3N2ia6TWknw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORpDtB7Wy
  Swbw5QhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aiYy1MBasFK178W8DewDiXv4uRk0NI4D6j
  xOWpIV2MXED2ZSaJB1cfMUE4exgl/n/awQJSxSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg4SFBZwl5v72BwmzCKhKvO88C9bJK+Aksf3yZyYQW0JAQWLKw/fMEHFBiZMzn7BAjJGQOP
  jiBTNEjaLE7MvNLBB2hcSMGdvYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitk4oy0zNKchMzc3Q
  NDQx0DQ1NdY0tdA1NDPQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQJDMqVY
  rWcH44lVP/UOMUpyMCmJ8uZJn00S4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrowKUEyxKTU+tS
  MvMAcYHTFqCg0dJhNdEGSjNW1yQmFucmQ6ROsWoKCXOK6AKlBAASWSU5sG1wWLyEqOslDAvIw
  MDgxBPQWpRbmYJqvwrRnEORiVh3mkgU3gy80rgpr8CWswEtFgu8gzI4pJEhJRUAxPzkRIDSeE
  3UwXWfT/ElqeflX8yxNnXOqd9XdvkBW1nJBR2LpMKEvBwM8tRUDWTPLxo+wq3+ktLGBcuc1CV
  OHOFcXL39Uh+F91cLQ6daTMP+JqqSvUtFPPZ+cNcecKvsOkv2WzrO3Zo8lYsUl7R/jlGu/Fe4
  SuJrdcfrm66eq+76R6D/qm8hxNvW677lTw75ISYR2WCR9ssQ4svP/Yf87NSuD0n4uiTl4fb3U
  RscnXrf767+sZlBpOTd5j3hi+33dZW7pFn3uZtL7Oc619a99zqyheTBI2F5rFonb9vLpeWyHH
  V9lzvfeMZz3gMCi6U2t0WMNl/7+Qpj6WB6/ckPjr6rI/P1so6hrdp3rGLh5RYijMSDbWYi4oT
  AQEd535EAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1657611920!269937!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31193 invoked from network); 12 Jul 2022 07:45:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:45:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0774E7C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EFF191AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:45:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
Date: Tue, 12 Jul 2022 15:44:56 +0800
Message-ID: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167900

License-Update:
 year updated to 2022
 url of some reposity and license changed
 exceptions of BSD 2-Clause License changed

Changelog:
===========
- Drop support for Python 2.7, 3.5, and 3.6.

- Output changes:
  HTML5:
     Wrap groups of footnotes in an <aside> for easier styling.
     The CSS rule .footnote-list { display: contents; } can be used to restore
     the behaviour of custom CSS styles.
- After package installation, the CLI commands python -m docutils and docutils
  start the generic command line front end tool.
- Support parsing "Markdown" input with 3rd party parsers myst, pycmark, or recommonmark.
- The default values for the "pep-references", "rfc-base-url", and "python-home"
  configuration settings now use the "https:" scheme. The PEP-writer template's
  header is updated to fix links and resemble the header of official PEPs.
- Various bugfixes and improvements (see HISTORY).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-docutils_0.18.1.bb => python3-docutils_0.19.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.18.1.bb => python3-docutils_0.19.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb b/meta/recipes-devtools/python/python3-docutils_0.19.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-docutils_0.18.1.bb
rename to meta/recipes-devtools/python/python3-docutils_0.19.bb
index e4ddd01978..7ae93ab557 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.19.bb
@@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fecee07ad8df9116e1f739e2ed2ea513"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=41001b296a89bb2780bbe306e947ecee"
 
-SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06"
+SRC_URI[sha256sum] = "33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


