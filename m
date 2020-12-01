Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.342.1606846332590679527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PIxSFpFW;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1442; q=dns/txt; s=axis-central1;
  t=1606846333; x=1638382333;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zWIy8n5hQEviDrW+DURCCBQv0JgKKmQ9A+aXbtwSies=;
  b=PIxSFpFWKmQXJaLvR6TlN712rVzfxaX/7jnyBleTosHpMyov0rnf7OBH
   rmDy667keCiDeesdcDU4537QbRi7pSRoIjtS/47TV+iEnGtUNPF5z7Bpt
   hzN6TF4fUlk9nUW626DGfUsSWP079Bh9yDKvwfaKSGcJhIkYFb6K6ZHc4
   o4Y+wqmvwFDMlOXq/Y4mtADaEIokFM+wkIjmewShtZItP15BRvlKZPPtc
   H/FIpKCyphS2UWNwVpLxBRBNozoAL070LXgv5crHnTqOcica4W8tkbmNI
   IpM20lCIUPQ4O9tCmsOpZkuPa/KiI4uF5qq8A8UbZiDZnJamElkGBsNQF
   Q==;
IronPort-SDR: mKysOfhiHNScAyKxt90d1Ae+VKIZIkI/chyKgbHz4bvUWFYEuQMyGLHmuJfaMvDf6Wf8BopWvM
 0BNVXgMycgI+98QwqJewdiOr12mZ6IMtFGymphXqVIcQobB4uF6/E73VPrzmKVbLqjavQKjxkw
 ugVS1scF8lG9lmd+lTykn6X4+GRUNip63L3Y7sFo7BGGuoXcZ1a0ukGfaPpjG6L9mEGw7E6OXe
 J0PlCqlmcbUpVeXUHJxrb7xijjpBL7ldzqkmSrEi+wS7BsSzt6ix1fUsKaWJ9/Q7X/itnPSbCv
 vpI=
X-IronPort-AV: E=Sophos;i="5.78,385,1599516000"; 
   d="scan'208";a="15621784"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 3/5] lib/oe/path: Add canonicalize()
Date: Tue, 1 Dec 2020 19:11:49 +0100
Message-ID: <3f2c73b1637817bed05a3e1445a4b38122c59543.1606846217.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606846217.git.pkj@axis.com>
References: <cover.1606846217.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

oe.path.canonicalize() is used to canonicalize paths (i.e., remove
symbolic links and "..", and make them absolute). It takes a string
with paths separated by commas, and returns the canonicalized path in
the same format.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/path.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 082972457b..504342e267 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -320,3 +320,15 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
 
     return files
 
+def canonicalize(paths, sep=','):
+    """Given a string with paths (separated by commas by default), expand
+    each path using os.path.realpath() and return the resulting paths as a
+    string (separated using the same separator a the original string).
+    """
+    # Ignore paths containing "$" as they are assumed to be unexpanded bitbake
+    # variables. Normally they would be ignored, e.g., when passing the paths
+    # through the shell they would expand to empty strings. However, when they
+    # are passed through os.path.realpath(), it will cause them to be prefixed
+    # with the absolute path to the current directory and thus not be empty
+    # anymore.
+    return sep.join(os.path.realpath(path) for path in (paths or '').split(sep) if "$" not in path)
