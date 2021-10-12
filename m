Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62517C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:47:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.12039.1634035631404304386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L9qNtqG4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id m22so65722428wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+Ax1BK6wsbxWSzgbCNr1/RIWIwipta1BSPn+F3eGUs=;
        b=L9qNtqG4ACczrulaLyG9iAF5+f/3fOxcmiFgQ6lUu+UKoQJYZ0jd4ZK6JMu9lpBcAm
         T6owwNaZn50OVBYmtRBfEvAXNxJYlo0lMp9ZBM8giFJysVi7gcfbvlX0Lv9BFta1gWno
         9KI4YS1Dvqz1FGXDXzmkJSbznv/DT3eT4X1Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+Ax1BK6wsbxWSzgbCNr1/RIWIwipta1BSPn+F3eGUs=;
        b=bq6fmedt5sbViMlgEcZEV/brxamMFpHCxbnC5Nul7h+ahBZbf8cFvbLbULxmCRV92a
         0W1TUOe83JNyjx7fJx3gZWg5NI7I+yzPu+b+bg6bZ8sPP44jf3K9k8cFVp0V05jjiHdW
         r1A9XiB5rWehZ7wBOznabXcSqKO7AMyK6F3aAknRGEhoKbaT8/MxOwZQbI9IFLoKAnse
         YTolcj+NxC3OF9yBXf67DVxVoRpjRmtgvLp58UiJ9NwZFuLp5G9y8OIJWIlGqxTK3xAu
         FLLsCuNZANKycfVNUp2gqMUmUg9PcssMTPqxZC9E+zimfeyuJ77PdRFIItTjc2FA/FuJ
         yQ8w==
X-Gm-Message-State: AOAM533b33sGNJvLWt2Q8TXRq281qvsR52mE9K8gx5IYEBS8pb2pC4T/
	EL25wW5Z88QWE7mYTmFjUnx5Owsonug6og==
X-Google-Smtp-Source: 
 ABdhPJxXr2UWAxz7oNDzGJJ/6EMEdRpw9ImDCCBaCmxjnsvSlsf/j1jDU3ZRTRPLmMVh2wBK1mC45w==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr30569599wro.94.1634035629810;
        Tue, 12 Oct 2021 03:47:09 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d206:d72:2579:f3])
        by smtp.gmail.com with ESMTPSA id
 d2sm11149468wrc.32.2021.10.12.03.47.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 03:47:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libxml2: Use python3targetconfig to fix reproducibility
 issue
Date: Tue, 12 Oct 2021 11:47:07 +0100
Message-Id: <20211012104709.2754053-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:47:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156869

We're seeing pthread being linked sometimes and not others leading to
non-reproducible target binaries. The reason is mixing the native python
config with the target one. We should use the target one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxml/libxml2_2.9.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
index 3105889c16a..c387587dfd3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -36,7 +36,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
 RDEPENDS:${PN}-ptest += "bash make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
-- 
2.32.0


