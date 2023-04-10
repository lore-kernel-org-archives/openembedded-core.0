Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E425BC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:04:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.40709.1681117475916301149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bfCsV5sy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117474; i=@fujitsu.com;
	bh=vBylHZafqQ38mEsEsHbi3el/xhQKgUEcFfSTWgjX4SQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bfCsV5sytGzXObVa+Ll2eXyYwY6BWK3DN6DCAwwMqri0bUfK1IYauBlmPPK3BwDIg
	 qzqyBPD8EoHyUK7/2VzxzsSjxbo6CD4vgx3OKgqe95wQW4M954rUXtyYK+r3ytVkM3
	 bZvrQfQ/qKLfDfQqxMDAuxwDpGvZm6rXSva2JJZxyAg0/WQb45MA8occaSzA6p+Scm
	 6P0Ws+NPmCrrqJ0OphBVNxScDcZ6oOg8EOSPlcO3KNNOvgoyelNqLucYeb/gRDun4j
	 +2wUXmWjai6/SflJ3fBQ+l5URn5GIcUL69y767HYt1yejnr6mBUMPjcUwym2vgrN6u
	 LdZEnJ/vuv5tg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSVfxonG
  Kwab5ShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b3rbNYCz5wVKzbuIG5gXEKRxcjF4eQwGNG
  iY8znjNDONeYJN783sgG4exhlDj2aBdrFyMnB5uAlMSN+/+BEhwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUF3CSaGg4xgpSwCKhKXJwWA2LyCjhJ9J9TBKmQEFCQmPLwPTOIzSngLHH8wm6wTiGgku
  5j98EW8QoISpyc+YQFYrqExMEXL5ghehUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0K04tKkst0rXQSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDNyU4uQfOxh39f3VO8QoycGkJMrbxWWcIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC1+ACUE6wKDU9tSItMwcYRTBpCQ4eJRHerPNAad7igsTc4sx0iNQpRkUpcV4OkIQASCKjNA
  +uDRa5lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8247DDSFJzOvBG76K6DFTECLuVwMQBa
  XJCKkpBqYlqdM9H/v4CCa8U7jA3dBVMvKp6JJb4+Ur2gKFkwvazDdbHtV95dVXbSptve8eet1
  16351G7jfvhZd+YCpU4Vu522Gzau6nrisfvaxRKnOSWKIYbp5+sS+t7zNLk+Z/qt7Cu8nesg5
  x7F7t5A0bCnd/qmuxxK0V1TsmDtvmsKx/Q03X9sdDXo1jiV6l8TNTWRM5PrwM2cnIi53zQPJB
  h/PLJqV+Il7n1nbvs2e5YtDV1ht/I156WaNXe2CwWpm29Pnyo3pcO7hreXa9GEQxMPpfiodvV
  ZMGwQlz87L+Pp2ph3L3u96xc8O/1olVb8FuZ7zfKzc7aYPjtwWH2vi0XO+SSDJf+z3rjdV9hx
  6nSYEktxRqKhFnNRcSIAEtd28lcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1681117473!397249!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18473 invoked from network); 10 Apr 2023 09:04:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:04:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 03B361000FC
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EB1EA1000DB
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:04:31 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] spirv-tools: upgrade 1.3.239.0 -> 1.3.243.0
Date: Mon, 10 Apr 2023 17:04:16 +0800
Message-ID: <1681117459-24898-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
References: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179864

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spir/{spirv-tools_1.3.239.0.bb => spirv-tools_1.3.243.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.239.0.bb => spirv-tools_1.3.243.0.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.239.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.239.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
index 5109bb5333..290c53e8e4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.239.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "63de608daeb7e91fbea6d7477a50debe7cac57ce"
+SRCREV = "44d72a9b36702f093dd20815561a56778b2d181e"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


