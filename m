Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A32AD0C5F2
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:16:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7915.1729847780806193154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Yv8Kv591;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431688d5127so18219615e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729847779; x=1730452579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qr1dEQsu6gk8Du3FfXChzHEd6rAaQ9gEnKc1VpvZWx4=;
        b=Yv8Kv591Hd141NOawUhuNx6ODnHDW/ecHbLcOmqCS7/wvw8AHefHdQX0HzJdUDS3B1
         l6uvn4HD6EMUKm6pAJpLWNhP8olzXQcxZaW99u6juMc8BXiPsXWqM30mhwoUOk5/xqtx
         TJZl0xIkNHUlXrt6zLvEDmbzH5Ysp6qOw2C2b30NYBfvC19GMW4nEwU3j6jl9dwKybGl
         oKtT9dgMKltPq6A6lBuAIk7Wwz8gtx8osKrtgIG+V7bopxuK9zN4895YrnARZRX+OGFJ
         VLXMHcwX8aeGXQACNXSyO95KVANCUZMOcJv457O8dMv+smqEHx+nB/wuQu+2dzM4bRHn
         VNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729847779; x=1730452579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qr1dEQsu6gk8Du3FfXChzHEd6rAaQ9gEnKc1VpvZWx4=;
        b=X5QlqivC+zNxPaCbnwhgY8nC+51RMi/pQD99vbiDmg1mpNoDUROGwbebcK/WiwfcKq
         qklMrKsyJNMYSnN/BiYa7QIAseJbYQMG6kzxn7xmAOAIUsq1zIV7xBBfXpwQU6sFJn6Y
         uZV9rqbDowCZJTsZFBV1t/sS8Hi48hyp2UjnqHt9Z9DeKaERtZ4YIcpUYLGDSExeaLYj
         uO6gU6IhhSt186B3dqckQ5KUWK+8B1HeTwKUqKqE6vnanpDUHpDpZJGntRNDpYivc3Zo
         DbkBo1NqgD00pKMXqtx0xg1ysavAUzt0a7kjegTtoAGXxCf5/kZPtw8VW55BBfEvXiXj
         Uwzg==
X-Gm-Message-State: AOJu0Yz5hgUcWX797Do/UN4/lEheTiTENqLc1nfdEzcPFEqbaipS6dLl
	0eLOPEqqBe9OoKc1Bqd+WyZzdeNbHgUc3DvHMTOa1v/nhi+et1JM9zovWBWNQk9IbxhxgIKfD2S
	X
X-Google-Smtp-Source: AGHT+IH2L1THFrQvM3bTqhKZ+q2wfByePt7Va19fgE0i0MWqaeF40VkzlfAHTs3hCr004lXVtN3VNQ==
X-Received: by 2002:a05:600c:1c91:b0:431:5d4f:73b9 with SMTP id 5b1f17b1804b1-4318c73a475mr47705895e9.26.1729847778854;
        Fri, 25 Oct 2024 02:16:18 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a4c0esm12108225e9.27.2024.10.25.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:16:18 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] libksba: add bison (yacc) dependency
Date: Fri, 25 Oct 2024 11:16:13 +0200
Message-ID: <20241025091614.2034294-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206344

Add build dependency to bison because yacc is required:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=blob;f=configure.ac;h=a2b213f245786d010e0fbf3e19291f0b1ab2373e;hb=3a4382259c3c6e7ef38cd33626fe2c1da282f816#l162

Fix ftbfs (triggered on scarthgap, but same apply to master):
| test -f asn1-parse.c || /bin/bash ../../libksba-1.6.6/build-aux/ylwrap ../../libksba-1.6.6/src/asn1-parse.y y.tab.c asn1-parse.c y.tab.h `echo asn1-parse.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output asn1-parse.output -- yacc
| ../../libksba-1.6.6/build-aux/ylwrap: line 175: yacc: command not found

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-support/libksba/libksba_1.6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
index b7a9fc4050..7d308c66fa 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
 
-DEPENDS = "libgpg-error"
+DEPENDS = "bison libgpg-error"
 
 BINCONFIG = "${bindir}/ksba-config"
 
-- 
2.45.2


