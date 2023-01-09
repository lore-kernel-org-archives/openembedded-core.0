Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32815C61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:20:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.64543.1673241643821385307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lLsZiet8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241642; i=@fujitsu.com;
	bh=wHqPUGavXaxamEcRL5ucvgmme9CrCcJFWb033XdOEJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lLsZiet8hAjAZemzZkBCR/WL6nSwHH0GlryXdNADwA6OCtzee4ZzfI2uvMqmF+7Ro
	 8dtfrYMCpxpbaPmjTB5q54n0rA3ABJMNj4iWQThD4FZjVdwb3QZ7dA1xDH1ry4+u71
	 h49aNqM3ZiUc17OQQMNtutDYbYIRcoqVKN3+3IErsWUMk8I+LF5z0H451MBRe8dciH
	 61VgEu51ogg6qL0dHEfgsHQQyDk3uRBIa8hSaZX1gIO8AE5TVNg4sBjhD719jM8V54
	 XXjBsRM5qW9MOTxrooo6x2tTY0qYM3kl/HQlxLXuGfwvGdfBMhMNbto6e3Ua05NCqj
	 e5sLZzXsUKU+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSVdzye5
  kg+/r+Szu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyXi26zFNwQqZjzaSF7A+MTwS5GLg4hgceM
  EucmT2GCcK4zSWyZOhvK2cMocf3QFrYuRk4ONgEpiRv3/wPZHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQVsJQ5e/84KYrMAxVv3TAOzeQWcJFbvuMwEYksIKEhMefieGcTmFHCW6GtZDRYXAqrZ93
  oaE0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXTO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL28
  1JJNjMDQTSlWureDcdqyP3qHGCU5mJREeTmqdiUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCdv
  XB3spBgUWp6akVaZg4wjmDSEhw8SiK8XDOB0rzFBYm5xZnpEKlTjLocaxsO7GUWYsnLz0uVEu
  d9vQioSACkKKM0D24ELKYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlZgHNIUnM68EbtM
  roCOYgI74MXUnyBEliQgpqQamOytjpS82Zj163BZn9e66jh2/9Z1X0XlrWS9YnJ2zgMVZv/we
  16wpie/uh4lUyMs8cNxytC/2XoK2seWth0Fek7LbVd/WpH2fdPeGyVteThHd5wmfLxWLdifcl
  z56uCTgxF5Ly0fNlQEM3rFlFcU13w2108vzyuJ6HzQ/j173zljEfdbcF/sOP5m7Jodfe+1yNw
  v/D0JC3d8cKqeUKu+Tmqi0SyfohRx7QdaHYrvLhSlfpxZ1bSootWCdH3B+yrL81tVxlaqf3yf
  LTey/Vt2kHwJMAis4kv+vsl91/s9Kpt95WpbOrZv5/E8Zc79ZrcV4bMX7VbcZI5ffOF6fEcoc
  GHLeY3eQAv+SP2tXZymxFGckGmoxFxUnAgDm8jwKZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1673241641!321430!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21545 invoked from network); 9 Jan 2023 05:20:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:20:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E90A11000FB
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DCE351000DC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:20:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] rxvt-unicode: upgrade 9.30 -> 9.31
Date: Mon, 9 Jan 2023 13:20:21 +0800
Message-ID: <1673241622-29031-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
References: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175665

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- implement a fix for CVE-2022-4170 (reported and analyzed by David Leadbeater).
  While present in version 9.30, it should not be exploitable. It is exploitable
  in versions 9.25 and 9.26, at least, and allows anybody controlling output to
  the terminal to execute arbitrary code in the urxvt process.
- the background extension no longer requires off focus fading support
  to be compiled in.
- the confirm-paste extension now offers a choice betwene pasting the original
  or a sanitized version, and also frees up memory used to store the paste text
  immediately.
- fix compiling without frills.
- fix rewrapMode: never.
- fix regression that caused urxvt to no longer emit responses
  to OSC color queries other than OSC 4 ones.
- fix regression that caused urxvt to no longer process OSC 705.
- restore CENTURY to be 1900 to "improve" year parsing in urclock (or at
  least go back to the old interpretation) (based on an analysis
  by Tommy Pettersson).
- exec_async (used e.g. by the matcher extension to spawn processes) now
  sets the URXVT_EXT_WINDOWID variable to the window id of the terminal.
- implement -fps option/refreshRate resource to change the default 60 Hz
  maximum refresh limiter. I always wanted an fps option, but had to
  wait for a user requesting it.
- new clickthrough extension.
- perl now also requires Xext.
- X region and shape extension functionality has been exposed to perl
  extensions.
- RENDER extension no longer depends on ENABLE_XIM_ONTHESPOT.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rxvt-unicode/{rxvt-unicode_9.30.bb => rxvt-unicode_9.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.30.bb => rxvt-unicode_9.31.bb} (71%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb
similarity index 71%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb
index 5e3c84194a..c127b9bbe3 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb
@@ -4,5 +4,5 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI[sha256sum] = "fe1c93d12f385876457a989fc3ae05c0915d2692efc59289d0f70fabe5b44d2d"
+SRC_URI[sha256sum] = "aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8"
 
-- 
2.25.1


