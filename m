Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323B4C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:37 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.46664.1674657755630056628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=J0AsriL3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id d10so13497003pgm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTKkzQg7q4a6DLzIWAC7Yec47qBOSSmJ2RIyAK49Ynk=;
        b=J0AsriL3q0HCg0lR3Q/Iz9SLT/OpB4Y+DIAJw4zHCKcRnIRkrpNqM5susAlVrezh2W
         shVN9S89dL34uXwyN51j7fb6ddnK5urA+jTtCtCQsZFyqQQJBYoJgxW/JRutykAzttZE
         cie00+OyrCufm3r8Rcm2nkkN6g2uYBJNsrVZ3PEPDlTZqfwuFYL7o5AccaQQcTkTmNwE
         Q5b/PtSGhmNjPWFAK5GgAib847/fuXWKo2MN/1qrhYKqvw0Vx+qn9Wu8pjC7W6esMrbd
         LcvfAUhpF70kiJLbNV/eYlOY/4Rhflh4GlIYIJDyhQU1+RZzevJBfx1YiEb0tWWO7CUY
         OmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTKkzQg7q4a6DLzIWAC7Yec47qBOSSmJ2RIyAK49Ynk=;
        b=uTaMuYsQqAk2GmDwwk82L+L0G8f651Ob3C3Ka/5Feyd314+5Jg/xvr3rUV91xgwfOS
         aUeg9/sU5v3r7Cy1uR8lYBOOUJ6cwwpYoqRTrTq8Zuy1EhaOm8Llz31KB7m6lo/s3qKg
         uKrKcqQMwKe/cO4u7nuLX1FaUuiwmQuPkmGkWfUk+oIhUMRZW+qyOSQmZIyO9rSIWblJ
         tr+PEEo3pmuAORAZ2Ontv295tYLHOnTfX9U9xaZOjypCaJGoYDyE1lcmXfzZaOhPyvb9
         Fgez34AQNtjZMbw7Xe8OEf/7yQs8mDz2OinD4PAZr85kCwyjJsxMou/oy9aytmjFDzkz
         tviw==
X-Gm-Message-State: AFqh2kq111Nqq7VWqWqcV5eSjRRUZGRZC9vd72gvXxYfVVR6tunXivD+
	dsLBwYLFaqJ3h5jqetsSo16ovdMZlYH5w51ksjg=
X-Google-Smtp-Source: AMrXdXtTTUNmefq5IYYqU7FcocoGRWzDHm9wyYVoiMrHJPy/DOiUtdSEbtP1YEQMOuVsZTPCZozt1w==
X-Received: by 2002:a62:384e:0:b0:58b:c66e:1ca8 with SMTP id f75-20020a62384e000000b0058bc66e1ca8mr30281901pfa.11.1674657754631;
        Wed, 25 Jan 2023 06:42:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/16] toolchain-scripts: compatibility with unbound variable protection
Date: Wed, 25 Jan 2023 04:41:56 -1000
Message-Id: <e3c671cbc723e17a8847ee15aff88a256afb3ac0.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176364

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
index db1d3215ef..9aa31dc6cd 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -29,7 +29,7 @@ toolchain_create_sdk_env_script () {
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


