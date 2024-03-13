Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC92C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10635.1710313745263450203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AUoUa2JI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313745; x=1741849745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cr4N98SccnqLFIZwh82KSskP3eeaCD8PlDA3c6luNGg=;
  b=AUoUa2JIEXuRZ1EXZjP/UZAbIdBB3Ug/OVtYppz35qCM7fabayaz7wcM
   pibI6jk3rsI8w45TqaZsKDnYz1RMwC+YTbX9YG3Fnknf8UUj941M1Pc+w
   +ISiwojRSqHf5kp582m5Vp8Ec8A97qGH2E5YLnGbGNgnE+U2qobVGsAHl
   GJ1Ba0d/sakiyCXD2hwcKy8ir6sAFIbgAsRKcp1MoLSYJ5o4/Fk4ysmoW
   OoY2BzlasZ7q59EQUNERGk2JPjeAsS8QJZoxvLKjEbxoe5QnqtboSbBxd
   fd7fTifpwHR1kG3WXS97WR9neerSIwD2GGMc2hZE1hNoT1M/747MQrZsV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140577412"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140577412"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E307C21AB
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EC08276F9
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3457820097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D491F1A006B;
	Wed, 13 Mar 2024 15:08:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/36] gnupg: upgrade 2.4.4 -> 2.4.5
Date: Wed, 13 Mar 2024 15:08:04 +0800
Message-Id: <1710313714-12541-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--6.850500-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrKQNhMboqZlpVJ8sOvRbBi8PR
	dA5qc+XmyrhI07UUNwakulA7P59Gup76e9GOpfQK0Eym3EHGbrj0swHSFcVJ6Al4w4lfxz2cpPp
	QIi8rib57c9JF/3RsTRrhXHjPYz6AHPTlDEy8xUu5qYz3DvND6wEPJrYlsf/6xbvXakbDXzj3SJ
	vEvhvPoFn5XWwnJwkW3+BcJt5VCDhaQiLka9EcSj9B1SHosSXQwTlc9CcHMZerwqxtE531VIPcX
	uILVCbaK9R11yl42sW9Du2ZULY31fr252PTOmm/3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTKYOc
	jnHaFYKOhzOa6g8Krb3eUWxY4pb6GQ2+Av2qP+ICknOT3tvx9r19lTVQS4Xj1X76NRw7Jr8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197008

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* gpg,gpgv: New option --assert-pubkey-algo.
* gpg: Emit status lines for errors in the compression layer.
* gpg: Fix invocation with --trusted-keys and --no-options.
* gpgsm: Allow for a longer salt in PKCS#12 files.
* gpgtar: Make --status-fd=2 work on Windows.
* scd: Support for the ACR-122U NFC reader.
* scd: Suport D-TRUST ECC cards.
* scd: Allow auto detaching of kernel drivers; can be disabled with
  the new compatibility-flag ccid-no-auto-detach.
* scd: Allow setting a PIN length of 6 also with a reset code for
  openpgp cards.
* agent: Allow GET_PASSPHRASE in restricted mode.
* dirmngr: Trust system's root CAs for checking CRL issuers.
* dirmngr: Fix regression in 2.4.4 in fetching keys via hkps.
* gpg-wks-client: Make option --mirror work properly w/o specifying
  domains.
* g13,gpg-wks-client: Allow command style options as in "g13 mount
  foo".
* Allow tilde expansion for the foo-program options.
* Make the getswdb.sh tool usable outside the GnuPG tree.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.5.bb
index fff7d8c6da..99996968b1 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
+SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1


