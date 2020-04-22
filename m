Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.2058.1587563542167862605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 06:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hWIJ+efq;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id j2so2473712wrs.9
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z4PQXSQRaXkrDCHgssNmvya9KnNrftSfUhO/WJTUKko=;
        b=hWIJ+efqBFF85r1XBoTj4sADdq0oJhoHsWPG48k8zj8ZJvVnASqPzgpNXe7fosWV1q
         dWvO1PvWsdizQLCzVu2MSKKNK1D0or5BFgWDwzoMtNMtIVRdkkil6RrjmZ4rubbJ89Mb
         2IZ7wTVBvFAxxqqrUrGbSFd+Vsf/9kKDoEUOr2SfG1U8j6SeOUEYY1MP6dfDE05JADjR
         ph/xM0pKQJwxRrRo2UsIeLw6rJawEXqZ5n83h0LAjzqwpSXYqZnYeBUDKdu8Zm6TrGeU
         HInDrR2Tb5kRPtf9dGFMEHz4cu6nCSiosyC3ldL1Cg0TfMM4RhwSfYW6SnEx5yliFg+U
         3qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z4PQXSQRaXkrDCHgssNmvya9KnNrftSfUhO/WJTUKko=;
        b=Wv9BZ7Z9QkLoud0pE5FKOF1RAgWhrzM06cNAo/W7qVNBgRMMEfZHDiQHhqcijxQVE0
         LtnI63wyR3PiNQ5ukvP+HynGbwF7Q9A8IK5U8KmYVE6lpnn+XVOE7hKYIlP/6QFX4YDq
         VEF/vpx94PsSM/mReHyESfy6uX5qu4IlFujWi3caBqWY4mTl3jB4xiVnHlkmEvhMMCFv
         i07fWwobDlI9lSvGxA84m8VaOFgDqH1C9hZ+1w8G+RQ3b4tyXYGihQK+QP0udQFi7Q0Z
         EfKuWv+O8V4k5sT12in86oLitU0q8wG9/6J12IBPdWWOfHsHMYffykCmVlhUfdIfwC1X
         hczA==
X-Gm-Message-State: AGi0PuZgx+BiJODLgg5s6P7pMkgS/GY6TgE5mQvPOo9TUfqYhD48mEIA
	IaDdqHG1z33gdxBCYxjTpQHlxddv
X-Google-Smtp-Source: APiQypK7wNBY1Vmx91s9RGEnHW099gX24rS16tl10VoQnPknBI+18bo7rGSHMwXI04uhZMqywj6+YQ==
X-Received: by 2002:a05:6000:1001:: with SMTP id a1mr31327674wrx.9.1587563540282;
        Wed, 22 Apr 2020 06:52:20 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id d7sm8155846wrn.78.2020.04.22.06.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 06:52:19 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/6] rngd-tools: Install as part of sysinit.target
Date: Wed, 22 Apr 2020 14:52:07 +0100
Message-Id: <20200422135211.121292-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422135211.121292-1-alex.kiernan@gmail.com>
References: <20200422135211.121292-1-alex.kiernan@gmail.com>

rngd.service has a constraint of Before=sysinit.target, installing as
part of multi-user.target is an odd choice as unless it's pulled in by a
different dependency, an other target would not start it.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index aaaaa290742a..084322ac40aa 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -10,4 +10,4 @@ EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
 ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=sysinit.target
-- 
2.17.1

