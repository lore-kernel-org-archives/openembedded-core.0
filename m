Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.8467.1628082014503335286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 06:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fSwKnmp4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id h13so2156870wrp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZPFZQDmsVwvf3K9ZJsMF47GAFAEHC6Y0tt1VKE1KInE=;
        b=fSwKnmp4JbwMbL0P/KPQ5gYKut7cfxvVs6y+7/M2+pQqSI8nchS/G/MWrz7biO9GMk
         3Dzu1Fz5sYabCOkgqe8zrASVr0r6aBRABJr5rHgoH0OkwKfcYTWdOgXetuPpHME0jhOi
         9NwdjJX6ebLK38D+wB8V5TQGabxhhyxnWqLrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPFZQDmsVwvf3K9ZJsMF47GAFAEHC6Y0tt1VKE1KInE=;
        b=bnsJybvOgqF19BOMFCGE3EEePRGzxneiE4M5wyepWix6Tdvp0vXLsEXISTBgDivrr8
         /gLc16pQs1W45HQzTJUf3j+sHtJzy6bRi+O0WzU0ZOrH58Chnra44zfnOu2/xGfLCrJD
         kFV/v24XLow6fGN8k8A1o0vucQHJ6vWhVsID4IoQGmJqEIqqUgz1ekcWufWaG9tCUvV+
         hf0NuYsCtz/RLVN9DvB/OF7MYsjo8/KC/N7g6qU+tNM737vrOjTvQr6SBBVcZxUozAAN
         HmqByU+FAQTwxn1M0ZJlOucXgZ8A+IgZ55+pEEtpmYMRKbGbbx8yq86m6K4jpKGUrj/Y
         40HA==
X-Gm-Message-State: AOAM533iG1iP2dZvZkGCZqsbO1QawjviNuY6NLd13UaUJUFtGZViL2Og
	cgCYOR7Wm96tWaB/SqOWQUlwK5EUjDYDYA==
X-Google-Smtp-Source: ABdhPJxst5WVc9u8a7CCr/J3Z3A5y8h23D1RZM6rI+tYHxdCzHeWFckHBO/arBDpk/AUsOvKEGfvgg==
X-Received: by 2002:adf:de87:: with SMTP id w7mr27739880wrl.270.1628082012817;
        Wed, 04 Aug 2021 06:00:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id w9sm2241488wmc.19.2021.08.04.06.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:00:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] image: Drop COMPRESS_CMD
Date: Wed,  4 Aug 2021 14:00:11 +0100
Message-Id: <20210804130011.3513634-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804130011.3513634-1-richard.purdie@linuxfoundation.org>
References: <20210804130011.3513634-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was replaced by CONVERSION_CMD a long time ago and is no longer referenced
in core. Remove the references to it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index df34c7884c5..d76895178fb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -457,11 +457,10 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD:" + ctype) or localdata.getVar("COMPRESS_CMD:" + ctype))
+                    cmd = "\t" + localdata.getVar("CONVERSION_CMD:" + ctype)
                     if cmd not in cmds:
                         cmds.append(cmd)
                     vardeps.add('CONVERSION_CMD:' + ctype)
-                    vardeps.add('COMPRESS_CMD:' + ctype)
                     subimage = type + "." + ctype
                     if subimage not in subimages:
                         subimages.append(subimage)
-- 
2.30.2

