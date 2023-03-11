Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D70C6FD19
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.35798.1678494453639257194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQybE2wS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id e13so6545844wro.10
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/DhOcAuWxmBY/OijZ6Z18QXWjsT83TOpiIS+XZjrbc=;
        b=CQybE2wSDgNyUBBr06ZfMHvjjF6v/DWF97rchZodWxiKvU2khplscb99KDslDit/xN
         QJt2tDM/DaSpnzkidmIQ9+vzPTcWl6hbpNo+j8JDE9acynokhOywY6N46eesM6lnPrq8
         GO2aQlyx7UBT69luoB/FZsX9t8EczX0r5E4xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/DhOcAuWxmBY/OijZ6Z18QXWjsT83TOpiIS+XZjrbc=;
        b=64s5o1OV5lbF6lraZyCc9fqFhGyrHrXjRwmHrRJiyaM9mb0VoHb+kICq10SAOAgmsE
         Gd4hzFO69v67y4FWVK6wAxwOA9rbxQ411YBxjMVFXbnGg5XNMu/zqh/Qu7Ucd96Smw39
         Xi1PC5Q70yLkMo6wkJbYijmoRi4vRYT4YpNfRAR2R0rpiV/52CJ4+IwsS/zdz21m+lRr
         O42bikYd0WK7ukpeGWz7t1HNqWzpPOTkKHo4DjwkRtkujBQPlg19y8XPsmNMX1WaU4n8
         i9l0HdvkBJvzp9hhmKfezCdiajF3RGH94mxxgS6kAAbf8MkoB8kbuurt0nJojDEWvudX
         8Msw==
X-Gm-Message-State: AO0yUKXbfF9/MBXoc+6c7wTldVkdjJidQa8MCJmePUT2Ay42vE6oqqOK
	zDTeazf/PaVsJlPuFkUXWCP4NqaFSTFH9rZHEhc=
X-Google-Smtp-Source: AK7set/39XsdljNUkXxXahweXLswuGz0I95tzjzVeJEoA528MlYUZjdmYL/oqfIGfw4o6Zh2GG4T/Q==
X-Received: by 2002:adf:fe44:0:b0:2c7:bbe:456c with SMTP id m4-20020adffe44000000b002c70bbe456cmr15461654wrs.63.1678494451947;
        Fri, 10 Mar 2023 16:27:31 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/16] babeltrace: Fix ptest dependency
Date: Sat, 11 Mar 2023 00:27:20 +0000
Message-Id: <20230311002722.3211118-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178358

Add a missing dependency on make so ptests can run in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 8e2fe4164d5..194a773a245 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF = "--disable-debug-info"
 
 ASNEEDED = ""
 
-RDEPENDS:${PN}-ptest += "bash gawk"
+RDEPENDS:${PN}-ptest += "bash gawk make"
 
 addtask do_patch_ptest_path after do_patch before do_configure
 do_patch_ptest_path () {
-- 
2.38.1


