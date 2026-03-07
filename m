Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510B2FC9EDA
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 06:46:14 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4555.1772865967301127709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 22:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=axefBtHq;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35995cb33a8so3430978a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 22:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772865966; x=1773470766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYVviTjyYYCr5qB0GbU+1zR/4WBHIF5u/29kR41AtaE=;
        b=axefBtHqfc0KkNkXNmTrPzZ7un9ZVLuvdqhbwVe/n2RpQdXZrKdIJf5c309TpPthmv
         HhmeOEEVd4Q+91emFyMeJbA00gZxo5TUbi7TwoDrDPewXZSboh8J/c6Ha9+VbdLemUJj
         BZ/rwcYVaW8AfiBjYY4WGMAa/sjmwZTGA+rCFp9rDUcauE7Rc5EUm937m2n6SeMDAL6n
         Wkn5452gKU13NYjwusdnoU78uA/4IQ1AkQnIsdwRijkPWPgcRCXt3lE1ySLoBcFBvpcA
         LdwDniILWH1y8F5Snm1OTp2GRzLI4qRJ1cNQT0rg3Ef6ILHf8IeeE0ZCmZYLQ52FkQph
         hCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772865966; x=1773470766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYVviTjyYYCr5qB0GbU+1zR/4WBHIF5u/29kR41AtaE=;
        b=UYfhvADZWt8yzi7EdIPjt7VzZccJMGiP7+uu0b14udViUoG5BUmHCyrzluwPMWaqkC
         96oXfKVvZnlhY2a5x4uYLncbb5VnAYFSq5QwrmdMze8kWNY/yMNr0IQ0/hsKVyjucJZS
         tIEjcVCSuD3rg8Eb+km+uJYtr+fHejHrWmLnkUjK0kGcQU0VAVcD1z+Ep5aRADbKWWNK
         CgmeKBg5vYcE4xKb4bDNXiZzEwf4f0e8e/FwqlU11oCBX+mRiNso5qcUgD+/EKggC4aR
         CJ3F04Ut+KYCU/Z0gaoDEX5+RFLmSPXXCwZb1O5t51agYjh9AWd8kgFz6iuuqstDYuew
         I07Q==
X-Gm-Message-State: AOJu0Yyk9xqi6LGrgWBZZ15EaI1Os+ln4nofFioh6YVOR+rH3Y5U2z0v
	PW1E6F7av2IVnqxW2lEguhlFL3BO32gHdPPn0oFumaQxU8ut8f2/osCwQempJ9Ta
X-Gm-Gg: ATEYQzyDXPnw+POD29OtQgPuNQYvUPaJTNdcNPwdJe+wgp4eUuQoczi5Pkav3CsMyob
	Mhu1lDLKDjGUHf/mV8D4Ddl+Iw9lCsTkA65l8+H5GX9KOHO5b+wH/bGVbHmsIwGRI3rZXttpysP
	ELuAUL1WAce5ZIHZMEzMHhbxWwwhAoy6bOpLxufV0QXm7CAhdBq6hyu4vy+mHUCKHSpxdcZTYmH
	12r9GGvDE2FoPTkuFuAd4ykYfmulQ8deuVGegZeZtJKk7foUDcWewXo8wxWZeVAByGwo3hbofHZ
	IGI88MPey3on/uqx8OAdhPJcLuiZZK4rpCFcIr1yaps8zOBk/pDlcZmqem9S9XJTsEeAeeuFwx6
	l5cMsvPi88+h2dNf5MIgoUwH9nEYYy4X0Blbb+QFfA6gy8RVDMOJREwfxzhqteB/rroGy/raukk
	7AFxBvwiuHqKVK2Tw9RPW4zEu1EJv3fKUeMA==
X-Received: by 2002:a17:90b:4cc5:b0:356:22ef:57a6 with SMTP id 98e67ed59e1d1-359be394541mr3924517a91.15.1772865966478;
        Fri, 06 Mar 2026 22:46:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d50ebdsm7053261a91.5.2026.03.06.22.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 22:46:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 2/3] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
Date: Sat,  7 Mar 2026 19:45:39 +1300
Message-ID: <20260307064540.1257672-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 06:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232605

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f86c38b13121788fe6a654df04800d24b2b28b61)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 68ae3b0464..2f7c816043 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
+SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
 
 inherit bin_package allarch
 

