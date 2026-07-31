Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB7C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:47:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3130.1785491232709286577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lr121rJW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-471eeac43bfso792637f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785491231; x=1786096031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKcYSrzQ+yTXaV+2JRKRPOoGIxCKeHy45N/b7zSCGW0=;
        b=Lr121rJWbPkE7QdKq4MXzqQzixEdbMD9/jBH2WjHoyJfVurc7DDxPE/Hn9//CfCU7q
         dhtX96oM5HnjwHvJeJ4DRqYU0HlWz/2uf/9SEky54vXlSc1FdMv5YnmbpjtIshEi58j4
         nJbEzY+86/bsE2vwE/N/2MDvP5Ny3pyVdF+ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785491231; x=1786096031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BKcYSrzQ+yTXaV+2JRKRPOoGIxCKeHy45N/b7zSCGW0=;
        b=IuY01B9vb++ntT4XKKJPGSScTQGsCRnOXVKfZa8LWKKuRlofVu/LD9dMnI49Vv9xEH
         OKBiDo03mEQaS+HQFEqbr48Xd+akRgAoTQZokSv8rtTEQPs6P1uz3yidk/2d2TjyoDaP
         V+l9xTJRQCz1mMwTA1OsHP9J9/Q4zIwaOTEytXB3X5E93suZMzCYM0tAvwtf75FRMYq5
         vqxSPJbHHzTJIf0WCT4eCwICOt9muYCjMyvN8KBUk0rvRNSvX/EohaXV8FrNfGjXJ97T
         aREClr4P5tMC0QoNKeEr9Wf1ddBMtupyuFTnBSuczRz8k6vnl/sHW4KsoJKEw+QhWi7S
         9ZNQ==
X-Gm-Message-State: AOJu0YxV7HXp5pSQVxIxYFGtTM0hy6WddoG8jXvW1mxNDUBA4nTNtZTp
	0IgsdzGpzA4OnSmAHicfVH27HUE8/5gthh5ERbpOB2/7VrJ8h+2falmJLyOCaHSlOr+vexFWWlF
	KJwx2aMQ=
X-Gm-Gg: AR+sD10fWbj0N14bnRUAXa1MfjUkUHEyglRinrxbPpW0LX1v1USP4GVKFZULzNMEvG9
	ZooMRNrZVbwPZaTEqAfaPjzb6Cmg1mv7re88appH0XVyk6Tvxnyvz0pFnAMf/BM/Rn4msFq/jyG
	lgfriAiHc+jUWaTvZOzznriw7qhsvxswH9DxtrngN7/Z8iNDTTvZhXrT+dBpG/cgtF+bgDMsHqs
	RWaou8v1X/9+AVBisTUqSVDQf+nKdZhVkfuypqQhW0VFB2Vpc8y5sVM69LiQ32cK8SkGf+9zM02
	DEG26NYYdVg0jmqWKw0iTrDLi7+Jfpt1/BZ2xpQtnbr9Ud3z6W6w4Z93yGp4HphxChGy5XTdZ9M
	eHeOE3KYGPkB8tiiZ52MQ6XzKgAnQ1kS9w66UhdvSOcZ4BpJAkUOS0gkCfwKMyWFh180AnZlafI
	up1WD5Bvb4/A4rcgnMyC6QZjXXIix2xePI0i6vYGpgyxjELB/riaoeiM51Hs1ZZ7t/f/JbhvmZj
	Km+i1UykFjO7NolGdO7uHpGkaWs7oXSTz0m01Mc
X-Received: by 2002:a05:6000:40dd:b0:47f:5ec2:d54 with SMTP id ffacd0b85a97d-47fd2abab38mr3220952f8f.5.1785491229453;
        Fri, 31 Jul 2026 02:47:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7f7b:46f5:a0f7:875c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e296csm2967749f8f.12.2026.07.31.02.47.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:47:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgit: Add nativesdk variant
Date: Fri, 31 Jul 2026 10:47:06 +0100
Message-ID: <20260731094706.609988-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242419

There are cargo/rust components using this rather than inbuilt copies of the code
so add this variant.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libgit2/libgit2_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
index 7310dda66dd..999ad6b05c8 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
@@ -18,4 +18,4 @@ EXTRA_OECMAKE = "\
     -DREGEX_BACKEND='pcre2' \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

