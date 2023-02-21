Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468D4C64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:20:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.39295.1676974827709347549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j6osdiW7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974826; i=@fujitsu.com;
	bh=7sA7sn4G1zGN8URvsdv0sZE0TFAj4en1CPFVAow7FKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j6osdiW7QhirsvA9vBjlcGqiCv2kCTTd40OORAwlO43JYngDf/YiWulEY7gJlP2Nn
	 vleUkGPBBUVBxBLp784RH7lf3O0whIILjF1gVKN8cZU9w0tfbx804m846EkKJVGNUc
	 xp8hkXiK3DvpUnw9CAvNvXnLSyHBUTQ7V/AJAUfuYMQxMFDo6upaWYAklmkRHEL4XA
	 lykyYcMarCL8bRpclV98QdxItJQCu3CVYVrJi0hFrQCv2jsgdmoQE/UbgPcKrnySdr
	 cIGsIvVCBT5RXcqLDYoNAdjQyXVh5pianJd7I8h2B2grdB+BU3lFtPrMXrfkQiNtmZ
	 cP4s8OT+0XzWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWfflrC/
  JBsfvGVvc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBlPD6xmKZjMWXHwsW8D4yaOLkYuDiGBB4wS
  ++7+YoVwLjNJfJw6mQ3C2csosXrDJKYuRk4ONgEpiRv3/wMlODhEBPQkrv4TBQkzC6hIvPjdw
  w5iCws4ShycvocVxGYRUJU41XAPzOYVcJJo+DkPzJYQUJCY8vA9M4jNKeAs8XHCIbC4EFDNyZ
  NL2SDqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFqcWlaUW6RrqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgQGbkqx8sQdjCt6/+odYpTkYFIS5f126nOyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQlev
  +lfkoUEi1LTUyvSMnOAUQSTluDgURLhresCSvMWFyTmFmemQ6ROMSpKifPWzgRKCIAkMkrz4N
  pgkXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvFGAaEOLJzCuBm/4KaDET0GL3Hx9AFpc
  kIqSkGpgyqn6sb+tatt3nhGWXR+0Z/3DxuS8Zl7eUX2Dyn9t4U/ut1Yr7HSIbtI8pPLhp675K
  98nZFK+IbVuvJjFzOrSlyqbfaWFsf3zFRqdO8tOKPL9420OGd464xi/gEDFwOr10d7YEQ6ioG
  0dE/bXzTzWd91i83DOX6VEVvxlj8WKfkKr6bqt/AnfOmWXOu5p8cm1yTU7N5P+e8y7dM1u4WJ
  JXK+9yd7DVMbtDujZs9lrxrnH5K1cs/MPGv/SnxZlTPjt+n/3zd5INP9vc8u2qbZOfKhpL5x9
  mZDTLruUq2Vz9ZyHLS5tVjCfTOprlI/vlO/Q5Dl5onPnvrvHTu9OqXiZdUj9Qo6ujrraogv/Q
  NCWW4oxEQy3mouJEAJXXOxxXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1676974825!85439!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15792 invoked from network); 21 Feb 2023 10:20:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:20:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6C452142
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:25 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5F0C57B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:20:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.13.0 -> 3.14.0
Date: Tue, 21 Feb 2023 18:19:59 +0800
Message-ID: <1676974800-24948-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676974800-24948-1-git-send-email-wangmy@fujitsu.com>
References: <1676974800-24948-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177488

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Minor cleanup in tests, including #93.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.13.0.bb => python3-zipp_3.14.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.13.0.bb => python3-zipp_3.14.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.13.0.bb b/meta/recipes-devtools/python/python3-zipp_3.14.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.13.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.14.0.bb
index 8df5d4637b..dc5091f6c7 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "23f70e964bc11a34cef175bc90ba2914e1e4545ea1e3e2f67c079671883f9cb6"
+SRC_URI[sha256sum] = "9e5421e176ef5ab4c0ad896624e87a7b2f07aca746c9b2aa305952800cb8eecb"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


