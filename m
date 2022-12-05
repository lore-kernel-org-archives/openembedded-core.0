Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F0DC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:25:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5324.1670207130737437693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J0QaaHMv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207129; i=@fujitsu.com;
	bh=eFb8ry9dpsEreRICtgj2X4q45sx8AvTc9h4mk8ZBj2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J0QaaHMvfVZTlIvOSDk3WjOCoZu80nH30IDk9j7YfLUB9V7GXg7Gfr2VzlWHre6ie
	 dt10mwRQUJTOSmcrZ28WVfTcPV7hIeXBnGRrW2tJJcX48wKpWlHmYAv6Eoc3BwE5RF
	 eDUhtgQAXkG9JTV+o7qFJP9/VMF7IQa5gpJRDwUuQcd2ki0DnXY+Xu0rFsI9e/DhTP
	 P4RailNKsdBKaxyBHkAMeudxwgYtPKJBeKSiF+ISCYXEXzlUExJ3zpKMMpkPoClvKK
	 l2XJvo43/m7I/TsENFHyGB4/WPHitFM7pDWp3pYuMeCOywYvH9r2EerRMtUODww7Kl
	 GYlwS9U3M5KzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqDsjrDf
  Z4MJWOYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePg3IOMBXPZKj4t/8HewHiNtYuRi0NI4DGj
  xKpJP6Cca0wSJ7bchnJ2M0r8uHkeyOHkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv3vYQ
  WxhAUeJuX/6GUFsFqB4z8J1TCA2L1D8+dGlzCC2hICCxJSH78FsTgEnic+rn4ONFwKqefP9BC
  tEvaDEyZlPWCDmS0gcfPECqldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQEj0yp
  Gs+LUorLUIl0jA72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzU
  kk2MwOBNKVa/uIOxc9kfvUOMkhxMSqK8So+6k4X4kvJTKjMSizPii0pzUosPMcpwcChJ8K4M6
  k0WEixKTU+tSMvMAUYSTFqCg0dJhFfIGyjNW1yQmFucmQ6ROsWoyzHza9sBZiGWvPy8VClx3u
  4QoCIBkKKM0jy4EbCovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNfNF2gKT2ZeCdymV0B
  HMAEdsZG/C+SIkkSElFQD06I+j/UBN7sem1bLXppWwcp+4ALjvKqek9aHX/kHHzv6Mlynqm6O
  YsBhJZ5N3/STDqtq3ChoeBeQ5nhfVn3GZH3/xdZTY1dPebPqAuesNR1mtgdnP9pXmaM420nEr
  lV3SvHL2awlC7isD8a/93z4ddfW7MuL9pfqVr1b/iU4tWXyvh25QXKCsULHAzidtrQq99k0TV
  XiZpxiH8lkb79qultd0+ubrisP8HK+0n33+OzU/3+56ksXFWmmzOn30SncHBe61FTwYc+qRWK
  1Xb+9TktvPCwWXsEQkTX5u7K6Jv+XLYu4j1bV2K6+8Dfi68wpHnu4Ocoudqv+ePwnTa9v2+u8
  HJPX+fmnNA+c41EJUmIpzkg01GIuKk4EAPJrETRlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1670207128!131978!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11927 invoked from network); 5 Dec 2022 02:25:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:25:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3446E100188
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 28A06100182
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:25:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnu-config: upgrade to latest revision
Date: Mon, 5 Dec 2022 10:24:53 +0800
Message-ID: <1670207094-6846-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
References: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174259

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index e298e31714..c97c111da3 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,7 +9,7 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "20403c5701973a4cbd7e0b4bbeb627fcd424a0f1"
+SRCREV = "f992bcc08219edb283d2ab31dd3871a4a0e8220e"
 PV = "20220927+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
-- 
2.25.1


