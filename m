Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A21BC5472E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.9390.1724319336246273233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXRiZ7c1;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3e2f07f41so5544551fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319334; x=1724924134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk4p9meaxucn1FnlTR5lI1q7R3ANtMpsSae0MgVPWHo=;
        b=nXRiZ7c1YkJqMa0iPpeeRarisEQ6dRjyqJId9A/68TN19VXBsk+axApr/Q94Xn+exl
         rloSnIo57KzQQUGbSmPshqJygqtlgkHLU5S63VrcKdsOjHEE1RmOpCy884qyI+lz/tz2
         rOjnmJq9nLSGC5fTmsxT7M2cSgvPpFf71MiBYzz7rlUfZzT/VTgLA2ml5OX0T6c3BRLP
         Md75TTVT4zQy9jiJ+YaysTCQ1WIWtwVi1DpIwcVHAeuMrLS/GpkGWtii6hk7NUwH2jXm
         fZJKTfHvwLlq1iQfdQTyxWgxY1E/Y9/NmcKCd2jWiAsdl7D1mu3UYAwF1kasdj/8PCDn
         GJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319334; x=1724924134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk4p9meaxucn1FnlTR5lI1q7R3ANtMpsSae0MgVPWHo=;
        b=RR6q2B7DjY/PDdFR3FYtU8k4oN6szE18p6eF8VDERRQQfPYqk3WKAgFcRrU5LI7G3b
         yyEvNei8vcDwZEvIdXBrBpAUfS9NJyW+ZQ9Gkg6nHmJDmCS01WVtqtCVNN2mkUFz5og9
         vaxcEX9rZ3yBuuKSjKoeT7QIXe1VIdRZQ1DOxfASUiFOLk0ZeCH2QMgZO4kGC8XcM8wl
         QN91VM7OMXMvjVwfVaQ16NSbPg6+aRoq6r2et+sRxID+le7z6pptG8ZqX+diBscfkCP2
         ziu71pezfdcHP+DRVuYsPZ9g7dAy422SiR5WNFk18Ra+2aMYdkduqSRWKWW/4LDLHPuc
         12Eg==
X-Gm-Message-State: AOJu0YxGMLsoCZ1BxTtLNpj6LpAiWFMaBYB4eIZgtroPJT9NegCYKYZu
	yz1WVmrp0vnCfeCWZoNW+/8kZqYjKxr5tJK/O6AHo7p7PdN/WinJ5d9Mmw==
X-Google-Smtp-Source: AGHT+IFFzf08hEucm1vM4nHEqo/bPvNc5CPqijhBVcXDN327CyerEJmwBSvoy85W735h7M2aLSUYGQ==
X-Received: by 2002:a05:651c:151:b0:2f2:9dc1:af33 with SMTP id 38308e7fff4ca-2f3f88b866bmr33143201fa.19.1724319333914;
        Thu, 22 Aug 2024 02:35:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/32] libedit: upgrade 20240517-3.1 -> 20240808-3.1
Date: Thu, 22 Aug 2024 11:35:03 +0200
Message-Id: <20240822093521.36790-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203629

From: Alexander Kanavin <alex@linutronix.de>

history.3 manpage is no longer installed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libedit/libedit/stdc-predef.patch            | 16 ++++++++++++----
 ...t_20240517-3.1.bb => libedit_20240808-3.1.bb} |  8 +-------
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20240517-3.1.bb => libedit_20240808-3.1.bb} (67%)

diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
index 75ef308fad5..0ce6d127a94 100644
--- a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -1,13 +1,21 @@
+From 32918b3a91d9fe4719bba78a44ec3262a2994e68 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jul 2019 10:48:19 -0700
+Subject: [PATCH] libedit: Move from meta-oe
+
 __STDC_ISO_10646__ is defined in stdc-predef.h
 therefore include it to see if its there on a platform
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/chartype.h | 1 +
+ 1 file changed, 1 insertion(+)
 
-Index: libedit-20160903-3.1/src/chartype.h
-===================================================================
---- libedit-20160903-3.1.orig/src/chartype.h
-+++ libedit-20160903-3.1/src/chartype.h
+diff --git a/src/chartype.h b/src/chartype.h
+index bcdb293..92327d3 100644
+--- a/src/chartype.h
++++ b/src/chartype.h
 @@ -29,6 +29,7 @@
  #ifndef _h_chartype_f
  #define _h_chartype_f
diff --git a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
similarity index 67%
rename from meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
index f8fa871ec98..932e5a1485a 100644
--- a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
@@ -13,12 +13,6 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "3a489097bb4115495f3bd85ae782852b7097c556d9500088d74b6fa38dbd12ff"
+SRC_URI[sha256sum] = "5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f"
 
 BBCLASSEXTEND = "native nativesdk"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE:${PN}-doc = "history.3"
-ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
-- 
2.39.2


