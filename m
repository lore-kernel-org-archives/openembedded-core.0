Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EB2C63709
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:09:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6947.1670479739679723882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B7vbzzUU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479737; i=@fujitsu.com;
	bh=5uhff8juiRPZ2V1sIXoK6s7rdtbLeAtIcRe3LuaPqOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B7vbzzUUkO/4wTaob5rEdyTOqj6p14HqZzb4InXPBrnni8TQE28kitMCmYxdqdZiw
	 HiR+SqcUoBJXCWEQnny3NhYtCj0rcXKeaFzXG5cxUNFZiAgW9F8/IF9EkyYE4Sxpk3
	 uKnZ7K1nI7Ir7QwUenxbwD4n+iTWiXd29+0UBnQG08VzxoJZXaYAkKHtVdzOCp0/yD
	 gF95lTpgY990WOnil8OJvztHnTGxCB1q+bvoZMSmJ+tet/N0xKZcxhxhXID9YVGw6f
	 dznL049jlrDU1f2Fw3QRaAYbhEerJ/gtN8+NiQCuIOc0qBP0moub69t8lXpVNdsvfQ
	 hqKWGif3xHsfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpFtZPzH
  ZYPsvUYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWN3z2fmgq1cFe9nzWFqYNzL2cXIxSEk8IBR
  4szKX8xdjJxAzmUmiWuLdCESuxklvl7awQKSYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAU+JT5tOMoOUsADF2yepg4R5BRwl3j7YDlYiIaAgMeXhe7BVnAJOEgfvzmeCWOsosf
  3KXiaIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjObFqUVlqUW6hgZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBoZtSnHJxB+OTZX/0DjFKcjApifK+qO5PFuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBe6FyYrKQYFFqempFWmYOMI5g0hIcPEoivL61QGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonz7gYpEgApyijNgxsBi+lLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5OeqApvBk5pX
  AbXoFdAQT0BH3/veCHFGSiJCSamBaO+WYZcEi/WX7BNlj+wSu1DtUNyUIn3OJ7e6/d2Hi+rqu
  D8mHet7W98/kdecMk755fr9NJ6f9nA0fDkpb3tv/96230i497pW3Hf5cavX/IrnYNOHoAneZt
  2vuPTGeEzklZIsrp/7hG3+//qjOZNv6pe+61tz2lw087s+2Xf1blmVypeilFv9UK2vG56ybjl
  +uKskwrPWXPf9nzeH1PL/erhN2z+24lvJb27Xz1euWwFVuvS8vl9d8zPF0c4nx93r2aMOJ13b
  HRETVNBRqZLnk+b5f002z35bivO8iU6Ry54UPfEzB9z6H3TORX/58z/0H27P4nvI2WufE6PmL
  3eN8y2avFSY87bLLz5viu5cosRRnJBpqMRcVJwIA9GGSFWQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1670479737!172789!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22987 invoked from network); 8 Dec 2022 06:08:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:08:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D255C1B5
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C755F1B1
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:08:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.5.0 -> 5.6.0
Date: Thu, 8 Dec 2022 14:08:14 +0800
Message-ID: <1670479695-1183-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
References: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Update vendored double-conversion to 3.2.1 (#570)
  Fix len integer overflow issue (#567)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.5.0.bb => python3-ujson_5.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.5.0.bb => python3-ujson_5.6.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
index 9f080eb27..ee12deffb 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780"
+SRC_URI[sha256sum] = "f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


