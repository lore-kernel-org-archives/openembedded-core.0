Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260ABC369A7
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.63725.1744073526785789747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cp1kUnyF;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073527; x=1775609527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ob9zeCK8eVsoMfmb7b3oxSznnFX9AZ2tAi5cd59rRu4=;
  b=cp1kUnyFM3oPHURUP2EW9JEE1RTpphgwM6q3AxMmLaRlCmPz2LIHLDfd
   plVyk8MhXlMMCne6jNeb3FAv8nfRxDWvIK8Cy9DqmRA/W0TJIxFHkryWy
   I4LkkNDYdBtTucjwTULdTLKcjH+W4vDTAuxtIqZpsMj/x08h0lpa+jNMz
   OOhfayigefpGdw86NvpYDtxf2P1xgcd0J0T6XuKVG3VC48ca/fRv50+Qz
   dt3g12Kt8t2oZLTYJwlCRZKM94h8INuZnt/OmwhuBK1qvesgb1fUgk0es
   UwHDFrF3YDN26M18DXgCT67+f9oPE0B9cl767mgkXkbd3vlPAQ9X3iQny
   g==;
X-CSE-ConnectionGUID: rWwlR4K3S8W1BlzSvsdmxg==
X-CSE-MsgGUID: /GnnQJW+SceYJWRhI6WOJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="183070470"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="183070470"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:01 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 156D6D69D0
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA479D5095
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ABFFF1A00B0;
	Tue,  8 Apr 2025 08:51:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/15] lighttpd: upgrade 1.4.78 -> 1.4.79
Date: Tue,  8 Apr 2025 08:51:34 +0800
Message-Id: <1744073502-27695-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214490

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* [ci] update deps pkg names for lighttpd on Cygwin
* [ci] MSYS detection kludge in tests/LightyTest.pm
* [autotools] spelling Couldn't => Could not
* [mod_openssl] revert SSL_CTX default cert assign
* [mod_openssl] spelling in comment
* [TLS] issue trace if unable to check/refresh cert
* [ci] Cygwin Invoke-WebRequest -MaximumRetryCount 3
* [ci] Cygwin prefer D:\ drive
* [ci] Cygwin remove redundant call to setup.exe
* [core] set server.max-fds = 4096 if not specified
* [core] clear Linux ambient capabilities, if any
* [core] rename remove_pid_file() -> server_pid_file_remove()
* [core] retry pidfile open on Linux
* [doc] systemd lighttpd.service hardening
* [doc] move TLS config to separate file tls.conf
* [doc] systemd lighttpd.service hardening addition
* [doc] systemd lighttpd*.socket activation examples
* [core] default listen() backlog to SOMAXCONN
* [ci] fix meson build execution selection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.78.bb => lighttpd_1.4.79.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.78.bb => lighttpd_1.4.79.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
index 1d9b4e517c..cd6790dff9 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "3c0739e8bc75c9e9fc1cfa89e1c304dd4b0e4abb87adc646a1d20bc6a2db2a3e"
+SRC_URI[sha256sum] = "3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.43.0


