Received: from mail-pd0-f173.google.com ([209.85.192.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1USyt2-0004ln-R1
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 02:09:52 +0200
Received: by mail-pd0-f173.google.com with SMTP id v14so1852945pde.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Mv6Mjidg9YkyqZ2oHfTnYyLlXHkUQXbLvdO8CNW+2SM=;
	b=yCQUkqZAp9PpjItpoULQZM+8/HbTFK+AOXafhiUTpuM56LkNkSyFp3P0J02rBIIzcN
	wUhWxzokRaCvdBFYpZ3Kscz5pCInuKwJeYw+9IYJMcz27WIhGsbv0VOPFoZtONaFJTRC
	Ihvx6/naoZ6syLlMZcVo6tt53gKAIFY/mxWkczZdjkaVKfmwEwV8EjpMS1jKbA3JY/9y
	1+xSU+2FjRu+AGtETYrtYWVx6dtveBIDV7hVV5YrIwEaveXe0snDApAhwppp6xzWI9FV
	/O50SXK6n0pa9A3IRavnp7XswjsyVMc8Bz2ffKPVd+Uv3lpP13jNXIExwTl506woiyU3
	6Ceg==
X-Received: by 10.66.156.103 with SMTP id wd7mr4481390pab.8.1366329093335;
	Thu, 18 Apr 2013 16:51:33 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id ak5sm12488443pac.4.2013.04.18.16.51.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:51:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 16:51:24 -0700
Message-Id: <1366329085-11756-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-dylan][PATCH 1/2] package.bbclass: add LICENSE_EXCLUSION to vardeps
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



