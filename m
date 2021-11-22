Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36914C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 16:35:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.182.1637598932484480410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LWSXpIYl;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 133so16058237wme.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bKQLsZ1ZxpzJDssiepaMOuja+U81sFL9jlyLENWT8nU=;
        b=LWSXpIYl29wk0tQCcLfXOSOpdikHylzOMZ5y0zl/dsWWsdJPwBtL6gM4EWDVlD92rw
         iBCXczt5Fn7nnnegsYfiJa80OgclGAVvxXJqQm2uadZK5fMRvAnwsjTs0kDIs03VM/dn
         eOvuQVTZ88PwNRnqexlH6JMAcQ1fxo6HP42UCB8JVaf2M9Lg4uVzj6DW2oK6Bj0QN7/O
         eBZakgzUuxB5D+k34XMYVw0DvpfHmMtkioCM+ZvJO9ANm6aBjyOxq9lVsB9DOjtWQ9gE
         M3humu3AaPmOP8NP7fqy4WNMxLdubIeIA6zotkDulXeeHFztAqB35x7sNo0H5J/3UDdV
         FwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKQLsZ1ZxpzJDssiepaMOuja+U81sFL9jlyLENWT8nU=;
        b=IzW6Rm306+zSBQFkW3RgjDGmQ+mZIK8Jlb31S+qLQYquAzg177AS5ZNfOt8l45aY1U
         SZJiqPnYHsuz6Mcb3n3Yk/9a47njA+azm4gceU2AkOaITDrkdwhiIkvx51QBk4/4uy/w
         WtZoi/NuTtZHoopepLBwnyBE60i4Bc2QI/uJqqxb1qY424bGdJ1b0DLAC6O8RU0N41QE
         tnBTSyO2lI43749q6Bt/RqrfZdh9j2JwNNzch2NnilE4ORFIkf1CFAVcMt+LYzkzgdGE
         xHKhK1PlQtNR1f8EEXYztk2BSPzCZs76H6ECXKotgEFws3guvv4pgtZTn+R6fRPWIB1i
         LdYw==
X-Gm-Message-State: AOAM532Ndw+RP5EYx64NJ4uMDV5J982AUpsRsr/jsLvPY4y24xyfNmL6
	ncvGa4dUDI1SPa0yz6rEsa2CJiC7Kucw6A==
X-Google-Smtp-Source: 
 ABdhPJzK11/R3JqubOyfChyuxZABUFST5DHl0CPjmlOUx5OVko3uitj/Gzk67uh+eFMVsqfHAQij5g==
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr31185177wms.186.1637598930825;
        Mon, 22 Nov 2021 08:35:30 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 i17sm11444719wmq.48.2021.11.22.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 08:35:30 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 1/2] perf: sort-pmuevents: don't drop elements
Date: Mon, 22 Nov 2021 17:34:58 +0100
Message-Id: <20211122163459.41079-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211122163459.41079-1-max.krummenacher@toradex.com>
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 16:35:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158583

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
2.20.1


