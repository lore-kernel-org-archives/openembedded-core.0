Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28213CD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 21:57:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66417.1780955847450898100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 14:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=sOgJ0D6E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260608215725f6ed228af1000207fe-l51zvy@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260608215725f6ed228af1000207fe
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Jun 2026 23:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=F8oNRHzCicMJyjdHufN3WRdlCI/lDsa/GY1ZChbCOsg=;
 b=sOgJ0D6Efb6gUUMGoVfBYjHBouGzzkjndqJ7/rfmLt1N2sIzqo8IyAyIY5JbWqFFByTTV8
 dIrycPNqIC20XrMyl35S40q733TJjTqu8S2x4vGi490KkIxj3kggKSZO2g8EpMyOiMEQSBn9
 bE/9LolQ67IlC58C7TxQKSj+UW6uoKs86x+l0s2RDI/myh9syOYqipJyeTtQmQXze8867NbU
 Dg1Jmc0x4WQv9yN1wMy5VravmKw6jccuLtTr7nPZbFlRV/vVayUNNjgefeEqOrQvbtvhLZOr
 TSBNuBPZGbB/MnFpoTRYS6A/tLm6Gg3ZE/xr1rdK6QWY4vitmeRmWOTg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 5/6] python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak
Date: Mon,  8 Jun 2026 23:56:51 +0200
Message-ID: <20260608215654.3664494-4-peter.marko@siemens.com>
In-Reply-To: <20260608215654.3664494-1-peter.marko@siemens.com>
References: <20260608215354.3664441-1-peter.marko@siemens.com>
 <20260608215654.3664494-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 21:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238263

From: Bin Cao <bin.cao.cn@windriver.com>

The _sysconfig_vars__linux_x86_64-linux-gnu.json file contains a
"userbase" field that is populated from the build host user's $HOME
at build time. This leaks the build host user's home directory path
into the target rootfs.

The existing py_package_preprocess() cleanup for this JSON file only
strips known OE build path prefixes (STAGING_DIR_TARGET, RECIPE_SYSROOT,
etc.), but the userbase value comes from the build user's $HOME
environment variable which doesn't match any of those patterns.

Set userbase to an empty string in the packaged JSON. This is safe
because at runtime, sysconfig.get_config_vars() always recomputes
userbase by calling _getuserbase(), which resolves the actual target
user's ~/.local path dynamically. The static value in the JSON is
never used for runtime path resolution.

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: beb245ef60c63359cd4f5e285d2f31c5c572b51e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 501de75fb1..919cfde9ae 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -390,6 +390,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                -e 's|"userbase": ".*"|"userbase": ""|g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
 }
 

