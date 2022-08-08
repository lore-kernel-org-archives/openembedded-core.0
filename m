Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7E6C28B2B
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.22453.1659940979307697595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FoAFrrRj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id tl27so14848890ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+1w7+YuPoiKyV/uqQPBGNzNsqZxINdjC53XQYq99JJg=;
        b=FoAFrrRjpKq4gai+KUA3ry46ugexIPBCZcpDnADe/2Wdcei6vM8W20AUqb2fP36gou
         vdZCUfG5uJkuD8+z9arzl44ZmtwiL4DhB/ymnoD1zLLoJxUPhK+5reXHyWZNiJDFKqD5
         xQijHMF1jgNQyXqQIlFgl3PvvCNFIn4ZT1L3bqMNEyN/yWZ95dPPZmV3j+mNKoQmW43p
         HYTR2jJ5nBKlZ+7kaeb+uxvLR9hatBbxOTNEm1+cHZKHKzyVrQeJD+6k/X3w2fXKnSCs
         ex6Uzua1AfjvHD5CnjcR2lkBkiaI0pljBLRSqYYAY7kW1mN/nMMUr2aEId7fS6jiRR/2
         27rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+1w7+YuPoiKyV/uqQPBGNzNsqZxINdjC53XQYq99JJg=;
        b=eOtWoq1Jor4XKfHjsG/ua5i74rN9wMWdnGbOJ1Lw5nVf582Jfif21kCIOYw8EN3CYp
         8XEhkhZHmey3/9Hf0IJvARsYnlbjScNKvvE2NHNFpZBbr/j1mngRV1HO/VBxsYWInjE0
         v+REBLXMmzIEqhI+31GB6KUnznDUaTXmJgH9Khc8OxM9eG0o/QktwH2f25CpJoqw0L4v
         gM42KlUSJhw2uL07p/TFxJs5QrfeSfoQTNMoEMRSAjqkfP754UK+zUARSROBXFtn/DHt
         OmFAAZbljE4422LfZNANEUMfN4GQ7SlN5D/jZD5ujECJ4hIuQXbUfDzQX76/UU9Proq8
         nI0g==
X-Gm-Message-State: ACgBeo2gP9XCPmJWmRhMpxe6jnixqvDfHc+ETBof0ReXHfd/fMSFSY01
	wOn0vPfivw4BQEJtBqSDWQnQVqnc0TY=
X-Google-Smtp-Source: 
 AA6agR6bmF+2w4zk7Msz2yrcbFeyW3jOLZU6x7sgaNbJ8XsFnrlrXwrZwer2FUWkUr8wsSHr7tLvAg==
X-Received: by 2002:a17:907:6e8a:b0:731:e3:6da5 with SMTP id
 sh10-20020a1709076e8a00b0073100e36da5mr8864916ejc.418.1659940977945;
        Sun, 07 Aug 2022 23:42:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 19/44] iso-codes: upgrade 4.10.0 -> 4.11.0
Date: Mon,  8 Aug 2022 08:42:12 +0200
Message-Id: <20220808064237.3975347-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169044

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../iso-codes/{iso-codes_4.10.0.bb => iso-codes_4.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.10.0.bb => iso-codes_4.11.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
index 857fe463ef..be573981b0 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "9a6c24ee40e737ab34273c1af13a8dabcae888dd"
+SRCREV = "2651d7fe65582263c57385a852b0c6d8a49f6985"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.30.2


