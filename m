Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B0C6FA99
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 01:41:16 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.12612.1678239671554989032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 17:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MSufP99U;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678239669; i=@fujitsu.com;
	bh=bVB+/njmM/zakfUfP1B0nij2aytuKmjQbmn05AttZHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MSufP99UGhZ1ftPX388LMjEtvk1i0FRgEKN+mAF+X1Egk9GqyQdanVn9XxqnojdPT
	 rYcPXVWefINwEJgpk1SBXoKU3q2abLTQXuw7UFgWCDHhdWU1lcA1uUjWttyEVCtzcz
	 65RY4Z5KIqOgakS8qnlbjz6zMRyQ/5PEo8zP3y50Le2EzDXwcjrGG16qnRVTkCUh1d
	 5sHA1ZwSIzeEYqzi1NkgLWxFWxMMppDHFK9G6klvTD3rZqZBRjRIzX3orMFjUzouY5
	 td1R7rD/VMaNphCPAqkKyVamdKr2BVs52vqJ3leIh+mO//tgbrQ+wYKeB+31wWZ5n+
	 0GYcZS+OAM7dg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpLv1OXu
  Kwf/jnBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bF7p/sBVv4KuZfCmpgbOXtYuTiEBJ4wCjx
  Z9lhFgjnMpPE5Oa/7BDOHkaJCUufsXUxcnKwCUhJ3Lj/H8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLBAksffLWyYQmwUovuNiCwuIzSvgJHF95nGwuISAgsSUh++ZQWxOAWeJuXuPg40XAqp51z
  sBql5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo2lxalFZapGuoV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxCVAmsbxYL7W4WK+4Mjc5J0UvL7Vk
  EyMwcFOKWZh3MB7u+at3iFGSg0lJlHffEfYUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8Pg+Bc
  oJFqempFWmZOcAogklLcPAoifBuBmnlLS5IzC3OTIdInWJUlBLn3fwUKCEAksgozYNrg0XuJU
  ZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvAr3gabwZOaVwE1/BbSYCWjxhf0sIItLEhFSUg1
  M/OauFwuqju1Mc5H7eOfzG8FjYrwTPrFN1iru2+mjc/avoZT0Oe7qp5/LdaR7dzfv+Xsp8XwU
  j3hUrmv+V7ba/YVJEdI/Zp4p/ByuvjCi7Fxh0VeJxOUrhQ8v0Onp+BrWd23HuWVb9q/aap8pL
  NM2yXtOy7k5CenvnU9yaP/KtXy4eGXakmouebEdiq6yJU17L13ZljHh3MpvTw172X+9/PNlv8
  +2+ct7PwpJXVawPKBld/9ffNXleOtZ05iXtvJpZ52sfaH0enm2uWluXbbH55j9tyfMsznT0m2
  hsLq2W2PNPpfzxTu8J4R+c3x8/aFWW2zgFd7Em/zZU8TdTUt29H9XtO0xjK/dNGl9uqedEktx
  RqKhFnNRcSIAUerrJ1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1678239668!411584!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6922 invoked from network); 8 Mar 2023 01:41:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 01:41:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BDDB91AD
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:41:08 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B25837B
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:41:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 01:41:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2 5/5] bash: Fix install conflict when enable multilib.
Date: Wed, 8 Mar 2023 09:40:19 +0800
Message-ID: <1678239619-21210-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178151

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/bashbug conflicts between attempted installs of lib32-bash-bashbug-5.2.15-r0.armv7ahf_neon and bash-bashbug-5.2.15-r0.aarch64

The differences between the two files are as follows:
@@ -26,14 +26,14 @@
 # configuration section:
 #      these variables are filled in by the make target in Makefile
 #
-MACHINE="aarch64"
-OS="linux-gnu"
-CC="aarch64-poky-linux-gcc  -mcpu=cortex-a57 -march=armv8-a+crc -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security "
+MACHINE="arm"
+OS="linux-gnueabi"
+CC="arm-pokymllib32-linux-gnueabi-gcc  -march=armv7-a -mfpu=neon -mfloat-abi=hard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security "
 CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types  -DNON_INTERACTIVE_LOGIN_SHELLS -DHEREDOC_PIPESIZE=65536 -DBRACKETED_PASTE_DEFAULT=0"
 RELEASE="5.2"
 PATCHLEVEL="15"
 RELSTATUS="release"
-MACHTYPE="aarch64-poky-linux-gnu"
+MACHTYPE="arm-pokymllib32-linux-gnueabi"

 PATH=/bin:/usr/bin:/usr/local/bin:$PATH
 export PATH

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


