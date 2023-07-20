Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7335C001DE
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:25:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.1547.1689870340083170282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=eOASSikf;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3143ccb0f75so872555f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689870338; x=1690475138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wFmksguCz2dvcuDB3mnqvDRn2C6B0rrMPstRQjpkD8=;
        b=eOASSikf2Sf3umeZ67LkJuc3HD4nFliB0GsZ/2Vt/uapxwwDISrqqAzygB8YxXkXRw
         BquKiDjCSY2DtIa9ykrnqrVv1SN1DfaOcQ9HRoS0+3BrfjF0y2tHkZRNms0A9ywURJT1
         tWQ+6Jnaj5emCnqOe9RismjcCFA76qaj7cRMNZKoOun4vldvPqYU1OG6nxJY5Obz4xAn
         4mxSfb+rg/OJs8UUjOexE3cvZv6M0Lg+rrVcNk6BBwlZBFTZijOn36Cv+KPHg7lXF7LM
         i5CZXXyXyCWwZyARw5vPJ4nfyo5u/ke6jC9aXyyDmIkCCTJlGH3GU1abVISxqjVjo8Ib
         GzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689870338; x=1690475138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wFmksguCz2dvcuDB3mnqvDRn2C6B0rrMPstRQjpkD8=;
        b=hwLRTaZnuh5p4MV5NFvG7xIlGXpGvtxXnMvF4FmGnperv8qbCrpFKRWT0ECOn42Rk7
         fuAYIspy2fXaBpolmVFEyWu9YXF7y9IgQrwVkPb2FKhpWg3shkDrkiVdn8J9QyUNUCf3
         UG52YK6l1STSc11Gx94FAgIjlQdFSNqjR5kawcnkKbcQ6ZUPAQv6Ka+mLE/2FmIZ30Om
         Stsy2ByzicPJqvKLUQ0GfNoseS4ai3D0lwyfgPPbRGoJFnSlKmheOj4d9YXPLB28FJ6y
         +TPE6120MAWOUOlGYkGgTedzuhaxoAq+t1jwMIFQYADFpEstFuixZisTBNHyB7Kl0yTD
         +P8A==
X-Gm-Message-State: ABy/qLZBcmf3mFxK+HMiPWa0+2R4NCwlFWW++cIzfeoptiBb8nHOmE1C
	3e1zYg58nycFawAtDCIgSWjExRLftW9meA==
X-Google-Smtp-Source: APBJJlHeOI0rX6l9YM6+peQkK/wOhAufHztLTrdHfD19sP86ZgHDvIbvt4udHW+2wbilPym8rp2hPg==
X-Received: by 2002:adf:f384:0:b0:313:e520:936f with SMTP id m4-20020adff384000000b00313e520936fmr2743147wro.17.1689870337805;
        Thu, 20 Jul 2023 09:25:37 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z8-20020adff748000000b00314374145e0sm1749076wrp.67.2023.07.20.09.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 09:25:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH 1/4] jsoncpp: extend with nativesdk
Date: Thu, 20 Jul 2023 18:22:59 +0200
Message-ID: <20230720162535.116519-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720162535.116519-1-peron.clem@gmail.com>
References: <20230720162535.116519-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184645

Jsoncpp doesn't extend for the moment with nativesdk

We will need jsoncpp in the next protobuf bump that will require
that.

Add the nativesdk to BBEXTENDS of the jsoncpp recipe.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
index c54dc9466..086615649 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
@@ -22,4 +22,4 @@ inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


