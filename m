Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6970ACCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:27:30 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.14196.1760704040330169775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZYwTTC44;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3612c38b902so17255611fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760704038; x=1761308838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIg4WjaZz/Da4BPn0YnroPWod+AGctLJMirlocmYuyc=;
        b=ZYwTTC44w0HsoSJMvnqU40fhrdE4oHhWMAho2NxTFNa62xloDv9RkX8/6wGvxX7PUW
         ch1zZlcGq2Y/9/3Q3S3qyLCpFjdV/Zbh6rfltTxWiK/yEdhOu5YQXQVvug/RMDfZ1oRK
         2promBg/UKSdF86OxmyXmbv1oYUgX6O/loRIQ5HZhUHW/ZvUECl9PdZ4x9tMNElODxDR
         jWF40a5nS6Ch2QlVnAw7/wa3PaSQGsxaTSYDEqkDgkElbchm7y1q6XYLxtHcw2j9UshA
         kJq12aRAq0wOzyl9bFvuEHJUzoE8JVfsp7ZNIjMut7cOIRmxgsGYD/H3EwgAaTTZWYL9
         5URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704038; x=1761308838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIg4WjaZz/Da4BPn0YnroPWod+AGctLJMirlocmYuyc=;
        b=WbaWL1urnnADiCqsVJZnjmVeKN9VE7hgTNJEEGHfOo4TcPV+afRx8vPvfBGm3NN/50
         FBtD2GPeE6cQaAmPcgqHfs+fF42ujTg/GD88B0XKJrbeAHjlPfXAQiNcFgKrEdWsGM9q
         lKcTakUWu3cg9YRUY/rnebCcl4AP8COQI6nfN+bthqok7/uW1C+H3ijTXo0zPj4PlJ/T
         dGpgj1KaNo/9UrQoxnmvw40YxNULmv/fkv5vGYl4CGwFbo9+jmyh9Z0LmQ94Y/hlEEty
         NIsM5H7NZHeUNSJY7DN/hSl+qoOQ+ANiqMnr2QRvK4HuE4nyixykcZOwLC4jD/h+6mit
         vQqQ==
X-Gm-Message-State: AOJu0Yw9WH16lXHfaDI9YvuotZBAWF3nANiMfFfhDodduGblco2YqX5Y
	8QKh2xveUtBBoid9JCQn2uP+btL/9LnVdTsA2NOK5k0CRz8ucQYmB7NTvLFNfJqwX+QKDeaso23
	WhZ9qGMo=
X-Gm-Gg: ASbGnctvCn+/ciwQqvHNrYx6tNnTUd9tBGp0+5Ok3iahVfMnIYkilM+wCQY4gxZyQfd
	myrW6/V3YndL+xsh2PqGiRcPJGuwfkYwnItpSk/sAAiTG3hspiujRhvEDd9tsbx7ZR7rWDiMTz0
	1HJFzTl1iaB48DJzDqfiyJOIl38sCh1qh+pgYQzI18JhVvuCMqODFEWwpwBbehhoJjXfz6LsdBS
	euuls4WS17C+c1z/1pjcmZ87PdBRfCaw36uKqwXp7Ue6KV9VESPyPZAOX8Tx3/qbo+caFx5wh5D
	jlYQw2GdqShNLJUOMqorQsY3TrOgeog0Ec5enAK+etqko8yOdR3y9Yf8Id5rK6JArvKqWVs52en
	Yo3EHjhvJ3+TCsI5u8+oq4H92pV+6F1P0eLJomA2qKlr8HHy+eTl+UqC+qiGJZGqA+/Td32KnPF
	CYDNYhuTTHyM2JXhg23GebP2eCYo/Ba8WxDCJ1UlBTmIqh
X-Google-Smtp-Source: AGHT+IEl9i5rwsuIiCaMtircTDKof2AmaML5CGwK8gdQEaQ85vK/lEgiwgHQpSyrLha+39+bzxfffQ==
X-Received: by 2002:a05:651c:554:b0:377:78cd:e8fd with SMTP id 38308e7fff4ca-37797826492mr10988281fa.9.1760704038350;
        Fri, 17 Oct 2025 05:27:18 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm61421371fa.44.2025.10.17.05.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:27:18 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/5] selftest devtool.py: disable qemu graphics
Date: Fri, 17 Oct 2025 15:26:45 +0300
Message-ID: <20251017122649.493701-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017122649.493701-1-mikko.rapeli@linaro.org>
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225013

Test does not need it and graphics stack may introduce
boot failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b92f017b81..be95e8c74a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1832,7 +1832,7 @@ class DevtoolDeployTargetTests(DevtoolBase):
         result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
         self.assertIn('  %s' % testfile, result.output)
         # Boot the image
-        with runqemu(testimage) as qemu:
+        with runqemu(testimage, runqemuparams='nographic') as qemu:
             # Now really test deploy-target
             for extra_opt in ['', '--strip']:
                 deploy_cmd= 'devtool deploy-target -c %s root@%s %s' % (testrecipe, qemu.ip, extra_opt)
-- 
2.34.1


