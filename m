Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB00C5AC75
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.8035.1650463735371662679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aJu4jg7i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id x1so2044485pfj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5TO7kdEvI9cbjWc60FppgLvgE/dRu7JwduMK7bqc9bQ=;
        b=aJu4jg7ieb6d3HM7hgHLqsieD9Q+vN6UJjwPltDM43IKrObBNXwpNZo4B5TKiYd7ae
         r0FQbNX4RfxEf3hH62Otozlk8+rw5W/Y2llY6+76Z0FRlRLleEnVuOA/jxwS/pDqN80l
         WWZq15YRqwqMRjMcZosh8wDpwbqIIEkPNacEoJ2iEVnUamrLEpCmA3PO2eEBCHzum4+V
         9F3RV885CcJJ3wbIlFOpalBF8miCPVMjkinSLLk2+Parg+l7j1m9af5vwK2Qjki0YHQK
         ySU/SjeRY6KsTuOcSC8PuGfz+urmQ8TVNhSqdvkcIq/QqEOtTtu4p1YJLkfGZzl6waL4
         kmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5TO7kdEvI9cbjWc60FppgLvgE/dRu7JwduMK7bqc9bQ=;
        b=GYU8jlSjtGMvCmgFVzKtXmuJT+kL+iCC76LLUmwzpaOhEEPnYdc9Mh8Aws5Kty4r7X
         eOa6+Icv5cZPTM4qfAEDUdY8sU4/BlxhrL/oyOWvPbju6BYqEvWksi2RcE4Ggstrn4zC
         SNCoKJpaUkhb6/k2JPaFCKU+qeKIDgK2NlofLqNHr3yr5vYOyGEE2u+2XgQnSlpl7CuO
         eTE9nk/LgCckY4F5YxGZA1u6gpmRkectOgI7EaSbO0j2JwQgwbcfY3/MhCqbaWCQbesW
         V+U8hHmZ8FByguZSQZAGaZKa60GxzHppf4iXmjIVxAUoiYEjK8OEGJ/jrZYgdCoDXPwx
         ZLHg==
X-Gm-Message-State: AOAM532ZemdaZ+21sGQ7kgriwTyf2JBnUN4AlM+hKPBZHE6UeY5guD9d
	eEXGdTRGwe1pT+equS9AitsWDEOq/FiWlVm5vdg=
X-Google-Smtp-Source: 
 ABdhPJyqms1lgiBJLZlo3KzlnYeOHYX1moUmaGDrvuK1AnqynZ1nYGgZPnADCRWa+n59zhn/uY2v6w==
X-Received: by 2002:a05:6a00:17a0:b0:50a:99af:48d with SMTP id
 s32-20020a056a0017a000b0050a99af048dmr7613109pfg.64.1650463734475;
        Wed, 20 Apr 2022 07:08:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/27] gnupg: Disable FORTIFY_SOURCES on mips
Date: Wed, 20 Apr 2022 04:07:56 -1000
Message-Id: 
 <99004032cd4a21f0b3e626334cd4437c4f02e258.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164676

From: Khem Raj <raj.khem@gmail.com>

This is a workaround for issue reported with gcc12 [1]

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105234

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b8259e070c582d0c566535a3559aa712148efc0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.4.bb b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
index 81361d902c..d27bddb8bd 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
@@ -83,3 +83,6 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
 
 BBCLASSEXTEND = "native nativesdk"
+
+lcl_maybe_fortify:mipsarch = ""
+
-- 
2.25.1


