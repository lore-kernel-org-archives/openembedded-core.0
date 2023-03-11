Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9002AC7618B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.35735.1678494450528446424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PSX2ZMvz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id bw19so6537530wrb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0ZfgOt7822H6yAixY4pfSsV14EI0B3a6qExG9Ca0PA=;
        b=PSX2ZMvz6aR0qD0XUJMBO6EV0xFeOGd6QXg+wBTsW4J6exivsmN2oVG2Mqr6ccuwof
         8dEQTOcc1zubGddVoOsQGhRavcTt321i6m+qe6AuM9KxkoSFtUd17PERgjAN2l73PBsg
         baUgAI6T6AtdTuy3+YwUviGw3In6g29POo/GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0ZfgOt7822H6yAixY4pfSsV14EI0B3a6qExG9Ca0PA=;
        b=M/7h0SFYk7WV0j63jJUCn+UN/kfm2fn683UCcB6OdgHY5bwPBwoT8Ose429O5g0iIS
         Sg2x9X6v+H6uVqgleo3R+Z9Wf94G4WCLzG3AxsWHFqeCF6F3IsECi8R8U2oVVp2K8yR9
         3C17coYdm/wFIkNJuTi9YLAx6aJrb5qdGOXr6OwmruJXog+j8VAySQnhAjN9H1UhYZp/
         DE3Ok8K90e03PMUTmiQCe9adC7tcN2/hqvBoFoecrA1CH0xEZhMowbGC3R1xkO7RAyE+
         RrYzjv3Fpa6qv/Q28CZc+nqtOCus7l1A27xxwpFdqSmpjbMi1brk8qekFBRW9s/dLJa4
         pLrw==
X-Gm-Message-State: AO0yUKVx+rAB9pMzI+F80LyngOZF+ixR1iejr+tKIZmLTRdWYxIJFGah
	ZZSnEXYX5z+ybcAbPhICUaBh/SXe3OrMtqRP0Ok=
X-Google-Smtp-Source: AK7set+v2ZUup0rlEtyq9H27vnmwN5vBk+8GjAodk1nLrRoQ17o2OfOnXAxRFQhzlNMztWxHqODfaw==
X-Received: by 2002:adf:f446:0:b0:2c7:ae2:56df with SMTP id f6-20020adff446000000b002c70ae256dfmr17353192wrp.70.1678494448879;
        Fri, 10 Mar 2023 16:27:28 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/16] findutils: Fix ptest dependency issue
Date: Sat, 11 Mar 2023 00:27:15 +0000
Message-Id: <20230311002722.3211118-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178354

The options used with 'od' don't work with our busybox config.
Add a dependency on the full utility from coreutils to fix execution
in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/findutils/findutils_4.9.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/recipes-extended/findutils/findutils_4.9.0.bb
index e4ce8ee4ebf..074817df27c 100644
--- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.9.0.bb
@@ -14,7 +14,8 @@ CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 
-RDEPENDS:${PN}-ptest += "bash sed grep"
+# need od from coreutils for -t option
+RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
 
 do_install_ptest:class-target() {
 	mkdir -p ${D}${PTEST_PATH}/tests/
-- 
2.38.1


