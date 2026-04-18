Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131BCF99C92
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72008.1776537252157654556
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a/uKWyNL;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e97e73234so14353821fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537250; x=1777142050; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwDC0qbIekZ01QcIITPykg4/PIEHcmQlJQ0FRNCtrxY=;
        b=a/uKWyNL8xMSrYtnfXouPRaY5DZ1ONxm9MUt3iweu4qu9uUACQ33D0mBw8jL2oHvua
         rbLr0qmK6DA7WtnYHgzNgi5LLy0jK91Zd14QDepnPQdxzA2rIfRLD4U+5MINYoTIGFps
         dLBWnp8d9O2iOZ+0LGdD0z6FQJXouXcadiL5g67KVNcFoPBkr5WVwtX/AKZyh+fQysJj
         SFZg4CT3wS0vlbc8QXKeK8hDTuHMw2ysgzv5qK/RZ4KG8X9CV1XebiAHfeco2yUJV4Wq
         y0B6p1EXSJMuz1E0hdbxcjLoCWZwZjzTzhi9dLo25liNJxK/CQEYS16OcJ4RIOqXPYDI
         gWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537250; x=1777142050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wwDC0qbIekZ01QcIITPykg4/PIEHcmQlJQ0FRNCtrxY=;
        b=OgHoEtnSqD0LHVIS/Pqwy5pDZJESsxLVWDBYX1dB0VuITRhe3/bvQM2ozrdJfIu3VR
         tl30sOkE0k1sPWSY4QDymUbVcmleTgwgK2f7iyVTwjoWrKqZqjAmrySiFrEKyvOadIwq
         Vs4Wx7vt9rjW2tKGqUtdVnmrGm5zEoB7G/k1noCD6mqudb9dROH2ugTIDpRWNYKn/5KL
         SuJqgIM0Hrbwa5T/+9UkU6jwLcBHYpnPZaYR7HYUesLT4svkb8zctIRF5nozZiQl3oJ0
         kO+v8TjAIJcffpQJEqa9muMIiL03p/jwmhmZKxlqMgWjMnMsTwMG4kEvdDVXdRWNEIBf
         Lrfw==
X-Gm-Message-State: AOJu0YxAKdlwVlxOW75odhr20/WylJuQyURqCVOz9Knw2Jq74Z4m1W8o
	4DnOS/oHhYCH+s5ul1UHCYdFLG+f/n57ptZWIlfkgAxTd/JkB4C7prK0L9GRwA==
X-Gm-Gg: AeBDietao1YZSYttunbDkk96YI4fAxofpgDOngZZDQRriMZ0rGq4wuAG5L4uKCdcqHn
	xFbRh8yfTWyFzLZpa0W/oQpbV9cVdAR/zr+owwxuNKxfEC8115zWC3dkSyYpcuvT3gkOUZZgY8l
	zox4iH+DXtmEqhjTUQpKplWiGNEtTh75DpnE9vUdZbxPt3Urj94yW64tPUQbo+wg6DzbFNhl3wo
	wNwTrVlLk4Co0APQvnmUoM/0+y6jBzqOs6sG+A/xj75FbDIKmXNTe8HDDRi/Q8yEoC5fiXlUSO5
	Zz4t+aapxEuqzfVCzrEl82PPR9UvT4EXtYbO6gKErtt3cOETx85/EBWJQqMBjLyqQaz3Z5CZGtt
	WUxwCJ2/p0B1JO+Ajp2sugjXUriK+eXPsLkK0fHEwNVQLznRyYf3XhM6UB6JJFTsbJKk6Ip/ZU5
	ssG/DD0H9uOtjtmytJJR4UhigcC8CsAoDb14DxPHoa
X-Received: by 2002:a2e:8a98:0:b0:38c:c068:1689 with SMTP id 38308e7fff4ca-38ec7b25288mr28168631fa.29.1776537250140;
        Sat, 18 Apr 2026 11:34:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:09 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:05 +0200
Subject: [PATCH 5/7] native: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-5-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=784;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=I7ikx3mW5mXq3+UiE4G3VE6EwhqmBdunFLBSLpioB38=;
 b=jtRjEugChokwv0r+sbXtqoiHBaqEevWohmSYI6qrrfGyWNzqs0kt8t9NEi05eYqPfJo4xn60Z
 sgYihv9pCR+BWP6pAkSYykhzkjK3Wpn0B2Ad2v6AV5sWDzV1G1pF/aS
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235519

'do_addto_recipe_sysroot' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-recipe/native.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 9f4ca170f7..ac9458a2f4 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -176,6 +176,7 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_addto_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 
 inherit nopackages
 

-- 
2.43.0


