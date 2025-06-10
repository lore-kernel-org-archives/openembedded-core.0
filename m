Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBDEC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.90700.1749571759885762009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WiuprsbO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23633a6ac50so19517395ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571759; x=1750176559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WoZ4RfQg4gV5gVgO94rocGcbQ/pvYDFH0pNOWS+Htc=;
        b=WiuprsbO5qDCCWP/vnSFYoxmpfXeTUSXRPcoSbpS4lf67MGqQSh+up7iZI+47J0d/h
         hgOiRJsYJKFQx+FQtIf8hvPDtJxuZi8AHJTYEYdYbN7me+6/bPJcjM1tOW/5BCR/FzCb
         dSsF3VC/iv0bEiNnGJCjGYnk7osOPIEanfVTVifm9BDUtD0g09Z4LjaNwQRJCbMrRn2n
         D2W3XTz1+gL1g8pY9K74Gyl5r4cfRJ7jIBHVWTMQ9y7H6MdlsVjj4ul012NQCBV6pEmA
         52H/saFa6jT8pgimThU/tl5/XTWH+Rsu1ZcZuyQQjpDIzyi2IDWwU5+xaKvTXUBlx00k
         Qekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571759; x=1750176559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WoZ4RfQg4gV5gVgO94rocGcbQ/pvYDFH0pNOWS+Htc=;
        b=VVrdHjObU67ozvPUNdsp1qLK2EzUW8zEnaDidwQJFmB+/y16umBB98nJGOoOXqjz5C
         x8+dNWKUyu8fBzsdqEPs/VEaepxOjm4xwn2gfOW4tzl+jS2hKpBGK90tSyzYfAxAxo6W
         uXziU2f++jL4AFLmnZaYia5q8pw1eMGhjxtL1bfyhTlViEnu793GOObfzvCkcqRleohy
         WT6vTOF3+zftodUBGeE8MYQw6GCNOm9T9atKaOR49ATSIFCxQ1b3ZuQb9bHHwMZwhY52
         qNOjVv/FmAIQe4TTo7mugmU97kXxxYQzuNNuAGGP+jvSI3KKorOwPPrYWMYBuPENiRl4
         KUDw==
X-Gm-Message-State: AOJu0YyPC6zVstAJ5RymBFb5trmnM966P31dDIYfnwbsWSt3xPBhS9Gz
	9rIeeIGSPg+ppeHpUMUcSMRQR8SQRzkvNq0UzAADZQ4r0NMscsbfDgCcusRWqlwZSD4kxt9qton
	w+HhZ
X-Gm-Gg: ASbGncuLZEJaWP9Jt7uISE5fYyMrcAvmgLUPP9D26ZtRfkjcUg+oF/4FqPrIOdlhf/N
	g8iqjGfLjKaEtE/VvykqGwprjQ2FLaaiktCHN96ujDr7vLPedXrBRkOPoWuzqBtBKaykkHArmAV
	LsTZxizwt1JopWO3xobED8c+qZrMEtmfq3pCDW2a95bPMGR7oxfN35pOG1ysbfADXIxw16LKkxA
	FeYIXNMcn6VHcEL6paH5GokKnIu2T6DAo3efa8Qk51Uua6CKU88c8DFw0Neu4naAHU0RcTBdPjt
	+yiXr9gi1vs5zN/jRBi+6Qp9JsZNOzDgMaTCul43fWKfHhmaUmt/VliIOsqc+JFg
X-Google-Smtp-Source: AGHT+IEgqpfpaN8CzWWgKrpjuc6x74D5OyGwkHkhTBsDq49f1im4fjIDyNp0c/MdMXuVBXhPjEYBnw==
X-Received: by 2002:a17:903:166e:b0:235:779:edfe with SMTP id d9443c01a7336-23640d23c11mr6850385ad.43.1749571758613;
        Tue, 10 Jun 2025 09:09:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 16/32] libsoup: upgrade 3.6.4 -> 3.6.5
Date: Tue, 10 Jun 2025 09:08:29 -0700
Message-ID: <a5585378dd9a2ecd8261958d02c34ecce1be5c0f.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218385

From: Changqing Li <changqing.li@windriver.com>

Changes in libsoup from 3.6.4 to 3.6.5:

* session: Strip authentication credentials on cross-origin redirects [Patrick Griffis]
* build: Use pkg-config instead of krb5-config for the gssapi dependency [Patrick Griffis]
* http1: When using chunked encoding report an error in case of unexpected stream end [Andrzej Surdej]
* http2: When a message has no content still respect its Content-Type [Patrick Griffis]
* http2: Revert manual window size management temporarily, as it could stall [Patrick Griffis]
* sniffer: Fix potential overflows [Patrick Griffis]
* hsts: Fix minor leak [Patrick Griffis]
* headers: Fix a few parsing edge cases that could be an out of bound read [Patrick Griffis]
* connection: Avoid ever calling disconnect twice [Patrick Griffis]
* auth-digest: Fix handling when a nonce isn't present [Patrick Griffis]
* cookies: Limit max size of max-age, path, and domain attributes to 1024 bytes [Patrick Griffis]
* cookies: Limit max size of name and value to 4096 bytes [Patrick Griffis]
* docs: Remove references to old libsoup domain [Simon McVittie]

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/commit/766e17528251c9b696a6076300ac61adc95536ac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.4.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.6.4.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 4d50e1353e..fbe9a79b0f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9b54c76f5276b05bebcaf2b6c2a141a188fc7bb1d0624eda259dac13a6665c8a"
+SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.43.0


