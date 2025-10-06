Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE18CCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:15:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.33603.1759756500591979770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ISWxxoAB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e542196c7so33278925e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759756498; x=1760361298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxRLx8H6OxsQp5oJQNTs7LXOCMy3Nr8m5R2NvStvI6w=;
        b=ISWxxoABPrIQRUhGeMCb/e5nMOMFAhrnNJ9Yqyu1KE+nAPqrA2aRL76CRjH99Q9HTK
         LoUrFA+vUSfmGcD+m86AixYCtnWhVJWXOATTMIjMb+6IF8ymyhtuFbGUsxq18M2fdop6
         h9ilFSqX12pJk1hVcaJkc7rQ9Ze28oP5RqV28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756498; x=1760361298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxRLx8H6OxsQp5oJQNTs7LXOCMy3Nr8m5R2NvStvI6w=;
        b=o9DkMMneKfGB33kKAGAQ23BKVVawh9rtX2mGdDwsHjfCLU7XjLhL6Ylsq+jAWMgF+3
         diG1GH/Ooh8gPT9dENZL+xtEnpT/j9kDOCWNzfB+S0nY5obE9dOK9RiRYj2AiyAkeDVD
         zRnEqv09CO37leaSqMFYVp1JMsXIzOV3MT9HVxgx95JAH9xi5PfCsYorNC1l0OnCkd9f
         KX4M+J29VcAOpAHj+ZWXEIlF9Qkl3IswDYdUcWb/MOM85cVLTy7yWz0B8djCtwx1KyUS
         B8KW0pY2TPfI4U+7oYK2/SLGUWPVJ+x5fxmiqroJ8250lVunECQpJPOG3r4ooqLeS+ET
         HLBg==
X-Gm-Message-State: AOJu0YwE75JIbDCdTV4TKGwxN7mrnCbZrzehkeCUgGf9shyazTnAqfOF
	zm1BFMVnocMiXem9B+MSvXeEBFhA4GSlBPEQ4FfY1lzFjQwQWGpJ1uOp+qDkyyC6wFW49G7AItX
	yDR4w
X-Gm-Gg: ASbGncueTRII+nDgHJWuwfOSH1xJFK+gQLyrnhj068oBE7zGfb2MBP9lT21ekRrtgSn
	znxTqorjKg0/Zt+zHIE3utwzg8ixzNBdFgnGydtNlpykX2RhQIRiFslY5u2FCbwjDEb99p+pg28
	McKtiZ3KsVGr9YUL6kwV46zkQQFzZRgireQaYmopCxuSIp/bobVppT50khZkHXFtONYjUYPqbD8
	9V2aT1Qb/VF5epgeMgijw0AkX2FYNvVzHsJdhF/tpQp2NndTbOT1IkDkJ7jMHn7saWZdf5WkJbg
	60qk4nuWVfYjxd4DSpgY1yBkdjivQ3CVnzWjzAiM/KRia+3ivNFK+gfOFLrpmqLUwi+8RtBzOy7
	CrTkcGIq2LGzSW9XEA9z/xKzdA9pdI9EklD8yjcT1gRu8dosj47Th8GZMOsamQOeO5VzHbN/v0G
	E0gHSh8+xO
X-Google-Smtp-Source: AGHT+IEKPV1mDqGOVVYPo5Dl9iwUJkz3Pyogxlb0Dw/ywdn1uYyBawYEIL0oQBZQJ7G4wezTwQP7/Q==
X-Received: by 2002:a05:6000:2303:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-42566c0cb9fmr9597908f8f.10.1759756498580;
        Mon, 06 Oct 2025 06:14:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3e9a:117:edd2:a796])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe49sm20994085f8f.21.2025.10.06.06.14.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:14:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/selftest/buildhistory: Fix test if USER_CLASSES is unset
Date: Mon,  6 Oct 2025 14:14:54 +0100
Message-ID: <20251006131454.846597-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
References: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224482

If USER_CLASSES is unset, the test was failing. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildhistory.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 511c666554f..1edc60c72d0 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -16,7 +16,7 @@ class BuildhistoryTests(OESelftestTestCase):
 
     def config_buildhistory(self, tmp_bh_location=False):
         bb_vars = get_bb_vars(['USER_CLASSES', 'INHERIT'])
-        if (not 'buildhistory' in bb_vars['USER_CLASSES']) and (not 'buildhistory' in bb_vars['INHERIT']):
+        if (not bb_vars['USER_CLASSES'] or not 'buildhistory' in bb_vars['USER_CLASSES']) and (not 'buildhistory' in bb_vars['INHERIT']):
             add_buildhistory_config = 'INHERIT += "buildhistory"\nBUILDHISTORY_COMMIT = "1"'
             self.append_config(add_buildhistory_config)
 

