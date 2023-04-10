Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED23BC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:40:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.40270.1681119625512963656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=luWaV1ZM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119623; i=@fujitsu.com;
	bh=gpkYBwAJTblrk75FskvD58W4wuS77or39gzpWtboj1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=luWaV1ZMBj09c4Jc22iWV62iP8znqR8qh7hC6KBB+TfcfY10jacMlSgYic7daf7f5
	 48jZnDa1olAG7n6wlWQZn5lRzxVwmrJYZF6uAF3BG+CgBnuMrixQ+YSSgoaPA7DMgp
	 XwIH8xff6S1FBW3aS7D6QRtmdayoLxPteZRaYGD6y3TlwBQ+cEZba5ba/OxMJiIw7Q
	 hIX1skuRu9VrDv4fGF7IrMDJIwq59pMTDD45vRe6s20q/++vAo0imeVEcf3lK0et0/
	 4fU3Rf0GI04Mn1yVgXsH6bShCbw7ruwSIvf8IwTpSGBxeY+MRZ7ImKK/79xU8+sx39
	 wwMGYebmpJ11g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSbf9pnG
  KwdeTbBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aLHzvZCq5wVTT+m8vUwHiBs4uRi0NI4DGj
  xIbb+9kgnGtMEovmvgRyOIGcPYwSu3aagdhsAlISN+7/B4pzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFnCV+Hj6PiuIzSKgKvHkxQdmEJtXwEni9OPVYLaEgILElIfvwWxOAWeJpt2zmSBWOUl0vf
  zMClEvKHFy5hMWiPkSEgdfvIDqVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itGsOLWoLLVI11gvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwdFOKE4V2MH7r/at3iFGSg0lJlLeLyzhFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgQvw
  2WgnGBRanpqRVpmDjCOYNISHDxKIrwS14DSvMUFibnFmekQqVOMilLivBzngRICIImM0jy4Nl
  jsXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHvmItAUnsy8Erjpr4AWMwEt5nIxAFlckoi
  Qkmpg0pTdX53ZatNpVLTD3XQul9d7uc2fdU8xueXk7M76J5Luf/j+teT2rdpf0x5Py5W59i/6
  aFbfbdXJ3ottl9x83xzluuZd8fdP/Q0eIr8Cl6n+tPkl81hjqmrm5QdPGT/cfNP9kCVs13xHg
  41B7Knbu3JM1ihq1Z+xun44/8/21+JnY3+L8Pv0vDqmz3xFqC1T3uyskhkvY9BK27CX+xp+Ho
  99nzv5YYLWP3s5P/2tDr7nU/892spXdz1ZbvGtPcV2jW9iBI/sFF16+lvHxb6gtIBj+2cvPd/
  5LG/qM/fnn1eYbj0aLxdjrZ9tKasv/4RH8fvdr4meCzfN4Xm80GppZXZu+yHf/sdWARwKXzs1
  lViKMxINtZiLihMBLL1vqlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1681119622!474798!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28927 invoked from network); 10 Apr 2023 09:40:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:40:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8A66D100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:22 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7DF2D1000D5
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:40:21 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pathspec: upgrade 0.11.0 -> 0.11.1
Date: Mon, 10 Apr 2023 17:39:53 +0800
Message-ID: <1681119595-25279-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
References: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179880

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug fixes:
----------
    Issue #74: Include directory should override exclude file.

Improvements:
-------------
    Pull #75: Fix partially unknown PathLike type.
    Convert os.PathLike to a string properly using os.fspath.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathspec_0.11.0.bb => python3-pathspec_0.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.11.0.bb => python3-pathspec_0.11.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.11.0.bb b/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pathspec_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
index bf0dfbd728..f49bf080e9 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "64d338d4e0914e91c1792321e6907b5a593f1ab1851de7fc269557a21b30ebbc"
+SRC_URI[sha256sum] = "2798de800fa92780e33acca925945e9a19a133b715067cf165b8866c15a31687"
 
 inherit pypi setuptools3
 
-- 
2.34.1


