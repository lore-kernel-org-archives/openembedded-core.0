Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D6FCD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:04 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9506.1777739452534595338
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H3GsirAK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1931607f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739450; x=1778344250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brlFXl9LnCIkJ/SsmyZFgLCq4DvgeOTBwHMjzT9BeoQ=;
        b=H3GsirAKn0t7hMd5w7ThHHpDvwe9vPUcilNRUrPu0mmErtxBCjBRNcj0Os9JnEHOh2
         V+SIdKm6fIgpIMPBa7m/x8TQ0dUX9sVWCcQ4Y0GnDIeDvx4XwEkbOJlhpcMT5zdqyv7k
         zdlH3GUZk1WlGqcDUePdfJMUlrms3iX1//kJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739450; x=1778344250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brlFXl9LnCIkJ/SsmyZFgLCq4DvgeOTBwHMjzT9BeoQ=;
        b=NTJfZkh99NbjTYujix1e0AQY2gI5L1NHEAumKlTzQy/78e/DNYUMRIALHOjmC+bfme
         nkz2ycF72q4mfyRFfsaszymPr+a6bC4tBf5T1ZBv1EskHV6M2qrw1I7go/U8ABMTcPej
         3x+7PGW6W/f8+2K1MkfBz+b5IeG0KYZYfZPrSUWGm0/SkApRjIuowF3PQCRpqmR6Y3Bo
         TkaYB5h7bm3xOoaB0BpY8JXI8QXh48mRv1dlHaliGhspexp6KD/etgC0tyOWvKZenvyP
         bI7fhDXni9TlHcam/kWFFmGb2+gQntoYt/3CbUQMwntWwHTp0HlPIj2yoc/BOXtghaxL
         W1BQ==
X-Gm-Message-State: AOJu0Yyn/SXcP4y5tJUghvlabyPoJE6V97kFtbBRjj8VxFU22oGv47rr
	lNQs+SjWI+4kinnnx49u7juDlyV+7Egpnsk9LX7/kH+ad/DQ/+rsTt3Hdnul2i0b9RgWlAHiD7M
	NeJfM9z0ukm3K3u0fkWMmvPKp1OSH0ETJF6S+IplX1Xu3StBEHC/Obe3+Twe7EmCcEiiFSKN/Ra
	oAulky8jzOmUMKoCs=
X-Gm-Gg: AeBDievS3Wpqu6ryV8WecIiw7r1lT4ooooc4YLPhJwL57piq4QUD7fV+eKn/psHfxiL
	jwDtKKO/TSpe7bPeh1kheNKehLCJ7yjhRal1OFeAG9lLF1ZIHDHwyVTC6WIdCY8fQh8FAsC6iEx
	Cyy6JGxxnomUlqxTUJ+97GcX+7PYcSisah1Cb2qaZ5EXJksmFYMJlaaBbn/s5Y0LE3zWmXrVxoU
	bQxG102kMeogaQ0zgk0BbmmaEjhZQ03oLTi87DSvTC9TH3yHpakxpDcfOaJ5Zrdd8zIMYYI5cOX
	0y2j1SPHm8R7RZJPo8BhVsitlTABuZD4nljUAkXSHKyLJ2u45L7R4D4ieW9RFOz9OzX0sUuOwq2
	bqqb+T49J4amelALk2HkUCU+Wno+1j45QgN4yKnbZQU1OM8c0vKGUx6gSfLJPKlNrQB8ljftLQp
	a0sCXPVYTheZmz2BpdhQJwtgdrUvPOfZy8Lqs2aLAcPaqtUQAiMgny70APQdqHljI=
X-Received: by 2002:a05:6000:2c03:b0:449:c5e2:a8ad with SMTP id ffacd0b85a97d-44bb34e71d8mr5932483f8f.11.1777739450425;
        Sat, 02 May 2026 09:30:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 38/62] python3-lxml: upgrade 6.0.4 -> 6.1.0
Date: Sat,  2 May 2026 17:28:58 +0100
Message-ID: <20260502162929.1377831-38-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236347

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-lxml_6.0.4.bb => python3-lxml_6.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.4.bb => python3-lxml_6.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.4.bb b/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.4.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.0.bb
index 1257534c0f6..b7bbf5c3d69 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "4137516be2a90775f99d8ef80ec0283f8d78b5d8bd4630ff20163b72e7e9abf2"
+SRC_URI[sha256sum] = "bfd57d8008c4965709a919c3e9a98f76c2c7cb319086b3d26858250620023b13"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

