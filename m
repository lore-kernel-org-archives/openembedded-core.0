Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.11123.1632141994336491909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BBP9xj9Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w17so21171134wrv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gkunKkVpH5XZRBEZQ8jimi2+lS4Vq0QCbA5NctmZIO4=;
        b=BBP9xj9QuQ9sJPB6uJRZPM8eUye01DW3ZFW521FZIrFAiuRKXGvIiq7xZCfV40CfqM
         bWpc4mK14Y5d5/lVICNmLTJMk6BiSuDguwptz16w0xRQ6O3jmGozEN8U7F67kyXMTY/0
         o+2owWOKREGNiTVBoomPjUnhOmtZtbHxIGkjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkunKkVpH5XZRBEZQ8jimi2+lS4Vq0QCbA5NctmZIO4=;
        b=icLJpVmqjL3WlPAGzT5TcbxuZK83wAvuWw3vKcJyMx5ix/7GwVFSZ9Ek8yR96wh4s8
         NTR3a9aUxsFppG36LJfSNz5jnHVpTH616b7I7QwiKzU2au7+QDq2M1qmyv2ipuP0ybgM
         XZSNjL6r/UNt4dkfVKTjxRL+pl1AJENZis+QpLZ1Yj/lPOZXAk/KcC1ThCWk6slwn9x8
         xF3UzluyN2GJ+/YGZbcIrCboI2gYIqGleJT2/VRoDq76oA2RB49hwadIAfwWWxfIt8ML
         tr4RtRPQIg2yaoP8GkuDbR+Du0EwfIu8krT/w39/ce1ZaW26AYWLpMvghqOD0nYr76d5
         Tz4w==
X-Gm-Message-State: AOAM533RnkvdhNTQkBIvfUJrRzBDoYSJ9MdLgzrsD7H6Xl1mOqpA6Wt2
	dw98Jhm9enkaoiRreFiDpeVK8vgWs+LoH6tt
X-Google-Smtp-Source: ABdhPJytCUJ4zX8PUjXMcPWCY7XByjqgarHV3J5mTV5zGfVUUOrOEEs3NtSK5svKoqopCoTRTuB4/Q==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr28285603wrv.112.1632141992860;
        Mon, 20 Sep 2021 05:46:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:32 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 11/14] populate_sdk_base/images: Drop use of 'meta' class and hence do_build dependencies
Date: Mon, 20 Sep 2021 13:46:18 +0100
Message-Id: <20210920124621.1576702-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'meta' is old and not very useful. It empties PACKAGES and creates
recursive do_build dependencies.

We shouldn't need such recursive build dependencies any more so simplify the code.

This does cause behaviour changes as some dependencies are no longer built.
It did show up issues with qemu-helper-native handling for example but those
issues look like real races and the underlying dependency chains were not correct.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ccfe2232895..49e166e697d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,4 +1,6 @@
-inherit meta image-postinst-intercepts image-artifact-names
+PACKAGES = ""
+
+inherit image-postinst-intercepts image-artifact-names
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.32.0

