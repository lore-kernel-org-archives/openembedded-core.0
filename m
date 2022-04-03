Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8442C38A02
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.7494.1649245766583824116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j+fDkR6f;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245764; i=@fujitsu.com;
	bh=poDSflbIERTeOiUchKN089au752CdLtbqKpUUVsWd5U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j+fDkR6felIAyIRfyFBTWVqBE948fxTIyFYWD+1DSyBdfme4lhuq+tjhM2hCFtB8y
	 ZN0W5au5i3fmL4EfXG12XT5/A5YHAYrV9lGrOyJ+ogQe2T/xH0kaV17YP2PC09iREc
	 ilf5o4XGu/mfnzeobQGQScPz93Dfeq5QDAQ9s7Una9CJqRerlo7hn07I5GDvHiJaek
	 f8PMq43l3Bi11yXsd96MTVqmcKy3OR2G7+fZ8jKgpDvkv+/mykKYbXit76Kjt7ABfr
	 d+tzRJ0Znf3Mr6WiTTwhG3ioHfAn7B9nUTXhL6pl7jswnyHhqUiCdHRe9JONDGYq5f
	 VUNZcwMEUvU5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqOtS55t
  kMOGNrMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnF653emgtXsFc8+nmVrYLzD1sXIxSEk8JhR
  YuniW8wQznkmiVfdO9khnN2MEpOnXGbtYuTkYBNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAUmJO+3Z2kBIWoPjRJWUgYV4BJ4nnC2czgdgSAgoSUx6+ZwaxOQWcJY5OOAEWFwKqaZ
  wwnQmiXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0hMWtWG9RMNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYLZKKMtMzSnITM3N0DQ0MdA0NTXUNdY30Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECwzelmJFpB+Oyvp96hxglOZiURHn3l/smCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLg3VIFlBMsSk1PrUjLzAHGEkxagoNHSYRXqwYozVtckJhbnJkOkTrFqCglzvsSJCEAksgozY
  Nrg8XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvF4gU3gy80rgpr8CWswEtPjdGU+QxSW
  JCCmpBqYFtbr576Z/D51rtCJ3wrMSBc7AJwnyblufrMl7/+P6sdbG32fYS5o5eCw8YtlKVI5E
  ieSu1g+s5Zr6uKSBr/bAgm8/bFffOXvB9aGN6J2c2gS9FxYMZ+OSt55jKFy8YIGFQ/30o6emK
  G5SSd61xbLw0rwI8zP/DTse+blGPqm/ZyDGsmzaxNiP/Y0WIX85q7Zs7M28oZLjOuWYVHtb1i
  S5qAkNFVfO2m8+F1VxSWoLT4hj9pFloZXzorz3Lg+Vj0+d8n/n7na7npk3bFNnv03Z2Om4T0j
  04qMD4nvb7pw3aFiWeFby3XW9458Pmxh9brR/vGpliIfZtO/6TWsClt6z/ztRf6FifLm7lrjz
  93QlluKMREMt5qLiRADYPMtFWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1649245764!495959!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14866 invoked from network); 6 Apr 2022 11:49:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:49:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F07A1100181
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 835E21001A1
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:49:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dpkg: upgrade 1.21.4 -> 1.21.7
Date: Mon, 4 Apr 2022 02:45:38 +0800
Message-ID: <1649011540-28857-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
References: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164070

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb => dpkg_1.21.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb => dpkg_1.21.7.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
index 681909f0bf..902cc03bcd 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "5563bdb608b3413639b69f1c76567cb66ff1a961"
+SRCREV = "e61f582015a9c67bbb3791cb93a864cfeb9c7151"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


