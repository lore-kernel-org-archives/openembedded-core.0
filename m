Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0923C6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:41 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.113.1675289794797654589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rBL2dfcD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id z3so13629218pfb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsMawxuQs9HQusQnl7hCMN7+f5hF+Hf3UmE9LutVR+s=;
        b=rBL2dfcDMji+ELht6X3hmLY7HG915Vl8ReZEZap72fParRwF/zfu7OKjzAJ0GWQQZG
         voelXqX0XYOlcn9mVOj2VEWPKx5War9r4sNu7/y/EslJWTHnfog5lqM+2sFcuiqHee69
         6NBXX0xkznHlVxJN3gk9lE1g2HGgIu3Y2ur64Iieg8gKoeprLu0wziArnOMY1TWh6iZQ
         RC008WPpZlUwVIKkv/qgQRjaEqepNCRg0YnsGdc5rBGeFYgCkE2sa0b+0Axxxijf+B5I
         ZJVD4ya82hUxXGVEtXt3asWiLqaC4PYhil9CwiXcvVo88mWpIuNiSl3/EvlwHFrCbSMQ
         mq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsMawxuQs9HQusQnl7hCMN7+f5hF+Hf3UmE9LutVR+s=;
        b=PtDjxehUFLJ2vqwrvb7/EAG/FRh/CZ98rh1yPmnGUc2eZjJ2ufnWMohdEtevPeFsoP
         loUIRfWbfb2QRhZ+Oq4YiqEGVYGK9id6u+lEZ2R5uvkpMHA+RP+7RFAwHhOVEZMQhKiU
         C87knOSgBEHNgyrfMy6IoGbg+kcqLb/FaF0hTkHcY2me+fLGTMcyLquaPrBPH04an1kv
         yWlyKOtj1w2EFjHUuJN1RwtXK6HVhAkGsS9a5Nj50povJ9EdazGIrslumlpY8xqJw/vz
         rGxjSia4teFRFsySV8ZD5cBmJNzAq0Cc5WOzxzcCaNK/8eKAEU4nqgxE68x2jCnWSF2S
         qwVg==
X-Gm-Message-State: AO0yUKUpyt72IJrocRnYXmgPeBxbtT+y/+FRfYPWmcVPDY6jtVJ3SN50
	92y2X0aNXq+A7LQrzFCpBd486C8gYFs/KEsSzg0=
X-Google-Smtp-Source: AK7set8qbTb586UFR87OrmW99aI4RPsNHf7W3QZXh3Rp2IH0dkP7DMNTKtMlhd28IL/rMM+8GUQ1Pg==
X-Received: by 2002:a62:b505:0:b0:593:c665:f256 with SMTP id y5-20020a62b505000000b00593c665f256mr255822pfe.3.1675289797698;
        Wed, 01 Feb 2023 14:16:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] libtirpc: Check if file exists before operating on it
Date: Wed,  1 Feb 2023 12:16:04 -1000
Message-Id: <f8dba1173dc42dd72c231fc291b2f7b44d828905.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176670

From: Khem Raj <raj.khem@gmail.com>

In some cases (e.g. mingw) this file may not be installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 547f3a13ee9268bbdd439c96108ba1fe9ab78873)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
index 66bc4ecdd1..6980135a92 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-gssapi"
 
 do_install:append() {
-	chown root:root ${D}${sysconfdir}/netconfig
+	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


