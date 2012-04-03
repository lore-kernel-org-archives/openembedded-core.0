Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SF1hc-0005NA-JW
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 13:15:08 +0200
Received: by wgbdr12 with SMTP id dr12so3112691wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 04:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=8+tSq0aCAvKmNwl+FXpJAGZEFEBFbNMc8LSkEhZAwpk=;
	b=axKGWKDQxOJSsceu0ivuo4fAeLMQPv2ymM1nwf6oIamRVo2Ay1o31scdVGtGfYqwJR
	sdIi35i7d620kXcA3XL6Q/50xJ78o9aXV0ysFK9K7f0BVo/8Z8G10Y1uRu8FA9PJloTH
	bcQVuAsvNZkSYAYWBOzs+DT8SclaVqW82vslHusuNuXLkheO6NDYUlnNuJXpJ6ZNU5s8
	omK1tGpoqgn9vpJ82xqoOfnnofdZO0ILKBPgQoUWs2QTRGJ1gwDfHFH7D/eXCObyLwnb
	+D6kkXZcu+zqrtQHM6nqijcaPFZ8ns+GelUqPeaJ/U4KsGiFMwUczHxta8hDtNyCsZWU
	wz7A==
Received: by 10.180.85.35 with SMTP id e3mr5287120wiz.6.1333451159437;
	Tue, 03 Apr 2012 04:05:59 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id ff2sm68076715wib.9.2012.04.03.04.05.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Apr 2012 04:05:56 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 14:05:48 +0300
Message-Id: <1333451148-32709-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQnhC30C/YBxLO7LszTXpWtpLhGd2IF9VIbEsYQXSWyZsl1eRhh9HXIrUHmvHtt61y4QvLXl
Subject: [PATCH] license.bbclass: Check if copyfile succeeded with isfile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 11:15:08 -0000

A cleaner way to check if copyfile suceeded is to use os.path.isfile.
In this way we can omit warns in some python versions where copyfile
return the same non-0 value even is this action is successfull.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/license.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c85233c..6c4a673 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -215,9 +215,10 @@ python do_populate_lic() {
         if spdx_generic and license_source:
             # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
             # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
-            ret = bb.copyfile(os.path.join(license_source, spdx_generic), os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type))
+
+            bb.copyfile(os.path.join(license_source, spdx_generic), os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type))
+            if not os.path.isfile(os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type)):
             # If the copy didn't occur, something horrible went wrong and we fail out
-            if not ret:
                 bb.warn("%s for %s could not be copied for some reason. It may not exist. WARN for now." % (spdx_generic, pn))
         else:
             # And here is where we warn people that their licenses are lousy
-- 
1.7.5.4



