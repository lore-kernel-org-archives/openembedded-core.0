Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077FFEDF159
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70320.1770985560715481067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 04:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VhdTrAoX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso6468115e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 04:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770985559; x=1771590359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uepOhfV3D96P+MLD9RV5LpulLfzHaZQczVbk2xWVxq8=;
        b=VhdTrAoXQJn1tL0FTOrKCwMyIGazI0mW7T92e2gouKIhxlPu0ABvK1jTj/5RbcOZYs
         7/Ap9LFuf5lMG8JxZ/L86jMb5vcjcMhd8RF0JoN6U318MJcweh+hHD0vwf27X0O2H2jl
         +WpcmHJ7cxBnstWa+vs2mGpvUl03o53W/N9n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770985559; x=1771590359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uepOhfV3D96P+MLD9RV5LpulLfzHaZQczVbk2xWVxq8=;
        b=xVRS2/Trw9sOWK6b+/Rnd00TfiiCg2mzuMexicA7HhoPKTtsTVdRyBEgFmLj3d31Se
         y7oSlY0k+zT0vuAeLoZleJXWVzAu5nY+OcLJnGMCx//jMFQ7iDSctw4F0IU6vBRmIRWL
         3/pIyJFmwY/VvaPFdCme+fhh5FailaQhFgnBGmdhHS1wnglSrITvUMK8vVg1P2akp7tp
         Q2Vc3B92AXpAkr7+UxTzXrNll0xY1yCtfMhr5QoRm61JkC16TTX0vr8lDe9BeCNG+pun
         zeeadXFXMhRn0ofEUW4i2euq0zN+jnPAkoEW8WEVC5RqC9Gl5HXf+l2UaG0HLjkJ5AZD
         SntQ==
X-Gm-Message-State: AOJu0Yxwq90tTSO73e47CXh983hFyEsnBqkRDOQ9YgtIumqoVyVa4UQ1
	KnNx4dVr2UlpBW1uFp0A4aUnlyEFWLebwo9jMavMDDvq/OFRLKR0Jmnf8xKqVGgKLivc6m6V5J6
	OO/5ItN0=
X-Gm-Gg: AZuq6aL7ZFhUlvjDeLZCHUPxWulWq1u5BIGPdAV2mZ5eXYmGqWoYZX0HfNs68Z/yELS
	V+KFY64x9sgI1JOpOmkV0KQzwKSj0lk43OGp053wkU/I6kyxRvS2UqMvKQWm6sT5fhbgNT5rIdW
	xLVvaHyX+sI3x+ymUByQLCEQwS9/zG275/bDW4yoE7PrJpw5P0TSt7DPp5+7La9bfRy4Nx7X6nf
	fge4Mz3qTLKF6aXs5P3E4gtbhgH+K0+TPt6Z0LQf0D48rBNa2TZVY7dqJgHtPW0wYgZOCieKwJq
	RaGtq+C346ryJoev6cNeUoIpanzpYcMRHA7BqFKfnhPpYOy/Tf1ZMlGzFRbsooRCN88LYKa0YFL
	KovOK2GyKQUEObTgqWZtmh0IBbeAxgtz2qXi7qKPl0PHKI/QnNd+tGX4+dMJYTfu00OL0mdxjAp
	tpZVoMddhmHraX52MQaUoEXHvcaFK8naHj1tdH7uhqpdWyi89wap0=
X-Received: by 2002:a05:600c:4fd1:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-48373a16361mr29613455e9.5.1770985558438;
        Fri, 13 Feb 2026 04:25:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370ac3564sm47915975e9.5.2026.02.13.04.25.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 04:25:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include an openat2 fix
Date: Fri, 13 Feb 2026 12:25:56 +0000
Message-ID: <20260213122557.1697239-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 12:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231115

We're seeing occasional autobuilder failures with tar issues related to openat2.
It appears there are definitions missing on debian 11 and opensuse 15.5 systems
which mean the openat2 syscall intercept isn't compiled in. This then triggers
on systems using the openat2 syscall, such as alma9 where it is used in a tar
CVE fix.

This updates to include the fix from upstream pseudo (along with a compile warning
fix).

This was tested by taking sstate for pseudo-native from a debian 11 system and using
it in a build of "bitbake nativesdk-git -c install" on a alma9 system where that task
failed. After this fix, it completes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ed1e8fb3e01..2dc5eabf2cb 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
+SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

