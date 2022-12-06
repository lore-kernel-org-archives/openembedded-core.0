Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FE4C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 05:49:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.40667.1670305754517646850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 21:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W8+L3V3D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670305752; i=@fujitsu.com;
	bh=dBjdBMMxsCjXaebxEIypPLCE1Ddsm0vmqbC/Z5/3kaA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=W8+L3V3DC8XKyUaXVbMRDLW4b1u8owM7yXMKbKnBdTuTj3/euLi3zoOFXGSTTxAAw
	 R2s1JW9GvejiOF7w2fzbT6y4bjAfy/7kQsHYJtq6HKTzGyiyKemdlcQIXGPZXrwJsF
	 /w0NrLozdLX6yZ4CcIXhoG/s9Vvc3wGE3ysFNiQWlVi6Q1Qt87MUF4SQ85pce8VPn/
	 HvjrBQs6lU7kpc9JJv0rE0EBmz0xyQvAOBy3/Dl7cE4BqXG+y1cJT81PHo+zEiQ4IU
	 MywAfjXAJOny0Kxu39C+sKLKoZu7UoTiZicEiv8lMPdGUDOuThDkHIZmmVvv2pNBjN
	 UbpWD+v/NuQGw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORqHv9el+
  ywbSjlhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bl5jOMBY/ZKv7+ms/cwNjL1sXIxSEk8JhR
  Yk/PAlYI5xqTxOW5kxkhnN2MElcOb2bpYuTkYBOQkrhx/z9QCweHiICexNV/oiBhZgEViRe/e
  9hBbGEBF4ltTW9YQWwWoHj7uZ1MIDavgJPE5peHwcZICChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uRmqvkJi1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+LUorLUIl0jA72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKVa/uIOxc9kf
  vUOMkhxMSqK8V+v7koX4kvJTKjMSizPii0pzUosPMcpwcChJ8G6+CpQTLEpNT61Iy8wBRgZMW
  oKDR0mEt+o4UJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8tdeAigRAijJK8+BGwKL0Eq
  OslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3viLQFN4MvNK4Da9AjqCCeiIe/97QY4oSURISTU
  wdV5m2pzp0cpRefs+9yL+6OUBflF+No73fdwSrF9GLVM48jti91bdZ9WVgZtdl75WMfzHzS5/
  NcbwC+OsG6vyup9N/S9oJLhR1apo4vFvMU1XjTh2Bi4yWB3vfCO99F+PEtM9rx19EioH+MIep
  vIpaBtv2OPQEN8Y031MqFPmgfDNGWoGZccWLj+78bXSn9W7bH5q3zdR5by9T7vfXVjQegLXiy
  VZYRlyKX+n9Z+Xa7V74pf6pzle/Oh898XhrtMULjzNXX7v6O3fNh/VvBm2hpWyCnp3CXNplzy
  Q6+t1+OL/vyXhzpkFN4Vsb90xum3R6Dap7uHVdwfZeo5J/N1ut7P+pWRlQ05h4MWKD7xKLMUZ
  iYZazEXFiQCl/yWKTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1670305751!90768!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10286 invoked from network); 6 Dec 2022 05:49:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Dec 2022 05:49:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9DB65100182
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Dec 2022 05:49:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 914E3100043
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Dec 2022 05:49:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 6 Dec 2022 05:49:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] gnu-config: upgrade to latest revision
Date: Tue, 6 Dec 2022 13:48:42 +0800
Message-ID: <1670305722-16736-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 05:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174315

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index e298e31714..e35e9008f9 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "20403c5701973a4cbd7e0b4bbeb627fcd424a0f1"
-PV = "20220927+git${SRCPV}"
+SRCREV = "f992bcc08219edb283d2ab31dd3871a4a0e8220e"
+PV = "20221007+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.25.1


