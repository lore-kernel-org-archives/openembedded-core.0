Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B785C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.12245.1641927749315042680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VljabESR;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id h1so165585pls.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NYhWAsVEHPcYCHWV/j+m6cvANsoC3mIsNuPowhD0JqQ=;
        b=VljabESRJ5OOw9tDbTrUBrmfMVxuwtoTLm1iadVNgue38crj8eEIVLy+ThXRjamwD2
         Cp8mQboMJ64krdcBmqj1bN7/OTP0OfMWjA5Z19OxKcoR9SQ62H8UdrXEbX+0q8gZvIfu
         ZhG+0GzLnMK9g6ggbxvjVcCCX0kd45EkciORS4cr3IsnG+PxaYcMs4XswAonqCS9142O
         wP/gHGR+ObJjLbEMKkfQxsHfctR3cFV5mk4qIGAWsYy5LIloj1V2cT37wSbNhN67kR2T
         cXlFUkwEde5UuFo1RH4t5FJbLWxE/hh2P/EALHhKihthCJSXk6MiffqAfWgh8cAqqF+i
         6yMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYhWAsVEHPcYCHWV/j+m6cvANsoC3mIsNuPowhD0JqQ=;
        b=lCO3uetajUjBlRbmW2IK5xXtpiWFdpTYbKrPBSlAwf6kFhiQ1fmCK87efsQtcHuYBM
         QOiPHzH1zbu9U8q6rHJ57WeDcn2fty6/WR0T5prAZw0aryA7fFuKnAZAQ+VUpsUN+/dp
         cunxtgmFekvMOYMowd/ARdyUiPe3Anu1W344Z69J8VVv+lwMCdLHgwQlrqhOiCaNrklH
         FJ90lYtmqLGxgTeGnUiQikJswsliLV6rm5lFGSptG/W1c/hWJUliDWBtxa/1CLXO+5wv
         DpYw3XuG6ahCIRIYxSJ9SOHW477Dwji2uE6Y2MFw4PQuFLHfvBJJTvltkYabIFfwVqVq
         7Wgg==
X-Gm-Message-State: AOAM531Ynmi91E5xcq+H1hxQwvDeXO3v37KU08BIBs3OXsJAupACMMr8
	nSGOvA72ujhw2rfmG3HGczefbq4Pc5M=
X-Google-Smtp-Source: 
 ABdhPJygsgAx3tQjwM3gkOa3bB0qg707HTjzWZsiEAPFgA/SW1qZmYxV2OjynyuWPJ6YbJTg6Ks8Rw==
X-Received: by 2002:a63:6603:: with SMTP id a3mr5092997pgc.578.1641927748571;
        Tue, 11 Jan 2022 11:02:28 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 10/22] libcomps: inherit setuptools3-base not distutils
Date: Tue, 11 Jan 2022 11:01:19 -0800
Message-Id: 
 <e911590d7aa98190cee4b78e2a1f8935095fa9c4.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160446

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/libcomps/libcomps_0.1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index ff6ecc76017..6603275d133 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -12,7 +12,7 @@ SRCREV = "dee4ae37f7818709802de28c4d16fa823bd83ae2"
 
 S = "${WORKDIR}/git"
 
-inherit cmake distutils3-base
+inherit cmake setuptools3-base
 
 DEPENDS += "libxml2 expat libcheck"
 
-- 
2.30.2


