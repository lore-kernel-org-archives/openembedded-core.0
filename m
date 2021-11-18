Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F8DC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 22:06:17 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.90.1637273175041328451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 14:06:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=gnKZOUWK;
 spf=pass (domain: qtec.com, ip: 209.85.167.47, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f47.google.com with SMTP id f18so33302326lfv.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 14:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kLgkzmKhIDhGjMS/2LM92k7XnWPwoHROxHlgtGGr3gg=;
        b=gnKZOUWKCzyewJhPwQND0GZd0jE94MHEAC+e5vlwQzvXn6WTm91wDr4DKP2REEwkax
         /5cR6yYF7iBrV9xxukbOHb6Aefeb8mjtlonV41WrRh/p1FyWgzO24F1l1wYLb6OpZxae
         IjkmLUYt9RcUlArhjSduuk/GzR7/0t1Tog5B9ZwOSyxUBZKtYhpmiqcd9nW6CQli5FTc
         fUoykIDn2MDGRGQNL4SmPToUkkvndsOv8LOb2D5JmOKVlsuiHNvq3p/lZzdHT6M0rLPf
         dXOVySGGACX7fN1V3gFBCe7Ca+v5y+f18EDA/UQ//KrWRJjMOlzkzG0lMvvHA1jqiGNr
         D2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kLgkzmKhIDhGjMS/2LM92k7XnWPwoHROxHlgtGGr3gg=;
        b=E2wucDBcTIezLCm893eUsmTdkmY+M8feXZEYpGx51sMR1j3t6ZixfW3nm34lZpOZDX
         24jp3oXZvyPfxGtjIJvjIyCc6DKAzYlNmcTBQrnlii9Rfpe0p0Hq7CrUirBQAeOPz40N
         6fGrvRGAgUrKNMjK4S2/Hi3zuG+0I4hMBnHlxobtMpEgAV/4aYsv53ufCp9zR53RdHuM
         YX95no23pBXDJIr8kyFWN4xe5QIV2NAMvh/mdZxR9PNDqUr9C56R4tswgQFOjxTx09RA
         +MYi6xOpAav1j3EeN3VoAUgWi3+uLXrB3rxXyW+xnPtQj2fGBsAtKAetWQcDWM1o+KFr
         lE8Q==
X-Gm-Message-State: AOAM531n9c6fa+z4W35WAPoW/LzalVehAD+21cWPIFzW3MNhepg2Ypxe
	i6cSJqKL6npJRF6KDiY/jcUmm9yPw3HfW7D+lY9oJLlLbIHAHkUTykPXZ5vKkokL0KGuKzItq/d
	CxTmln6zSZTxUh2Hj1jp8ZOCK4FLhH1uvaQhObX3IYNxKyypJmqa54rRfmpqlVh0/VHQJ14P+Z3
	GBVBkQA49cG8TtjZs=
X-Google-Smtp-Source: 
 ABdhPJwsKeV5iwm7LhI/IzMig92hgXhWu2fe77pMNLXg4vZjx0NPkRdfA2mYyYRFj5UJ3FMg3M0Y2w==
X-Received: by 2002:a05:6512:110e:: with SMTP id
 l14mr28194711lfg.550.1637273172641;
        Thu, 18 Nov 2021 14:06:12 -0800 (PST)
Received: from localhost.localdomain (87-52-47-7-cable.dk.customer.tdc.net.
 [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id l4sm104404ljg.60.2021.11.18.14.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:06:12 -0800 (PST)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] os-release: Add DISTRO_CODENAME as vardeps for
 do_compile
Date: Thu, 18 Nov 2021 23:06:09 +0100
Message-Id: <20211118220609.68122-1-daniel@qtec.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 22:06:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158482

DISTRO_CODENAME is part of VERSION variable but not used as dependency
for do_compile task. Append it to the vardeps list to rebuild in case it
changes.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/recipes-core/os-release/os-release.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 8847fe30c3..637d059e8b 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -12,7 +12,9 @@ do_configure[noexec] = "1"
 
 # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
-OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+OS_RELEASE_FIELDS = "\
+    ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME DISTRO_CODENAME \
+"
 OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
 ID = "${DISTRO}"
-- 
2.33.0


