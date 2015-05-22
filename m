Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C7B95609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 11:42:46 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so44570809wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 04:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BJ2Wf4qZrLigYzY5Vnv+L0RqgMdJUP5OhtAKRGDZgU4=;
	b=l4nf+sEtZKGTZ1wDNVUvxAPI7tg4oODD03Fm9nSu9v9zzZBPbT+QNWh6xzlqYyQ/yv
	S0PDlIP5qYoYEV1tSN4sZGhSEIt9forZ5B4lSsiZbrB2ACsUUvD+gUkfzUjbjpAvj3lq
	f02sX9n9rCFa0dhO80O3ruc+aCg3oxKcG4c4GZr5pHv6CNERW/DOmfFXW5hPBxAbqd3H
	ChjAKZBMhjt0lH6Gtd9VGXtZ2nLOf3+h0vAUzp12PDKZ/ynGOekfwBBBUUO6k/sp3oop
	KxgyGnw8C5v2jIWxxi1Ptm717k7w3SjyBumabBURRP7WysXFDLd6bMEEaHovYVydIlna
	0zvg==
X-Gm-Message-State: ALoCoQl1fPwb3CGZxLIht/1VLGDodIooVm5pZ5MU4LcdQQhlhaTYlmxVDGkbrqy19XdtP0g0eLwk
X-Received: by 10.180.78.65 with SMTP id z1mr6872879wiw.14.1432294967194;
	Fri, 22 May 2015 04:42:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id d14sm2776985wjn.30.2015.05.22.04.42.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 04:42:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:38:25 +0100
Message-Id: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] utils: add helper to perform the union of two string lists
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
X-List-Received-Date: Fri, 22 May 2015 11:42:49 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/utils.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index b8224de..f70bd86 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -55,6 +55,21 @@ def both_contain(variable1, variable2, checkvalue, d):
     else:
         return ""
 
+def set_union(variable1, variable2, d):
+    """
+    Expand both variables, interpret them as lists of strings, and return the
+    union as a flattened string.
+
+    For example:
+    s1 = "a b c"
+    s2 = "b c d"
+    s3 = set_union(s1, s2)
+    => s3 = "b c"
+    """
+    val1 = set(d.getVar(variable1, True).split())
+    val2 = set(d.getVar(variable2, True).split())
+    return " ".join(val1 & val2)
+
 def prune_suffix(var, suffixes, d):
     # See if var ends with any of the suffixes listed and
     # remove it if found
-- 
2.1.4


