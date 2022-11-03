Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B345DC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 07:41:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.16802.1667461250226582805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 00:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bj6zCvI9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667461248; i=@fujitsu.com;
	bh=RODzANS/7or1joxADaXVl2iNKD4iYPHcWjR2/rRhxSU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bj6zCvI94W3CW/axZ1QfBtE4IkCwyGwdjRhEUOWqI+oeWyFo0xqtNT+1eyOthkfHV
	 xcyAOhIMI/QaIQI295Ny8dmSjjcsuoCSIZNYo4oLAwfbMfpFrfPgFZaiHAsfdt5wDa
	 pIW8APlcpT5X7ZGqgNIVXGM0iksjBnJJD7/JXYO1j5f2vU/N/5ZdxTVp+itZ5qiX1B
	 KcWkQKpX1lQDN5LP8+bJ0khKX3UTG5esN666N1pyp82HbIh8R2EhhHyVs2tM+jbjMo
	 tfNtVSdsFfoZIHRdz2A6OLhl4yYlKzjttZkJnjyHwG3kLg45IZd6VcwMb27WqBa6Ir
	 ia3ya5iZYEPTw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8OxWbe+IDn
  ZYN1rNYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPXlivMBTNFKrrnXmJqYHwl2MXIxSEkcJ9R
  Yl7DKnYI5xKTxKbFbawQzm5GifX/Glm6GDk52ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwE1i65VlYOUsQPErz/4wgdi8Ak4S52+dYgSxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWhenFpUllqka2iol1S
  UmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGI4pxanmOxi/
  L/ujd4hRkoNJSZTXKjI5WYgvKT+lMiOxOCO+qDQntfgQowwHh5IE76NcoJxgUWp6akVaZg4wN
  mDSEhw8SiK8TtlAad7igsTc4sx0iNQpRmOOq1eu7GXmmPm17QCzEEtefl6qlDjvhnygUgGQ0o
  zSPLhBsJi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY92gO0BSezLwSuH2vgE5hAjplW3U
  SyCkliQgpqQamrEvzf28099W/atHP4hihu2O37En+3vL7XEF512azckwyzG2PWPX5P+/6Txvs
  q0ouvLVt1/riGmysfPly4oly5y7zL2u9ZGWOJRxOE+hi92+ct+lDfF1Ixn3j4Mx6+4NBH8KOO
  Oy0O5WzbaVUxgL7C8opt4UiN6hdX/T+VPeNXqbuefZHwqak1L6PzirNniM6Y2JdstLbBZm6nN
  N/y62aefynqkvMsylR0mZb2ncZBazV2qau+XD93wLePw8v/wxnmP9km+CEaVtfH7Vd96Hu/fd
  1X9pL406KOaeIll4UDLSNsH77RlHh0AqrCdVW6+9v+37oRZFoTuyLkG0fm5+KSx+SVGAtOzL5
  /vq3of9zlFiKMxINtZiLihMB4HgVH1QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-745.messagelabs.com!1667461247!157813!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24203 invoked from network); 3 Nov 2022 07:40:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 07:40:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 247427B
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 07:40:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 17ECB73
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 07:40:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 07:40:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] libxcrypt: upgrade 4.4.28 -> 4.4.30
Date: Thu, 3 Nov 2022 15:40:31 +0800
Message-ID: <1667461231-29031-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172613

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* configure: Restore ucontext api functionality check.
  In c3f01c72b303cbbb0cc8983120677edee2f3fa4b the use of the ucontext api
  in the main program was removed, and with it the configure check for it.
  However, the ucontext api is still used in the "explicit_bzero" test and
  thus this test still needs to be in place.
  See also: https://bugs.gentoo.org/838172
* configure: Restore the functionality of the '--disable-symvers' switch.
  Without this fix the build was simply broken, if symbol versioning was
  disabled for any reason, e.g. whether the compiler nor the linker
  supporting it, or if disabled on purpose by the user (issue #142).
* Fix variable name in crypt(3) for a datamember of 'struct crypt_data'
  (issue #153).
* Add glibc-on-loongarch-lp64 (Loongson LA464 / LA664) entry to
  libcrypt.minver.  This was added in GNU libc 2.36.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 39ba2636ff..2bdedcba6d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "50cf2b6dd4fdf04309445f2eec8de7051d953abf"
+SRCREV = "fee2687bad66e351a3dcc963a34ae80125923ff8"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
-- 
2.25.1


