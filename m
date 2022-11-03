Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA80C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:33:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.15932.1667453587154503013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WO77jyhk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453585; i=@fujitsu.com;
	bh=5bpfDAPxKJjwFQe8Sr4V3m7M6Crn/gM4l6OtB14PYlM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WO77jyhktWf65BZQccvJWHmyTMmfhhDo0U6lI3lY8p911OHm8clzYXL+Zb+AhH7RA
	 E0uo2IwalP6lhFuCssKP85ALre1omnMBCKDRQixw1KtUvln+LgA9xS9j3WOVShdqvP
	 L3/h/l21e+Qou8/l7sx+X9cuVZjEeF6gCFUGwQ+VBWkoGPFPIKgXAfiQ2KBKIQYesj
	 KRe/l9cGfIviuVMpyGkgzrDFe8jIZ3NdUNP6+iSEDO7c2Gg+p5UYeXMEZmzNkMmF0I
	 TfK78h2brI2AGVg4Bzb6+h29irZRLZ15g5YxxawB0Nysij2SK3OACL8eY4LCsjJ/Jp
	 eIpJ6uHgln51g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSXdCUHK
  yQe9hIYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePiNp2CRsGKWdPWMjcwfuDrYuTiEBJ4zChx
  orOdCcK5xiTx9e8VNghnN6PE+u6NzF2MnBxsAlISN+7/B0pwcIgI6Elc/ScKEmYWUJF48buHH
  cQWFnCV+Noyhw3EZgGKX79/AKycV8BJ4v5he5CwhICCxJSH78Em8goISpyc+YQFYoyExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jXRSyrKTM8
  oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDMSU4iSbHYx/l/7R
  O8QoycGkJMp7ZWdSshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXq3A5GQhwaLU9NSKtMwcYFTAp
  CU4eJREeK/7AaV5iwsSc4sz0yFSpxiNOa5eubKXmWPm17YDzEIsefl5qVLivJEgkwRASjNK8+
  AGwaL1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3q0gC3ky80rg9r0COoUJ6JRt1Ukgp5Q
  kIqSkGpii9u/7pb/LP2ileO8FxhO64ZGr+r+HXc09oh4ev9L7TuG0wPxkUeG0LffURT5OKEh1
  TPBO5txwhU1sStaGmoZVvPFN7n3hC8xc58fnlM92tMjNf7xAh/HZN4n1uTzfs5I85R/tKk3fw
  fc/3Wkxs+27S7pMkWZeykl3074KrM0vfsF92uQCN18qn2Rspvq9l6yJ/XLFLTukG99W5Myenu
  2Ruf/lGxkDk9jK3bWnBa0aOtgrFurLTurS94sWbXi9ymnuavUzH3Z7XFf6Y6Pl3LNdoiJe8z6
  L8z1+w/uSD88uf75tybuH97b5Xz3RtM9T/Frp//bXb7MqmDS2BzZ4sf9dNf/qVxXW9iUxbHr3
  lFiKMxINtZiLihMBe4UhCVEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1667453583!382635!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3262 invoked from network); 3 Nov 2022 05:33:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:33:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BFE861000DC
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:33:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B3B6A1000D5
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:33:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:33:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt-compat: upgrade 4.4.28 -> 4.4.30
Date: Thu, 3 Nov 2022 13:32:49 +0800
Message-ID: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172607

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
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb} (100%)

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
-- 
2.25.1


