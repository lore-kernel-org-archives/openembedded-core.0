Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3DBC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:57:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.48476.1681714623417221156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J7Nojcwf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714621; i=@fujitsu.com;
	bh=Y5LUYsMRaJrvgtLEwLfW/N7iylEAmbFjNBrJv4ukulQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J7Nojcwfkyi87wCApaCbBxE3UpcM/db/obWmRAvmh1wcTVA2smA9g4oaBAXyLEf/k
	 EY2Sk4SXEwcX54KPgX/U11Cjr/kQxaJiMb3FNMV1nk8VaziaLYwr4+sPg51DgFvgO2
	 0JImM/hjJfnSrO4Ed+S3qZWESfjthcwtZ4ZbsoNqNM/W5Qq0GNlYjnhkMiReGlpKsu
	 8+sCiC+XmVk7CMHI3Sp+9hfhSuyxcBeDqpY3jaqLPw6j2BThkFazqY15j7NLe3pVIQ
	 VuzVLLirv7P0y2xd1DcCw632NQ/rYM+1bjKjT+Xo/bF1PDuCpZFYwpE2UCavuVJOxD
	 2Kxv+Te4ABYxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLv3rU2
  Kwd7dTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bkrmVsBef5Kxq/T2dsYJzN28XIxSEk8IBR
  4s+KLiYI5wqTxIV7l9khnL2MEldv7mHuYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQcLCAo4S0z8FgYRZBFQlWhZNZQexeQWcJBYs/Q1mSwgoSEx5+B5sIqeAs8Se78+YQGwhoJ
  qWt1eh6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhenFpWlFukamuglFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0px4vEdjK/6/uodYpTkYFIS5X2Rap0ixJeUn1KZkVicEV9UmpNafIhRhoNDS
  YK34bVNipBgUWp6akVaZg4wkmDSEhw8SiK8xs+A0rzFBYm5xZnpEKlTjIpS4rz1b4ASAiCJjN
  I8uDZY9F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx77QXQFJ7MvBK46a+AFjMBLZZTAlt
  ckoiQkmpgOnzu9WLh8wYf+F75X5xd/Cb0/NT2Wz/41k5e0TX//JIDFQnPXdVmLL2/p/mdtZL4
  x0mT/kx7WG5yrOl36jWdl66MibLMnrF9DpIp7yf91VE8mH1+beE1y933mDZvvW+qH768aUf6y
  qDI43dfxQZK3+aYYNIRV/Z18fqtKiGLjWcVbD2slNDnq3CkbYbh5ysVLp8+syUtN+j/HnRf/4
  zea0am8NsMRTZpVlMDJmovX3mAYcKFtwum7ueSnbRUgXW2W4et29tLM1fGlzIKxMff8WiZlx1
  w5XxwTUzH7EsP/KbFicb0TeFdrfpgx+X03vJX7AIfyqxcre1WFme+lzkUqp25NGHl/bsWEW03
  J/+b3KjEUpyRaKjFXFScCAAsiRBpWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1681714620!104763!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4774 invoked from network); 17 Apr 2023 06:57:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:57:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 779F01B5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:57:00 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6BDC41AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:57:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:56:58 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.29 -> 1.4.30
Date: Mon, 17 Apr 2023 14:56:33 +0800
Message-ID: <1681714595-18749-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
References: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180138

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Update snap build to use freerdp 2.9.0
    Add text mime type formats to RDP clibpoard
    Ensure timer is null after destruction
    Ability to view passwords in the clear using a toggle in the password field
    Made icons viewable in lower resulution.
    Improve mime file
    [REM-2809] Appearance preferences now refresh in the main window when the user...
    This should be a message instead of a info print. So that the user can see it by default.
    remmina_rdp_monitor_get(): fix maxw, maxh and monitorids calculation
    Fix undefined symbol error when importing gi in a python extension
    make it build on macOS
    Fix autostart file flatpak exec command
    [REM-1987] allow for dynamic resolution updates for vnc connections
    Fix overlapping text in preferences menu, terminal tab
    Allow could not authenticate banner to go away after successful reauthentication
    Add environments for easy manual testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.29.bb => remmina_1.4.30.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.29.bb => remmina_1.4.30.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.29.bb b/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.29.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.30.bb
index a92a3b278..c22eaf1d3 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.29.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "fb19eb5f11f206ffb442a9e0c519cb0f2cb3fd8b"
+SRCREV = "61ea9b6681104cadf0a3f8c25bd3e5685ee6691a"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


