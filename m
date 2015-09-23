Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id DF4FF76903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 16:13:48 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so76922270wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nDosuWQYPOO9mJy+vPVjYm+DjTzLk/LOh2dMnpEi5mA=;
	b=oEBzCoMmXt1GX1X5WjMFXUehU8pw2ZtKf/EXX2hswjbo21Wgh2NVwX5EbSxpUWmsec
	ktWa6soK/JMm/kbVQQXwM4bNq8o5dCyTkrRQri4fhhkgHQDDOUu1MgF2sxXz/GoWsAqT
	zkPgyrsHzA+knkFDM9AeMtnAKVE0aozdWDnhg1juPaa9S0LwuQIQ39TRM1327NaOk5db
	oP+hL5xtX/KhGy4uzwplMTx3w2cB67yCpnZqsKOLGV4+7M5c6CiUDOz8Xszv6ukdqorB
	Out7/JMFjTcp0qaxLI6DHeuPQlk8GVd3qBHYkI3HD4/hSm6YF6uBOcLqPHdgK6+M1BHo
	U4BA==
X-Received: by 10.180.8.232 with SMTP id u8mr5268034wia.10.1443024828297;
	Wed, 23 Sep 2015 09:13:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x7sm9303024wia.5.2015.09.23.09.13.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 09:13:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 18:13:56 +0200
Message-Id: <1443024836-20974-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
Subject: [PATCH] sanity.bbclass: show warning when chmod fails
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
X-List-Received-Date: Wed, 23 Sep 2015 16:13:52 -0000

From: Alex Franco <alejandro.franco@linux.intel.com>

* for some reason this part of:
  http://patchwork.openembedded.org/patch/102561/
  wasn't ever merged.

[YOCTO #7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2eb744f..34f8618 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -839,9 +839,12 @@ def check_sanity_everybuild(status, d):
     else:
         bb.utils.mkdirhier(tmpdir)
         # Remove setuid, setgid and sticky bits from TMPDIR
-        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
-        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
-        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
+        try:
+            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
+            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
+            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
+        except OSError:
+            bb.warn("Unable to chmod TMPDIR: %s" % tmpdir)
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
-- 
2.5.3


