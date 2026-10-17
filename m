Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A23BCCF2C7
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 22:57:15 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5692.1792277826374603539
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 15:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so2838611eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 15:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792277826; x=1792882626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5enOFX9A5/SUMjHCoqypP1fihy+KGdCQPpQgu0yd0Zg=;
        b=JJx5nUK5zKousON9MMIdWafVrou7QK5yZhxfxpeSOb5y93WKxlBkfUo0PI2a8KODvg
         LFLP7r8arwlIRJLdpWcMpWcqZ/VIs7jjec/mOsLqj3qc+UWROogYEEnJ9YxA3jlPRDEH
         UREPMOf2Cc6HJWlB5Skgv/d9Xh/3SL3wi11/6S7kv4xBKXwFMoCqsSxw3nZWfCOkXbOX
         Xyl6j/EM1mD0LO5fqx4SbhRL9iTQ5IGYwJ/2oxh8Xkakf0cLOPxp3//bC6+7l5+r9qGi
         bwG84GzVAwZIfyEHeKLEp2nTMRTF+oKUkZmae+H2ULcOX2XzCvizcT0zsnRBsqREZdjK
         bdew==
X-Gm-Message-State: AFq9FYLW3p5o2DpUxsK5gm4TSe3KXJdIGtj078B68SK4qhxIcQsJPnOq
	oBw/EbfrcA1pDYYdrYI28D34FZ/fn0fFmyfc59OrnmBL3QHhPjrT89g7v0Lovg/W
X-Gm-Gg: AYBFou2ayQ/6R4F1NmlkJaHcqyf6uee4iQ8nUT3ZJXbnNOwzcRZqdRgBvOchgFlmsPm
	XPhAZBIt+yhoXZrwOpE3+Bfmwqlf5rEHsX82CvwtDbwqvWlT+u1OZJwALGW7VXNbmjIvrxy9JXu
	LFZrS+vl9bDrbN/Z4/KtWWtntmxuXNOtAhJ1VuMhIQlXEKW1N20Jy+DdytepodyHFMg9AxZX2h/
	0Huz/Jho5GzxtaJzPoiEB62AiFGrIOFAttHX4VjIFSiYe2ufRAJ1gTop9+4UqC37Q/mzfE2Ia/A
	5o9v86L6d05yOHds+utRbNj8FFaz4IOrJ1QosmwuEPZAiNtvHEAJhXEcFt26mmQz4j8rzB369AX
	pGi1vTDwskioRGBhpbJK79djgOYcTum5CSUgTw6ybz3zXkN7WvFLWrfHL1uyFgAJsmEXnQVK1pD
	whuVRNtLTS0zYtiSmHHNCk0xKlHg667rhly4se5AEwyWBCdQ699rZr3jgLdnYCC+lIyX4uyngXt
	Ql7Nc2xXeTEOP0gmIUDUEEhhnrKe5C8QDcoJIZLRUfBvOW2f77qwF0/jr5rdLyAWfXV1tonSUok
	ZGY1tCFJ42GJixfyPdTFmFc7+A272IwmPGjds7rmvjAEO6gvL7gS2VBY44obKiNqUzfRtsCxSmW
	AHhTrF2OIanI=
X-Received: by 2002:a05:693c:8946:10b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-361a1f567a5mr4795662eec.30.1792277825619;
        Sat, 17 Oct 2026 15:57:05 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm18045645eec.9.2026.10.17.15.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 15:57:05 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 1/3] yocto-check-layer: Add --run-tests to select the tests to run
Date: Sat, 17 Oct 2026 19:56:54 -0300
Message-ID: <20261017225656.680168-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017225656.680168-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 22:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248098

The common and distro tests ignore --machines, so a BSP layer checked in
several runs, one per group of machines, repeats them in each. Add
--run-tests, taking <module>[.<class>[.<name>]] as oe-test does, so the
common tests can run once and only the BSP ones in the others. A name
matching no test is an error rather than a run that checked nothing.

Tested on meta-freescale with "--run-tests common distro" and
"--run-tests bsp --machines imx8mm-ddr4-evk imx8mn-ddr4-evk".

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/yocto-check-layer | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 8c8b4dbcad..e747451366 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -32,14 +32,14 @@ CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'checklayer', 'cases')]
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
-def test_layer(td, layer, test_software_layer_signatures):
+def test_layer(td, layer, test_software_layer_signatures, run_tests):
     from checklayer.context import CheckLayerTestContext
     logger.info("Starting to analyze: %s" % layer['name'])
     logger.info('Distro: %s' % td['bbvars']["DISTRO"])
     logger.info("----------------------------------------------------------------------")
 
     tc = CheckLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
-    tc.loadTests(CASES_PATHS)
+    tc.loadTests(CASES_PATHS, modules=run_tests, modules_required=run_tests)
     return tc.runTests()
 
 def dump_layer_debug(layer):
@@ -70,6 +70,8 @@ def main():
                        help='check that software layers do not change signatures (on by default)')
     group.add_argument('--without-software-layer-signature-check', action='store_false', dest='test_software_layer_signatures',
                        help='disable signature checking for software layers')
+    parser.add_argument('--run-tests', nargs='+', metavar='TEST', default=[],
+            help='Tests to run, as <module>[.<class>[.<name>]] (default: all)')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
@@ -228,7 +230,7 @@ def main():
             layers_tested = layers_tested + 1
             continue
 
-        result = test_layer(td, layer, args.test_software_layer_signatures)
+        result = test_layer(td, layer, args.test_software_layer_signatures, args.run_tests)
         results[layer['name']] = result
         results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
         layers_tested = layers_tested + 1
-- 
2.54.0


