Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058D2ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:06:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.22894.1662368806756991996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ajOVajFn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368805; i=@fujitsu.com;
	bh=bDgofYjVENatvsCWSUZMRw4aTPOnHs4wRDeXJ4skfZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ajOVajFn7qsNPNHkQZ37scp3h8YHM2ImuhUFhK3rQ5vXDlHOFC/ysAHII6zJbzp5J
	 I2iUZV3idTa8EeSXP7bi5Y8kW5FIYnL3dVen67rWCK+f+DYBN0wz9Rm3/3HOcA/OUE
	 HXgvET2/4IyKOqbuo3oaaZ2d8e4Pw1LrS7uySSDqt9dwhSUcpM5B0KoLEPX4lkIwgO
	 70JB4+a/F8AUAHC7GDHY59oQR5N2bN/bQ/OgF6BJ2oCKoFmn5lU7jyjk/zPlageXc8
	 lNIUXBCvHIRhfL6pdg88Q3DfonYwd95LlnOlfQmCHmybCL6dpdzaV3JXZ3bNMjFDt8
	 YVplqv1BbZF2A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpKuyRzT
  Z4McXXYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePUwilMBQ84Kt7evc3UwNjM0cXIxSEk8IBR
  oqNjOROEc5lJon/7YnYIZzejxKL191i7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7h
  x0kLCzgKPF2kjlImAUo3D2njR3E5hVwkjjS9JcNxJYQUJCY8vA9M4jNKeAscefBLCYQWwioZu
  X+dawQ9YISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11TXWNjMz1Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECQzilmPXxDsY1fT/1DjFKcjApifK+nyOaLMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCd+UOoJxgUWp6akVaZg4wnmDSEhw8SiK8/uuA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEufdBDJDAKQoozQPbgQsti8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEublApnCk5l
  XArfpFdARTEBH2PUJgxxRkoiQkmpgUrqzkn9uooTRqqZ0iZc59S+WcX2zqdVMPP53eQy3wc4F
  YRNLNqtdLT69+9tyreU3njA4pz6Zs0dQb+fdf56qk2cc2GQ640JbaNSTkw21DzdeuZ9m8WK5u
  72LtmZm2QV/01kpZ878yT5tcUQr6Sd/So1S5PsIxf12RxQvT561K4/dMWGb288l57Oddjq6/j
  ocpzz/vbH66f/tBzs+6G4S4ZVxOyHl1bIiVp9zi3C6Ja88+5OilKlu1h8T/uZ5q+34r7o4Yet
  SV+trirezT0SlbtdwfDmd87Vl+pVn1ScNrn2RmHT1yKxCX4nq5fF17GYna8vil3092H2+sJh/
  sdnP6P2fj0w6PkPxgtap3/FT+JRYijMSDbWYi4oTAc7baytoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1662368804!134659!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32483 invoked from network); 5 Sep 2022 09:06:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:06:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 627F41B6
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 578401B5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:06:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.1.2 -> 7.1.3
Date: Mon, 5 Sep 2022 17:06:21 +0800
Message-ID: <1662368782-32326-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
References: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170308

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.1.2.bb => python3-pytest_7.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.1.2.bb => python3-pytest_7.1.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.2.bb b/meta/recipes-devtools/python/python3-pytest_7.1.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.1.2.bb
rename to meta/recipes-devtools/python/python3-pytest_7.1.3.bb
index c642d9a232..373f7f35fa 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "a06a0425453864a270bc45e71f783330a7428defb4230fb5e6a731fde06ecd45"
+SRC_URI[sha256sum] = "4f365fec2dff9c1162f834d9f18af1ba13062db0c708bf7b946f8a5c76180c39"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


