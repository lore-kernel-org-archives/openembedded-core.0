Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBD979CE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 23:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3FNqSSx001106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 16:52:29 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 15 Apr 2019 16:52:28 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2019 16:52:27 -0700
Message-ID: <20190415235227.52361-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] bash: add sanity check for locale in run-ptest
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
X-List-Received-Date: Mon, 15 Apr 2019 23:52:28 -0000
Content-Type: text/plain

We will fail later if the current locale is invalid, so check
for error messages from locale.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-extended/bash/bash/run-ptest | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index c61fabd..19f2991 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -1,5 +1,12 @@
 #!/bin/sh
 
+if [ -n "`locale -V 2>&1 >/dev/null`" ]
+then
+        echo "The default locale is not valid!"
+        echo "Try 'locale -a' to see installed locales."
+        exit 1
+fi
+
 en_US=`locale -a | grep en_US*`
 fr_FR=`locale -a | grep fr_FR*`
 de_DE=`locale -a | grep de_DE*`
-- 
2.7.4


