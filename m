Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10276C678DB
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 06:54:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.8957.1678172090340761148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 22:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VcQvvIBI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678172088; i=@fujitsu.com;
	bh=fIbRd1/p7YRbnBeh0G2Pt9OLUAHhQxKt046DU9G/dKY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VcQvvIBI/m0jCMhZp7WjFUY7V7OI4uVOdbJp0k2ygIePbWfpsn01huw2+/N2lCnpX
	 uciKg+jesZBkcoSexLyCpz5PKS3qyZu24ZPNvSkPnJq9JnNSkPCmCsH01yr33URBcC
	 qaKzvtkql/E9rERreOveaw/bPHn0LpocQjLIuqwXPqQWeSwOfLSSrjCgzw3NnQ73xw
	 JzyHJnWPmnjR9LhlzHw+GnuLOokKzGEiHMt1TtF6BGiS0TuVAJ5lHneVLGEfSDSiGC
	 oBQUyxIBLpsmIFl6OaqPshzeSWhXGsf7t6FX45XNp+pMHHUJA8e153kRLutEuN4IM5
	 lwnrzmwUAffHA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqLv9Plu
  KwaJZEhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aivl+sBS+5Ku5tOsrawHiOs4uRi0NI4DGj
  xK4D89kgnOtMEruPXmeFcPYwSjQ9+gLkcHKwCUhJ3Lj/H6iKg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC/xK6vt1hAbBag+NpHHYwgNq+Ak8TFq4fYQGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgix
  fMEDWKErMvN7NA2JUSrR9+QdlqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6ZroJRVlpme
  U5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmNKcULaDsbWvr96
  hxglOZiURHmv57OlCPEl5adUZiQWZ8QXleakFh9ilOHgUJLg1bwHlBMsSk1PrUjLzAFGBkxag
  oNHSYSXAxgdQrzFBYm5xZnpEKlTjIpS4ryfQPoEQBIZpXlwbbBovMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmPcwyBSezLwSuOmvgBYzAS2+sJ8FZHFJIkJKqoFp2iWz656/L719GT7nqPs
  KtkAXl7miuyRq755z1pApZrluzbTngpGA0y/NzUKvQhqtJ3A4LLmxS5OH9UzTtelTXxQsjtrq
  9zNvdePfZ16B7fxfw8wFRZmPPhPh+DUzlLOz1S+u5837/9+tdyRw3CiZt2L27/SYCuMep2Nzd
  Kx+f1rzy8l55+QjLQ/4WFQYHAN8Q5h35G88/D7yzekf11ZMufshIfPdS5fEgig1P/80k1les5
  dk7OG/HDd19QVR5vKrbsnPJIvllNQ2tzrrRcye2f3YvD3NXVDmnLujHccX/7NWO6NZY3vj+Mw
  nd4W0/jXjPqFS8Vitd273m4qsxKNCC3tDf7VsVy9o32x8KUCJpTgj0VCLuag4EQC2yS2EQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1678172086!836095!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28586 invoked from network); 7 Mar 2023 06:54:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Mar 2023 06:54:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BFD2F10018D
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Mar 2023 06:54:46 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B379D100182
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Mar 2023 06:54:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Mar 2023 06:54:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] vala: Fix install conflict when enable  multilib.
Date: Tue, 7 Mar 2023 14:54:35 +0800
Message-ID: <1678172075-14569-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 06:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178092

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
   file /usr/bin/vapigen-wrapper conflicts between attempted installs
   of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/vala.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index d3daee37dc..162e99bb03 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -50,6 +50,9 @@ do_install:append:class-target() {
 # vapi files.
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
+
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
@@ -64,5 +67,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
+	rm -rf ${PKGD}${bindir_crossscripts}
 }
-- 
2.34.1


