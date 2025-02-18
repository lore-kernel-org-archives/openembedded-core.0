Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC25C021B3
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14685.1739864491632196876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lD90TDqp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864493; x=1771400493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=++puTAhmiSotAfFDglmXZEaBtoq4zjEOeF8amblTlnk=;
  b=lD90TDqpWkPWmIP9LjsxlhnRT/SCT9XTFeRfc7i4TjM3kNqMh5zHbqNT
   3WzDD9E7jJKuN/Lxk2zHNE9zjUa2vaIXqfVxxxuoj/UvvxXea7XZCwT0/
   5JRxAxhxZt677nJR2JxQnldfOOfw0pOwrfrm1SG0h3RDE+oVB/4v/3sL3
   rDOYkJnCB2jbzQH1rg0eRWonDjtBNQUV78HqFdG+4MnP4Ia1PSYw+5KhA
   Z6RcY6nnF7vVL8MzyF0WBp9Yk57YaWKQmEP/vXsbGgb9izLfkdO9ucOSO
   4MoChbEPAmrGBRm56rLxXLYdGE9HvDVWuU0u1T9+NvsZUIyzCWdWB3Gm7
   w==;
X-CSE-ConnectionGUID: tYPaDojwTUiqdHTdVSUvww==
X-CSE-MsgGUID: myBAKAoOSX+jowx6JE0xeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="192947496"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="192947496"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 59C52E8520
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B64A6D50AA
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 598BB1A006C;
	Tue, 18 Feb 2025 15:41:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/32] python3-hypothesis: upgrade 6.124.7 -> 6.125.3
Date: Tue, 18 Feb 2025 15:39:22 +0800
Message-Id: <1739864375-21394-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211586

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Improves sharing of some internal cache behavior.
- Optimize performance (improves speed by ~5%) and clarify the wording in
  an error message.
- Fixes a bug since around version 6.124.4 where we might have generated
  -0.0 for st.floats(min_value=0.0), which is unsound.
- Add 2024.12 to the list of recognized Array API versions in hypothesis.extra.array_api.
- Registration of experimental Alternative backends for Hypothesis is now done
  via hypothesis.internal.conjecture.providers.AVAILABLE_PROVIDERS instead of
  hypothesis.internal.conjecture.data.AVAILABLE_PROVIDERS.
- Refactor some internals for better type hinting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.124.7.bb => python3-hypothesis_6.125.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.124.7.bb => python3-hypothesis_6.125.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.124.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.125.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.124.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.125.3.bb
index 6b294ff68c..e5c1dfc6b4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.124.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.125.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "8ed6c6ae47e7d26d869c1dc3dee04e8fc50c95240715bb9915ded88d6d920f0e"
+SRC_URI[sha256sum] = "6276d9d8f7f91ebd7ad95081f004bcf5699afb4d680a8321861cbf3a5de45d3b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


