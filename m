Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1485BC54E56
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8389.1709105605373369203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UmVm0UtH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105608; x=1740641608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JA5gq4KPPsMzX8++KUxXsUxIxYiAVcpQCroMjad0kZE=;
  b=UmVm0UtHYAnWIYadbVbuw5KFh7Jnbw3W1hmtWOrcg8O4n21g4uEtAJ86
   S3I0eN2TB7dSqc9yNBpAWwInHL6v3qmI1a5PQY3Ll9DjhQbQtIFi9GJLm
   GJxlWhCvKkwYeKCQLmiYXdC/XzxJesDy22zxKSHg725Ky0s7ZwANtxL8x
   j+CMIqdzVRUcGAPbWU6VsRjFy+gLwPQdnZnMxu9HpGAeYy2bUQLskXL+p
   zqHPTVlPubQFuSojvKP9491KthIXq2rgWe+fra2BXSiaRqiDBjgbLuZ0N
   eclhPLmJwijlQGd0hOcdSjr2tYRrGykP7bKNdpUSwRA+/2GFTcYRApTh4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129444240"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129444240"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:26 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEBE7A02A3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A239DB3C6
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF9352008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 695F41A006A;
	Wed, 28 Feb 2024 15:33:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/48] libsecret: upgrade 0.21.2 -> 0.21.4
Date: Wed, 28 Feb 2024 15:32:23 +0800
Message-Id: <1709105575-24259-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.445900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr7xtPw/8I7HSZVnrV0ZFsVUjk
	mZhzoGFQ7+nFmH5aUdYq1udiYlzzO/POIMIWf2Grn6y0mNkW0aTD4xQfyZlO1JTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3Q0D4MTphfBGxx7vRUjbKhgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipclmoQX+aag9F+mlHcJFovlUsibigLU4R9LPHB
	4MXikBZvrCEjXs8BvSNuEvgLg2iMWzRpVLiYUTfyaHwlCINcn4P83ef6BtZh/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196339

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * file-backend: Subscribe before calling dbus
 * meson: Fix crypto option being silently ignored
 * Updated translations
 * Port PAM module from gnome-keyring
 * secret-tool: Fix memory issues in lock command

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsecret/{libsecret_0.21.2.bb => libsecret_0.21.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.2.bb => libsecret_0.21.4.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
index 2d8ea952c5..88c3c73510 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
@@ -13,7 +13,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "e4a341496a0815e64c8d3b8fabab33d7bae7efdeab77b843669731d5b181dcee"
+SRC_URI[archive.sha256sum] = "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c581301cd53912b20"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.34.1


