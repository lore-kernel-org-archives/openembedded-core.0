Return-Path: <kekiefer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91084C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 20:28:40 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.744.1634588919931896355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 13:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cjo0OB3v;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: kekiefer@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 75so17326050pga.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 13:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n0dbpEKMqPhQ765Tdx8C2AMEuCe/+tqDLcWLM7L5pA0=;
        b=cjo0OB3vcwA4Bv4kaHr9d/YTSZ+l3XcMhiXvoWx84I6MSFtjymh8Mfi5nvg4OegM3s
         S2KDNrm6xt0+mQ5i/+7k2LlrOIbqjhFnYe4qRLMebMY0pccgtfzKJLJA8rn/bSVkF9DP
         4D+7xDGz8pDAQO0ExvXdMMQpFSSaUtg0pLIJBvX2BSqn3atbVEmndrfy509TV3Jxn1FG
         hfGoRhSzH1NmWkCZwfFkbVVLJ5S4R4kfg/kb1zJpGPgBAcIgMRxAaX7aS+WakU2XVe/U
         D4ZSTbxeaOqjYUR+4lkpYcXOM3I9OyZGuAbzWPczMJvnTdzOiZwq9d/ib4j5RICtNyFU
         FSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n0dbpEKMqPhQ765Tdx8C2AMEuCe/+tqDLcWLM7L5pA0=;
        b=17ekPpsCBEfHMWZLph1OR4iDJFx2CzY/RsMSRR7Yyu6HC7Gbqmoefa8gUq2Bciieux
         bqdeahI6WexF5piz2zpJzL/JPfWxc4FjxvNUtyTstMiw5XXfj/C9FNXh6Ae2etMBTR4n
         iuiyg8b4ilt8q9DZ07xIQ+hST9t9N3SX8/dOypNmw8aC3H9G+lbOeUKA25FaL/Q1b+sc
         +9pgcvXS87uhkPqZmXIt/U6zEfBytLDCoYRzkc7SpSdLe+JiptaGZnyibtsXVyIEZX64
         jynPXyzvVlZAf/6LuzTDKW3CLk6HHkq8JyZvTyxxlUgtMU5krn0UpKu2TI2wovXMb73R
         EvrQ==
X-Gm-Message-State: AOAM533RKFGnpwHwWqlxq4W8ZPr6IEqiVsg7KO0UTTvCAwMKxCS2myKW
	ooIZHMeKxArl3bWNk1RO/dwMxd6woJtY5A==
X-Google-Smtp-Source: 
 ABdhPJwOSZPr8/9TxndgWdWMy9dqzctjlnWqaEt3X5ZQNYsS1sYyzu1DIfBTJDAGBOsJ6RWFxiwYNA==
X-Received: by 2002:a62:7b43:0:b0:44c:6d72:ac4d with SMTP id
 w64-20020a627b43000000b0044c6d72ac4dmr30325854pfc.73.1634588919053;
        Mon, 18 Oct 2021 13:28:39 -0700 (PDT)
Received: from emorypro.localdomain ([2600:8802:5d00:40:55d8:fae7:2df9:ee0a])
        by smtp.gmail.com with ESMTPSA id
 t3sm14109793pgo.51.2021.10.18.13.28.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 13:28:38 -0700 (PDT)
From: Kurt Kiefer <kekiefer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kurt Kiefer <kurt.kiefer@arthrex.com>
Subject: [meta-python][PATCH] meta-python: gyp: fix for compatibility with
 Python 3.10
Date: Mon, 18 Oct 2021 13:28:34 -0700
Message-Id: <20211018202834.11056-1-kekiefer@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 20:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157093

From: Kurt Kiefer <kurt.kiefer@arthrex.com>

The collections abstract base classes module is finally moved to
collections.abc starting in Python 3.10.

Fixes the following problem encountered making use of gyp:

|   File "[...]/usr/lib/python3.10/site-packages/gyp/common.py", line 497, in <module>
|     class OrderedSet(collections.MutableSet):
| AttributeError: module 'collections' has no attribute 'MutableSet'

Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
---
 ...01-Fix-for-Python-3.10-compatibility.patch | 25 +++++++++++++++++++
 meta-python/recipes-devtools/gyp/gyp_git.bb   |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch

diff --git a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
new file mode 100644
index 000000000..2b88023fe
--- /dev/null
+++ b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
@@ -0,0 +1,25 @@
+From bfe579283e5fcab60172818bfe4e6e1d40c2bed0 Mon Sep 17 00:00:00 2001
+From: Kurt Kiefer <kurt.kiefer@arthrex.com>
+Date: Mon, 18 Oct 2021 11:21:14 -0700
+Subject: [PATCH] Fix for Python 3.10 compatibility
+
+The collections.abc module replaces collections for Python 3.10
+
+Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
+---
+ pylib/gyp/common.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pylib/gyp/common.py b/pylib/gyp/common.py
+index b268d229..4f9cb0ec 100644
+--- a/pylib/gyp/common.py
++++ b/pylib/gyp/common.py
+@@ -494,7 +494,7 @@ def uniquer(seq, idfun=None):
+ 
+ 
+ # Based on http://code.activestate.com/recipes/576694/.
+-class OrderedSet(collections.MutableSet):
++class OrderedSet(collections.abc.MutableSet):
+   def __init__(self, iterable=None):
+     self.end = end = []
+     end += [None, end, end]         # sentinel node for doubly linked list
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index d668d1ca1..73329cec7 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
 SECTION = "devel"
 
-SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
+SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https \
+           file://0001-Fix-for-Python-3.10-compatibility.patch \
+           "
 SRCREV = "caa60026e223fc501e8b337fd5086ece4028b1c6"
 
 S = "${WORKDIR}/git"
-- 
2.29.2


