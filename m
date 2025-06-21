Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5AFC7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:44 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.8236.1750515814212393764
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gqfSIeFh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234d366e5f2so36959555ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515813; x=1751120613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm/LYVXO9ebnJpfn31zHFUExC8UhUpA0bojnZyrmHC8=;
        b=gqfSIeFhu7ZzamQo7NSuz4B8RhI7du0rcONGsCp5qcjSWKsqxlWP+DFYNIw8stbXG1
         N99ngy6bNedHr+rI2ThOSbZtxxPn/bDArfx0AjF1/ViAGckKlTeGsdrJWishobWcJdBA
         nr2QRE57Sam9cua4e8D1E1xIcWPXn+PEMpT5M/yKGSsqQwwbaGdXe/ewGidCiNGBAGqe
         MkBfL9tBwzLEd0SXKGeBOXJffa+Jw8jHhUqoWj1DtXksKU9gYWD5DvLHYlfdqQJB55Cb
         ccIbpRJ0O3uJQZE+akD4mMM2AC5APHkZmZooobEQKoAKFDo2KH+X7Q2BGJGZRszd+STe
         natg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515813; x=1751120613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zm/LYVXO9ebnJpfn31zHFUExC8UhUpA0bojnZyrmHC8=;
        b=LZmOwrBBB/iHkDhdkEpC7VbNgKlAxRcrrC/PbMwGSxVz9sOx1MeUwk2Da7HNRYKFFf
         FGrIrFfbekTH/PhZw9+1rgKkZFZJokETlxsQcakUtnDCJHq11YyO69Jx1Qv06nSNbSlM
         AljXsew8Wr0a7cUwOPKCGG09J/AmXyaTkBRi2ASBKmLzRxF8pKTr2M6sKycCIcbIDAWG
         RUy141FFUN/87S58tAT2XTkNWl0puL3WKU6nqPCssedrGqKyhX3UKdTNVnIAkDaGYVJT
         wj3R/bQdUt1Hq3oywUQnBZHTBuaSZJGz5dfXL8csGV3N07aUh41yszlZ0rpdvA4KWH/s
         ux1g==
X-Gm-Message-State: AOJu0YwVhjtp1WnSj8hCLYKkl4FOa3frRDS+WVr1x9MssLsjBahCP3oq
	8L3bxEodGryiEbp0SkFSJRufaztVsnN3KtD9xaoG2/Ra1JDpDzEggrqxfRlqXLujZ55FjB7eIMt
	x9AfU
X-Gm-Gg: ASbGncujDB17a5T8+/aq/ygpfpWKmEWilu2CWQzhL7CsCaWsr1al23jM80DH0upGZ1u
	J54uAzvx+D9xvYx6nyAfwQ9sJshuHsn/nc6ENZ8eUsI7ww/KDGdNuKwvzf2mt74UqHzBvU4S4tJ
	a6KS1U8o8ZzWgPPgK/4p/NCCA8E6YqpKGP4KI0oU+PT5z1vTs69Ahh090ORpabEY+cyKLheIwbf
	I6pdtUqhGyjOSfGV/HXwBEuX1fjMHWBp7qJbbgb+qn9qZhoF1sSoJSn2KiRISA3jxhiEvnBWZLE
	oHFlCZxMoEeZMGDKixZ4U2WYHR+oKbx0480TC/g1TMxWh1ugq74gRA==
X-Google-Smtp-Source: AGHT+IH+o7H3LhfH3pRvn5fGUziCgIahT2OOsbWFNiNEKtvk88ae4LlY4w2p4Uv7wLZ2eyPpymCJ5g==
X-Received: by 2002:a17:902:ea06:b0:235:129a:175f with SMTP id d9443c01a7336-237d99362b5mr104441905ad.34.1750515813479;
        Sat, 21 Jun 2025 07:23:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 6/7] ghostscript: upgrade 10.05.0 -> 10.05.1
Date: Sat, 21 Jun 2025 07:23:16 -0700
Message-ID: <01842999c13f5ba5a020e7b5029a3bd059c18f4c.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219164

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index e937f04cb3..fa6ead0cd8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
+SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.43.0


