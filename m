Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0241EC4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 04:19:30 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.24792.1699157963487952495
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 21:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=XbcoM6oL;
 spf=pass (domain: underview.tech, ip: 209.85.160.175, mailfrom: vince@underview.tech)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-41cba6e8e65so21202801cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 21:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1699157962; x=1699762762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NNDeVKjNw+azRkTMX/VPoBFtMajlrxBbTsBfoNKflQ=;
        b=XbcoM6oL74paCkQA0p54OgPHmAXvDGz0sEa5AJXQrpSuyaPoOCIN4w/JZo3iJ0xugJ
         MhPv7RRv72hy1gpsMmhkdeBViRNGXIfHT0g8XKf1mrt7kr0XrrYNNR50ZtzaX0iBJYsU
         OR1vLsoqeL0T9HEHO3mwriVPSRcRU49GDtPh5KpQ57ST1YyrsiBHld1nAe6AmRuhJlSr
         +RyLdbVpCpVNM0DFfExKGepw0jBjN6Cv0vlUjIvXAsINIramJA4z5LEyvjTs4DLfj0S/
         ++mL8OWuAgzZfu5B4DzYeuRg8k7Le9Ac7Vi+r9F+c4DOX4kVpdmYBZ09nbMEI5L6Cl6A
         2HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699157962; x=1699762762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NNDeVKjNw+azRkTMX/VPoBFtMajlrxBbTsBfoNKflQ=;
        b=biu5qYYujM3hLFCOPy4itiOO1wriACs6AzbIc2fKOFQ9+fJ3Sqqp2w01cQUMT7iC6M
         7doPoGfALDIqyEscseg9b2UBnUvsNx53h7vy70M0cLFd089Sat/yuPFYD/S7+nIqWa3w
         24pmjBRs/rllJFLpWHto1GvtRWw0cgXMmyFj21hktGnwBRgk9s76LJKxTDafMF1BF6xg
         C7fo4KWIFmRcSwTEwEbRi04UiQ4ptYP8VfbJxrVrefWBAiQgk6BsQ08qTwa2NIMh2bwp
         /hsASadSA9QYZjH9y2YJ/lWhZ5BzA0V0i1vkp1vCalRQ4pMcvX5RPoqL3ZQLG5O4F0Rv
         FU+w==
X-Gm-Message-State: AOJu0Yw+sTdaHEK3dakYeGaBT/mQgjGuVvJmp9mgkVHsGwvqBGd7Vh0y
	8E8FtcKbH0pDuC+NZ+I5PHQkHq521C6y3hmXRus=
X-Google-Smtp-Source: AGHT+IEN0woSAbKS2egWQ0rmh5Xq5ZHFmrOVsJGRqe7pvIb+YvQzm6NS+QtRv0Sk40wovUVSqTL6+Q==
X-Received: by 2002:ac8:57c9:0:b0:41e:a8ab:3c73 with SMTP id w9-20020ac857c9000000b0041ea8ab3c73mr4731658qta.41.1699157962370;
        Sat, 04 Nov 2023 21:19:22 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.hsd1.mi.comcast.net ([2601:406:4d00:a9b0:c3e0:d1d9:dda5:f86a])
        by smtp.gmail.com with ESMTPSA id o4-20020ac85544000000b0041e383d527esm2177633qtr.66.2023.11.04.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 21:19:21 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] acpica: add nativesdk to BBCLASSEXTEND
Date: Sun,  5 Nov 2023 00:18:57 -0400
Message-Id: <20231105041857.119695-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Nov 2023 04:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190183

Enables use of the iasl compiler on the host
side of a given generated SDK.

via

TOOLCHAIN_HOST_TASK += "nativesdk-acpica"

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/acpica/acpica_20230628.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index 3b939ad665..b7921516a2 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -49,4 +49,4 @@ RPROVIDES:${PN} += "iasl"
 RREPLACES:${PN} += "iasl"
 RCONFLICTS:${PN} += "iasl"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


