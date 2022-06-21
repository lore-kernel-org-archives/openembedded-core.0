Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4EFC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 17:02:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.46010.1655830966105338884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 10:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: l.stach@pengutronix.de)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1o3hH2-0003L4-Ao
	for openembedded-core@lists.openembedded.org; Tue, 21 Jun 2022 19:02:44 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: sort-pmuevents: really keep array terminators
Date: Tue, 21 Jun 2022 19:02:44 +0200
Message-Id: <20220621170244.2053810-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 17:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167167

Commit e1382583cd50 ("perf: sort-pmuevents: don't drop elements") tried
to fix a case where the array terminator elements were dropped from the
sorted list breaking the build, but it only worked for the case where
the terminator is the only element of the array. When the array has other
elements the terminator will still be silently dropped, causing invalid
memory accesses at runtime when the perf utility iterates over the array.

Fix this by treating any unmatched entry as an array terminator and also
add a comment to make it a little more clear how things are ending up at
the right position in the sorted list.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 meta/recipes-kernel/perf/perf/sort-pmuevents.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 09ba3328a7ab..0362f2d8fabc 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -62,7 +62,10 @@ for struct in re.findall( struct_block_regex, data ):
             #print( "    name found: %s" % name.group(1) )
             entry_dict[struct[2]]['fields'][name.group(1)] = entry
 
-        if not entry_dict[struct[2]]['fields']:
+        # unmatched entries are most likely array terminators and
+        # should end up as the last element in the sorted list, which
+        # is achieved by using '0' as the key
+        if not cpuid and not name:
             entry_dict[struct[2]]['fields']['0'] = entry
 
 # created ordered dictionaries from the captured values. These are ordered by
-- 
2.30.2


