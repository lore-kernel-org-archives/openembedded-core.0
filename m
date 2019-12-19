Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D305F7FD69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 14:54:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d139so7236129wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 06:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6GE95Nowgv2j0PnQ//R4G6yRfb7bBKg6V0cy5Fqg6KE=;
	b=sD94J79qELc3pFc3gklM5hb0fiZYaD06M2eYpf/Zrgugxp0T4GbW0z8hcanx5XVkzf
	cdg0gc1VZA4iZe74Obxwypl3iIAWD4GXwgaQ3UydCJTWIlYON+Aedr6ST26CxWYH/jyY
	H5GUf1/M4XkaM4vMo8YtWyA8Nf/J28pdHYAJEl5XW7OV5YfgAgDbGmtbA/rZRbYx4FNp
	957rv29W4S9IgcwJWoyjaWMmWmrWYrWGWhaXZsuv/Few/KJux/maygxczSKak8H4JBRz
	6Y8enFRs7YFE8fuPiVWzNPxZ14ANp/Fpqv987eNsWFIsU+zHRfxEetb6VwHaQCR0xLKv
	F8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6GE95Nowgv2j0PnQ//R4G6yRfb7bBKg6V0cy5Fqg6KE=;
	b=EC1Wa+2/KtMvZML6a1f5nFHQMIfk6rux5LG0nTQZ0v2+TXTkHpDDDN4HD9vg7DuvoX
	0xhXbgb8u1PNKJBe/heBrMUI5nKKVdvcNMsSxz6iPKjYVZv8eCqQIyzlI4Oi+KGqrkVh
	CZMaEIwQB8iMhOhL9PgczIrZekrqBs86yu1yujPYDHGa/tZripHW00R0p3rht5bXpQt1
	W8CRnaCadK+RvR1kWgiZJwrilXL+cZSZgScRhwPi8cXT6Ia6+RUzd1nEJvjKml3xG7B7
	5wEhSCiVUodECLwlbd7/7X0TjCZ8EkY7c7KIHVpuh8xFtA6sjTXgUpmKpL7FkY/sLJhK
	JvJg==
X-Gm-Message-State: APjAAAUz06iiwrnBY6zN1BibUoIxboDQPZL1qPd15jEH7kjTbhnTNvpe
	jZJ01lbXr/FvC/7kgvz9MjB5vU3+6F4=
X-Google-Smtp-Source: APXvYqyPSw5yCOlQTo9P+ZfgNlio7KhGzuS8+Sxp7xW7p5Uf2a17zEK4GUCH/Dh3d9UtNWWFfoublA==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr9811921wmb.17.1576767251861; 
	Thu, 19 Dec 2019 06:54:11 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u13sm6378445wmd.36.2019.12.19.06.54.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 06:54:11 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:53:23 +0000
Message-Id: <20191219145322.31083-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219145322.31083-1-nick83ola@gmail.com>
References: <20191219145322.31083-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bitbake: fetch2/wget: checkstatus: use the same arguments as parent
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
X-List-Received-Date: Thu, 19 Dec 2019 14:54:12 -0000
Content-Transfer-Encoding: 8bit

the commit:
  312f1a5e741: bitbake: fetchption: attempt checkstatus again if it fails

was introducing an extra parameter to the checkstatus function, overriding
the parent.

Avoid that and remove recursion as is not needed.
Also introduce a small delay between the two requests.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 bitbake/lib/bb/fetch2/wget.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 180fe9aacd..9c0defb6d2 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -201,7 +201,7 @@ class Wget(FetchMethod):
 
         return True
 
-    def checkstatus(self, fetch, ud, d, try_again=True):
+    def checkstatus(self, fetch, ud, d):
         class HTTPConnectionCache(http.client.HTTPConnection):
             if fetch.connection_cache:
                 def connect(self):
@@ -404,10 +404,21 @@ class Wget(FetchMethod):
                 pass
             return True
         except urllib.error.URLError as e:
-            logger.debug(2, "checkstatus() urlopen failed: %s" % e)
-        if try_again:
-            logger.debug(2, "checkstatus: trying again")
-            return self.checkstatus(fetch, ud, d, False)
+            logger.debug(2, "checkstatus() urlopen failed: %s", e)
+
+        # Some services such as SourceForge seem to struggle to keep up under
+        # load, with the result that over half of the autobuilder checkuri
+        # runs fail with sourceforge.net "connection timed out". Attempt to
+        # mitigate this by re-attempting once the network operation on failure.
+        import time
+        time.sleep(0.2)
+        logger.debug(2, "checkstatus: trying again")
+        try:
+            with opener.open(r) as response:
+                pass
+            return True
+        except urllib.error.URLError as e:
+            logger.debug(2, "checkstatus() urlopen failed for the second time: %s", e)
         return False
 
     def _parse_path(self, regex, s):
-- 
2.20.1


