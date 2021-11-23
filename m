Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A1AC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:10 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.824.1637704690210533735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KjIYqhoq;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id kl8so314422qvb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BfYv76w0s72d8tLWAMYYHn3DjkOiaLsf9M0TiaVkwqk=;
        b=KjIYqhoq/MOk9zTz7UxOLQIcKEeG3Mhj26MUr7W7X9B4gcVfm1ZCV2qmYIQg2glnss
         7Lfs7qfYIfPwCmYaNUcrdSGn/Y0x0dGJSyZlCIcM34glxt06qYVJwY6VRoV47qyNOoQF
         iKtZKr7O6OzkndOxXysAHqDogxZc5AuPq4RFCbgNhlRyO10Fbj0zC49GRYGlmmQGU04w
         ZfgUmQJTpY2MojShXqV8l3ng8h47o0fcCo90jYWBNxnx6h01/eIE9pjFmWSdGEAt9FKy
         /DM5QkeLO6TjK8kck0+F+rvcg2YMR6bUnXamJcZqmeCH/bcdFjTq3Y73hOJozpWWMRAT
         Ad+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfYv76w0s72d8tLWAMYYHn3DjkOiaLsf9M0TiaVkwqk=;
        b=be6+MPG9HtLTPPge2U8MmRIyBqok9SHTT+Jr3s62sy3HxKJBeTevwXtqwW8TDzGGo/
         iVBMgrR5jMCR9Z8fCp5XkLXUWUXTzfBuowKcGGZBEh/6gmYOgfBC/PJyiHtLcBKvg6AI
         SRvFNt5d/sngQNzEDmGNnIiv3t3Vw6gKQ/uRBIJTYgeQ3qmPrS2NQ+SGD3j9qx8vZb9M
         ZDxoYTqqZSxrpJ8JdapT0M+gPoFwtzvbYnbOShcFWhGQWUHNvk1ooJgfTOEZ1L9kPzwY
         7XBFrOf/PjDrsTcKtkr8QVMMFwUGuCj9XdRSqPnUBvg2ViXnY8iR8mb2diSxxv8TmPTf
         McQQ==
X-Gm-Message-State: AOAM531FpudX50uNa1FRicROSPgvswJ5HLUCzlPfiYhSgvFdn47X60b8
	CrTkb5XqOfyR7RgcmzNToaw=
X-Google-Smtp-Source: 
 ABdhPJwbEMHKnMEJooUOQMybIjbLpYvn2eTuVIOYtHTMj7puiVpgZyXHb6KSCJ/2I469BGfcbrB7+w==
X-Received: by 2002:a05:6214:2a8b:: with SMTP id
 jr11mr875086qvb.19.1637704689377;
        Tue, 23 Nov 2021 13:58:09 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 19/20] perf: sort-pmuevents: don't drop elements
Date: Tue, 23 Nov 2021 16:57:46 -0500
Message-Id: 
 <0b50e844e37c9fbdbafec143785488d5678352ca.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158640

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


