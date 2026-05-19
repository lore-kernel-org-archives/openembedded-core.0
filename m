Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56573CD5BBB
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1012.1779233440444076579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UlmJL6Hr;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so45499775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233439; x=1779838239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJQUh3B3wiA64y2/Myi3VKjPXL7aY2yWce5Bxkt0nNM=;
        b=UlmJL6Hrzlm2FZBh/23KovQF8ikMz3p3HmXzLqppVH72BylwOGlP0PQobwCB6G6LTb
         BD9GLY3V1R4iz9MuOdZLWh7hiFrcLDBjdNHFORvW+q4Y0R55kD/pyjmm3N2rCPt+k23W
         kw0DRtHu1tytFF2VRF8Z2n5pyMZZl83ZpKkFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233439; x=1779838239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJQUh3B3wiA64y2/Myi3VKjPXL7aY2yWce5Bxkt0nNM=;
        b=GTqITawDVUe3Avk3eZl0dvxg4zkjKxfa0p9EXg4/No5jtyXnaimEPyron6lYLVsk/m
         Anwqagg4/b+mS/M11T5Ylp/0wvqUTi0qM5GqqyVD1WIPyUyzsMRFylARDmV3eAtYYQ8K
         ZBe+zT/jhxdXa99EqQW/99OkQpVvLivuhm8aT+J63SLZ/z03dxwUFu6c8/2cI3TDRb9b
         JXqcSXKrhBo9rF+EPnmMQJV4/pP8WjZyHYywrU7X7bwXdJJbF4yiwX00p/8KNt49aPnG
         3U43j3heOtX7Qu/zX9sb+TA5FOHDBdIrF8Glhmbc5e/YD00/1zia/MnWAJ8icXJmIq0D
         TO0w==
X-Gm-Message-State: AOJu0YznRZ2y41CoO9xTkxBJzdSQlHJHGUSAyVx8vvVI3aSW/ZnnAA3E
	LDaLYBQlLxKMsG/YlNGgYTqgDsRlDrYS15Z+xmG7ajEU2+Snc7dUusdLQdsplxd7CgQ1q9exwet
	HofSB
X-Gm-Gg: Acq92OHr82inCMagQ61A6lvW5ifxOEWJpTLuriohyAQLM3sqC2It1NiDwx3qs6vvY12
	DG0X4LyS6ia3scL2s7UFjukFUqBre9LFTxVad1vMNlB0xY610iNYVMlNKGOr2cjNtKgYA1+7dM+
	5rolFmUi+BbhykpbK9+RDvZPIP2kuJ5W/yaGxT2EOxoqog3H94D8Kh5OYBzYr91IaT7OE0f+1Vx
	T3DF8YxYngpjKPy3/UKftmbdFud0INm5qgyG3aFIz7b7cembbNw8PnCF1JLHKDdQTPU9w15hS5d
	JqMVzzNp/Y6dmYivlK0WBVtCq9QURQADLhqRiTLOLWPrdV8Y4mFoTsFrXQbeU5JLlZWoLMKWKLn
	ti3DA7L7V7CLfyqgibli/bETY04A3DWYHU5vO89L++GPDwfAeY9mKxjNCVkNhq9kStmmlJFpyea
	GMNdqCzRCcY+aZ2B26+ZFuUx7iJvavq3eGrwdamKsdFeiQmzNc62/jHGFqeEd5BrveI9CcHo9Lo
	zHFsD3jOqmY3OqvggrVjtNawls=
X-Received: by 2002:a05:600c:8184:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-48fe60e1451mr335763805e9.4.1779233438655;
        Tue, 19 May 2026 16:30:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/28] features-check.bbclass: add reference to required TUNE_FEATURES
Date: Wed, 20 May 2026 01:29:58 +0200
Message-ID: <cfeff9b548060fe07c30d44cf50e64ea589fea1a.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237368

From: Robert P. J. Day <rpjday@crashcourse.ca>

While commit a8ef7339ecb9eee909224e7cf23ccd48ef105d93 added the
string 'TUNE' to add support for checking required TUNE_FEATURES,
the comment was not adjusted appropriately.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66e76b68460d5d7480e686ed2d94090d69fb4b90)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/features_check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 46d8243cb6b..d69cfb8309f 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -1,6 +1,6 @@
 # Allow checking of required and conflicting features
 #
-# xxx = [DISTRO,MACHINE,COMBINED,IMAGE]
+# xxx = [DISTRO,MACHINE,COMBINED,IMAGE,TUNE]
 #
 # ANY_OF_xxx_FEATURES:        ensure at least one item on this list is included
 #                             in xxx_FEATURES.

