Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3B9C74A44
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.8641.1678229329487449345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gUx9gGY7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id a9so15790062plh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvHYZ9q6GtjuK2oFcnJ5Vg8c/ZXLI784v9B8/Nh5kYo=;
        b=gUx9gGY7cDxND0WJNiX4kOKCUZO9HC1zfOV3oHeKYvxomtTYSB/kvlTlgs4q6GqM2v
         F2hQ+nNr380o7T6xBUmivD5tgjqhXMcSBtjV4mlOABsjWniENpPAWhIrEC0NgGN6ZRYQ
         eDUx4sFaPbsFOGZBH492aqU2JZE0SW5qWwOeYG/pWtD9xr5fiDKWcDQeYNhWZ2s+YiCg
         6ztdV4A3dPa0DEZ29G/ygbny8fQ7s/yXQsBaD3RJ+CC5msoHcnkjwYC95ZJJFneO6giL
         exmfT7/DIt7BypxqQ3Xu7Oksggwf6ae6W5Abexsbd0t/ur1wQrFADS0Fe4cv4+a1uwjf
         Ejaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvHYZ9q6GtjuK2oFcnJ5Vg8c/ZXLI784v9B8/Nh5kYo=;
        b=IQZGh6MziMdrIu/snKSuASb48r+th/7iZp1ExxmjFYQbWORcRg4ZrMrzI8Zf1TSAV2
         QjjBFSUtzY6XlqwbYUf7up4Eh2NwhZD0PhHtRXhu/JAEIBYex/OOus83SV6DutGe2UGg
         ROC8sAfqUh3d/ZtdtlRTZ1R6L7LJyXgTlw2GnQSYssZP8WHtas2/zG038AxDdWoznEAg
         W4KuwYdo2bdgdYatY1vg97ffpDg77Zx3oMeYN+L+Mr4Pm9CqVog4OczUe6IsqZJgZTu1
         S6ePrU77cEPhZszAV+pIZYDtyTBbTtIxNXyYN0IruOjvVGY4pgOPBKoyUk3qKHzkMBmz
         v1Fg==
X-Gm-Message-State: AO0yUKUbeHPeDGcv9kQUw8Ys8iIeseYH1BFYHBtALM+b2c+rBIaqrN6C
	3GXY6up6EbBDX+OJYn4vsW7510k6PGpR1Z0eWPM=
X-Google-Smtp-Source: AK7set8ww9VvHNeEpcCOZ91ulysiyqzw6Y34K2Dj0InjddAb3vxvJH8gixhqDHkc/v/Oqs06Z7n3BA==
X-Received: by 2002:a05:6a20:748b:b0:cd:83b1:4236 with SMTP id p11-20020a056a20748b00b000cd83b14236mr14726770pzd.36.1678229328532;
        Tue, 07 Mar 2023 14:48:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/23] apr-util: Fix CFLAGS used in build
Date: Tue,  7 Mar 2023 12:47:51 -1000
Message-Id: <92fb7261a1c7ebe6330832a9a71d1bed82c85a6a.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178139

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to use CFLAGS with the correct WORKDIR in them, replace those
in the sysroot file with the ones appropriate to the current recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45edf189961aff1858be9bb7b63116073c0a0c10)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 meta/recipes-support/apr/apr-util_1.6.1.bb   | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 4b606e7e64..adaabee47b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -39,7 +39,6 @@ exclude_packages = [
 	'gstreamer1.0-python',
 	'hwlatdetect',
         'kernel-devsrc',
-	'libaprutil',
 	'libcap-ng',
 	'libjson',
 	'libproxy',
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index f7d827a1d8..4e183ca374 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -35,6 +35,7 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 do_configure_append() {
 	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
 		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${B}/build/rules.mk
+		sed -i -e 's#^CFLAGS=.*#CFLAGS=${TARGET_CFLAGS}#g' ${B}/build/rules.mk
 	fi
 }
 do_configure_prepend_class-native() {
@@ -49,6 +50,7 @@ do_configure_append_class-native() {
 
 do_configure_prepend_class-nativesdk() {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+	sed -i -e 's#^CFLAGS=.*#CFLAGS=${TARGET_CFLAGS}#g' ${S}/build/rules.mk
 }
 
 do_configure_append_class-nativesdk() {
-- 
2.34.1


