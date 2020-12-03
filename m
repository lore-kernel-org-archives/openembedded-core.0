Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.10168.1607002657119428613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hJo2Rbo3;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id f23so3532864ejk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/V7cH+29N+rXVgDqTJKsPWsHH8KyZBW9Dsa/WrmC8a4=;
        b=hJo2Rbo3WF0ta7v6GZOvU+5hf8bRhQTYPB1ojBE2sZZCTRqIvLspQD0GNIXVk75zTA
         8hJ9N3F7YxiFdmLeua/azYCRx1Th9oEXq7WWvFkbwlSg49uEe6aDIqCfSjGARa7HcUkN
         bb8rRH6W+YYMl59ptn7OMKiporkCC3dxZMlASV2/cEae/97h+MCxFAuF1ZgJBw/bFde8
         rxo5uZP3t2p5oJuIxwx0ZZuOv1eHJlWxGAUVt+mpebcxxfYN84AXwZk7ql2KvqPXBXV4
         MCbSwUDDFGSEs+RpxHWdcKdDzT63OvH+Pm92olqnO6spv203N1uANLGkl34zG7HbSiMc
         4xOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/V7cH+29N+rXVgDqTJKsPWsHH8KyZBW9Dsa/WrmC8a4=;
        b=Qff1mJ6mBbuAQzf0VUYEg24RTM/CRzvx+0twApRIV4zpcle5nhz0B+nKMesBuqV2Ju
         IQcP6AvTkG24IfDW+R+8+HZLFcg/nfwmCUg+G7DboveGVzGPH572rjssXxoDIKcXZSwA
         GGGHuSLp0rkk6wYKFUU/iWVI852vF7qFQs4tY6RS14adlOpith1SgLahuWav0uXyd15C
         AjHPdChi8Ao+FhY3Cq2XIao11MMjMKqI+7eVw7Zl6K6fVLEwnpqHxR3tCaxCPxHv4Ta/
         +MEvR+7vQ9ByV0rRaROKZQbpa+/8l9i+OBqW7AsKcr7ZksvuBgtLltRiroFFNr0kSYYn
         gTWw==
X-Gm-Message-State: AOAM533e2Ht8ATFU7EewyWjhM9yhRYxJ3q0UCVsZ5gwk+s2/DV2m4Xu4
	ObN8Vvb9qZv1yQ4oUXt937OuoqrlH6SGGw==
X-Google-Smtp-Source: ABdhPJyuOm3LunJuI0oshA1LlmX7WCDI91vooFnAK44MwtbzVZGLO/dp+kZOLUcoFpifQ7BgnOdj4w==
X-Received: by 2002:a17:906:46d6:: with SMTP id k22mr2518339ejs.542.1607002654979;
        Thu, 03 Dec 2020 05:37:34 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:34 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/11] meta/lib/oe/reproducible.py: gitsm:// works just as fine as git:// for timestamps
Date: Thu,  3 Dec 2020 14:37:17 +0100
Message-Id: <20201203133727.12936-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This in particular addresses vulkan-samples reproducibility which made me scratch my
head for a while.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 421bb12f54..0fb02ccdb0 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -47,7 +47,7 @@ def find_git_folder(d, sourcedir):
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-    if not "git://" in d.getVar('SRC_URI'):
+    if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar('SRC_URI'):
         return None
 
     gitpath = find_git_folder(d, sourcedir)
-- 
2.29.2

