Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EA4C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 09:15:20 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.11587.1706778911170686406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 01:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WW3yFQwN;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a35385da5bbso105551966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706778909; x=1707383709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=01IRj8L+7Qhu5VJeZN5rx1LZeIzOh3NfmnAK9EZ+Uto=;
        b=WW3yFQwNmnCwtpDw+TDF59APDkAOv1yI9rtvgr7fOjZ2y/iYO/EddFgJyERdZDHE7s
         hv+z1LijoaAW9lq3BSyKJDvUHhnYlAaHpVJ1If2JHId3OxR2jtAaH8Rfnub3+evkCg7S
         +KLsG3fWlF53PVvXGDEFjS3YVSj7iPJrnHAe+sOKanh2lEWM2Au4bihRaMazk5Lxx2qY
         jS+TfpamLTNCJREiAAFPHeyonuNSaK8MRY2SPz/uPL0fCypdmwmBT08iUTumTQaHu7sM
         jN1+CLhUzQ6kk+SxSge/3JdPYUnQlejJTjzEpewutIeCdwUWpQXQq08zi44SguXmgyVZ
         /YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778909; x=1707383709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01IRj8L+7Qhu5VJeZN5rx1LZeIzOh3NfmnAK9EZ+Uto=;
        b=PsgNYddcA54EZps4jNhUNXHgPTSfU3Es1Ml4/L684CB6cph9UbnWenkRB1xU7WlaQK
         hdgt9PFnhRYA+2bStUwUlQs4BZi9VSciKFWh1rmmIVq5+Z24zJjdiLLsn5gWIZmn2o5p
         J15JoA9NO6EMUD/gOHj3S7cluJJwz1mlCCuMa9Qk8myrbnCHLuPsO5nfTwVCI0XJgpFD
         qTIbtyCU1zR4L5qwORuiMVTJvnu45gn275uYlw7sm7gmNYP1Fg2E+/iyxKeSuLoOpwTI
         +FcxqeTHb1X0Bv5cMqFBTBLAp5SY8eWfjwQSzjbnm3JripM8hznOX7v8xVYt8amvOAPY
         Mc8w==
X-Gm-Message-State: AOJu0YwPrRL2Qp1IlSzoysdisQFHNyuCcfdNyV8HQMyQLobGPf958ugT
	sy64oBCma7AHiIROcEnuOCQsYJF393tMcFAQbSPXgFCYueg9YFTsrHIJZ8Dq
X-Google-Smtp-Source: AGHT+IF7gkjetZM8b4dYSSGc7KyIuMtSZ2ARX/ym87FbkH8McflCwU9fwPGfPxz325xu5wuobhr4JA==
X-Received: by 2002:a17:906:d114:b0:a35:e26c:e80a with SMTP id b20-20020a170906d11400b00a35e26ce80amr3046643ejz.3.1706778909331;
        Thu, 01 Feb 2024 01:15:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d59a3000000b0033b18e6d81fsm382143wrr.114.2024.02.01.01.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:15:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/2] classes/package_rpm: additionally escape \ and " in filenames
Date: Thu,  1 Feb 2024 10:15:03 +0100
Message-Id: <20240201091504.1944076-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 09:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194580

As specified in:
https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 819ee502783..45ac138084b 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -217,7 +217,7 @@ python write_specfile () {
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
             def escape_chars(p):
-                return p.replace("%", "%%")
+                return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"')
 
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
-- 
2.39.2


