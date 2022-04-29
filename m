Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9312C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:49 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.11900.1651248165514106782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KNqi2vYF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so8977899pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Pei3BeWCPaQ/YvALjYtgq8+PY43BWvnoX4fJGeWCNkU=;
        b=KNqi2vYFR0oQSmPJ2811S9eYMjJSR25In9HdNnWrU+1RIngjagN6T8uITcNtFEMBYz
         GROOO7ecccIp9VRvEBKLlkCsd+JI2Sx25a4EJNKzAe22yJRoqEuszs2perLxOqTH0jDr
         NuDrz1Pm9xCi7NJhdfiGiSgLSLeEXn4wCOfacUDqPd2OJ4zvP1jC24l6J4JuDqhKProY
         UGV4yJpmGqPHmBQVdASigvkEjLodo+iX1oJznVUR9lxi1jXslszhBUu/9wkt9U9I83Fv
         wkEbnc/QWpilnz9TFIS5VahGLpy2Vfy64QIquusSqyy+k2dsl7RuJMjyiXRUek9VtZ3z
         FyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pei3BeWCPaQ/YvALjYtgq8+PY43BWvnoX4fJGeWCNkU=;
        b=at/v0ikkYpLDZOOoIdNhf5oW8AcbZnOPd4gJJkkCLOpXtepRhVlPL3aybYZ+AxStPO
         uATGnLHocTqoF4cbqgk2XrYS0B7mBVDe/lkS3lly+8GJHtP+G5NEcQaKGHnD+DdaPEfr
         1JrrtwNDI/28S8YFQkz0xKQpVgM235X5Z9Rnz1eL0rvEf3KPSCVgAqF9qZD2T5MdGxgP
         TI4Wv0r7O2lLIEpm5fAcNn3iot+mECRSvj+klTG+rx1tjz9FGbxQze2nCaogs6FiMg3m
         bkQZAM2sbs357DmqTd7LfnxUXVObAX6798aFjYfWE8BAjqVc2/7Iew6NKa+/KY+bCRgB
         /kIQ==
X-Gm-Message-State: AOAM532SPqNnmt//pqKfli/HYjtgd7+URUdYKD3owIEY+2j9vpFftWr4
	D7O/hCZ9rfwO4lYIlPzfYNnMvSOnJRbKgHgeEH0=
X-Google-Smtp-Source: 
 ABdhPJw8ItrOy3dfBmvHCrxK+U0hvYJkcZkmMuL6LIrVvMcXWZEeSBFRqySh1LCNbBnSZDflI/vS/Q==
X-Received: by 2002:a17:90b:1e47:b0:1da:31f9:e5d1 with SMTP id
 pi7-20020a17090b1e4700b001da31f9e5d1mr4740674pjb.226.1651248164283;
        Fri, 29 Apr 2022 09:02:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/34] staging: Ensure we filter out ourselves
Date: Fri, 29 Apr 2022 06:00:52 -1000
Message-Id: 
 <a1eba0f2d36f3bb03323a65c66dd2a83c5dd2c05.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165052

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adding a dependency on ourselves in this function doesn't make sense, the hash
may change after hash equivalence is applied. Other code using BB_TASKDEPDATA does
handle the self reference correctly (which is there for a reason), update this
code to do likewise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index ab827766be..9fc8f4f283 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -651,7 +651,7 @@ python target_add_sysroot_deps () {
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     deps = {}
     for dep in taskdepdata.values():
-        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]:
+        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0] and dep[0] != pn:
             deps[dep[0]] = dep[6]
 
     d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
-- 
2.25.1


