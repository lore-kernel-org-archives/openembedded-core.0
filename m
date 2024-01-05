Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512FFC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 13:36:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.23379.1704461764004014883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 05:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REzZIhQ8;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d5d898162so11835145e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704461762; x=1705066562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6IpR6aeMgBQeWUbp5k551TgU4mNXF/k63yLXtikTQFg=;
        b=REzZIhQ8xP0ulqoILraarxrJNpbzfq0lPSV3m/4q63WHPFtrwLwE4VXhpA1Vhwtb5W
         sxYUo27e7ExDE/aYi9HLsB4nN+ILguboXWss7Y4JQii+DLcD9ZAdKtOfR5I0w5mr+VCG
         c+vJDYH0ewtLRMQjSF7S9o9a4J7SR1OMOvIVRjgfuKIw/TX9SvnKEFGBfeG86JwPxtmW
         qNdmq2oBDf9FCE4qN63OqsTaA2/BICwWNOqq524iG1z90fwykDmCS5Tm6GETGYJd3fac
         c4p5Fris0RQ9usQie7SLfbr5FhImT2QCOC+nCA0UcRaiXDOVOv9ZL/MiNxvO/te8DSac
         Wm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704461762; x=1705066562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IpR6aeMgBQeWUbp5k551TgU4mNXF/k63yLXtikTQFg=;
        b=CLDFQiwbJ5f37sHAR6kM9ocvSea6Ybp8XuuCy1FnjMawa7JhlJ51SzOX4qxT3N7MHS
         0NT2DXy11Gh11M+dLn6JZ+XoaUfa4zPMVUdcWPmEUCTne9LnYWbIIgyA1wF9a1HNAgzd
         qr4lBWN05sloHSOBbhFJaS5b/lI+qsEZNoRQzrbLK0GFJxSUfCvLsT4EbSbfxhtmJMQZ
         KvoGEPA+0jOsm5rmC0ED179P8dIJY7lnZENj9yHvc9DYrr+SGFFPtdY73I0llOR0egou
         iQIZQepnoQPGl7l269lJniJSM2kPZ2UtL4NPEIXJQYfA/vDM/MYlOpx77N1Zg2S859WV
         irGA==
X-Gm-Message-State: AOJu0Yze7wLVunJmuFTqnpExAvxRU58jNJIVMMVM/jNKaYI/hWXic9nE
	1kInN28EwqMo+j6vm++4L4dhy+fEIhg=
X-Google-Smtp-Source: AGHT+IGkWV2YjC7pBttMuaNebffbATI5LXKL8dj/T4A3qwgoJ7V9N+pKyq2fPq8WSE9riFPZhPvSPw==
X-Received: by 2002:a05:600c:b58:b0:40d:87b7:2462 with SMTP id k24-20020a05600c0b5800b0040d87b72462mr1302339wmr.40.1704461762056;
        Fri, 05 Jan 2024 05:36:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d608d000000b003372c080acasm1425187wrt.2.2024.01.05.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:36:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] devtool/standard: correctly escape \
Date: Fri,  5 Jan 2024 14:35:41 +0100
Message-Id: <20240105133543.3017997-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 13:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193355

python 3.12 points out that:

SyntaxWarning: invalid escape sequence '\*'

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 559fd45676c..c20c0321a35 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -772,7 +772,7 @@ def get_staging_kver(srcdir):
 def get_staging_kbranch(srcdir):
     staging_kbranch = ""
     if os.path.exists(srcdir) and os.listdir(srcdir):
-        (branch, _) = bb.process.run('git branch | grep \* | cut -d \' \' -f2', cwd=srcdir)
+        (branch, _) = bb.process.run('git branch | grep \\* | cut -d \' \' -f2', cwd=srcdir)
         staging_kbranch = "".join(branch.split('\n')[0])
     return staging_kbranch
 
-- 
2.39.2


