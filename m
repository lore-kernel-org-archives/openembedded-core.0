Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76D7C38145
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.472.1660894079242672342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8KqKtqr;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay12so1891736wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VS6RV+3DuB6UpJAZgfmDu8dAF2e1WmcFd6aIr0ZpMqA=;
        b=c8KqKtqre/JwZwdJyeSX+r8YIow9O13SSfcBMfzo/nXbir2L2KbvMj1SCmmEuE2lgC
         wIGi+tZsW3Dv26YD7TRUobSnwjyxFWR4JCCMC5OYpnxVhj4nToMTeUQFCbZKpuJ/wsD+
         yIzZmsSpZU1/peaAC5O1xNx/XpjDwWMouocJQ/m1y+AWgFo5AymlTx4v5+R5dDv9EMGh
         IuKYgYd1kwQPAdm/AK1ZYWSO18SJmqCn+q2h6HAnGgoLU7aYSnty8lyDfBzP+0HHNysE
         pKki1fCZlueqyK0m1cXt3s3WCce7maWk8l1OFCKJ8DXqlBT5aBaVuiVltnSLmPHqOJEV
         GTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VS6RV+3DuB6UpJAZgfmDu8dAF2e1WmcFd6aIr0ZpMqA=;
        b=YhpxQ+DCWA+OOqGdbVQT7nV+f292JuBAtkXA8oOc40pmZ9OA5xtBAJRAqTlNxQt/WW
         byt0iHJ1+UYJ4+KPPSf6l2qZll1O6TvDjh8a5bYLS/vF8+WiIvaPZLziDe8ON+7cOnoo
         DDAPMLUprSu6tKtF/jlcOIOxN0FNWlbJdfOSb5RijDdBJGVNJuaFMzAL/07Tg1fge2yz
         +QjjxiAZGA6RX9N1U/tTGNZfAMTO4SuSX0gCK2kyfu1PmjcIhSwZILgVhghoVOqsyHZJ
         GZaexmhfpTm92W9ZMWl+mxslSU5VSB/syBzYfBB10iPSMqu0ThtXlgrDFgV3QjG3SPlg
         1JQQ==
X-Gm-Message-State: ACgBeo3lD4fNEaYINP/giO7LGAZM4qQS+VxQVnPGNEc9rRebeAacEQbp
	H+hF+Zfu5TAnvMQ7EJdJsz2sOsGLU+k=
X-Google-Smtp-Source: 
 AA6agR5gLkAnc8xo3xSHtiadxomSzVOP4zsaze7UR/6naz5MFWeNZ2zew6dGGr/86Gg099zRDFPY6Q==
X-Received: by 2002:a05:600c:1e8b:b0:3a6:acc:ebfb with SMTP id
 be11-20020a05600c1e8b00b003a60accebfbmr3923390wmb.66.1660894077749;
        Fri, 19 Aug 2022 00:27:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/42] git: upgrade 2.37.1 -> 2.37.2
Date: Fri, 19 Aug 2022 09:26:59 +0200
Message-Id: <20220819072727.2236928-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169585

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/{git_2.37.1.bb => git_2.37.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.1.bb => git_2.37.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.1.bb b/meta/recipes-devtools/git/git_2.37.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.1.bb
rename to meta/recipes-devtools/git/git_2.37.2.bb
index 5d2524a1da..b7858e2e46 100644
--- a/meta/recipes-devtools/git/git_2.37.1.bb
+++ b/meta/recipes-devtools/git/git_2.37.2.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "7dded96a52e7996ce90dd74a187aec175737f680dc063f3f33c8932cf5c8d809"
+SRC_URI[tarball.sha256sum] = "4c428908e3a2dca4174df6ef49acc995a4fdb1b45205a2c79794487a33bc06e5"
-- 
2.30.2


