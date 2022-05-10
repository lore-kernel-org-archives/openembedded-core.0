Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DADC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:38:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10680.1652193478512479389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FZn3bmas;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d22so16896494plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f4S2sBs9LZNXP3jvc4Awp3LWgDoAvTLT6SGs4OQqsKc=;
        b=FZn3bmasjM9cYdd963Tla31YD9BO4yUv1UA76T4pON4A1Mjz5U4YG6YusLcHXpO61i
         EjGxmZf/CIg2BWdnpiDY2ihd5/UVjbaPLT2CDnSt0ixPjbu5Ose8HtFESLP8WQUM5Ju8
         VR2GnIBhuvKI/HxKoGV9lEVsxFrVVMt9zbrckHummxWSwLrwxgO6lO4/MpiyqVnLFYaB
         zRCELaROOF4ILpI1lAjrsofUuSSlzoAmoFbM9Ng0/fGpcZRmCeXiTppe168hvdrUjvvQ
         DAc3/I5LyLlghrU045K6+NicNf9s4gxg8jNUAaI1FQNOYq9H2xC8nbbQiPJ1/i0QP0lT
         MVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4S2sBs9LZNXP3jvc4Awp3LWgDoAvTLT6SGs4OQqsKc=;
        b=joGe9GOoAMdwlGwL3MbcNqZt/GHynD7vNcRMqR2YaOiOOKM2prtLsND0NqjcbhuH56
         ThNOdGt0FZMtUyzXH94+CbBNkqP4iE5Rqd8/oLL7irq9CV5ND+UfE+jIr1q4NMOJqz1k
         CWDKqYANaIfw0zva6j3qtR72XnIXHG66OLlBwWmWiYVyYr4sBD+2ls1Pdl7R7/T4GfrC
         rDzk+DtX8IsQ4Lyi2S8XTEpn65CMBdVJrxBTtPwaz7vqIVjCi65ZmN4DHAIuVMgWt1qb
         VXMqZ+0UHl5ygbyOaDU0sigZ3iqe3bhM+00zK73WZ7yHyozzYWGiyhCClOmwrbi3vYL3
         OlFQ==
X-Gm-Message-State: AOAM531xGKqU8919leFquDqsso5iojsQZkP8Dc7Ogn+VvAsGmB3lr9z4
	dIW1ydm2TCcrk86P/B+sI8iiD5T9XIu7oKZv
X-Google-Smtp-Source: 
 ABdhPJzQfkdP8MKfAYWLl3n1TjdAlqZXAA9TLq2XopGePZ/8z89uHfIALVOVPzhmXiz3XGBnVXq6Kg==
X-Received: by 2002:a17:90b:4398:b0:1dc:7edf:c92a with SMTP id
 in24-20020a17090b439800b001dc7edfc92amr328905pjb.136.1652193477157;
        Tue, 10 May 2022 07:37:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/40] volatile-binds: Change DefaultDependencies
 from false to no
Date: Tue, 10 May 2022 04:36:46 -1000
Message-Id: 
 <371a8e2b0b0a3a2febe1d8d6ce65f258a15f6b1f.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165424

From: Portia <stephensportia@gmail.com>

The systemd-unit parameter DefaultDependencies changed from true/false
to yes/no. This changed in systemd in v242.

Signed-off-by: Portia Stephens <stephensportia@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit add4dcb03dc7b034253db05f0023cb97cab8b26d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/volatile-binds/files/volatile-binds.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index 6612d2aae0..8fe7d8d4f9 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -1,6 +1,6 @@
 [Unit]
 Description=Bind mount volatile @where@
-DefaultDependencies=false
+DefaultDependencies=no
 Before=local-fs.target
 RequiresMountsFor=@whatparent@ @whereparent@
 ConditionPathIsReadWrite=@whatparent@
-- 
2.25.1


