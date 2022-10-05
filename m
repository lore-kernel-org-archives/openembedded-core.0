Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C725C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:48:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.22091.1664966916967608471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lh18nxPu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: david.bagonyi@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bk15so25337894wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDoxQcowySb5yxSAVbpagx3GgyNxVMokliUTxl1T+n4=;
        b=Lh18nxPu8Wx6cWDFEqowwKtQHAeTGp2EyptMnGd9xNwG6NZR5iWT7PFWraaJQ9U/yV
         qC4mLZ27knbIrW245wX2xIpFTBFIBpxySIAuoR9S1VHaaS2HkoPPsqFs0a0zrz02Xau0
         Y6PA2+cWUcGqQuFAaJJDmx34Xne9vts64JSIcDv7HR45Cbw1+fqxEK2apn8k+XgFLjtr
         BEayPpvoR7TzEqTcW9LuRDWWCeiN2acvBH4MdMzTM55i4HK0vqoGe0lvVY0wZjMaRgoc
         cAbG4CktJA20cRFipZfdo2+7dfWmpIqIsFEbRtTkgiE3x5STLJ1ZiBneEu9G1ypMBrK2
         0mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDoxQcowySb5yxSAVbpagx3GgyNxVMokliUTxl1T+n4=;
        b=waePc+dQKDKadGi15kawkHijJFID33SMdKocY8YGoXDCF0EI4UPwnBgwD3xLRyPwWM
         gXTJc7kqXeTAIFnV1Ai8ptiacM8BzCuuHoiCjzu1ak6PiXW7Nvk+H2cUD7p/7eDYRAS6
         egpKk2jd9pYEtnKsR5ZSi00KgfRVs4mfvjrkGY/iO5LHXmvav51GNJXW187Vwoy+bcWH
         QKVpssUfb12JTs8rrmkWeVwUgK+npME+gWKC1EMeSV4KBwVbIOYJV709GJisqScLl4E9
         qjPGT6x7uBpVLMjFwFhg+jFpp5Tatnln/e5Ag1S1Ifkh7sLd86fqIuAIK+CrJtZs2uSS
         OB8Q==
X-Gm-Message-State: ACrzQf1YJn0nCvxip2Sk+3Anegv1PxOSvBfBHsb50TEmh6cS2gxN1+Mg
	imvo0BTmBG5UA2SaUqxRVnX8PuvjLLBC+Q==
X-Google-Smtp-Source: 
 AMsMyM4dnA4jqGLTpo8dLolN9Mrks/Jd26zPab4V+luBMHI+Z+e7aCnzJ9FwBWKhGQk0gOjr/PobBA==
X-Received: by 2002:a05:6000:1cf:b0:22e:3ef1:a268 with SMTP id
 t15-20020a05600001cf00b0022e3ef1a268mr8436943wrx.43.1664966914947;
        Wed, 05 Oct 2022 03:48:34 -0700 (PDT)
Received: from ip-172-31-10-113.eu-west-1.compute.internal
 (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b003b7b36dcb8dsm1505985wmf.31.2022.10.05.03.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:48:34 -0700 (PDT)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH] gpgme: Allow setuptools3-base to be excluded from the inherit
 list
Date: Wed,  5 Oct 2022 10:48:10 +0000
Message-Id: <20221005104810.16863-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 10:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171454

Inheriting setuptools3-base adds a runtime dependency on Python.

This change makes inheriting setuptools3-base optional. If one does not
want a runtime dependency on Python, they can remove python from LANGUAGES.

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.18.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index ca9c6cab14..af5b176363 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -50,6 +50,7 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
 PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('LANGUAGES', 'python', 'setuptools3-base', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
@@ -59,7 +60,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig setuptools3-base ${PYTHON_INHERIT} multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
-- 
2.17.1


