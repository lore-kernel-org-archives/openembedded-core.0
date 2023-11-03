Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59BFC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:49:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.65211.1699044576698235847
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fPMpI7C9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DFE31C0004;
	Fri,  3 Nov 2023 20:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699044575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uiww2oYd+2pifcPo/Q4B1v8mfO9XEJYK0kaf/92GEKw=;
	b=fPMpI7C9XfMbWK6/Po6uN6er5nvom7TXJEP10+cGCRw8gDFJLnJ30inDjFZY+HQfsYU3N2
	WBg7bbJ1h/3WsybrnwR9T5iAiuGJCKWqn2VqXLBAtOWhgfGsQw+lwzfXoWgPgyU4tRSCb9
	/hQgNLhO6Rih9HfrZea6qABQCzDrMKpk1z0CLSUOFGODBA2c1tzSUDzPqu2QcqmrG20vAD
	ZB7UYvoWT9VHm/3Yn67lgpIcgI7LRjBKSJw0NhdZxlpPDLjHTbgnlKJPt+lBMNQGibXGPE
	QX5nN5IOqV38AKSV/EnG/XU+/TFjp2UqAbUGebcGsh4vTjRJ2QWv9dyDCknE5w==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH] scripts/resulttool: group all regressions in regression report
Date: Fri,  3 Nov 2023 13:50:18 -0700
Message-ID: <20231103205018.19693-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 20:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190166

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Commit c304fcbe0588b1078373558c2ddf36064bcdf214 introduced a grouping when
listing regressions. This grouping has been added only for ptests. It has
been observed that any other kind of tests could benefit from it. For
example, current regression reports can show the following:

1 regression(s) for oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash
    oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: PASSED -> SKIPPED
1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_help
    oescripts.OEPybootchartguyTests.test_pybootchartguy_help: PASSED -> SKIPPED
1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_pdf_output
    oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_pdf_output: PASSED -> SKIPPED
1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_png_output
    oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_png_output: PASSED -> SKIPPED
1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_svg_output
    oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_svg_output: PASSED -> SKIPPED
[...]

This output is not so useful in its current state and should be grouped per
test type too.
Enable grouping for all kind of tests, to make it llok like the following
in reports:
5 regression(s) for oescripts
    oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: PASSED -> SKIPPED
    oescripts.OEPybootchartguyTests.test_pybootchartguy_help: PASSED -> SKIPPED
    oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_pdf_output: PASSED -> SKIPPED
    oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_png_output: PASSED -> SKIPPED
    oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_svg_output: PASSED -> SKIPPED

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 8fbe5a54783a..10e7d13841a7 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -236,7 +236,8 @@ def compare_result(logger, base_name, target_name, base_result, target_result, d
             for k in sorted(result):
                 if not result[k]['target'] or not result[k]['target'].startswith("PASS"):
                     # Differentiate each ptest kind when listing regressions
-                    key = '.'.join(k.split('.')[:2]) if k.startswith('ptest') else k
+                    key_parts = k.split('.')
+                    key = '.'.join(key_parts[:2]) if k.startswith('ptest') else key_parts[0]
                     # Append new regression to corresponding test family
                     regressions[key] = regressions.setdefault(key, []) + ['        %s: %s -> %s\n' % (k, get_status_str(result[k]['base']), get_status_str(result[k]['target']))]
             resultstring += f"    Total: {sum([len(regressions[r]) for r in regressions])} new regression(s):\n"
-- 
2.42.0


