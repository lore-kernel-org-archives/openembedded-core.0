Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F02C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:08:21 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.48414.1718892492147298185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YB/r9kW8;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-797f1287aa3so53324585a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718892491; x=1719497291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsAx0yloNp2SnBm+qDd4AIelvSguPq+KPxevaC9TvVY=;
        b=YB/r9kW8IsjiQicc1sOBp6lN7lMK6B+tyvWui8kkeJ38MjrdaIzHBj15CUCN5JUrXB
         BCkcX7VKtn7uuzAhNbTfT7LdX8UuRjrQ+ayn9Hg5AcZ9ATSDgDddV/buFUpID/arcV6/
         luyydb0PiC00LByEZ0+4UeetVy1RTpetOSWhk5+zZF2lyvbzt5Z0+tm8waqEXtSrFqSp
         oQOmF6Jgl12Vo6X7HdL/m4Hk5C9dlTvn95vQtcwGS3B4GfRZhM6xqTkbpx/PZ2jePWIs
         iSn1fg/JLqgp5iKqCOsLk3p+5PAPJtVWZS4g3TUWbHZfBZ/xHrpfGS9oZdNAxfF6RFs0
         ILfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892491; x=1719497291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsAx0yloNp2SnBm+qDd4AIelvSguPq+KPxevaC9TvVY=;
        b=TBT0Fp3NBLyPpEbvmFf22e3c3xLPkihXJc7KGObEoAuuh8a5N6XSowq1vcVqwTR+lV
         FCUnKO1T0uEXy+jfgcsMkFmK5zZ5g3LfbgPfr4JtCje1fmaTx8wTK7mc7o+4QLEc3FnR
         K5PWJAxk/fZ645z1+ke6/Uba/87F7/Xq/N+4IUtKd6q+g364VwhDCYwkBKlTmLViMU03
         XDSxw+dBzxsu5fMK0Ix/sdGVkhUe+Rnu4kISj5Zu8wT3ez/LTnXmXuuKYloOL+pK1ulD
         s7PfdWYr467wJNL0A9m8nwCUz830gLfCBnFg9V1tW4s+4vvf3tLKA65xSZEL+Jt6TFM2
         yP6Q==
X-Gm-Message-State: AOJu0YwJhWSzG8QUq5EdmxZUtisGj8NHKCYibIltStIVHr9xth95noKD
	oirWoIWlBWaOnhn15TdTRg1wcF6PMD3kx57nyvl8pqbjpxUgwLDBOQ4FfDiVnY8Z5EUcWUP4i67
	9
X-Google-Smtp-Source: AGHT+IHGjlPsH+o4irxTfCZCA9tY6vN/RuOr4fnvp8UZBTOIBkTmpGaM4pe9wMfkG0DpK3IXdRwFKA==
X-Received: by 2002:a05:620a:2490:b0:795:a500:aa99 with SMTP id af79cd13be357-79bb3ebd6c2mr589601685a.57.1718892491015;
        Thu, 20 Jun 2024 07:08:11 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6efc7sm691579185a.131.2024.06.20.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:08:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 6/6] MAINTAINERS.md: fix patchtest entry
Date: Thu, 20 Jun 2024 10:07:53 -0400
Message-ID: <20240620140753.392220-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620140753.392220-1-tgamblin@baylibre.com>
References: <20240620140753.392220-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200961

It still says that patchtest is unmaintained, so remove that line and
clarify the maintainer in the list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 MAINTAINERS.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS.md b/MAINTAINERS.md
index 505c2e234d..fe706a19a3 100644
--- a/MAINTAINERS.md
+++ b/MAINTAINERS.md
@@ -41,6 +41,7 @@ Component/Subsystem Maintainers
 * devtool: Saul Wold
 * eSDK: Saul Wold
 * overlayfs: Vyacheslav Yurkov
+* Patchtest: Trevor Gamblin
 
 Maintainers needed
 ------------------
@@ -52,7 +53,6 @@ Maintainers needed
 * error reporting system/web UI
 * wic
 * Patchwork
-* Patchtest
 * Matchbox
 * Sato
 * Autobuilder
-- 
2.45.2


