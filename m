Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121E5C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:37:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.93969.1738604223265037286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zc7/oFo2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43675b1155bso54924605e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738604221; x=1739209021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMTDl5W98/q4piPa5WH3jhczhUAztV/YhSphNgOgG5A=;
        b=Zc7/oFo2nXGqgcjvFONXjRziUzwE20yUIb7yErkoHh0h+lRn8rQYXyCa9DAJqnYUib
         /FNnDXNux6HtVmmCGcX06hOsDj9rCfrCikWwe5AA5JZjk6IuEJTKyYkV5U3yJis9JFPx
         l15T0UskFzKaOsHK//VaOKuDjJe3SHS5c076E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604221; x=1739209021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMTDl5W98/q4piPa5WH3jhczhUAztV/YhSphNgOgG5A=;
        b=ctUJtYAfazbN3zMKK0+2k9YynZF/8YXiPeQOURDO2UWxnRbDiFT1su4VHRbYogUMp2
         jXLZacaKMvGqx50+Dd80K9ATUEz5EqLeWcAplLF+Jr35r1oiJ9F9ICRTTkZsSrG7Hgq0
         G4QCyOtda3ocMbMGvCt0rMWuGU1KV9be+GvnxVF1jt++am0eb4CK2orr5kTcd6bhe6tS
         X557eH1n3qEf8GJhQvdg/M7UaFClk3RO5opAtr3h9CY2rCAImlqkwBq28UsmI1TjcHdq
         fIUl8iyf5hD/t53PFw0lh4Tt7nGMbi400Ouia6iRTapxnzl4imf+BclfzqPDcVA6T5yd
         MQtA==
X-Gm-Message-State: AOJu0Yw1uYGWBvOqGPy32InzgDIcQjtnq+varzf6bzK2g3/2bJHm708V
	3VRj6E6uQkOcg2CcgCjYiTQaPcsEv/npWfuv7HNo8jyqx1KvTrgX7uDYvQ8SVfeo3AgBrAD4vKG
	t
X-Gm-Gg: ASbGncuYogeVnenV/p/05a30Y84yknCbw2gFPPWRb+Trlq9bB71NfDBJxWs0cfT23Lf
	o//KT4L6teSasA7niyRkNOARgOgYBIQpIAG43eXDF0SZESIiVjeKi5gSxP2TrFpcUmUFKo2ulE/
	KwK+shC62tjJ95cPUeqlghmucrwG5J/jKdeU9Wsa7qxBpyDM7VT1hoYq8jKLZNgFoza8jWHyX4U
	4+iC/VxUUBdpcOgDssjvYAHToI9mVUzYwA6y1G3ssGXyEzL9h8yA/JYMCR9fPOGjVYKpdloVAj2
	/roSaQ3BSzzbEjLk43XdCnkaYlWogyXnq7L79bGaTjr9
X-Google-Smtp-Source: AGHT+IFEOTExQ+DakNpc6usyUCjAAIZ8w+oRerJnia+p33U2wzUX7CfLxDWtKmx1fVXLPCcmCbKCFQ==
X-Received: by 2002:a05:600c:35d1:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-438dc3cc9f1mr199771515e9.17.1738604221245;
        Mon, 03 Feb 2025 09:37:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f403sm161056515e9.25.2025.02.03.09.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:37:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] lzip: upgrade 1.24.1 -> 1.25
Date: Mon,  3 Feb 2025 17:36:55 +0000
Message-ID: <20250203173656.3412275-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
References: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210723

License-Update: FSF web address added and postal address removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/lzip/{lzip_1.24.1.bb => lzip_1.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.24.1.bb => lzip_1.25.bb} (88%)

diff --git a/meta/recipes-extended/lzip/lzip_1.24.1.bb b/meta/recipes-extended/lzip/lzip_1.25.bb
similarity index 88%
rename from meta/recipes-extended/lzip/lzip_1.24.1.bb
rename to meta/recipes-extended/lzip/lzip_1.25.bb
index 6eda0127345..590e35cb75d 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.1.bb
+++ b/meta/recipes-extended/lzip/lzip_1.25.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 DESCRIPTION = "Lzip is a lossless data compressor with a user interface similar to the one of gzip or bzip2. Lzip uses a simplified form of the Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize safety and interoperability."
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     file://decoder.cc;beginline=3;endline=16;md5=18c279060cd0be128188404b45837f88 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162"
+SRC_URI[sha256sum] = "09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"

