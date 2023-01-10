Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F59C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 03:31:32 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.95317.1673321485173804601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 19:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VkMnSEg7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673321483; i=@fujitsu.com;
	bh=KbcZINxglvKjvDmJgJ5O7etXcsUWvepVVNfuS0dapWU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VkMnSEg7atFEbRS9wcnUPhELQHjNMTs4UHUiaSjB5R7FwUVFC6nrUY4xstohVPIMd
	 l/VvCQRUVrQjwoLXA5fP1iZgd60qNqUO1g54BTCZ4+6rH+ordzz2x9mDDfAv75Ho6Z
	 2T5WiJ4keymtkEwVekq5i++OOsvKIw/wr7nO1dmhoiAiyl58LkAQY2Cc8xHA3Pj8NE
	 /UyzY789dPocwVX8Ahy+QmTe4+HNVIZEGLHbDCWoowevjyYsTuVMi3k6IpHtQGfMSA
	 leiKd+fysVmEg3Cl1gRBuUztJyyLrABeeMwoco7d/X0yLJs543MxL3LRNkzYR4XT3X
	 I7Z0Tcxwr3ZLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8OxWZfrzp5
  kg6XLRSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owDjSwFzzgqjr26z9rA+Ie9i5GTQ0jgPqPE
  8fUlXYxcQPZlJolpc7ayQDj7GCU27vnACFLFJqAhsXvqZeYuRg4OEQE9iav/REHCzAJqEkdf/
  mQGsYUFEiV6ZzUxgdgsAqoSt89cZgOxeQVcJX7u6QQbIyGgIDHl4XtmiLigxMmZT1gg5khIHH
  zxghmiRkni7aU9UPWVEq0ffrFA2GoSV89tYp7AyD8LSfssJO0LGJlWMZoWpxaVpRbpWuolFWW
  mZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZhSjHb7x2M55f9
  0TvEKMnBpCTKO3/PnmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryfbgHlBItS01Mr0jJzgDEBk
  5bg4FES4Z13HSjNW1yQmFucmQ6ROsWoKCXOGw3SJwCSyCjNg2uDxeElRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8EVeApvBk5pXATX8FtJgJaPGPqTtBFpckIqSkGpjmlQWZZHqGJswy8aj
  9ML+yL4rp3sKlbP98jmoaMv0pfSla2a3p8uKZejWnXXKfrKJlZq2r4D5nJvnExcd2/f955dvE
  11+leApcBMMEjK/0a4kvWMI1TZ/b4LF7rmL7n/N5+Yn7DgZteWU8dznfAYvwes0zZiad3///C
  Nfo2JvQGTXzqdNRrg07zJfXxEd514lGMmxwFwvavcGa6cUU/eMvSk8Ycfvxraq8nRFjd8OpIl
  smnOdlUf3edbk/bt9tOe738/3BnBlFfttU8zTTF2l935Xelp50a6pNqZGbcWttS0af6MuTH8V
  DGIR3/T7gFGL5/Ftppu01sQCTv29FTp/eJmSVMvXSW13m5FdVSizFGYmGWsxFxYkAMFhJLD4D
  AAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1673321482!404631!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17657 invoked from network); 10 Jan 2023 03:31:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 03:31:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F16FD7C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 03:31:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E5C9F73
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 03:31:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 03:31:20 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2] libpng: Enable NEON for aarch64 to enensure consistency with arm32.
Date: Tue, 10 Jan 2023 11:31:09 +0800
Message-ID: <1673321469-27718-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 03:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175704

NEON is enabled for aarch64 by default, so, to ensure consistency with
arm32, reference to libpng-1.6.38/configure, added
enable_hardware_optimizations option for aarch64.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.39.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index d9dcf37..a6c229f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -22,7 +22,9 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
+ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
+ARMNEON:aarch64 = "--enable-hardware-optimizations=on"
+EXTRA_OECONF += "${ARMNEON}"
 
 PACKAGES =+ "${PN}-tools"
 
-- 
1.8.3.1


