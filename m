Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E75DC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 04:28:08 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.179592.1698726480245473604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 21:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PT6+V/jF;
 spf=pass (domain: linaro.org, ip: 209.85.221.179, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-495eb6e2b80so1676785e0c.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698726479; x=1699331279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xH9gBt1YL89jxymEONXoXExQWK8h1zt5nsQujwesJCw=;
        b=PT6+V/jFUvXakZVpddrElMD2fXUgHFmclipzR/tz/8Ib2U4WhV5J0G2Sumnmq4mqMp
         WGpZr1DuiYxJaZFJMLZ683jXX0CSekPlWHMOBS1ee/B5OOo25u7wWEmHCQaM2mYBjHWW
         6usUoVrZuF9Tho3WUTH47pxxAyOK7C5RU+T8PlW4E3Yk7oPR1WB7nvYjPvLTa5JKTX/I
         E0mzWBIgzOrCmAit3DW2NMbC5o2w+olSEwrdyd3h68ODgvMW+fHPSHJJbYPybXxT4T7u
         YVabY/XhYtUCISix7E5s0/AcDH7gf37vy+ZjpjhGehQrS7EKxQiwAsVZY+t2q7dvYL8Y
         wdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698726479; x=1699331279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH9gBt1YL89jxymEONXoXExQWK8h1zt5nsQujwesJCw=;
        b=MsTGLOHcYj+vJGk0judQSvRkU9Wk0twhDu0NuRaQEOJJfWdIHdHR0YjFrTPulgrXNV
         cnbA2kzLa8wmyKaCDStvUkgnSH0zoXKO31Vk5p9GzD5ulHILgR/78Ib3QPRxiFKK320O
         l0ilijGyAoaEeh+DmfTAq5mm8Pl+wIfNw1dyp0Y8p1LfaERO2KehPyHwAzw2k0KhUt4L
         WKaCwXTv/bngHTG4p6QHADpz0mzayIzOV73FqAo/01H3UoQRdtSz0PI5JNGzh3vumTRG
         yyXdmQADwh6K7BqI3i9hKx5+t6GkAkxn5dB8j8Pe0PRw0Ge71zjDaiCdkYQEVtrCrHqc
         nngQ==
X-Gm-Message-State: AOJu0Yxa5xeNBzvWbEWxpemu4mY+iAEQuaAD7KluF8r6HgDYd+SQq16H
	qEU42b2TVlgFv2/Jlm3zYort//n3tM48cgrsxsc=
X-Google-Smtp-Source: AGHT+IGr6Rf/Mcv9n1+lJt0bU7d/e8znDpgH4uGuVqBblOwmZ1HxSxDQ6dz+krMbUw7kb4bJBuBazw==
X-Received: by 2002:a05:6102:2092:b0:457:c37d:33c with SMTP id h18-20020a056102209200b00457c37d033cmr7065702vsr.10.1698726479031;
        Mon, 30 Oct 2023 21:27:59 -0700 (PDT)
Received: from jetm-rog-x670e-gene.. ([177.93.3.200])
        by smtp.gmail.com with ESMTPSA id ea13-20020a056130148d00b007b5f4e678d6sm78670uab.0.2023.10.30.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 21:27:58 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] package: split strip cmd when ccache is used
Date: Mon, 30 Oct 2023 22:27:35 -0600
Message-ID: <20231031042735.3842176-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 04:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189825

Using ccache stopped to work after 77497dbdca with following error:

  FileNotFoundError: [Errno 2] No such file or directory: 'ccache aarch64-trs-linux-strip'

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1dd20f85eb..2685da0af9 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -39,7 +39,7 @@ def runstrip(arg):
         newmode = origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
 
-    stripcmd = [strip]
+    stripcmd = strip.split() if "ccache" in strip else [strip]
     skip_strip = False
     # kernel module
     if elftype & 16:
-- 
2.42.0


