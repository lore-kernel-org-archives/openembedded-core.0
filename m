Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 23CA960229
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 21:52:38 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id h65so9353284ith.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kzjpeGcGPpe7B7H9LAclRLcygU8YvB5ME6tjW9JYMxA=;
	b=EOiMGeUJ6QrtNAFXybbWtIvFOJNKsaORBDfqSaBOU7UJtmGdHz188SC4JkbJTGU2wC
	MHcf8hOiKGqHQ06NHT7XK3WG7OLzHOL4OKsd7xDWH8BBPOzi8ffgOkATfFJ7OlAImn5R
	CJ6yr66wgsPHXChyDPpiyXz2dlw6qi6o4SnFxowHOBC3sOQoEms197tJSS2jf3YIyFUF
	iuEPCFYFzI9oFFIozdMSOVmXZV8PiMQXszwjcaeQG3fauLPjXyARtzLaW0xGidp9LAOQ
	L9+TgmsJryb/Llm9Cf0duaA1Fg0tmDbMLrlbaV03fcuxMjQvEKLN72r/uAOkWwj1Uunh
	M5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kzjpeGcGPpe7B7H9LAclRLcygU8YvB5ME6tjW9JYMxA=;
	b=TResRRMxL4oG9UNQbQcLbAsGKTS1cCvGOxirC1A2Mccj/XkO83c+BMu5FO0/U4OgJ2
	ZV+DQSHYjyy8rT6r0oD9mYd/WtZrS4PTxop1De/ap0KLBaL+HGT76A1ub8taPoGAk8wF
	0dZ5UcthnnjJnQ0qzQgwtqCG7rVMelp/q158dccpry8jFL6v7crPNpUobgsAnzjbgUNo
	sD2wbaq0OKBk6CkXuzjzpR/yJ9D19hBR+t+OqervIu7bQawj/NaHggObdLgXm0++IgDM
	yOsGzRcO9/yITaNokY3T9RilJCOb24fDo2m8AuXiRBVBJIeC+V7uZDD4ly5Gj6SuC9LQ
	FKDQ==
X-Gm-Message-State: AA+aEWYN5OQpPWqHD9fouYjA/LSnTtUClzRJ5eZ5XvTrNySl5K5vYY+v
	uEwhpyACxrJKrWLvvkp7JpyDvEGH
X-Google-Smtp-Source: AFSGD/UKkYHSE3w8ruLyBFzA92vP966GeAGyL/8f9LVFFsln53Ntkl62/59g367LHQUw0TE6sVN5IQ==
X-Received: by 2002:a24:b8c6:: with SMTP id m189mr3384962ite.72.1544219559509; 
	Fri, 07 Dec 2018 13:52:39 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	z10sm2088014ioh.20.2018.12.07.13.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Dec 2018 13:52:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 15:50:57 -0600
Message-Id: <20181207215057.4140-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] persist_data: Retry database setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2018 21:52:39 -0000
Content-Transfer-Encoding: 8bit

The configuration of the sqlite database can timeout due to locking
under heavy load and should be subject to the same retry logic as the
other statements.

