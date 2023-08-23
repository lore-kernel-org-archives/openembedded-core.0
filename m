Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3F4EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:27 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.13106.1692801446255386922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=l3glsRf9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bf55a81eeaso26316055ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801445; x=1693406245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jy8a38lKM6RTLupS2vvxIBV6sgzsxHKyY2BqU73obdM=;
        b=l3glsRf9yjltjf3xeh5u0UJ+/B8gzSCjhwM66RmyTj3llpOd2xbwFBO033Wb30Aznp
         uYxmOk8x6zoqOyqH5bH2IM3LOXDnZFkeg1GSSuiYaP4X5jMYfdspAyVaI8peWGQ9Wdos
         Z9914Gr/OkDCfp+y8k/csY9ClNRZnPsMerOqhbhdRvIg6dnzSpmlKin5W65BJw55Zc4w
         CvrfJtftfHqpReHo1PIqrJZazi+lAi0ESz87tePdoJUJ4xhT4te7EHGIeBnEiD2LX3ua
         RtaOslWqtJmF86P8V5i2HdhaIHj2B0Kl/e8lL97GAtubr0Wp5TBWOlJsnD0g+xgao7tZ
         ciYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801445; x=1693406245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy8a38lKM6RTLupS2vvxIBV6sgzsxHKyY2BqU73obdM=;
        b=L3ISVyenlpl09CA/k0IKBjYjvSfnEw1NV9ymnPouMBiVSBAFwKUbCMecAi22TtF9QL
         JHngOLzR+/CaDEIDENekDnKEBnpscKKJ02OW4gA/fFGErUAGvFYGFU58jshx2zzDrlgD
         PE7DOtbY+XAwKBYCgU9QMeke27ZYHgzy3CkzPSp8yfDmn/V4IBf1/lMlUB1PsQk21mRZ
         CXOUt7JAJ8+9JEuSmSIuHC7/Lz1FB2IOuCHuE4+XFWXtnJTVyRtxISrA72bS8keCNT7y
         OK8aMReGZYAw03tRJ5eEElWlaTZm56t4JvMOWN5HQ0ES5bWEDPda5FElEtF4VuEPICgn
         LRoQ==
X-Gm-Message-State: AOJu0Yz0SBQpYj2jesUqOzuO0Y7GIkx+UlpXRj70WKRkq+BhB2K8F0vX
	cafDa2/rll3TDC9CH06JhB51YUVOe55hTvJjqR0=
X-Google-Smtp-Source: AGHT+IFSGGLbQ3q0ovYDHab18XuWxvKXm7d4MVm5XR+q1yO8NjBf1ye30qaNIsXu6ZeDGdP9hJVNiw==
X-Received: by 2002:a17:902:d38c:b0:1b5:1787:d23f with SMTP id e12-20020a170902d38c00b001b51787d23fmr10154524pld.5.1692801445449;
        Wed, 23 Aug 2023 07:37:25 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/36] oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
Date: Wed, 23 Aug 2023 04:36:02 -1000
Message-Id: <4c02f7407d7afaefe1bc72aea25087b3f2271ac2.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186613

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have a suspicion that the read() call may return EAGAIN on the non-blocking
fd and this may truncate test output leading to some of our intermittent failures.
Tweak the code to avoid this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8920c105725431e989cceb616bd04eaa52127ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 4ab0cddb43..7c206ff105 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -250,6 +250,9 @@ def SSHCall(command, logger, timeout=None, **opts):
                 except InterruptedError:
                     logger.debug('InterruptedError')
                     continue
+                except BlockingIOError:
+                    logger.debug('BlockingIOError')
+                    continue
 
             process.stdout.close()
 
-- 
2.34.1


