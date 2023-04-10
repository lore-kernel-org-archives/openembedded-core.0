Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172CCC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:37:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.40231.1681119458272167107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mYLlKcH6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119456; i=@fujitsu.com;
	bh=8SuDFaNbT5gK6txcKgPXvOf8aEo6MBIsf3TyN8koPFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mYLlKcH62fzXU0ZjQBZFarTXMCfaSqJNeAJsUrpYjkMZonxCToWstFFQ6wbHZSkZh
	 Z6zdt1L+ktr6S9j3NsKj66z+qG9BJ0812n91aF/8ad3bBZENSsEja3iTmE04hD8RdV
	 +QK/4e+ywIOkLq3e7g6FqLFwGGiy9+9SeW23XZHyPA0tHYiyy6fzACvrWKbgBgtRJn
	 UMeGI47sWJSPys+DtCXK/D1wvkpylnXtIpB4Gc/Sr7f6Co2tlKkCMtnQVCMo6bBp9P
	 9KpxqppYWISXAdA8UMdEWvrFRI77hhBvIcFDtmrIJdwOzRihcM4xBJNeMmiLScJ354
	 Mk/QEGe9kTGFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSffBDeM
  Ug+uL+Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1ow1Nx+xFvTxVmxrOsLWwHiHu4uRk0NI4DGj
  xNcLhV2MXED2NSaJNRtWMEM4exgl/m/cxwRSxSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAq4SUzfMYQGxWQRUJSZ8WcsIYvMKOEnMu/kcbIyEgILElIfvmUFsTgFnia6GRjaII5
  wkOg7eZIKoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/BDVTTeLquU3MExgFZyFpn4W
  kfQEj0ypGs+LUorLUIl1DY72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src
  5JwUvbzUkk2MwNBNKVZv3cH4s++v3iFGSQ4mJVHeLi7jFCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvAyXgXKCRanpqRVpmTnAOIJJS3DwKInwSlwDSvMWFyTmFmemQ6ROMSpKifNynAdKCIAkMk
  rz4NpgsXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvmYtAU3gy80rgpr8CWswEtJjLxQB
  kcUkiQkqqgWlHSBC/kcy6a9uM3shzzOCR0Hy4yzN475Zfr+fM2XH13ncVm/evP2c/2lKZ0uqw
  rkPbsbaB4czFyXf2bp1Xs2bBwS3f+pIvKsootMRzM9bvm+22K40h4y3L9wyuc2pygR2v1UXC1
  bQOt59VWNhe4x7WotgoyTB37xqBn77cxQ4nd+T/qt0mejV8iZV1XcDaad+dTxUFGJ7cMSvY1j
  j2567PeSfZGpjCGjcFWaj9XqbrdjBW3GC31vG2RS9Mjmx3SHqbkLbBdcMjs8n/J5WKlNRevLU
  u5erXK4W3Jb2UTx6p+hATFJP2IOST0pqTX1y8N/9J97NL+inZ/aBl/fO43Hq25Y3rm2Yt0pHN
  PC13mEuJpTgj0VCLuag4EQDz8uyzWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1681119456!197502!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23329 invoked from network); 10 Apr 2023 09:37:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:37:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E70BE100329
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:35 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DA205100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:37:34 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.33 -> 0.29.34
Date: Mon, 10 Apr 2023 17:37:17 +0800
Message-ID: <1681119440-25219-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179874

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed
==========
- A refence leak of the for-loop list/tuple iterable was resolved if the
  for-loop's else: branch executes a break for an outer loop.
- Some C compile failures in CPython 3.12 were resolved.
- Some old usages of the deprecated Python imp module were replaced with importlib.
- Some issues with depfile generation were resolved.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.33.bb => python3-cython_0.29.34.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.33.bb => python3-cython_0.29.34.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 30d1b39467..2b778493cd 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a"
+SRC_URI[sha256sum] = "1909688f5d7b521a60c396d20bba9e47a1b2d2784bfb085401e1e1e7d29a29a8"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.33.bb b/meta/recipes-devtools/python/python3-cython_0.29.34.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.33.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.34.bb
-- 
2.34.1


