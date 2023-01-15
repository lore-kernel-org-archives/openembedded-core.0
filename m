Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2597FC63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:23:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.134739.1673760191776433733
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QxQmeSWm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760189; i=@fujitsu.com;
	bh=j/DucdrqIhdHJ0EF32Vnb5qD4ivEtNMXlUX7MwRZO5c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QxQmeSWmPykXF2v7XvC9eo54Cs/iS78D69co1/Bua1vYGdiSDpJj1IwpPbPDTswra
	 yh9xAgKmH9uKigaDRVlURs4FDPp7ifTHsd5m/1TSrkOC94NtBUlOjbcO1pfzA8Zqok
	 z0hPOMw4/+l7wDVAW3WMQTR6HIJ6XeuIXV168XyIlKZRqc3D/4mn9IsiTA2AKnWR99
	 y2kwL8T55YZApk3EVohOeGmNhLJEE+ECg15vOQJxOI9uhNkfA2EsSEDhS81YAOqs7s
	 pS6gOALun+/eYEEBQOElbmoZWPy1dHqBqZQ7DoOglF/UstchgZoqnC7pduGtlNT6g0
	 tr3/SiKqw9Acg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8OxWXd37+F
  kgyvfTS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozNx9tZC3YIVmycp9jAeJavi5GTQ0jgAaPE
  vS92XYxcQPZlJontB/ezQTh7GSWmtTxiAqliE5CSuHH/P1CCg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICxxLf2B2DlLAKqEnta9zGClPMKOEo0LpACCUsIKEhMefieGcTmFRCUODnzCQvEGAmJgy
  9eMEPUKErMvtzMAmFXSrR++AVlq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFacWlSWWqRrqJdUlJm
  eUZKbmJmjl1ilm6iXWqqbl19UkgGUSiwv1kstLtYrrsxNzknRy0st2cQIDMOU4mT2HYxvlvzR
  O8QoycGkJMob+e1QshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3g2Nh5OFBItS01Mr0jJzgDEBk
  5bg4FES4dXuAErzFhck5hZnpkOkTjEqSonzvugBSgiAJDJK8+DaYHF4iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5Iw71OQKTyZeSVw018BLWYCWhxSfxBkcUkiQkqqgansj5Gz5DoXfx6NX6t
  2rdYWF3zsnqVZsV70Ov91adPFL356bZU9zLJ4tiLP43dWRqvmFPfzm3yNXde9/kNwdp6V96/v
  qlZrXp45cHDzx/r9wVaLJU/vOsHjeMxJZ4KU5zoX9rvvE0WWv/93as0NkQ1yGQ8Zmk0+rkpQ/
  9ccGvdvSrEns5GYXKjmtVdtwns8JN+ZiCktWC4dUXnK9tLWjJ0tj9jDNvvUcotM/MeaeGyu7L
  L0ApWt8x7J6NaYrt+s9Tio+IpR0e10/iVGptz/q9wXbz5yqnL7l9lhQvaWzY9F5jEHhFZZ1yl
  8a1YOmhQo9KfCOib21AsVt2zOrIWqS1cvWtWzxv+JJYeost/+n0osxRmJhlrMRcWJAOBdzx4+
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1673760187!229611!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13807 invoked from network); 15 Jan 2023 05:23:07 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:23:07 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5C717150
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:07 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 50B9D73
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:23:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ed: upgrade 1.18 -> 1.19
Date: Sun, 15 Jan 2023 13:22:51 +0800
Message-ID: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175867

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * main_loop.c (exec_command): Fix commands 'e', 'E'; they did set
   the 'modified' flag if file not found. (Reported by Harry Graf).
   (main_loop): Print script error line to stdout instead of stderr.
 * Change long name of option '-s' to '--script'.
   (Suggested by Andrew L. Moore).
 * Assign short name '-q' to options '--quiet' and '--silent'.
 * main.c (show_strerror) Use '!quiet' to enable diagnostics.
 * Do not process file names for backslash escapes.
   (Suggested by Andrew L. Moore).
 * ed.texi: Document 0 as starting point for searches '0;/RE/'.
   Document how to achieve the effect of ex style '!' filtering.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.18.bb => ed_1.19.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.18.bb => ed_1.19.bb} (80%)

diff --git a/meta/recipes-extended/ed/ed_1.18.bb b/meta/recipes-extended/ed/ed_1.19.bb
similarity index 80%
rename from meta/recipes-extended/ed/ed_1.18.bb
rename to meta/recipes-extended/ed/ed_1.19.bb
index e1548df15f..d01b7486d9 100644
--- a/meta/recipes-extended/ed/ed_1.18.bb
+++ b/meta/recipes-extended/ed/ed_1.19.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, disp
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://ed.h;endline=20;md5=6e6a818b0593f937fc63ba08d5e314bf \
-                    file://main.c;endline=17;md5=8419a08bb12936f32384a0d1c0f9e74c \
+                    file://ed.h;endline=20;md5=504a90a78b045972e2fd2f3fc418c195 \
+                    file://main.c;endline=17;md5=cf9d322b0ac4445ca2299c61ee175365 \
                     "
 
 SECTION = "base"
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f"
+SRC_URI[sha256sum] = "ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.25.1


