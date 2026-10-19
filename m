Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3988CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:39:41 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36168.1792420776743002069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fc585291cso419103c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420776; x=1793025576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5enOFX9A5/SUMjHCoqypP1fihy+KGdCQPpQgu0yd0Zg=;
        b=q9R+ArA/gIC5SNkYmTyLbc/Qt3P9bSkUOVy6GuvsEEirDOz/NaWW1N7DKV2XT+QYHL
         EO6mxkrgSI8r/b33BFLu9elgvi7nx3GdclRaxHIfOGYegoPY9g7M1Bh7ZcXA+H5KdeJs
         bNgPQQWA2gPF9Darl3zxKzwe1AA7gRsd22YpjXKLDZJKZDZXdYTZhuyPwevPVwH79ei5
         9n0RRmZ6nKojj6W4A1ZkQhCOmcm30NikOZKh8jsstFWGPk1fzVhUbfCsRD5WTUMVEKx9
         CcJv8yPsjlufjoR/qyTntu1fzjLG/Jn9epiClqxESJJu1joiavVesuX1odJaSP7v0/U2
         kNuQ==
X-Gm-Message-State: AFq9FYIl4SmT2wZ1XlA9q82Wcwxy+U3UwPUD0GM/LlYVmp1uUutmQtT2
	TsgKYa0YMwX9jnGIl4Ob+Ki6vd3aiDhyHfjxfcljaKj4/JrVn4ctxfqkwXWSAD+C
X-Gm-Gg: AYBFou3wA9RLCiQ3dA5yyhKl5b8MLmgEjIVvl5/zXcbC6qbApqpIz7GQ1SKnJUpG0ih
	94Q9Op2PepfXD2OHpp9qZjXQC+2iez/+xdcmxZbbRZEWzta2Y6X49v6u1c6MJJMIVDczI1dEclh
	V2fzYxR8feQudrwIScJ1kW0SNolRgGW/xbXPng6g5pitiGCsdlF02C8oXXJ6p788iLhzCYASDCi
	Tt5XhZu94g2Gm/rucqMVC6fxEoUIJeek83J5jQgJ8xmh9xTzTy62V4M++QFPf+R2yh6LQT/9GD1
	D5wV4wxyF17qYzT6Dd+I6noJ21bGUB0ricZ8X7nlXffmsAJm8OHOnag3jNGc9yf5iSQzyQQRqEZ
	btE/d/GzPl86MCWrBoDULE9972ig/W2TFRhfA2RKs7kNlXDbTQBx6MbM1PdP8ewHVsHPUbFvpZw
	y+/Hg4btRL/gldq7GZuMDKK2EMXoN1dPalRT37cHK1B4f7JBFrkaGi7XTKADhSRNo2sJdiktu6b
	DYZu3NHVBGSn3Zpukb0qraegh8mRGTSMnUHgbtrBG2Fk9lMl9LFe07P72y6r1Q7P/XC08jR7xlK
	s1YbGCIoJ1iY0rDPuV8hu/MpV+y5qZIn0kax/8LjsjpbAB2YgU9wIrrO2wPfv14iWg71+9L3v7E
	p
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-185125790a4mr11609911c88.19.1792420775916;
        Mon, 19 Oct 2026 07:39:35 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm53384824eec.12.2026.10.19.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:33 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH v2 1/3] yocto-check-layer: Add --run-tests to select the tests to run
Date: Mon, 19 Oct 2026 11:39:22 -0300
Message-ID: <20261019143924.1521981-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019143924.1521981-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
 <20261019143924.1521981-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248176

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


