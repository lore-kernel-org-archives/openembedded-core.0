Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B92EEA877
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 17:46:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77802.1771004762589982737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 09:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y123673e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48375f10628so5013775e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771004760; x=1771609560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ+Z37SR8cJwzUYiZOhnFeiqtgmqTuMFSkkUJmHpZr0=;
        b=Y123673e1yegF/F/PRcAg+NG1Sz1h8xT39FsMt5wDs4o6+jzmNUc6XfoeFl7sVVvhS
         DWfJFOInQiFMzlDd/nB8VI89ndH3QuJFZmCvF3vV4BTVxFwYzybkJ4/u12wacBxwKwc0
         IDQH4vut9fht/+kUoCBI6/C1g18D2MnBds1Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004760; x=1771609560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZ+Z37SR8cJwzUYiZOhnFeiqtgmqTuMFSkkUJmHpZr0=;
        b=eo4EcbZ0rjIMhAlb32w1iek0rnawUgy08J89WIiP4sR5o6N67eXC368xKcIG6rv4lG
         6Wsu5vCyHnx3fxiJPcMAElh8zeeDIg0UyoGvazUeqlcvJmMn9CuRxyf51uA2s3LHz0eg
         5GHej4fQoyE3vS78ijUTopVSRmhR5Ji+9JooAdJb7A7+btICkZ5NmXQ4m6IOWRmJF17T
         dMSLdGFJ5bzj1Xez2vzFG3elyJ6XgKk4FBtqJ29KACVXixyKLeadO51jOMJXYW37CXyS
         +7eT9q+KolIM11IUEl3pmQf6E9qyDbl5bBpiOTrVYQxYP/fw1BAy2u7ogzkzaNZIBl2S
         V7kw==
X-Gm-Message-State: AOJu0YzxpXTvteg6h5bJ1EKEoyX0jJle1qfX6BM7rPg3TQt2izaD9hMr
	Yy+nA1XpsDa0JU/4fnRcQRPBlpiBEti2cqA5uPJVygNT+rak+JKPLHk2gMeqqz2ADwYXHMi9E0H
	mD89Am6M=
X-Gm-Gg: AZuq6aLpG2GyhXX3dysfSN/Q8XHZ45ihduIxVW6gJUjiukdxeh5CWSsXIT1nWVkCjxZ
	0B/CrGhw4zBr759vc9D77z3uA2+AIcCUXzFzhvGlx84g6hYzuv+ckz98ZLT9+Pkhv0BB/ttvQkj
	H6m9696a939ixfgPJ3MLGI1MP/U/z95IhIDTTp3D1IhKGEilNNImBuwYZTn4vHgkDTBEXCL6oXj
	CTwXYHlNSZLBU6bFxpBOOenqKEi1a+3o81uif3HbglIIXTc6RGICd4COhj2I0pJj5Dqh9nDZCaO
	suMNPnQ4SpWvYfVwoo1pnMTwHNdAIcWd1Zz9JZtCzhBWXVbAht7yug/B4uY941lLd3BWPaVpw07
	NKw3o6op/jKLn2QoUuQYmZDwPfBLW7u6NHz7b08f0BD+hGnYJioadM5cHvF2jlyZiXjApFChveo
	KwFVFiboqMLiK5C8JNa+ztttWCavoWXLETmZ+ixCHln/p3VxVw+9c=
X-Received: by 2002:a05:600c:450d:b0:483:a21:774c with SMTP id 5b1f17b1804b1-48373a44430mr43485425e9.25.1771004760364;
        Fri, 13 Feb 2026 09:46:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483709f6935sm36502655e9.0.2026.02.13.09.45.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:45:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oeqa/selftest/buildoptions: Drop pointless/obsolete mirror entries
Date: Fri, 13 Feb 2026 17:45:56 +0000
Message-ID: <20260213174558.1799136-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
References: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 17:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231130

We've never had any of these sources on this mirror and support for
several is about to be removed in the fetchers anyway. Drop the
obsolete entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index b46f55e256b..d9d37ebc7fb 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -178,13 +178,9 @@ DL_DIR = "${TMPDIR}/test_downloads"
 STAMPS_DIR = "${TMPDIR}/test_stamps"
 SSTATE_DIR = "${TMPDIR}/test_sstate-cache"
 PREMIRRORS:forcevariable = "\\
-    bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
-    cvs://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     gitsm://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     hg://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \\n \\
-    osc://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
-    p4://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     ftp://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     http://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \\n \\

