Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03A0C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:34:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.5523.1670207655590614646
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q3lSQjWP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207654; i=@fujitsu.com;
	bh=E3blbf4T2lx0o5WQG2Q9wELHMMCXaOWVKp8Wz6eGJ8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q3lSQjWPuwg2hxkpow/pHH+EEje/BymEm5o1yPIh2R6/yOktnfdoXZTdBr6zv38rX
	 D4JfsZo6ZKdn3pNVgKtDC9uOV72JihoKD23RkZE3HUuQKBwIQA8O3pUFo7zZo4RpBL
	 JHeGxDP8eknAiOKlj4eVg2L195oBZ4MRVwtPhL1urLko0cahPyqqHlEAJR9es13GRN
	 Bt4wzxRHhBTl82bG45ij0XwKxG9N+rNcYyz2P9Nv/f3DZzJ2eQGBNVkksj0b9myPD0
	 4AzjBrm76rAS5i+sHwvh/PcOTcIs0ShCcrtNimCvMxclnenNcvZpQSSQoH7hvnn8uW
	 dwie0dx/rtX5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLs0ojf
  ZYOJOGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP1wc3sBVe5KuavmM3WwPiCs4uRi0NI4AGj
  xJmDS9khnMtMErc3vmCBcHYzSsyf+gHI4eRgE5CSuHH/P1sXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBJ4kvbyewgtgsQPHzS+aCxXkFHCVmtUwHGyMhoCAx5eF7ZhCbE6h+494uRhBbCKhm5Y
  NmNoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzVBzKiRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jU01EsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknR
  y0st2cQIDN6UYrWAHYwfl/3RO8QoycGkJMqr9Kg7WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb
  3RYb7KQYFFqempFWmYOMJJg0hIcPEoivELeQGne4oLE3OLMdIjUKUZFKXHe3nCghABIIqM0D6
  4NFr2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzuvkCTeHJzCuBm/4KaDET0OKN/F0gi0s
  SEVJSDUzlFqsdVGuy4j4XXN5reGRPmNOiVYYiUS4r8xb7Gs0VM/j572IDe/v/YLZjDssOfTec
  yazv5mznv3zv7KYTNT8en5C78WrmgnUnOdulnXo+VZVmVCjwd8YyR/RwK85r6GfJXfD9TYHnN
  2/N/7L2qTzOi01s57IWeZmo+936ZJFTql5XMH9+cvDfIwGzMlmbfwTcP7LxSLD2nu1iPRP2Nk
  ZcaPd7k7tExfSOj/0KvbzgBTIvv/a/Z+JZ82qp8HHLNekTGdtWG+XJT5TeNiO9f6/6HCmzXNu
  b+wNXnRP+cvPQ1NsTGzKY2ids+rtU3eKAQdyXI4VH9Q4yFkjZG5uytFydrSUR+ujLxRPJmb4S
  cUosxRmJhlrMRcWJAKdMC7lZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1670207653!132664!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11193 invoked from network); 5 Dec 2022 02:34:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:34:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 32E4A1AF
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:34:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 27E841AC
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:34:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:34:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wayland-protocols: upgrade 1.28 -> 1.31
Date: Mon, 5 Dec 2022 10:32:41 +0800
Message-ID: <1670207562-7127-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
References: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174274

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.28.bb => wayland-protocols_1.31.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.28.bb => wayland-protocols_1.31.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.28.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.28.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
index 2366cc7859..afde995fd4 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.28.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c7659fb6bf14905e68ef605f898de60d1c066bf66dbea92798573dddec1535b6"
+SRC_URI[sha256sum] = "a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.25.1


