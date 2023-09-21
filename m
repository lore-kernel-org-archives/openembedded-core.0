Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3FEE70707
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 10:08:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.12533.1695290921791207258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 03:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ibkyBOg0;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1695290922;
  x=1726826922;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zp8x6bj5DJelBsSitXlHRO3LEpYBSyFrb2XBGaZxLEI=;
  b=ibkyBOg01N4QKBcUCt5WyqfDibYt+EFLVwUz95iOEUOoTQ/OMpvdSF8o
   Q7ZRKaL2Kf+/+Mh+KbMphx1G3s6kgji9sYENdqvjfIPOae7Bw52x7CcUV
   Oo9L3z/y5H+2DzmS3t0meTQQsADn/zs6Ks4Po3aKWpoAiCUblGOxyrvHp
   w0AZFGHPiqnO2UI1ZHHPL4+3oCwxusP2u7RnGZV0lZlkatdg6RflxTSFe
   uHwaapbpEfMRI7N7uyEiMPSOXhW05lZttKlI2XGe0mCghvHNbHak1waVX
   ARyMx7Lbglq9hFZROgElEsDOBu5cHj9/9il0GyEbju5QM0LEp7aRcDvNl
   w==;
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] hashserv: Retry and sleep if database is locked on INSERT
Date: Thu, 21 Sep 2023 12:05:38 +0200
Message-ID: <20230921100538.154753-1-tobias.hagelborn@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 10:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187987

From: Tobias Hagelborn <tobiasha@axis.com>

Retry insert operations in case the database is locked by
an external process. For instance an external cleanup or data
retention transaction. Use async sleep to not block the event loop.

Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 lib/hashserv/server.py | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/lib/hashserv/server.py b/lib/hashserv/server.py
index d40a2ab8..c898be3f 100644
--- a/lib/hashserv/server.py
+++ b/lib/hashserv/server.py
@@ -9,6 +9,7 @@ import enum
 import asyncio
 import logging
 import math
+import sqlite3
 import time
 from . import create_async_client, UNIHASH_TABLE_COLUMNS, OUTHASH_TABLE_COLUMNS
 import bb.asyncrpc
@@ -114,7 +115,7 @@ class Resolve(enum.Enum):
     REPLACE = enum.auto()
 
 
-def insert_table(cursor, table, data, on_conflict):
+async def insert_table(cursor, table, data, on_conflict):
     resolve = {
         Resolve.FAIL: "",
         Resolve.IGNORE: " OR IGNORE",
@@ -129,7 +130,19 @@ def insert_table(cursor, table, data, on_conflict):
         values=", ".join(":" + k for k in keys),
     )
     prevrowid = cursor.lastrowid
-    cursor.execute(query, data)
+
+    RETRIES = 5
+    for x in range(RETRIES):
+        try:
+            cursor.execute(query, data)
+        except sqlite3.OperationalError as e:
+            if "database is locked" in str(e):
+                await asyncio.sleep(1)
+        finally:
+            break
+    else:
+        cursor.execute(query, data)
+
     logging.debug(
         "Inserting %r into %s, %s",
         data,
@@ -138,17 +151,17 @@ def insert_table(cursor, table, data, on_conflict):
     )
     return (cursor.lastrowid, cursor.lastrowid != prevrowid)
 
-def insert_unihash(cursor, data, on_conflict):
-    return insert_table(cursor, "unihashes_v2", data, on_conflict)
+async def insert_unihash(cursor, data, on_conflict):
+    return await insert_table(cursor, "unihashes_v2", data, on_conflict)
 
-def insert_outhash(cursor, data, on_conflict):
-    return insert_table(cursor, "outhashes_v2", data, on_conflict)
+async def insert_outhash(cursor, data, on_conflict):
+    return await insert_table(cursor, "outhashes_v2", data, on_conflict)
 
 async def copy_unihash_from_upstream(client, db, method, taskhash):
     d = await client.get_taskhash(method, taskhash)
     if d is not None:
         with closing(db.cursor()) as cursor:
-            insert_unihash(
+            await insert_unihash(
                 cursor,
                 {k: v for k, v in d.items() if k in UNIHASH_TABLE_COLUMNS},
                 Resolve.IGNORE,
@@ -260,7 +273,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
             elif self.upstream_client is not None:
                 d = await self.upstream_client.get_taskhash(method, taskhash)
                 d = {k: v for k, v in d.items() if k in UNIHASH_TABLE_COLUMNS}
-                insert_unihash(cursor, d, Resolve.IGNORE)
+                await insert_unihash(cursor, d, Resolve.IGNORE)
                 self.db.commit()
 
         return d
@@ -301,16 +314,16 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
 
         return d
 
-    def update_unified(self, cursor, data):
+    async def update_unified(self, cursor, data):
         if data is None:
             return
 
-        insert_unihash(
+        await insert_unihash(
             cursor,
             {k: v for k, v in data.items() if k in UNIHASH_TABLE_COLUMNS},
             Resolve.IGNORE
         )
-        insert_outhash(
+        await insert_outhash(
             cursor,
             {k: v for k, v in data.items() if k in OUTHASH_TABLE_COLUMNS},
             Resolve.IGNORE
@@ -386,7 +399,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
                     outhash_data[k] = data[k]
 
             # Insert the new entry, unless it already exists
-            (rowid, inserted) = insert_outhash(cursor, outhash_data, Resolve.IGNORE)
+            (rowid, inserted) = await insert_outhash(cursor, outhash_data, Resolve.IGNORE)
 
             if inserted:
                 # If this row is new, check if it is equivalent to another
@@ -427,7 +440,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
                             unihash = upstream_data['unihash']
 
 
-                insert_unihash(
+                await insert_unihash(
                     cursor,
                     {
                         'method': data['method'],
@@ -460,7 +473,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection):
                 'taskhash': data['taskhash'],
                 'unihash': data['unihash'],
             }
-            insert_unihash(cursor, insert_data, Resolve.IGNORE)
+            await insert_unihash(cursor, insert_data, Resolve.IGNORE)
             self.db.commit()
 
             # Fetch the unihash that will be reported for the taskhash. If the
-- 
2.30.2


