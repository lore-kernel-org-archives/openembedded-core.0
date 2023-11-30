Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DCDC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 08:15:41 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.64])
 by mx.groups.io with SMTP id smtpd.web10.67779.1701332139697837832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 00:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kzz6Xjf4;
 spf=pass (domain: axis.com, ip: 40.107.247.64, mailfrom: tobias.hagelborn@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXnrHcovTdcoQ6YqJYEI9jWbhnpjvc81CP5LwpRFxbLHspKrIfE4C/mxJPQIdm9YWGFEH5OUPIS1MYxMeXt4J8y4Nnbw5Gm3E489mUOkWHnJj39oELHemJpYLWS3IuZ79+zJGEJCqzcPu8E7lNQNbjoJFfp0uE6JRZN2de1K9ANn/CiTsKR4OD2iK91k4deHLNXixmkUvgrJUlhybkcvIdWoDc+iEIYYExHdcsWzkGSiA4aUZDLvPUp/nt4AqLONfMfqXEGCvq0bDNWL2OhulRnvwA3nY5ZXA8LRzy4xpEJPZa7Naf0zOv7psrZeGMhgSxW0xecYCXGGkPV5PEAzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWlWju186udzVrkTc7o7zoyrnBU9n0bQIda8/mhoyVc=;
 b=aPKSK+wT/YVIuMAJB5y38v9VNbNVSZXZKBf1IXlAFv6ebEnOUdnNvTL3j4jbleiNl9XKDHmNSisl5462sb1fTj8s4CtiBSs8OwZMbxBNg+i3X/ZsI/jtE93sdVkHSsTmccR1s4ICI+LGHKHVfaxwv3G8AswjxlWYhbsN5akJWjR8jueRO5N814oV/Nh01dWAkdo3VVLSxLjvCOzP9btEsz4cXRenO3BNqp/AROnbioSGGNi8NTDS85zPObOuuwLWWnLHy7ElOGFi8U4UGRUrMxvBUKICaQJcwgmmG9IHLImYlMqeQuKn/0B1ld63WIYA1yIu8iISZI9Cg16qMEMfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWlWju186udzVrkTc7o7zoyrnBU9n0bQIda8/mhoyVc=;
 b=kzz6Xjf41PWDQ0DIHTrX52Wsyxjn6uDSyHETf3blFpnTvhBcteLkoWLRW1wObgPeYOcEhn6ZL9gzqJZ2ML3CDXkGVz6UjDfOcuyzo7UDMpjMaCIoohWyvt2IuME1dZGJ0i7h4Y/9hAD3WF++h27w6Lk4pjWzVPWPb5WRCGfzP0Y=
Received: from AM6P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::14)
 by AM7PR02MB5797.eurprd02.prod.outlook.com (2603:10a6:20b:10d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 08:15:35 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:209:81:cafe::46) by AM6P195CA0001.outlook.office365.com
 (2603:10a6:209:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23 via Frontend
 Transport; Thu, 30 Nov 2023 08:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 08:15:35 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Nov
 2023 09:15:35 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Nov
 2023 09:15:35 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 30 Nov 2023 09:15:35 +0100
Received: from pc37511-1950.se.axis.com (pc37511-1950.se.axis.com [10.94.62.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1833DEE9E
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:15:35 +0100 (CET)
Received: by pc37511-1950.se.axis.com (Postfix, from userid 11324)
	id 14686B257EA; Thu, 30 Nov 2023 09:15:35 +0100 (CET)
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] hashserv: Unihash cache
Date: Thu, 30 Nov 2023 09:15:25 +0100
Message-ID: <20231130081525.2537624-2-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231130081525.2537624-1-tobiasha@axis.com>
References: <20231130081525.2537624-1-tobiasha@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|AM7PR02MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 682c15cd-0440-4572-f30e-08dbf17c879e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rHLzrpqO7OH8hkf5pqgpolQZvb4z/Dz5OQKFQNgU+aEYiFleCokXkJoOeJ2l4CRtDGH6NTY1BP6vYnmwhfgMPWQQZ+OHPe3jTLL0/daQHC96n4CkSMs0mlg7k5Ul3b5Al/WXFfu2HzQbZ3Y2XjANYFcWTfrofEDWzy+ObeDPaha1I2SmZTc3V8PsLeZujQYirwmMLV+/4DCKecljCloAk4lVyHs/rZey+9FNQ3rV7JFvPbnfuRjbQtm8byBHEH9GFaDZ+P0PpM2IvNUyAig81CK32RRFqCqvXt61W+4MDRU9Piy98if5zrsGEVmwCquZidXDvIZF7elvS1HV3sb6JvQRioldcHPIJ0bxyZIBmI80Csj3aYb+FSc5Weg1H541PjeuNvQemFYSUC9+UMnVnARRIxntZf1Eo3/tqNMVqXrYSIa3x8yMr45fbgkhVrGgc+ZcqcMa1XN6hkJMQOS5GUz/Mx/yKKiG/iE1GkOa+q23b4q8V8jsA8LK2reCFwLUEZcVMCxcziSrWkoHYpbtFAy9Dv+9IBa5xIANfujCNZp1pgmu/yaETYZCiFXqCdS/f81PXoNo0paMqM8vJSi3j2VRNrEWcQiNeTVeLWOfQkFc7AOI4CvRyTGgARy+ATE4jhf/j9OFGc+1+41gvCmg9y2hJWjlbfL3sXr+ExcbSu/lf0FHQnen9MWcC/RIWNngCVhbnmR6LdJ7gJ2vAOGO5zjR9gq0LIPT52Q8QsqtwRATfCIjqqS1t/k+hbvjzwdwoIqz7KYYYFnByiRv0/YGAj9T+za869UkZZgIldB0S3M=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(82310400011)(451199024)(1800799012)(186009)(40470700004)(36840700001)(46966006)(202311291699003)(40480700001)(40460700003)(36860700001)(47076005)(356005)(81166007)(36756003)(41300700001)(5660300002)(2906002)(83380400001)(82740400003)(6666004)(6266002)(336012)(426003)(1076003)(26005)(2616005)(70206006)(966005)(478600001)(70586007)(8676002)(8936002)(6916009)(42186006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:15:35.6324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 682c15cd-0440-4572-f30e-08dbf17c879e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 08:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191480

Cache unihashes to off-load reads of existing unihashes.
Due to non reproducible builds, the output hash has to be considered.
Only return a unihash if the output hash matches.
The cache is least-recently-used (LRU) and bound in size.

Data from handle_report and query_equivalent are inserted in the
unihash cache. This caches unihashes from the database that have
not been written during the current session.

Stats have been added for hits, misses and size of the unihash cache.

Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 lib/hashserv/server.py | 188 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 159 insertions(+), 29 deletions(-)

diff --git a/lib/hashserv/server.py b/lib/hashserv/server.py
index a8650783..3bfd4e2f 100644
--- a/lib/hashserv/server.py
+++ b/lib/hashserv/server.py
@@ -4,6 +4,8 @@
 #
=20
 from datetime import datetime, timedelta
+from collections import OrderedDict
+from collections.abc import MutableMapping
 import asyncio
 import logging
 import math
@@ -95,17 +97,34 @@ class Sample(object):
=20
=20
 class Stats(object):
-    def __init__(self):
+
+    named_stats =3D (
+        'average',
+        'equivs',
+        'max_time',
+        'num',
+        'stdev',
+        'total_time',
+        'unihash_cache_hits',
+        'unihash_cache_inserts',
+        'unihash_cache_misses',
+        'unihash_cache_size',
+    )
+
+    def __init__(self, unihash_cache):
         self.reset()
+        self.unihash_cache =3D unihash_cache
=20
     def reset(self):
-        self.num =3D 0
-        self.total_time =3D 0
-        self.max_time =3D 0
         self.m =3D 0
         self.s =3D 0
         self.current_elapsed =3D None
=20
+        self.num =3D 0
+        self.total_time =3D 0
+        self.max_time =3D 0
+        self.equivs =3D 0
+
     def add(self, elapsed):
         self.num +=3D 1
         if self.num =3D=3D 1:
@@ -136,12 +155,24 @@ class Stats(object):
             return 0
         return math.sqrt(self.s / (self.num - 1))
=20
-    def todict(self):
-        return {
-            k: getattr(self, k)
-            for k in ("num", "total_time", "max_time", "average", "stdev")
-        }
+    @property
+    def unihash_cache_hits(self):
+        return self.unihash_cache.stats_hits
=20
+    @property
+    def unihash_cache_inserts(self):
+        return self.unihash_cache.stats_inserts
+
+    @property
+    def unihash_cache_misses(self):
+        return self.unihash_cache.stats_misses
+
+    @property
+    def unihash_cache_size(self):
+        return len(self.unihash_cache)
+
+    def todict(self):
+        return {k: getattr(self, k) for k in self.named_stats}
=20
 token_refresh_semaphore =3D asyncio.Lock()
=20
@@ -232,6 +263,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
         upstream,
         read_only,
         anon_perms,
+        unihash_cache
     ):
         super().__init__(socket, "OEHASHEQUIV", logger)
         self.db_engine =3D db_engine
@@ -242,6 +274,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
         self.read_only =3D read_only
         self.user =3D None
         self.anon_perms =3D anon_perms
+        self.unihash_cache =3D unihash_cache
=20
         self.handlers.update(
             {
@@ -413,20 +446,23 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
=20
                 (method, taskhash) =3D l.split()
                 # self.logger.debug('Looking up %s %s' % (method, taskhash=
))
-                row =3D await self.db.get_equivalent(method, taskhash)
-
-                if row is not None:
-                    msg =3D row["unihash"]
-                    # self.logger.debug('Found equivalent task %s -> %s', =
(row['taskhash'], row['unihash']))
-                elif self.upstream_client is not None:
-                    upstream =3D await self.upstream_client.get_unihash(me=
thod, taskhash)
-                    if upstream:
-                        msg =3D upstream
-                    else:
-                        msg =3D ""
-                else:
-                    msg =3D ""
-
+                unihash =3D self.unihash_cache.get_hash(method,taskhash)
+                if not unihash:
+                    row =3D await self.db.get_equivalent(method, taskhash)
+
+                    if row is not None:
+                        unihash =3D row['unihash']
+                        # self.logger.debug('Found equivalent task %s -> %=
s', (row['taskhash'], row['unihash']))
+                        self.request_stats.equivs+=3D1
+                    elif self.upstream_client is not None:
+                        upstream =3D await self.upstream_client.get_unihas=
h(method, taskhash)
+                        if upstream:
+                            unihash =3D upstream
+                # Cache the found item in the read cache
+                msg =3D ""
+                if unihash:
+                    self.unihash_cache.insert_hash(method, taskhash, uniha=
sh, outhash=3DNone)
+                    msg =3D unihash
                 await self.socket.send(msg)
             finally:
                 request_measure.end()
@@ -461,6 +497,16 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
     # report is made inside the function
     @permissions(READ_PERM)
     async def handle_report(self, data):
+
+        unihash =3D self.unihash_cache.get_hash(data['method'],data['taskh=
ash'],data['outhash'])
+        if unihash:
+            d =3D {
+                'taskhash': data['taskhash'],
+                'method': data['method'],
+                'unihash': unihash,
+            }
+            return d
+
         if self.read_only or not self.user_has_permissions(REPORT_PERM):
             return await self.report_readonly(data)
=20
@@ -511,11 +557,13 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
         else:
             unihash =3D data["unihash"]
=20
-        return {
-            "taskhash": data["taskhash"],
-            "method": data["method"],
-            "unihash": unihash,
-        }
+        d =3D {
+                'taskhash': data['taskhash'],
+                'method': data['method'],
+                'unihash': unihash,
+            }
+        self.unihash_cache.insert_hash(d['method'], d['taskhash'], unihash=
, data['outhash'])
+        return d
=20
     @permissions(READ_PERM, REPORT_PERM)
     async def handle_equivreport(self, data):
@@ -738,6 +786,85 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
             "permissions": self.return_perms(self.user.permissions),
         }
=20
+# LRU Cache Dict based on work by Alex Martelli and martineau used under C=
C BY 4.0
+# https://stackoverflow.com/a/2438926
+class LRUCache(MutableMapping):
+    def __init__(self, maxlen, items=3DNone):
+        self._maxlen =3D maxlen
+        self.d =3D OrderedDict()
+        if items:
+            for k, v in items:
+                self[k] =3D v
+
+    @property
+    def maxlen(self):
+        return self._maxlen
+
+    def __getitem__(self, key):
+        self.d.move_to_end(key)
+        return self.d[key]
+
+    def __setitem__(self, key, value):
+        if key in self.d:
+            self.d.move_to_end(key)
+        elif len(self.d) =3D=3D self.maxlen:
+            self.d.popitem(last=3DFalse)
+        self.d[key] =3D value
+
+    def __delitem__(self, key):
+        del self.d[key]
+
+    def __iter__(self):
+        return self.d.__iter__()
+
+    def __len__(self):
+        return len(self.d)
+
+
+class UnihashCache():
+    """
+    Size limited LRU cache (dict) of taskhash->(unihash,output-hash)
+    if output-hash is provided, take it into account when matching,
+    otherwise only map task-hash to unihash.
+    """
+
+    def __init__(self, maxlen=3D0x20000):
+        self.hash_cache =3D LRUCache(maxlen)
+        self.stats_hits =3D 0
+        self.stats_inserts =3D 0
+        self.stats_misses =3D 0
+
+    def get_hash(self, method, taskhash, outhash=3DNone):
+        method_hash =3D hash(method)
+        taskhash_hash =3D hash(taskhash)
+        cache_entry =3D self.hash_cache.get((method_hash,taskhash_hash))
+        result =3D None
+        if cache_entry:
+            if not outhash:
+                result =3D cache_entry[0]
+            else:
+                outhash_hash =3D hash(outhash)
+                if outhash_hash =3D=3D cache_entry[1]:
+                    result =3D cache_entry[0]
+                else:
+                    result =3D None
+        if result:
+            self.stats_hits +=3D 1
+        else:
+            self.stats_misses +=3D 1
+        return result
+
+    def insert_hash(self, method, taskhash, unihash, outhash=3DNone):
+        method_hash =3D hash(method)
+        taskhash_hash =3D hash(taskhash)
+        outhash_hash =3D hash(outhash) if outhash else None
+        cache_key=3D(method_hash,taskhash_hash)
+        if not self.hash_cache.get(cache_key):
+            self.hash_cache[cache_key] =3D (unihash, outhash_hash)
+            self.stats_inserts +=3D 1
+
+    def __len__(self):
+        return len(self.hash_cache)
=20
 class Server(bb.asyncrpc.AsyncServer):
     def __init__(
@@ -765,11 +892,13 @@ class Server(bb.asyncrpc.AsyncServer):
=20
         super().__init__(logger)
=20
-        self.request_stats =3D Stats()
         self.db_engine =3D db_engine
         self.upstream =3D upstream
         self.read_only =3D read_only
         self.backfill_queue =3D None
+        self.unihash_cache =3D UnihashCache()
+        self.request_stats =3D Stats(self.unihash_cache)
+
         self.anon_perms =3D set(anon_perms)
         self.admin_username =3D admin_username
         self.admin_password =3D admin_password
@@ -787,6 +916,7 @@ class Server(bb.asyncrpc.AsyncServer):
             self.upstream,
             self.read_only,
             self.anon_perms,
+            self.unihash_cache,
         )
=20
     async def create_admin_user(self):
--=20
2.30.2


