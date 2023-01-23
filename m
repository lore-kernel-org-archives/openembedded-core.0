Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB65C61D97
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.34108.1674440561127430088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6sYzBdLU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 141so7990585pgc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfhnXfrB1WMldGu3JcgvpDSREaH8K881o/pspLpLquE=;
        b=6sYzBdLUQSkB0KTplLoeotzWKJidJI17kqz3pdqVyQ7JAbhFWN9K72DVVB/hQ3OZnk
         gTDjfp+I+KQqqar7luReghCvnjV4pwweXa+fh39E+YJqu8mOT8K+XnPSj4+vMeEOahL2
         55G8hTZ3Mu1vzWtHt/GTxaGEO28HzLU8+SGiYaYsXoDMtIIzAEj63qlR41YXYtlFbIIj
         LDKkCh8rfdl41SagHikPsyyO07vFpEJawXevzNjveCJkNqOaKZFds52toZT9o8LWDSNi
         NvA2ydVs2neCxVavUkxr6YI0muXXvtvUCcE6XiBQxPQuSFOM6kAsFZuNvWkOeAse163y
         4AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfhnXfrB1WMldGu3JcgvpDSREaH8K881o/pspLpLquE=;
        b=2BXdU6wOs69WYEEKP8fsHH+rLoTlzMhTtmzFmUw7nEyxe2JQL4Ar8tgygrAqj5ova7
         RnnvbaviWTi3aj0JsAg4mx+FXVw5vSVDYZV60uSdUyBMm/X/QVHBYnWMsNgwEo0s7qsu
         DujyQ7klcjYJS5R7/0PHzOEnUf9K8f8A8MBLJsm6h+y0bfTEza+HbogKXcLuxmXNMIXP
         z1a074iQbrlweC+8n90M6IA5X5fbW4Yu2dzZN2EOvNJYHr5qlVGat3E4zlZI8ntVhPgp
         7Jds3RNt85STyBQxS77fluj1/s4/xQ7g94UnjJoRfoSuVXgVnO6CnBGA5bXt0/+2b6WT
         3UhA==
X-Gm-Message-State: AFqh2kpi5cS4ytwjYdibXDLgmUi8mCzeSED70G3H810ATvXnHVP4f3UM
	d95PT2YaMeDfHIRqUjJ3ioTOIYOm06CwosGwpdk=
X-Google-Smtp-Source: AMrXdXseyqAaBbzBonG72xYuYQQMWqgru3qlTKBORQW7d/OlZEaFqrvnYyE+zcIIZeTWePR3rWmXAA==
X-Received: by 2002:a62:830d:0:b0:58d:94f4:a8b9 with SMTP id h13-20020a62830d000000b0058d94f4a8b9mr26089264pfe.11.1674440560233;
        Sun, 22 Jan 2023 18:22:40 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/32] toolchain-scripts: compatibility with unbound variable protection
Date: Sun, 22 Jan 2023 16:21:23 -1000
Message-Id: <ad2b7b4d4138ac5f6f74f69d9d6d88a592b14c6f.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176293

From: Jan Kircher <openembedded@hetsh.de>

Fixed an error when Bash's unbound variable protection is enabled (set -u) and variable "LD_LIBRARY_PATH" does not exist.

Signed-off-by: Jan Kircher <openembedded@hetsh.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85685370b0ad93291cda59fb091a15eeecf5e0d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 1d7c703748..d2562b5d38 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -31,7 +31,7 @@ toolchain_create_sdk_env_script () {
 	echo '# http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80' >> $script
 	echo '# http://xahlee.info/UnixResource_dir/_/ldpath.html' >> $script
 	echo '# Only disable this check if you are absolutely know what you are doing!' >> $script
-	echo 'if [ ! -z "$LD_LIBRARY_PATH" ]; then' >> $script
+	echo 'if [ ! -z "${LD_LIBRARY_PATH:-}" ]; then' >> $script
 	echo "    echo \"Your environment is misconfigured, you probably need to 'unset LD_LIBRARY_PATH'\"" >> $script
 	echo "    echo \"but please check why this was set in the first place and that it's safe to unset.\"" >> $script
 	echo '    echo "The SDK will not operate correctly in most cases when LD_LIBRARY_PATH is set."' >> $script
-- 
2.25.1


