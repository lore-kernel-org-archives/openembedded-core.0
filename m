Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E92C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 23:29:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9693.1706052548757299394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 15:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gx0PaBuF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso63009155e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 15:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706052547; x=1706657347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePYbs++lhKtJFM70C2dtVM4bSWeoepS753EsYyH/ue0=;
        b=gx0PaBuFc86cwKNocJXZFY5onJih4eN0wVRxQewFKm+D1EsEAwrxWU4sJl3CNJvRyy
         SNQsoRyWf0Gym3Rlbwp/MKhYhCV1OKIni2wV/EP4LUAMfrq0HZPia4q7AdaKbMR3LfUx
         j9JMEoUPwNT72Hdd9G7QTIT+kHTc+eaQ1Tp+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706052547; x=1706657347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePYbs++lhKtJFM70C2dtVM4bSWeoepS753EsYyH/ue0=;
        b=Yu4XwsFXKP72XNDT5Ss3SBTnNLf9wOkjR7LR8tWp0SOqB+U/W0Vq2QIODmlesqoxEP
         6rG3onE3Hb9nrLKE4qL7J2+0N2gqTN4oqhZORqQGopvTrlAONiSiQcqxZucBYFFiB333
         /fh/eNKCupLLUj/Mhp32W8L7+nRIK3NNl4Pwdka1yz7BgbalwtjmMwQc6w84wBLx59fc
         iLws1cAj05sG8LlDpJqTMuAoh2PFylgwMQujaCiT+6LtmKLF2PboCag9m32S1P/b98AN
         bmuBFCBcajnMxiLYfe0+9UDLVlSm1NUt1O5GW9Z7qVeS0qp3Wa+wP3qvKyTPg0mXqZDK
         jgGw==
X-Gm-Message-State: AOJu0YyZvnkU9bOcv9hUlXs58MlaMo8quGpNzOGo9Eb1Sba7V3Sxvht6
	5BRAbYKdecAKMR+IC7lll2sXjNBxRFWttktVVUNuHiGNkTKtLpdIuOYX0eaph/FN+ssJE6ZO/h1
	+
X-Google-Smtp-Source: AGHT+IHYTHMAMTbIW6OsK/gDAwB2dRwZy3ofr2qUMoZsa9dRpE9Bj5t0ly7y0znVfPbKf671LeCx3Q==
X-Received: by 2002:a05:600c:5011:b0:40e:a9d9:7b37 with SMTP id n17-20020a05600c501100b0040ea9d97b37mr603876wmr.59.1706052546869;
        Tue, 23 Jan 2024 15:29:06 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:27a9:6a99:2170:a4d6])
        by smtp.gmail.com with ESMTPSA id x7-20020a5d6507000000b003392940f749sm9758068wru.77.2024.01.23.15.29.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 15:29:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-subunit: Add missing module dependency
Date: Tue, 23 Jan 2024 23:29:05 +0000
Message-Id: <20240123232905.672173-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 23:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194255

In version 1.4.3:
* Subunit now has a dependency on an external iso8601
  module rather than shipping its own.

so add the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-subunit_1.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
index db5fecf921a..11be10bab60 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] = "1079363131aa1d3f45259237265bc2e61a77e35f20edfb6e3d1d2558a2
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = " python3-testtools"
+RDEPENDS:${PN} = " python3-testtools python3-iso8601"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.40.1


