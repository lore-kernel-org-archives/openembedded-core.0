Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2ADC433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:58:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gmQEM9iF;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237887; x=1683773887;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Jky4ijBz6D1uI3BE4IK+TWaFzO4RlBXnHJ278RVEEtI=;
  b=gmQEM9iFCS+arQ+iLytD5YtOWTDKNGGLLn2fgxwPVSTXomZaffkDSQWA
   c8+lwLKsEe15D7TQdwcCK80s8HzyQ7b+cS3UpTxCCzRtaMf+3ERyYktaq
   fNDkC2Siq8YcJwTjQOZmK9JHGBA3oraoaMG056M8VmylCZV8PpbyH3WgH
   xp2D4WXNGfzczCsLjXvVMZMdZgE2A9YR7I8sw8dI6QwKlvNJSQgKAiz8q
   1ANg+6Fe60P+FPv9N1if+cRngsWr1B2sVomonGvwN+56Cw1qpvZbvz0Re
   wmFVOenpISRxeUkl/nRFPm7FRZkJexgcNoVIv60loVmeqIxkSCXaumjqL
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106082"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106082"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754881"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/17] perf: sort-pmuevents: don't drop elements
Date: Wed, 11 May 2022 10:57:31 +0800
Message-Id: 
 <a6cc268224194218809b56874c70b87c7df4a94f.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:58:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165484

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
(cherry picked from commit e1382583cd5060be301afaa9998ccf250cc8bca3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.35.3


