Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB463C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:31 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.17036.1740678024771079017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uG/QnDqB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22337bc9ac3so24653895ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678024; x=1741282824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puDk7OGhtvoNYEFFBd/G0GHtG8MS6+5npOIz/CZxl+E=;
        b=uG/QnDqBbL4Yn1lGgS01+wN1cYQRtcYnK4PwykRff9QBpzRANeBcB2AnhVDR9P8XmL
         HZrYvzkoyEeafM2ZWizl9I0qofbkowxaY/EDQgDqxRKOAucRkePgONe1iimONcjhimp6
         S373TdUgTLV3+g9BQj+7mZH/EEbq2oUxVXfoCQPDyNHwqnjgSJTVPTaSMY1r0O96dx0W
         GbIFabi6smWW6TaaZQYsuLHd0DMBZxXb6WVX5GeKCcvMyXb5gIlmNTBmiHRP4hdvLu7I
         yYcBzqB80x+NH8fS563oDLpEfU0NL/lw58G7jXD3KVjfUXXefPf3lGGAfRm/DU2+5S19
         dFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678024; x=1741282824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puDk7OGhtvoNYEFFBd/G0GHtG8MS6+5npOIz/CZxl+E=;
        b=fhRXj7GUBQnhngwDTMGR+Dzvxp4dysPNNHSYxhUJeDIrPRKeDlzQUpjpUCq8e0+DCS
         XCyubK2PIRAJdWmPrjIM8qt34AZcIoch7Itr4OwYEWxF1s7ijGQo9Gykqig1e8gdWVaL
         Do1b3st8cXKRjqizi5msnVsDdzzE4K9ZLtzaWoQsXSAzUcIoKtmNXcnA9cGnITmainKp
         2AwBNQ1v/KkSpWCvPo2fAv8xyIJWUFr8JM1U3jHhkwVbo2C/P8BtJbjCOB5yO5bl6Tok
         Ohmh4VI5aW47ox70G74q/eVvcWXkb1LywpKryJRTm4Ps6kqp+mOFbeZ/yMMqytdTJB1/
         VSPA==
X-Gm-Message-State: AOJu0YzQYXUN5pzT6GK+gb7X3uXQXxQGScmbI4BEbQAxU31y/zaz+3Yw
	3ZqS5cK48jJqt7SEWy4TGfJC9tYv4rwpFlKBTtaZRCsGF4Y4CfxpPQPAsSZhYbdTwOUhbnIyLnc
	x
X-Gm-Gg: ASbGnctqB1c+zUwnDOq+2YVwXY8vXM2a/FquUmQvuXA/DNx9S3iCX0pEZy+TlObxj7B
	Vb+mYjM6lALkBm3envGnJCZB2dNJrl9p7Qo+x/FRmLslPye4960WS4oXgutLDE6QnYNzFmTKB/W
	9Kk+JPSUN6Mr6/dz6UycYPfczwEJhgvMSCikqQDQ2g/Vk4n0NX5XU1vqTeOfuU2rTuIJZ0SFqBH
	tZUNhPyVGy4y9gefqv1DA78jiuLsjZrwMBr6yIMXC/ghDeJN/bkLdmPijbhqONqAOAQapxUZpsU
	ZqkIaBFSq6qY6oHPWA==
X-Google-Smtp-Source: AGHT+IGXJFMDZ2VA859xbM/Rt0kYiVVjGN0EMZ0MsObj5yxqYTbxt+JUYUhj6ZgUWOQFzyCeIV4q8Q==
X-Received: by 2002:a05:6a00:c86:b0:725:df1a:288 with SMTP id d2e1a72fcca58-734ac428a45mr434637b3a.24.1740678024067;
        Thu, 27 Feb 2025 09:40:24 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] xz: Update SRC_URI
Date: Thu, 27 Feb 2025 09:39:50 -0800
Message-ID: <3f0803557ffa0fae557895f955ab2dcac38d7262.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212037

From: Guocai He <guocai.he.cn@windriver.com>

Update SRC_URI for xz.
The the tarball of xz-.tar.gz has been changed from
https://tukaani.org/xz/xz-.tar.gz to
https://sourceforge.net/projects/lzmautils/files/xz-.tar.gz

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-extended/xz/xz_5.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
index 3482622471..7f889e4367 100644
--- a/meta/recipes-extended/xz/xz_5.2.6.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://sourceforge.net/projects/lzmautils/files/xz-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a2105abee17bcd2ebd15ced31b4f5eda6e17efd6b10f921a01cda4a44c91b3a0"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


