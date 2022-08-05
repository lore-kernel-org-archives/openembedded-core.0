Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88825C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.6767.1659705175208683315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FCG8gkeL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l4so3178382wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=N2RJRsSbrtHzselbM4BYF5+0HqwmiJgiz30/JCoZnuU=;
        b=FCG8gkeLT+hJApDzZEd+8jC1ufaGkzCFxny0/3CcZbRWQSph+zsckrpzFJEPbwkLxe
         VZmY95JZcprV9eyXKaagoQLqMLT8xdE2lVt5cEQjseMcZW8xZ1gQVlCY+gbkkkFZYPLW
         rNxMePZBYmnLGdwp3YldbvoP8v5fSVL87XI7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=N2RJRsSbrtHzselbM4BYF5+0HqwmiJgiz30/JCoZnuU=;
        b=xV7sOQUJwGpMhTiNxI4WurIMecNxOR7Xj4joAuBwpykAv9o+2FVeebJSdp8kn+lPDA
         wf27RiybqdQPiOS+5t3hiir6ew7R55Jrt8hFdhEBCHQccvGlljoD8F/3h91WEwFe8yhd
         VnUVd0Sok7SVGpgG5/KfwwRAXCXHrfwy2Hh/EYoLDIjE9Z0k8bZGkQOCuwzEiASUTk/R
         RgZIAy1LkB1x1ZN6YjhYaT0szA2edF9h7UOOKk/RNGgXe+bXOS4aabwTyo0fBm0Mze0B
         AcvNZOoVLg2CvMuu64G5IUlmnWBI+oSl1mp1XRfflUB/qaZqOsomfdGmwunX10Ub8E0w
         KUSA==
X-Gm-Message-State: ACgBeo24Bs9I9b4XhvbIkuA+HMsiClq/a6l3TlNygWDRT7uVCPz1Qe3k
	K31nnVkAvG4OmHjDpc6Yei9nBBtYHjxi5A==
X-Google-Smtp-Source: 
 AA6agR5KPdYNEjLATkHi12J9cvS7ekNMa9bJAr9jaAhrvXgsV6s9+F0c+kav53FuBDlWSiWLZaeJJQ==
X-Received: by 2002:a5d:6d49:0:b0:21b:a3ba:30b5 with SMTP id
 k9-20020a5d6d49000000b0021ba3ba30b5mr4434039wri.513.1659705173307;
        Fri, 05 Aug 2022 06:12:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/29] nativesdk: Clear TUNE_FEATURES
Date: Fri,  5 Aug 2022 14:12:24 +0100
Message-Id: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168935

Similarly to what native.bbclass does, clear TUNE_FEATURES since these
aren't appropriate to the nativesdk build. This saves us having to change
down signature issues due to data in this variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index f8e96075134..e46739e325b 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -55,6 +55,7 @@ TARGET_CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
 TARGET_LDFLAGS = "${BUILDSDK_LDFLAGS}"
 TARGET_FPU = ""
 EXTRA_OECONF_GCC_FLOAT = ""
+TUNE_FEATURES = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
-- 
2.34.1


