Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC20E69178
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.28635.1732292625154598340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UuDZaD0G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso19736175e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292623; x=1732897423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yK/hISS0ZMN9foPN32QFDy1sSyb37fAbtceHr+fCEVk=;
        b=UuDZaD0GHLrH+PsNqUsMGyl1b/NFFSa3K5eVTlXh76ykG1vj2frTjzzEao9sS7oqrk
         jMhLF7PiK7FjFFwqUZQ8n2yi3GLumnni5leU1zMOPCucw9MtEDYI5QUwo+hlNuNohpQJ
         pktocSBW/kjyw+1YHz6s3gVEq2dqd1YeSpQY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292623; x=1732897423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yK/hISS0ZMN9foPN32QFDy1sSyb37fAbtceHr+fCEVk=;
        b=CTQTLkzAKvWaREluGKcPb2WwIgL4IXeY12ihYcwCb7NFSixwZwOhDiCfkuGAcIV4lH
         2Rm/YDnk4ST2EKJLO0yMfHPSxscrwrGOSVy0k1OPKXrr0vCBIcem7LB0ASPtUIy5ALq4
         v2yE44yzBPCmgzBccGvPX2K9htL9KB3zpaB+PvjZ0GIligR5xWHtS/vRti16i0f7FSDO
         z3nOKRnDU0Lvv2Ow/8fsOSV3/m/LcQX2j2Noy8hpe38WR+wpu4kuIYWjJdQOFCG+9GEE
         PmqJU472PLeiYaEA/wyfeW9Y8LUNg05FLhkofMi4UyHRj5yXDNg1Gr9d4OgcOuQJL6U6
         2Ucw==
X-Gm-Message-State: AOJu0YzmGnBt3nbgXsJG6ieNweBs1K4SjkxtgyZKghvHGeRoZwT5J2kx
	hQcBFcwdtXcOHL1xppovUSOGDLtG2k+IE0iRoiDvd2/L6RdQkqeSSMuRqw+vJBgDUOQ9n9pvT95
	j
X-Gm-Gg: ASbGncu07QfbG8Uk0eQVTtrlKQvYh1Fh1u5LIBEjSlxseY+uuVbHu7s0xwFNyG/Mqmd
	gjC00hu3HiZnB++W2K6atNsH4Xy3SodP7lNTbqzf5ZjkmYa8eAzFLLopPJh+oKg1LaAfJqgAAvj
	ZyFHwGOaavXoSEul/VUh+3u+ZSFS5wtg4OGTh8kFaK3ET4TPLbImDK8eqCtxQOpMp43siMfTrOD
	zXL81jd9aaB09WyKuCAoCtUqmuctDFHE2NqQtxqWAA891aAlxvI23GVyZcTgMjeQ4aDAvylCnbW
	YDU=
X-Google-Smtp-Source: AGHT+IHDMBTBDF11IT+7eQvH2Tyt+zj3IBW005XTTRKoVF2gu3SibCGxFMcxejwFuCCaAALhq8iKWA==
X-Received: by 2002:a05:600c:548d:b0:42c:b67b:816b with SMTP id 5b1f17b1804b1-433c5c889a4mr68768145e9.1.1732292622901;
        Fri, 22 Nov 2024 08:23:42 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] oeqa/utils/gitarchive: Return tag name and improve exclude handling
Date: Fri, 22 Nov 2024 16:23:34 +0000
Message-ID: <20241122162340.2770780-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207630

Tweak the gitarchive exclude handling not to error if excluded files
don't match.

Also return the tagname created so that other code can then use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/gitarchive.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 10cb267dfa9..a826646059a 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -67,7 +67,7 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
 
         # Remove files that are excluded
         if exclude:
-            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
+            repo.run_cmd(['rm', '--cached', '--ignore-unmatch'] + [f for f in exclude], env_update)
 
         tree = repo.run_cmd('write-tree', env_update)
 
@@ -202,6 +202,8 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
+    return tag_name
+
 # Container class for tester revisions
 TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
 

