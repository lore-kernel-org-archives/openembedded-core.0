Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E9CC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 08:34:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3862.1637570053453876204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 00:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="232231989"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="232231989"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="508448608"
Received: from amohdwah-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.176])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 1/5] cups: Fix missing installation of cups sysv
 init scripts
Date: Mon, 22 Nov 2021 16:34:02 +0800
Message-Id: 
 <e2518c2eba8c6e486aee3273dc2cba9ab51ffb69.1637569916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637569916.git.anuj.mittal@intel.com>
References: <cover.1637569916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 08:34:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158555

From: Claus Stovgaard <clst@ambu.com>

The packageconfig needs to be --disable-systemd as documented in
configure file for cups. With the current value "--without-systemd" the
SYSTEM_DIR variable ends up being set to "no"

It is caused by the --without-* section in configure file resulting in
eval with_$ac_useropt=no ;;

$ac_useropt is "systemd" causing the variable $with_systemd to be set
to "no", because of below test

if test ${with_systemd+y}
then :
  withval=$with_systemd; SYSTEMD_DIR="$withval"
else $as_nop
  SYSTEMD_DIR=""
fi

cups configure test for i if SYSTEMD_DIR is empty to decide if the init
scripts need to be installed. A value of "no" results in that no init
scripts is installed.

With --disable-systemd it works as expected - installing the init files.
Though cups should properly improve their configure script.

Signed-off-by: Claus Stovgaard <clst@ambu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 967fdd2ba12f22d8e46600ff085833993a32cfeb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index f6f8637a43..0f5c2e730f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -44,7 +44,7 @@ PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
-PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--disable-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
-- 
2.33.1


