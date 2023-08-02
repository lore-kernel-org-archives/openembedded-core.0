Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B2EC04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:16:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.16122.1690985804275558256
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LRpiXVyF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6C6FE0009;
	Wed,  2 Aug 2023 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690985802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+bxk2I4LGCdbNOm6hD/09/xLL+Oq7YBRycsagt1Svs=;
	b=LRpiXVyF9IizowRytTg4yfKbrX1p+Z4PNGFqtxHiclG/xUgflOnlKE7qANRHpgSIBJyAdv
	5l4Ro2CblxJHkiZgEF2gz5MK9auIYYH2esDkxZUuwdclQaCzOXg5YMS4++GSrzkH+oCDsB
	gTb4Bw6FwLjxN5S7/YHTCDkui2qB+5QROIVsGZuZOtby7A5qsvY7U1+joWTkrwQwhqWrjg
	9HtX5aYCs2KLOiv6Wn0OwQ6AsgFP7s5vz6dgPDZp07/HpUjGLDcwDVCUHR/tOP2WRi8IFN
	jMg3/Fyu1Q3tz0luPDVFN64INO22h1hnqN3M+ntQDPSKvs4bfy0N8pIJc7uLBw==
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/2] scripts/resulttool: allow to replace test raw status with custom string
Date: Wed,  2 Aug 2023 16:17:17 +0200
Message-ID: <20230802141718.3326905-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802141718.3326905-1-alexis.lothore@bootlin.com>
References: <20230802141718.3326905-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185402

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add a STATUS_STRINGS dictionnary matching raw statuses to custom strings.
Whenever a regression must be reported, raw status is searched in the
custom statuses dict (key search is case insensitive). If no custom string
is found, raw status is kept and used in regression report

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index f80a9182a9a9..3a23d7fc0a0e 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -74,6 +74,9 @@ OESELFTEST_METADATA_GUESS_TABLE={
     }
 }
 
+STATUS_STRINGS = {
+}
+
 def test_has_at_least_one_matching_tag(test, tag_list):
     return "oetags" in test and any(oetag in tag_list for oetag in test["oetags"])
 
@@ -173,6 +176,9 @@ def can_be_compared(logger, base, target):
     return ret and metadata_matches(base_configuration, target_configuration) \
         and machine_matches(base_configuration, target_configuration)
 
+def get_status_str(raw_status):
+    raw_status_lower = raw_status.lower() if raw_status else "None"
+    return STATUS_STRINGS.get(raw_status_lower, raw_status)
 
 def compare_result(logger, base_name, target_name, base_result, target_result):
     base_result = base_result.get('result')
@@ -205,7 +211,7 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
             resultstring = "Regression:  %s\n             %s\n" % (base_name, target_name)
             for k in sorted(result):
                 if not result[k]['target'] or not result[k]['target'].startswith("PASS"):
-                    resultstring += '    %s: %s -> %s\n' % (k, result[k]['base'], result[k]['target'])
+                    resultstring += '    %s: %s -> %s\n' % (k, get_status_str(result[k]['base']), get_status_str(result[k]['target']))
             if new_pass_count > 0:
                 resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
         else:
-- 
2.41.0


