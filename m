Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4E9C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:29:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.5400.1670207371337049139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MLruZp1I;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207369; i=@fujitsu.com;
	bh=jxqsfY7E/nYT6jseB7ogWB3OtOrOn9UytTubUqT605Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MLruZp1IcUIiUFIkOSIFKCp51sMqwdMEi9KjPmkQuqwEaDhgxo2WrdGz01TpaZ0/A
	 Zb+WSAtILTjbDAxMjR1fgcQIAUZ6gewU5gwuBiKeDdJN+pJxR2O4zQJacVdIVWt8QT
	 iff4H+GNoEdTmLOFIh9gccSrJqZfEeL5Jj18uAOU7qcaXYU01enKYXaBs7ryvOrqu9
	 MihEpyTf8KCfkz8ldCftTMoTYEEEhp6IUuN4pZjVWr5p1tUF/fyQXHXwUHuwR/x11Z
	 i/4kY+uu/0IMZikRO3HBdNv/vmPRmiQ+wipyLfcXmMn6GgcZ66yAsxs0Cjn8G1i9v4
	 JR9CVW3VJ8RvQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpNsR3pt
  s0HxGzuLOz3fsDowe5zauYAxgjGLNzEvKr0hgzZj5ZDlbQS9XxfT9q5gbGL9wdDFycQgJPGCU
  OPd7NiuEc5lJYt3igywQzm5GiRvvlzB1MXJysAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgK3E5nW/2EBsFqD4pss/mUFsXgFHiUUb94LVSAgoSEx5+B4szingJPHwMkRcCKhmbd
  8PJoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbrmeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgcGbUpzwcwfjxmV/9A4xSnIwKYnyKj3qThbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  Rsd1pssJFiUmp5akZaZA4wkmLQEB4+SCK+QN1Cat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qV
  LivCogMwRAijJK8+BGwKL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXjdfoCk8mXklcJt
  eAR3BBHTERv4ukCNKEhFSUg1MnOaLV3FtvG2hIMVZvDxQe+K++rCoVVdk4pfaJvUtT3N99HFf
  dRS35HaD8vTiFC/f6HerbtUVsotIKs5PzLS78fH4mmjO5Y6PK5Xumu+zfHRhU0pO8xohC3Pfs
  LJIm9vykziV+48xaNrb3Zlw2aVKR9jjXcvkUtH5GxmnVt9R8X3HPMdFPorz9Y4fZYkxsyNdbU
  M8ensTL0T1nv6TnePDe20Ke3Uvk9769YaNG2Lm+/+1at/5ZO6cyXdFOH19321U7LvJcaOJNdO
  qWHl92JSfdvO2KlkVik/3UjFYYMv35keTWIizjk7YbO6wMAPG2watnJaTO2beeOi+qfXXNPvA
  +RWaFTk8AU0XWVUklFiKMxINtZiLihMBVgAdDWUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1670207368!129444!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25287 invoked from network); 5 Dec 2022 02:29:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:29:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F12C81AD
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E62A91AC
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:29:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] patchelf: upgrade 0.16.1 -> 0.17.0
Date: Mon, 5 Dec 2022 10:28:53 +0800
Message-ID: <1670207333-6986-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
References: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174265

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 fix pagesize on ia64
 write out replace sections in original order
 patchelf: correct page size for sparc64/sparc32
 update vendored elf file
 add workaround for readelf from binutils 2.30
 make objdump/objcopy/readelf configurable and respect cross-compiling
 build patchelf on windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../patchelf/{patchelf_0.16.1.bb => patchelf_0.17.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.16.1.bb => patchelf_0.17.0.bb} (90%)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.16.1.bb b/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
similarity index 90%
rename from meta/recipes-devtools/patchelf/patchelf_0.16.1.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
index 8ce9e99520..5faee923bf 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.16.1.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            "
-SRCREV = "438d23e29c73beb8f16e04efe2a91daa6819ef34"
+SRCREV = "ad0265668f12eff59027259345fed4b0f315336a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


