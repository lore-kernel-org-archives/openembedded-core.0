Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03148C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.82178.1674238316102496611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TpZKbF5n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id c85so4571025pfc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SG94ihhs13PxbjE7GKLcnIHJzIbmsprKdjR0CMpSUAo=;
        b=TpZKbF5nT9u0yfvjD9UnEQozCwniqLcWF/VXUees1bDpivaBXTm602CHfBKzk37sdr
         +s7eGSrXzHJmHLo9D2nyALMCkH/0cByRHYyQE8MSzHUvPRubPXoPqyY7cKZCJdln6FUe
         YTpZNlo4kTIYtColxQNYoaLqZhffreYPvPnPEvHq4mOGmjydOn9LxjMlrvzWTSy8+v+Y
         kQURgEsNWqP56f+yGYeBucPui/Wq8axsOBhkFKS6/CmJudgIITySSQe+hKXlDxvKaeHG
         gbC5Dy6iPw04YQvWBP2Puqsi+zDMgLrnN/BulnljpVNr0jtkDJKYMt8UqG/8sgHMTODh
         g33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG94ihhs13PxbjE7GKLcnIHJzIbmsprKdjR0CMpSUAo=;
        b=eHEzTfvAMod5Q6hRIQ1fY3lE28rc3Qh0qKuNLnodIAPKmV2iaevJbT8aVQp1bMMIKE
         2fMgpIbMnTjBRTUa3gbusDvvf1dYy0uoY7WWxpjaYSA1YAGZF6NcJ6+W3jH4mgSH+WA2
         ooUbmLXHKLzZ0dNoUwB7ai/6fFOHQHd2hr8iFDfonOIaaH2JajB3iVGbDZghhWSAjsKj
         GKwtB9TU0vJ5NHf/18rB3VSukn7JkuwXRhwOzQ0Ex/P6I57CNG6cF7M6L26/UZIpz6sA
         p8z+cdDUMeC0V8zHHRDP3UNwJJzBKMEpIzb/mMB29h1V9jbsD0JXG8ne7/2nTq/z9HcG
         fy6g==
X-Gm-Message-State: AFqh2krR2gqHqLO5L23VIkZUewX1AZk5xbABZN1v5Wozp1MwgnX6Q7vg
	uHjuZ6/j2vFwOhXvH6lNFTyqJgXY6OZbSNd/iqk=
X-Google-Smtp-Source: AMrXdXsHWbOFksJ4xBTNS2nCKt8zPaKFjNd93mU3H1Z6A8tLq4Dee6q0KEsNQOLeigDA6MeXl52gnw==
X-Received: by 2002:a05:6a00:1887:b0:58d:c022:d60d with SMTP id x7-20020a056a00188700b0058dc022d60dmr22105910pfh.18.1674238331756;
        Fri, 20 Jan 2023 10:12:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 37/41] toolchain-scripts: compatibility with unbound variable protection
Date: Fri, 20 Jan 2023 08:10:54 -1000
Message-Id: <00356d24516a34860e12975e4652e483edcae611.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176244

From: Jan Kircher <openembedded@hetsh.de>

Fixed an error when Bash's unbound variable protection is enabled (set -u) and variable "LD_LIBRARY_PATH" does not exist.

Signed-off-by: Jan Kircher <openembedded@hetsh.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85685370b0ad93291cda59fb091a15eeecf5e0d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 3cc823fe63..fa658a6596 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -37,7 +37,7 @@ toolchain_create_sdk_env_script () {
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


