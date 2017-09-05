Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB43877DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 02:16:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v852GEKT004434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Sep 2017 19:16:14 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Sep 2017 19:16:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 21:10:11 -0500
Message-ID: <1504577411-63092-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] yocto-compat-layer.py: Fix trace when layers can't be processed
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
X-List-Received-Date: Tue, 05 Sep 2017 02:16:13 -0000
Content-Type: text/plain

When all of the requested layers have unsatisfied dependencies, an error
can occur.  Check for the condition to avoid the traceback:

Traceback (most recent call last):
  File "../scripts/yocto-compat-layer.py", line 203, in <module>
    ret =  main()
  File "../scripts/yocto-compat-layer.py", line 194, in main
    if not results[layer_name].wasSuccessful():
AttributeError: 'NoneType' object has no attribute 'wasSuccessful'

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/yocto-compat-layer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index a16974f..9a541c6 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -191,7 +191,7 @@ def main():
         logger.info('')
         for layer_name in results_status:
             logger.info('%s ... %s' % (layer_name, results_status[layer_name]))
-            if not results[layer_name].wasSuccessful():
+            if not results[layer_name] or not results[layer_name].wasSuccessful():
                 ret = 2 # ret = 1 used for initialization errors
 
     cleanup_bblayers(None, None)
-- 
1.8.3.1


