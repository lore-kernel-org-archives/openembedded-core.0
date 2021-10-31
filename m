Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349FCC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.32826.1635699483521868462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UDCkFqZv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id i5so10091816pla.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D7Oof50XfU2x2OGXxLik2wLStwb9qi2g1NHFEFlUrpQ=;
        b=UDCkFqZvv8cA2J1z8b6tWjKHNTqSfzVxaSrE3Cb2uWY/v6AuhGJKr7DluNHqTP4SAu
         fhapNGS58GI8T5cg0OAFybKopM8i2a7PDBWthpFg+Ux7i0sJ14xcBexFvNBszIGPkkWr
         9CRunF1ajjHU+xyx3654iY70nWde7KLmmMqd2JVPt6ORmiMnf8ST03lCibNbMND/rRu0
         sPXDZidTtdD8ZHl9yHTHVfsNXgW6/4WWpAaHPzMjidGM/dLoCX7YOG84DOrmmJiz0rDM
         TRHmQaylbbXAFiM7H233SBKK8UGy9nDtzhFA0SZJ2FpNozxRRBh3O2qoHiobyrEGU1YA
         gU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D7Oof50XfU2x2OGXxLik2wLStwb9qi2g1NHFEFlUrpQ=;
        b=7Auc3+yJWPtfYmHZWEGvI2N7IhP1T07TTSALAjCLWMyukzGt6nF0ES9xeH6cX6tRNo
         KjZAQT/CPZ5k2dSmNLiBmwnkvmt6vpXFIBpnfzZu/YU09By9oEQjf5onHLdhL9y9OXVH
         kPnMsILwpHyW8A3MG4cuXHgmtV9SyTq0RCw0vvnq+JkLYRtpyvQ7ranuACFaOuIgyUtI
         IeeYfj6l4zgo/PzJrrEHixIZTuA4qfgy6J8czXXhGo83f21omArb9/wIGzpmlQCNV/Fo
         8JsvjiSGhTgVBoClJ+GoZmeFFNfNRq7LIOH+rYpBUHPYdhH9kJDEBU+bKkglW8M91WnP
         eLBA==
X-Gm-Message-State: AOAM53157uR1Na+1Imz+0rJ75oL+4O/wAuwV8B7FEp+Hw7qoSCrDi6nA
	fNOIverNjLgELLLQWByGdawSFOkU4lziLzolzSY=
X-Google-Smtp-Source: 
 ABdhPJy9sFRLDrWCM2kFW88puGNTvELCwPJayfcue06aFNahYoN+fqj9LqhgncznXO1vc3xfSQ8O5A==
X-Received: by 2002:a17:90a:d583:: with SMTP id
 v3mr24718833pju.216.1635699482548;
        Sun, 31 Oct 2021 09:58:02 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/29] curl: Whitelist CVE-2021-22897
Date: Sun, 31 Oct 2021 06:57:20 -1000
Message-Id: 
 <543a72e115340f3a7378b8b85bd48a0b495b3919.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157659

From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>

CVE-2021-22897 is affecting only Windows, hence whitelisting this CVE.
Link: https://security-tracker.debian.org/tracker/CVE-2021-22897
Link: https://ubuntu.com/security/CVE-2021-22897

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index d7ffb2dc50..bc1b993e9e 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -34,6 +34,11 @@ SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a5
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-22945"
 
+# As per link https://security-tracker.debian.org/tracker/CVE-2021-22897
+# and https://ubuntu.com/security/CVE-2021-22897
+# This CVE issue affects Windows only Hence whitelisting this CVE
+CVE_CHECK_WHITELIST += "CVE-2021-22897"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-- 
2.25.1


