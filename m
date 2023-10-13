Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B51CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:53:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.35714.1697194385603286431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 03:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H5Ge04HK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405524e6769so12489495e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697194384; x=1697799184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcfQjgQigVLF6xh9vEaaKMwyMr/D92dafvrv6xtlf7U=;
        b=H5Ge04HK5Qw5Cevv2Rf+gXe6pRJGAxFth7ywBjtckEdE1uwSr8NHRH8QVb4icro6lY
         2BLfUd8WAmP3Uffe0T9UWxTRkhVQLjwjOm1oIKIu1y7Rj1c00H/OpcvY61zUAqBW8yVe
         HIrJ1t2ANjwhCUpXxgoCTGixncax0unmT2d/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697194384; x=1697799184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcfQjgQigVLF6xh9vEaaKMwyMr/D92dafvrv6xtlf7U=;
        b=jnvPyoB9IPQV+Am8jYRkhy8ZR13ilgtSdTjrE/cAzbL2ViqKuUTupyVvmFiyYXqoun
         0grEearp7nAEsD8oXRP6TqxzmUg/j12fKpFblW/xK7mw2UkURknoJ4QODvaMkU3dOys4
         43z4F2W/7RrADVvwL8/G0/ym3UasnGaeGJu4Cg8HpPnbqYKmANFxvesjLW2kgDoH+fqe
         kuP1TcBXVRuK8NhF96K6a3HZGi6VlQwmUStPILQsPQGDGS9xSOkwTtLvsLvBmBpWxYV3
         BXOsi3/hOxQbPyR8DQhIBUqDbo4YqRFNjbf8VLYuVuCg+KwMRIvi/5GKeOzG9P8cQOFR
         Nd+g==
X-Gm-Message-State: AOJu0YxtCMfTDY3rkZxYrICW1RWmoNpmcB3WTwJj95BdyHvA74hMHjhB
	4DuOHo6KPcSGwnuzmehVBSc7nCA7WPl5DIzgPdQ=
X-Google-Smtp-Source: AGHT+IEAStsnEREsOFxn6I4mZI0jSaknZ/u9tb54pwx/Or6omxKcwdvPAJuke2CT9BKQjtPIpgfNgw==
X-Received: by 2002:a05:600c:258:b0:406:51a0:17ea with SMTP id 24-20020a05600c025800b0040651a017eamr19440572wmj.10.1697194383591;
        Fri, 13 Oct 2023 03:53:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c2a:1925:586b:5a77])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c00c800b004068495910csm2234981wmm.23.2023.10.13.03.53.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 03:53:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] reproducible: Exclude rust for now again
Date: Fri, 13 Oct 2023 11:53:02 +0100
Message-Id: <20231013105302.231475-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 10:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189059

Unfortunately there is still an issue with rustdoc not being reproducible
so part of the problem has been fixed but not everything.

Add the exclusion back until this has been addressed to avoid autobuilder
failures and long diffoscope analysis time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 9b4a0887dd9..84c6c3a05ff 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,6 +16,8 @@ import os
 import datetime
 
 exclude_packages = [
+	'rust',
+	'rust-dbg'
 	]
 
 def is_excluded(package):
-- 
2.39.2


