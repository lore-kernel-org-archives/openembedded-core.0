Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607C3C636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:35:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.5822.1676536554978100076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=TXKFjo6v;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536553; i=@fujitsu.com;
	bh=aFsCWjuNQnJyQBFl3VXqE7NevmnjKISBOx90CiMxgxs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=TXKFjo6vN1iDmB9ndepmQKol8J2Hsd1Uhqds3rSPJ4sB4EuYf3UzH5CauJK5Ma26J
	 I4kvV3mHGHijCWj/KQCA57W9HSTt6a5fwOcVZjkzhR6jL59NKuoKb6LF+du4Drehl/
	 8jb/lhT+2xzEROUF/KWc4FUdK/2z90COAe4vwN/wHlINSTux/6db+cyCDKEoPepKen
	 dnO2wH2JRUHSglZYlibft/51qlkvTNnRRCgacZo4tIbVMHHpMuO96IVhjYCegU13q/
	 FbEuipEvY9nZ11RaEdWGmxpSHy5tmRCcAkX16IfkA97H6IXj6vJSaXuSZnmygewlvM
	 1pVA7PocNmZLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORpPvi1dt
  kg+5jqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bz0jbmgq8SFWfnX2JrYFwh1sXIxSEk8IBR
  YvKzbmYI5wqTxPsTb4EcTiBnL6PE/y+RIDabgJTEjfv/2boYOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwuYSczr/MYEYrMIqEr0XmtnA7F5BZwkmtdPA6uREFCQmPLwPTNEXFDi5MwnLBBzNCVat/
  9mh7DlJZq3zmaGqFeUmH25mQXCrpRo/fALylaTuHpuE/MERoFZSEbNQjJqFpJRCxiZVzGaF6c
  WlaUW6Roa6SUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxi
  BAZvSnGa2w7G331/9Q4xSnIwKYnyFuu+TRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwTv9JVBOs
  Cg1PbUiLTMHGEkwaQkOHiURXsErQGne4oLE3OLMdIjUKUZLjg+Hruxl5rh6BUTuvwYkhVjy8v
  NSpcR5u0HmCYA0ZJTmwY2DRfslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK81sDUIcSTmVc
  Ct/UV0EFMQActYAY7qCQRISXVwGRjNe2Ll5L4uSls151lrNd65iaZ+3/drHi4lrPN41PmpB28
  1c/fP7vFkOzTeN1Zu10h5EfHvNaA398rIvffVWdjSpy5a87NJ6EPew6sXOGmrWHy4v92oWtcF
  1R11W/dj5p/bl0ryyLuVtO5rAV6p37cPS4hnrLc5IjOZp59pqYFG+vctk46ofh6vaB09i+uXP
  1A3lVLfHikNxjvOvVFonBadN+u3tPJnE+upR66/aZjX9hMqzNCi5u39J016+q/yX1YysBlotD
  MjL2zNcRfpGyLvDG/xNP8n9vXhhRrtfcWsxO8K4ylKi89sLFfW+oV7ztTeeYDgSuyQl+v3fmz
  5HzVqwOs3zZX3Z2veifa5acSS3FGoqEWc1FxIgDp1d7McQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1676536552!89860!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21167 invoked from network); 16 Feb 2023 08:35:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:35:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E43A81B6
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:51 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D87F41B2
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:35:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dtc: upgrade 1.6.1 -> 1.7.0
Date: Thu, 16 Feb 2023 16:35:39 +0800
Message-ID: <1676536540-14583-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177276

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
removed sinct it's included in 1.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tdump-fix-Werror-int-to-pointer-cast.patch | 40 -------------------
 .../dtc/{dtc_1.6.1.bb =3D> dtc_1.7.0.bb}        |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
 rename meta/recipes-kernel/dtc/{dtc_1.6.1.bb =3D> dtc_1.7.0.bb} (89%)

diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
deleted file mode 100644
index 4c3e34b1ff..0000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Fix the build of fdtdump with mingw.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ae0ce1fa7f4d679b5f8df1fc0e797246e43547fe Mon Sep 17 00:00:00 2001
-From: =3D=3FUTF-8=3Fq=3FMarc-Andr=3DC3=3DA9=3D20Lureau=3F=3D <marcandre.lureau@redhat.com>
-Date: Wed, 25 Aug 2021 16:13:50 +0400
-Subject: [PATCH] fdtdump: fix -Werror=3Dint-to-pointer-cast
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-With mingw64-gcc, the compiler complains with various warnings:
-error: cast from pointer to integer of different size [-Werror=3Dpointer-to-int-cast]
-
-Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210825121350.213551-1-marcandre.lureau@redhat.com>
-Acked-by: Rob Herring <robh@kernel.org>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
----
- fdtdump.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fdtdump.c b/fdtdump.c
-index d9fb374..483f367 100644
---- a/fdtdump.c
-+++ b/fdtdump.c
-@@ -21,7 +21,7 @@
- #define MAX_VERSION 17
- 
- #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
--#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
-+#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
- #define GET_CELL(p)	(p +=3D 4, *((const fdt32_t *)(p-4)))
- 
- static const char *tagname(uint32_t tag)
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
similarity index 89%
rename from meta/recipes-kernel/dtc/dtc_1.6.1.bb
rename to meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 2a6ac089a3..0fc3eca002 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -7,9 +7,8 @@ LICENSE =3D "GPL-2.0-only | BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
                     file://libfdt/libfdt.h;beginline=3D4;endline=3D7;md5=3D05bb357cfb75cae7d2b01d2ee8d76407"
 
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmaster \
-           file://0001-fdtdump-fix-Werror-int-to-pointer-cast.patch"
-SRCREV =3D "b6910bec11614980a21e46fbccc35934b671bd81"
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain" 
+SRCREV =3D "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(=3FP<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


