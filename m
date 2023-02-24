Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A19AC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:45:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.8856.1677206723219857307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yQDEUkaA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206721; i=@fujitsu.com;
	bh=vvpj2ugSE4axWgRrjALz1Iie0q5ysqNhSl1n0KnSrgk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yQDEUkaAwdOa2Zkbdx9a6/bq0zUqnNv4eq3i9UXXnfwS/q78Z6WRVNjXzwNkXL5nj
	 foF/eNDAwP7mAr3a/08liRFHhTBqK+XPk/bGp7fkCK8oH1hF6YnemgEHIQgI9kFMC3
	 Ta2FNGldIr9z58vuwNCxdEvbmVM0g0PDzeWVt1RzpWtaasQM27IHc82+7/iUJlhBbX
	 M3OzBiYR11NUc808kx7Jss92ijxQVJ5fegy8/5hVvFSw3VqgBlShmZ7xEFVmt/2alj
	 KC6UOUP80A4HuWzFmWMXsOAOQUZWsECa+ZuRHZ+5dIcZaudmvfcCHwGKs6zzYfzb5k
	 90+J2LvDmES/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWXe/yo9
  kg9fnrCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyN12cwFcxir+h8cZipgfEYWxcjF4eQwANG
  ida52xkhnMtMEl3925khnL2MEnuO/WbpYuTkYBOQkrhx/z9QCweHiICexNV/oiBhZgEViRe/e
  9hBbGEBf4nrX7cwgtgsAqoSf7YdYwYp5xVwkvjYUA4SlhBQkJjy8D0ziM0p4Cyxfu52VhBbCK
  hk6tcZYK28AoISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYzYpTi8pSi3SN9ZKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAkM3pThRaAfjt96/eocYJTmYlER5dWV+JAvxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4H2lCJQTLEpNT61Iy8wBxhFMWoKDR0mElw2klbe4IDG3ODMdInWKUVFKnFdLGSghAJLIKM
  2Da4PF7iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwPlYCm8GTmlcBNfwW0mAlo8fc3X0A
  WlyQipKQamAoNZ5xOvPYjZnEKN5frB7n7gUt3sOdOOfuqV/XHxiuzeWflVN81mHr2tfC7qNxp
  8Rcvt92UiJ93/lmR2ImoScXC9/4W9Z2YdJjf8ng+94kwnVvX9F04uwzi1dhk/Hdc69sW4TszS
  OqtQKWOj8yrtelRstOUHdRW8YcnHF/YUBqzfkLk/3n8ycKvtt6fZ58R9Umt573Tv7sGUg7LTy
  wrD/9n4FN5Oih7k/G0n9VKXNevGRqyGAv45Ba8UG1i5Z56UqtfZm/OC53u3IsWltcEufYcEzh
  06aMwtxi72oq2pwd729JrtA0Cel28t0he0DpfpG24fV/O1KaomFaPZP+b7n+MtlRJ72k02yX4
  3LJYiaU4I9FQi7moOBEA3wLUs1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1677206719!185444!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15303 invoked from network); 24 Feb 2023 02:45:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:45:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5BB05151
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:19 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4FEA77B
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:45:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/4] bash: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:44:54 +0800
Message-ID: <1677206695-16822-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177651

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/bashbug conflicts between attempted installs of lib32-bash-bashbug-5.2.15-r0.armv7ahf_neon and bash-bashbug-5.2.15-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/bash/bash_5.2.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.15.bb b/meta/recipes-extended/bash/bash_5.2.15.bb
index f78f79fcc5..ce81496f52 100644
--- a/meta/recipes-extended/bash/bash_5.2.15.bb
+++ b/meta/recipes-extended/bash/bash_5.2.15.bb
@@ -20,3 +20,6 @@ DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 BBCLASSEXTEND = "nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-bashbug:${bindir}/bashbug"
-- 
2.34.1


