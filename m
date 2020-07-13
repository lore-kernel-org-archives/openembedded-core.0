Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.20228.1594649863385180743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OhZiLnr6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id l63so6060478pge.12
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bxbwQmodd2mM2Sz7gHCKvgmn9ohwr6NS6jX1/X2ttKc=;
        b=OhZiLnr69uo/4QfxfPEsr2EyzP4JfmLTS17H5xVS3hNn0czpTI5+YziPQUTcA8cY1I
         p0JW5f06Q+EGEhKlKuqBLSXqtCj8ezMhQuQXTPBBRNa+PTrnXyZqZhDzxFR4Kw37R9pY
         5G3cTRRyi83+ncXdrDGDRIulntp7FCfez+cIKmQG8bTydBjSLgRMESH8f9XsPBEnTWmq
         lAkg48QQJ/Tr946/tyMespQWZAX805ovxEtUHE8aVExdR37yq7hjT0bkTb2tbxFIHXTH
         6bQoAdapZ+fHpWS7Jd5X6jSLxAd5SfFILQpt0C/2Tj5wKO1ccbJY0rFBo+LRsSKwj+Ko
         bnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bxbwQmodd2mM2Sz7gHCKvgmn9ohwr6NS6jX1/X2ttKc=;
        b=F39YSI1l7tdcA+I6YVlYaPZtW60Z4ZKmx9i5o5qMhQxyFzSk+BdYqVDE0zMOX8jaH0
         S4FspM56Yinaaukh/TVofkxENPZQlq/IbjyaGRPeDN+f6D4kfdukk8YrQvt9TwG2tUxS
         FXQE0AcYAiBKuFYf3NiAfI5JDuOoW4s7Q7CWL7xwzoNpG5rCTFPUSFdrHkQxR17CooIr
         l+i/B2e4NvikU7Kbz2STEnyXpfezwC+pb3lFWfnbYtXz7OrMdNbd/hUbNZ9AA4phResL
         5nu6xhjRtZFkV5C+PQywwuoHF3pvyCUjwO/dVo6eWuCLKS4Woeqx5WOvwCrrBsPX9uat
         uYNQ==
X-Gm-Message-State: AOAM531NYJBunSbG5I1VTSvUr31WVsjmEhvsW//yNrEQnipOS+Z3gWWS
	F372DXbT89m0OaqtUdH7VufiA8Mo4ulkdQ==
X-Google-Smtp-Source: ABdhPJx9YFeMBjA65CcF414Wk8Afdw+woCTIgsctoDvW7zcLZI9OTS4MF+67ZUwWbrbc4yDKqcu6sQ==
X-Received: by 2002:a63:ac53:: with SMTP id z19mr66773861pgn.181.1594649862556;
        Mon, 13 Jul 2020 07:17:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/15] oeqa/core/loader: fix regex to include numbers
Date: Mon, 13 Jul 2020 04:16:58 -1000
Message-Id: <0cd06605399b4f8c701cf483fc2b300e30fe90a9.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: "Vacek, Patrick" <patrick.vacek@here.com>

The previous version only included the numbers 1 and 2 in the allowed characters
for the module name. In the past, this was (\w+) so all numbers were allowed.
Now it explicitly includes all numbers again.

Signed-off-by: Patrick Vacek <patrickvacek@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f241fa493536ac953c1dac303917c6e75b459e28)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 73c5788508..11978213b8 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -46,7 +46,7 @@ def _built_modules_dict(modules):
     for module in modules:
         # Assumption: package and module names do not contain upper case
         # characters, whereas class names do
-        m = re.match(r'^([1-2a-z_.]+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
+        m = re.match(r'^([0-9a-z_.]+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
         if not m:
             continue
 
-- 
2.17.1

