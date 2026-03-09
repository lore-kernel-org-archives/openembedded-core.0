Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A557BEFCD98
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:48:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11411.1773053294623655260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LgFG2CPE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so9931565e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773053292; x=1773658092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjr/fZSsbv4l7tZ+ypCUCcG3UkyHeCL0Gff0BdEXqXc=;
        b=LgFG2CPE8ruVAqDxAIbJsI2qd48TAQiH7p5pqLlz8f1UaV7LZ5lDpPknQyRvNg7mfG
         Kug55ErmivNjNoP96xkmQQs4UtGN4HL/WY/vK/T04SpmqCIsclBOEzNWmMkRywYEQ/UJ
         5zDdv0aAULD2Bb97djrumWspwWvoTIpYA4xaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053292; x=1773658092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sjr/fZSsbv4l7tZ+ypCUCcG3UkyHeCL0Gff0BdEXqXc=;
        b=aVSa4VEVu6kM1Chj0IiRtAzKKIQLbq5enN2Jp4tk7yCtC/Q5n1qsuNIUStXzW7u+XE
         ycNCMTG640Ex/T3ZhsJSLAIldAiAeD/CnVLuV7ySWBLYsibEIn6MMUcqNjVhRdxiplfb
         5X+qSFevvw3+AeHtTmlI3hRRcm2VJ4IUrq4L8LNcos/WrhRKI+8e2xamenJAyAUAt31i
         3K3Rb+njv6R3fvXekDlo4x4ZN5PCh9FAcolgYEh/smAJimFZXiybpmYEdtOGUO7KZZPD
         L/mz4z1ApdrU2seAGJnZMwreZ+81yVG3h3EXL6Dfi86lW8T3pgyZqRfrOiYVOUKcXhO4
         OU3g==
X-Gm-Message-State: AOJu0Ywap64iw0Yppf+gCqNDb9Cl5vDuCrvMcbwdgKoiUHoTu3wHTT2a
	mDgupWYeyXoC+IeNta5HZPVRcc84sPE/U29F0rHjF14K+K3953jQIEFX7R2AxmpTnKh6ihylcgG
	SLaWyNAk=
X-Gm-Gg: ATEYQzyYlJrPa1kNFaWxFWXuscnBYKlu4N/zoxCL3SchYJyGDfXKeexp+eueVPxudbl
	vzDwbyhtrPANYfGwiSc48wYEHKBHXwgvoC3eqdk1qgLsHHB6FVw7wyue0VnG/1nDbqH3ocNFcrT
	DV7SpcxZFJDQDPKjQo16ZqoNr8xwcjp6ltUkK3Rm5O+108441joynVa63GidWZyYzR5bqGCuxqw
	mCYxnkXdJ5Chd5VjarvjmJGB3LF/3mPq2nV7U4yiDbzD48rvCV0ED6kG3o3JoSA5owJ/N6qmOKm
	4mANqunXSj+xWV6vQsc71jD6ZYJh0SwymsaHc9Q6pCnk84Mk8guXJjc+RtBLeScTCzQsygqdZ24
	RMVs2DwFczoN11ESn4pvWjgkoOvOFXBY5c/m12KzHE85WYA9K1bnAvveGP0kCRZ3Q6GI9EJtabY
	iHCt52oRJpdo2Z4l9fQY8czBqwDmf6jHZjxLFBMV8tBQHosraRAcmoDnd9fPO+IQ==
X-Received: by 2002:a05:600c:34c5:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-4853f383f6emr17059975e9.3.1773053292285;
        Mon, 09 Mar 2026 03:48:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24aa:67b9:6ef1:bd24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae57401sm21265589f8f.38.2026.03.09.03.48.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:48:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-runner: Upgrade 2.5.0 -> 2.5.1
Date: Mon,  9 Mar 2026 10:48:10 +0000
Message-ID: <20260309104810.2947188-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 10:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232694

Pull in buffering fix:

"""
When running slow ptests, we can see an issue where the tests are writing output
but it doesn't make it to the process (e.g. ssh connection) running ptest-runner.

The issue is that the standard buffering for non-interactive terminals is 8kb and
some ptests don't output enough data to trigger a write. This can lead to
the controlling connection timing out.

This change forces the output streams to be line buffered in all cases. Most
ptest output would contain newlines so this should work well. stderr can be
unbuffered by default but making it consistent here seems the best approach.

Testing with this change on slow ptest runs (e.g. qemu emulated) showed much
more consistent data with this change.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{ptest-runner_2.5.0.bb => ptest-runner_2.5.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.5.0.bb => ptest-runner_2.5.1.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
index 607fe4b5ff2..f5628d6e468 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
+SRCREV = "afe64efbb3f028e898fa9a5efcdc3010ebdf283c"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https;tag=v${PV}"
 

