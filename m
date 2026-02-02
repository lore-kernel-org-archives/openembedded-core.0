Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93ADE7FDDA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:55:49 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1120.1770065745217391906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 12:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nmto8U/p;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-503312a8333so2134551cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065744; x=1770670544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjxYzvvWf4Cu4hPx/VkxvgapdI94Oxv2FhCFriptyZY=;
        b=Nmto8U/pjTc8gQQuS81BzzmCp4VpmzhPUD/hGikWefu5Mb4dGMOX01kDbhp+3nbz5G
         X3vfF8N3Vpwnf7dYj27PFDjipgL2K0nOHFwQssC6HTY/39PLuwvyPT7PlGcp79q53PYi
         GYG8PUM61WXQ9Cr/D8mDNj8Wt49ykc9XLGBeg43fApk8WjOOPMGYezrCFOm8tRcWM0Tq
         2EaUDLjWrRUKXRT6K1oBzUsDvz3MDnMVWvhXXx53wPd8Qz89m1w1oZb6/phWg/TBDA8U
         6q46bL+yiV1++2CHRm0RxHRDmD+qBXgk4vsx1ZB73APGYt+M2cZ1lFtJMJe81mLH6/qB
         qJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065744; x=1770670544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjxYzvvWf4Cu4hPx/VkxvgapdI94Oxv2FhCFriptyZY=;
        b=YGVNBvQEvJOfMqZn6xRyNXLhqHzyS4wyaTbS1PkPgaNcUaUP278I7ircH2NRtAOocM
         Y2Tw62Nv1YpiUGxSvhJHyCY078493vADXSq5uM1uZUAy0K2pk+0lETOxvYsKBvQhKt1V
         SRVpvcTZXgE7I8qXxBWpo8VXxg/xgHtd+mrh2ThV0hTHOrJG050pXQ1yvzCdZ5yu2WKD
         ZmI/6G37zdaNjxzuI40fW4cY+cMUflnpBQrGKECU5/0+kItPyLTKHXPBdZAAXrT1+XF4
         /Cx8IFA9NTVKT/yFnBui0R+foKohKJfpPa/SKsTCN9WIN0Cs/3UeHS6nOfZvWjYpzJvo
         UGcg==
X-Gm-Message-State: AOJu0YyltmZK+NAsATP0aj8Lc8VUyksquiB/Ss1BNmjuE36AIQhiLxL3
	YNhsB2mOwpXegQ71XAeqYrSUIKOa85jQNPgAChDFD3GcvaxHpAFkXHwDYDhHIiMfnQk=
X-Gm-Gg: AZuq6aL3UZNMZOioY0x3Y/eurEq6Fzc3OMBqbYOtWVoEHLRn24Z5N7mC5cS0zUrZ477
	TNHBJhV/PKgUXznpgXwmHjmR8XNGuchkKCdhrIvJCR6uPff7y2afElASrlOPXReFwM1/O6YEveQ
	Q3TkLrM7UnoYR7KyDJohFOQ0+MklUSTC4uHLrjsw4JgdAsEtIyxez8JuzRLyK7USj23gzGnRXeI
	AfZpbBNlPqGWTjUdJ7yKL3RLSuDjHi1hKTwt50zpAjG3a5QBr0j0UyabwAss3dKfbBCXqTmAHkp
	ToH/0wdrK/ID2xfLUnbEjWeieh6PzryiaW/RImRnkpJ8E+gDo+PlAxo/2JfzoWnVFbTMl1+8TrX
	cl5X6NLdCJHG1CrB0zF9AZQMqDFZdbqx34lKmyuZvjkqncO2+y3ZRtexQGHeICP0s9sBo1ao3km
	A7oUHYqF187p2F6WdEQ3IdeMZuOJfJOTgsuH1HKIN+uFqVFx/n6fkvJNM=
X-Received: by 2002:a05:6214:6001:b0:889:e38c:d13a with SMTP id 6a1803df08f44-894ea073029mr120792106d6.5.1770065744154;
        Mon, 02 Feb 2026 12:55:44 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d28c71sm1356221285a.33.2026.02.02.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:55:43 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v7 4/4] generate-cve-exclusions: Move python script
Date: Mon,  2 Feb 2026 15:52:30 -0500
Message-ID: <20260202205231.2134908-5-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202205231.2134908-1-valentin.boudevin@gmail.com>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
 <20260202205231.2134908-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230403

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../linux => scripts/contrib}/generate-cve-exclusions.py          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/scripts/contrib/generate-cve-exclusions.py
similarity index 100%
rename from meta/recipes-kernel/linux/generate-cve-exclusions.py
rename to scripts/contrib/generate-cve-exclusions.py

