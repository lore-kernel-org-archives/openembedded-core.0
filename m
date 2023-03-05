Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEBFC61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:07:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.5248.1678003629783795117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ixXZGSJx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003628; i=@fujitsu.com;
	bh=L8KpHw+34Pct5AscFDK8tAO5tDdg597qhFLBrj5RVys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ixXZGSJxpU/s5vZzj6T09DOl2ZzB3XRKqsTf1NUDpDtOTdfjlfL46WyLl9vIbtv32
	 0N0gXzWDvc3BnZDxQwZismifkOvvBVzL6m8CteajJNathf2oKQM/GqkWK/LPlVJ+5a
	 DYOlcWhPbYe0nh4AhJT7Yh98oAbptOudxPaHB8t9cR7F45dwquiVPxxIofLl/3C94H
	 H/GWh5JwMdoPY2khURnhRsmTw0kh/i1QHAOeDbKwu8nzMcurs/icD6XPLx7xAvxl5Q
	 eCJPNXPxea+vUZr0I3BcIlhwnDPfBpq78vOCiSL6w2MUvU7n0kiuMy+2hfl6w9k16E
	 L6zepV7fIHq0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSXe1L0u
  Kwex9XBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bHq09MBT0cFatnv2BpYNzE3sXIxSEk8JhR
  4vCFOSxdjJxAznUmic29yRCJPYwSPb9uMYMk2ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwEFi58J2dpASFqB4RwMnSJhXwEni9qF9TCC2hICCxJSH78Emcgo4S/Qt+8sMsdZJ4v
  LDbWwQ9YISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYTYtTi8pSi3TN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzalmOndDsblfX/1DjFKcjApifIG/mJOEeJLyk+pzEgszogvKs1JLT7EKMPBoSTB+
  9SNJUVIsCg1PbUiLTMHGEMwaQkOHiUR3oeeQGne4oLE3OLMdIjUKUZFKXHeLd5ACQGQREZpHl
  wbLG4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdfIAmsKTmVcCN/0V0GImoMUapxlAFpc
  kIqSkGpjOT9pyv/Xr0dftpUcKizZbr2bJVGH/sVH5fMC5LwJtR4PvN1zWZdZbx2gfUrhK5UpI
  RFrqqSWzenpbJpz4vkzQ059rbXyHROT+937XZ+REqnEUvW/7c9lYKflE3qRVS57s3b57353ZT
  VuWbn3AZflkh9Cy6ZaiUaaCCglh3Kv2TTVhO5e0/MLRg8t8nN92yMTMMpxkEv3a4smjPTUS9U
  IHCy7wV9WFfG69YO2lJiO141DmbsFPCc3PJPvTWjsMHrpUnu0Qrpf1WvbVNCrYschYm2mxe0I
  Dg8/Rtrbt93nfmsfF2U7YxiQld+nKeckDoq2nHm5e1+E111mHdedmhk7tHhevJau0n8RzJV+1
  dVdiKc5INNRiLipOBAD3yI1NVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1678003626!188187!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32471 invoked from network); 5 Mar 2023 08:07:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:07:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C58581000EE
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:06 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B72B61000E7
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:07:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.30 -> 3.1.31
Date: Sun, 5 Mar 2023 16:06:42 +0800
Message-ID: <1678003602-30550-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
References: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178037

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.30.bb => python3-git_3.1.31.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.30.bb => python3-git_3.1.31.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.30.bb b/meta/recipes-devtools/python/python3-git_3.1.31.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.30.bb
rename to meta/recipes-devtools/python/python3-git_3.1.31.bb
index 80f50019b1..08b9f66bcb 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.30.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.31.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "769c2d83e13f5d938b7688479da374c4e3d49f71549aaf462b646db9602ea6f8"
+SRC_URI[sha256sum] = "8ce3bcf69adfdf7c7d503e78fd3b1c492af782d58893b650adb2ac8912ddd573"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


