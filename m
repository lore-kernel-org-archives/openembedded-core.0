Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ED5C6FA89
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:06:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.22610.1662368804060945269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SJlsoWR0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368802; i=@fujitsu.com;
	bh=ktOl32CgHQJHcid0/dBhg4oyoEH9Apt9Xlmqp24t68U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SJlsoWR04dSvXS38/jHWvc0fWAQG+9Fw/BqZfoAlJDqkSWHqfDrtJwblmzYMWWkOm
	 nh5fbuRQNL41Nik61Xm/NSqsZ9aknFH27aW40AQGOi7fDMI49cO/F+WEd2QOjpmBYB
	 xO7QIvi/w1zMnVPKt7jiatatCd1WGGmKsfNKtuX9+VhNfCFhHIC/SHF4dJR9O1+NBs
	 zIqYk2cvvn1WFUCYVQ6LK/3bKSd/hwktucRsg+qe3BAHld9OVdCbf8nyvbQKKzRASy
	 GrGk7GpEmsjMZK1x+s61aS1++jubl/0BS/UGG6kZAJPz2pVb4eutrbaDZnLOF87TW9
	 n/LxN+UzJ0Wkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqKu4RzT
  ZoLXNzOLOz3fsDowe5zauYAxgjGLNzEvKr0hgzXjyg69gN3fF8clfWBsYN3N1MXJxCAk8ZpT4
  PP05M4RzjUni/O017BDObkaJdTOPM3YxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAi0Tf779gNgtQfMGJN0wgNq+Ak8SWJ0/AxkgIKEhMefieGcTmFHCWuPNgFliNEFDNyv
  3rWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSjdMPMUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iYVZaZnlOQmZuboGhoY6BoamkJoS3O9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwEBOKU45uoPx2L5feocYJTmYlER5388RTRbiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwbtyB1BOsCg1PbUiLTMHGFUwaQkOHiURXv91QGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzbgKZIQBSlFGaBzcCFuGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzcoFM4cnMK4H
  b9AroCCagI+z6hEGOKElESEk1ME2wbj2Zp1iUsiPmo7/PFK63v/gst15R2fcja6Kh0vd5/5JO
  F7y+O4nHqq/ulnHzzNMbciaVaqwLOVaQ2WHiHPBN/7vcsfwtf3oWv7WJa/hhnPSPNTFU0HVyx
  KotvE2x8/b/kfxr/dZ/x54SBbdNpve4p836cC0gctK2xZt2TFptzLz2Tq98nsNHhy92ba6nt7
  Ya+BXpX/erCAr6oqiXvp5j/dazP8Vjrgq63G5OX7Pzs9/ORc4XmzPEDab8f6CwddLqRXOson7
  8vLixo0P7bi+7hhrnnjelrFuX9zdaWTJcmLjXdQFv+GvBNT8elDIZBN2beOJcHd/ttCoPj5Du
  XS5+7G9nC044LqzTtCVd55sSS3FGoqEWc1FxIgA7pBMuawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1662368801!428072!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13230 invoked from network); 5 Sep 2022 09:06:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:06:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4BBBE10019F
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3FD3310019A
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:06:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pathspec: upgrade 0.9.0 -> 0.10.1
Date: Mon, 5 Sep 2022 17:06:20 +0800
Message-ID: <1662368782-32326-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
References: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170307

Changelog:
==========
Bug fixes:
------------
Fix documentation on pathspec.pattern.RegexPattern.match_file().
Issue #60: Remove redundant wheel dep from pyproject.toml.
Issue #61: Dist failure for Fedora, CentOS, EPEL.
Issue #62: Since version 0.10.0 pure wildcard does not work in some cases.

Improvements:
-------------
Restore support for legacy installations using setup.py. See Issue #61.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathspec_0.9.0.bb => python3-pathspec_0.10.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.9.0.bb => python3-pathspec_0.10.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.9.0.bb b/meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pathspec_0.9.0.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
index 641f1cfd87..8f2af0ec99 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "e564499435a2673d586f6b2130bb5b95f04a3ba06f81b8f895b651a3c76aabb1"
+SRC_URI[sha256sum] = "7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


