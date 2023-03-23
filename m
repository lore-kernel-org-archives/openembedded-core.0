Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C5AC761AF
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.85132.1679605508665892192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OD/f8Nsw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso3356479pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/01RA1TdHULJvLny8cqnehIxgdl3uZdgh1fPJ70Rdzc=;
        b=OD/f8Nswh7zJpqWivejA8+O9WF7uPs+Mr2Gnbq1md+jbHycVbPit24BdOmSOck6BFO
         XGmVUbhqm3UEALG7i73/UT/o2NzXEatCmMR2zykQndgFMdsOHdkC5TAlx16t+fFRcsuy
         p4FsZbncXFblfR+PlpqJ2Saz2M2UDXz0aYrgOhb6vhQ1iYMBcScb9THGFFpoooUP/gV8
         o33kJwGbOQWET4pwT+C8Vklc+L2QwutihiVVlYPbA/fm3odM9O+roTykHbr2K2nhJEao
         Exvtaq+nLn0HOD3nxJ2jHDP5C/IUEr8CafarP5DHvGKRLpWTUIIgPaoTcv9Q0MiXWfoz
         R2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/01RA1TdHULJvLny8cqnehIxgdl3uZdgh1fPJ70Rdzc=;
        b=t69bSGaOhLslHpXuloiTpPDKpS+W+k08El7eScuOhK2o5WKaUvPQ0DmpdoPZcCyakg
         YP79DJnG8dMgAzRi7+yCZOJoXvA3QYKchSvgXP60frEIEdAxicoA5ozoMBEYRl58gJxU
         7gNMWzVxFGmplwuo6Vce2pOcjno8NZdkpAkOmOW03EvFCfJLWZoTX+4IrOwkxKn92r7H
         TQz5m2YGP8AC2s1HeHWy0ycg/RikJaY9BrghH8A6Z7lx+na2ijUcD33Ohy+qJWlJQwsm
         2gAdcpDQRRKWEIhmfcK2D7WQ2YS7iEHb1L10HnXbAPIBzQcBcZqzxPdid9Y/LA0BS799
         WAVA==
X-Gm-Message-State: AAQBX9fzjh+Ii+5TGjbw2vnS5Pik0FuIgoUTh5QAAMv+yDzU9LSnUMzx
	GLr3NhijIs9EV1Gxi6Sv4t+SLcmZmk/lazNtTmQ=
X-Google-Smtp-Source: AKy350bmX54cZ/YXpiA4j/7m5SCpryy4nVoxw5RheV6+E0nD0XQPr92krwTkj9BxNrJFfDxaibw+aw==
X-Received: by 2002:a17:903:70b:b0:1a1:ab92:5c6b with SMTP id kk11-20020a170903070b00b001a1ab925c6bmr124011plb.57.1679605507776;
        Thu, 23 Mar 2023 14:05:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/14] lib/resulttool: fix typo breaking resulttool log --ptest
Date: Thu, 23 Mar 2023 11:04:36 -1000
Message-Id: <213ed03f5a15be639a97dca6f5bbf810f7ac2eb5.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179002

From: Ross Burton <ross.burton@arm.com>

ptestresult_get_log() looked for a key called 'ptestresuls.sections',
which should be 'ptestresult.sections'

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7c8c9f7283e54bf8b1521fbaad7dceb66a8fcdbb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8917022d36..7666331ba2 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -142,7 +142,7 @@ def generic_get_log(sectionname, results, section):
     return decode_log(ptest['log'])
 
 def ptestresult_get_log(results, section):
-    return generic_get_log('ptestresuls.sections', results, section)
+    return generic_get_log('ptestresult.sections', results, section)
 
 def generic_get_rawlogs(sectname, results):
     if sectname not in results:
-- 
2.34.1


