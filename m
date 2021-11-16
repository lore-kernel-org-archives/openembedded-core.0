Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA2FC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.383.1637080346426941201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319941113"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="319941113"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956793"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/17] wpa-supplicant: Match package override to
 PACKAGES for pkg_postinst
Date: Wed, 17 Nov 2021 00:31:54 +0800
Message-Id: 
 <2e0bbd8edcdcc892e593848e618a9a00f6dac05f.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158356

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In PACKAGES, ${PN} is used so it makes sense for the pkg_postinst variable
override to match that else it causes user confusion.

[YOCTO #14616]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae9094d45bbfff377bd542939e12a8451a4959b6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 33b1495bb2..25cd8ef82c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -108,7 +108,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
 
-pkg_postinst:wpa-supplicant () {
+pkg_postinst:${PN} () {
 	# If we're offline, we don't need to do this.
 	if [ "x$D" = "x" ]; then
 		killall -q -HUP dbus-daemon || true
-- 
2.33.1


