Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2FBC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:50 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.4107.1637788488923312928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FeBwvadn;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id n15so4152185qta.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BfYv76w0s72d8tLWAMYYHn3DjkOiaLsf9M0TiaVkwqk=;
        b=FeBwvadnWI3xe9XD1aYlz4/Fkw4Xot5ynqENw/qqLooX9QrzRWRpnhoTlLlmBumPR4
         p7evpeXTNKZvPLjH0XVmna8Ppid4+U1BqXBX0Iq3b5RvyyUi2HISR/o0z6YbZN0cmb+o
         nywFA1rh05eLKpQlRpDjfGN8j7E3+xexIhgLjzRAfP/fdPPTic9IxxODDv51N6iap7cf
         WiyFg33/i7X7R5FWieUF9PgBEwkAEK5YtcGWwu607skglcemhyqXpB2n6pZf4YbnD46J
         2kDA+Hp6GVI7GLaZtAaUXihBmDfvIT3+NFYEFypP/yqMl7zTa45WceZmCHsw8I9gbWQl
         M0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfYv76w0s72d8tLWAMYYHn3DjkOiaLsf9M0TiaVkwqk=;
        b=GulxMxkmN0bsYSbbPzvOUu/TJMrpFMl2T20W/vdVHaijSyWSzdHZFf7OFWi0VA+CQL
         f8ikNkhibzEei2/alle8sKxCgl+YBeVQqgx2b3hOyaVSDWXb38fNLDp++/1aLqy3HOrH
         i+ltxlSwZRdZKlEjOhpwrtrVZfLhNcLvaKEYdeu1Jq1LtJ5rwOmHRZ8nRDSR/mvLna0T
         YHF0MhRqNVMzG8PgJRhnUIlNVUYUqr/PlxxJeHJeHvy50111MbuUwiccRLJ6BFN83DAF
         iOW6peNac6Q9uGTVR71X+zo3bt9fYJRdlCi4iz+zyPNkeYrZNXuK4WkOi8Gl8FK2d66l
         pY8Q==
X-Gm-Message-State: AOAM531d6oOPOH1/hgVRBfPMZMVJgU7FH92LLLV4vLGCxmEZLqd9bKNo
	YPIrmKX4jQyrlW+kBMNbKgw=
X-Google-Smtp-Source: 
 ABdhPJznRJ/9HVBv/+IyOVWIrzMDmub9BidiyThnJr47bOoq+T3G8SuNimN1SI0Ght4wfiuQpgm65A==
X-Received: by 2002:ac8:5bcc:: with SMTP id
 b12mr11071792qtb.249.1637788488072;
        Wed, 24 Nov 2021 13:14:48 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 19/20] perf: sort-pmuevents: don't drop elements
Date: Wed, 24 Nov 2021 16:14:25 -0500
Message-Id: 
 <3fe4037143c8e9b1ff0e1d15efe0a02ecb501e81.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158765

From: Max Krummenacher <max.oss.09@gmail.com>

If a struct element neither has an element cpuid or name it gets silenty
dropped.
Kernel 5.15 for some ARCHs have at least one array of structs matching
this.
e.g. for arm pmu-events.c:

|#include "pmu-events/pmu-events.h"
struct pmu_events_map pmu_events_map[] = {
{
	.cpuid = 0,
	.version = 0,
	.type = 0,
	.table = 0,
},
};

struct pmu_sys_events pmu_sys_event_tables[] = {
	{
		.table = 0
	},
};

Before this patch the second struct is translated to an empty array::

struct pmu_sys_events pmu_sys_event_tables[] = {
};

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf/sort-pmuevents.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 5ddf0f144f..4f841eb822 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -61,6 +61,8 @@ for struct in re.findall( struct_block_regex, data ):
             #print( "    name found: %s" % name.group(1) )
             entry_dict[struct[1]]['fields'][name.group(1)] = entry
         
+        if not entry_dict[struct[1]]['fields']:
+            entry_dict[struct[1]]['fields']['0'] = entry
 
 # created ordered dictionaries from the captured values. These are ordered by
 # a sorted() iteration of the keys. We don't care about the order we read
-- 
2.19.1