[YOCTO #13069]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/persist_data.py | 85 ++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/bitbake/lib/bb/persist_data.py b/bitbake/lib/bb/persist_data.py
index 29feb78203b..4b37227cfd1 100644
--- a/bitbake/lib/bb/persist_data.py
+++ b/bitbake/lib/bb/persist_data.py
@@ -66,27 +66,31 @@ def _remove_table_weakref(ref):
 class SQLTable(collections.MutableMapping):
     class _Decorators(object):
         @staticmethod
-        def retry(f):
+        def retry(*, reconnect=True):
             """
             Decorator that restarts a function if a database locked sqlite
-            exception occurs.
+            exception occurs. If reconnect is True, the database connection
+            will be closed and reopened each time a failure occurs
             """
-            def wrap_func(self, *args, **kwargs):
-                # Reconnect if necessary
-                if self.connection is None:
-                    self.reconnect()
-
-                count = 0
-                while True:
-                    try:
-                        return f(self, *args, **kwargs)
-                    except sqlite3.OperationalError as exc:
-                        if 'is locked' in str(exc) and count < 500:
-                            count = count + 1
-                            self.reconnect()
-                            continue
-                        raise
-            return wrap_func
+            def retry_wrapper(f):
+                def wrap_func(self, *args, **kwargs):
+                    # Reconnect if necessary
+                    if self.connection is None and reconnect:
+                        self.reconnect()
+
+                    count = 0
+                    while True:
+                        try:
+                            return f(self, *args, **kwargs)
+                        except sqlite3.OperationalError as exc:
+                            if 'is locked' in str(exc) and count < 500:
+                                count = count + 1
+                                if reconnect:
+                                    self.reconnect()
+                                continue
+                            raise
+                return wrap_func
+            return retry_wrapper
 
         @staticmethod
         def transaction(f):
@@ -113,16 +117,28 @@ class SQLTable(collections.MutableMapping):
     def __init__(self, cachefile, table):
         self.cachefile = cachefile
         self.table = table
-        self.connection = connect(self.cachefile)
-
+        self.connection = None
         self._execute_single("CREATE TABLE IF NOT EXISTS %s(key TEXT PRIMARY KEY NOT NULL, value TEXT);" % table)
 
+
+    @_Decorators.retry(reconnect=False)
+    @_Decorators.transaction
+    def _setup_database(self, cursor):
+        cursor.execute("pragma synchronous = off;")
+        # Enable WAL and keep the autocheckpoint length small (the default is
+        # usually 1000). Persistent caches are usually read-mostly, so keeping
+        # this short will keep readers running quickly
+        cursor.execute("pragma journal_mode = WAL;")
+        cursor.execute("pragma wal_autocheckpoint = 100;")
+
     def reconnect(self):
         if self.connection is not None:
             self.connection.close()
-        self.connection = connect(self.cachefile)
+        self.connection = sqlite3.connect(self.cachefile, timeout=5)
+        self.connection.text_factory = str
+        self._setup_database()
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def _execute_single(self, cursor, *query):
         """
@@ -131,7 +147,7 @@ class SQLTable(collections.MutableMapping):
         """
         cursor.execute(*query)
 
-    @_Decorators.retry
+    @_Decorators.retry()
     def _row_iter(self, f, *query):
         """
         Helper function that returns a row iterator. Each time __next__ is
@@ -173,7 +189,7 @@ class SQLTable(collections.MutableMapping):
     def __exit__(self, *excinfo):
         self.connection.__exit__(*excinfo)
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def __getitem__(self, cursor, key):
         cursor.execute("SELECT * from %s where key=?;" % self.table, [key])
@@ -182,14 +198,14 @@ class SQLTable(collections.MutableMapping):
             return row[1]
         raise KeyError(key)
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def __delitem__(self, cursor, key):
         if key not in self:
             raise KeyError(key)
         cursor.execute("DELETE from %s where key=?;" % self.table, [key])
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def __setitem__(self, cursor, key, value):
         if not isinstance(key, str):
@@ -204,13 +220,13 @@ class SQLTable(collections.MutableMapping):
         else:
             cursor.execute("INSERT into %s(key, value) values (?, ?);" % self.table, [key, value])
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def __contains__(self, cursor, key):
         cursor.execute('SELECT * from %s where key=?;' % self.table, [key])
         return cursor.fetchone() is not None
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def __len__(self, cursor):
         cursor.execute("SELECT COUNT(key) FROM %s;" % self.table)
@@ -245,7 +261,7 @@ class SQLTable(collections.MutableMapping):
         return self._row_iter(lambda row: (row[0], row[1]), "SELECT * FROM %s;" %
                               self.table)
 
-    @_Decorators.retry
+    @_Decorators.retry()
     @_Decorators.transaction
     def clear(self, cursor):
         cursor.execute("DELETE FROM %s;" % self.table)
@@ -302,17 +318,6 @@ class PersistData(object):
         """
         del self.data[domain][key]
 
-def connect(database):
-    connection = sqlite3.connect(database, timeout=5)
-    connection.execute("pragma synchronous = off;")
-    # Enable WAL and keep the autocheckpoint length small (the default is
-    # usually 1000). Persistent caches are usually read-mostly, so keeping
-    # this short will keep readers running quickly
-    connection.execute("pragma journal_mode = WAL;")
-    connection.execute("pragma wal_autocheckpoint = 100;")
-    connection.text_factory = str
-    return connection
-
 def persist(domain, d):
     """Convenience factory for SQLTable objects based upon metadata"""
     import bb.utils
-- 
2.19.2


