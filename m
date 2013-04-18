Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1USytP-0004nH-33
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 02:09:52 +0200
Received: by mail-ie0-f180.google.com with SMTP id qd14so4022572ieb.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Mv6Mjidg9YkyqZ2oHfTnYyLlXHkUQXbLvdO8CNW+2SM=;
	b=dYBRGiOVKP6reuubAztwu+atKGqJ2tLsJcS+yrWHuPLkfgfZyUsQO0nQQOqV/weGF9
	zQdi94IHG6u/vbN5qIbsViQluInzfHHDGpC2bRbmJ+5tZDZq5ustsOLuAhPjjSY4Hxb5
	mc7D00vEK96rEpo6aKpI1/IkVa9mRVSmSIcMV2DbEsYzobIZRbwHhT9mi6V6WTU3LI95
	hX1wG7dA+UsqTL1z5Gg8TZqk4YWPd13KbSvX++lypsE3LAR6vhPCXXQQq/vZ87s8n1gv
	L8Rxt9dV+DN/Kq4PbG/0i1L9wjBLQIYXjRZAczfLYKnSGl+59zxWrlu3BKMk7jJpTF1N
	9UXQ==
X-Received: by 10.50.110.104 with SMTP id hz8mr1032168igb.41.1366329116799;
	Thu, 18 Apr 2013 16:51:56 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id xc3sm388596igb.10.2013.04.18.16.51.55
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:51:55 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 16:51:50 -0700
Message-Id: <1366329111-11949-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] package.bbclass: add LICENSE_EXCLUSION to vardeps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2013 00:10:15 -0000
X-List-Received-Date: Fri, 19 Apr 2013 00:10:15 -0000
X-List-Received-Date: Fri, 19 Apr 2013 00:10:15 -0000
X-List-Received-Date: Fri, 19 Apr 2013 00:10:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Ensure that changes to INCOMPATIBLE_LICENSE re-run do_package for affected
recipes.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2bc31ee..5524816 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1789,6 +1789,10 @@ def gen_packagevar(d):
     for p in pkgs:
         for v in vars:
             ret.append(v + "_" + p)
+
+        # Ensure that changes to INCOMPATIBLE_LICENSE re-run do_package for
+        # affected recipes.
+        ret.append('LICENSE_EXCLUSION-%s' % p)
     return " ".join(ret)
 
 PACKAGE_PREPROCESS_FUNCS ?= ""
-- 
1.8.2



