Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2A894602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 00:19:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 187so1428453wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 17:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y4gb/CYWpMZnbwSn4+xZOi4ezELNTv92NF2STBUHVcE=;
	b=Sh1fehmzkcdW7lRraquz6f9jEi/HNJ6vzQWcDoI66lrs8mk/IyS5gK46X2SXfTSO+M
	HYFM+16ViYxz/feqQAa8bpBtERxAAtg2SzMwARqq3+ijDwc+5kd8Eibwa7g0dGbYfFTz
	lP27h80LMXxAF/M5Xb+yOJP0zRxnclGZK2NK37UzfDzrK76rL91WVY+5XG7CjGGBMLdy
	jOPVNWJb96mzOlvT5b9QHDeB3Kl2rKmzFc7TIdkmVX89p1OXHRecdqH5hoZBGJq/s8Cb
	Fe83Dr7XpJ7aknJyUZwlAFQn4WapVYN5S59j0Itb35frKeBA1XW+iqA+abS75merI+O4
	aixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y4gb/CYWpMZnbwSn4+xZOi4ezELNTv92NF2STBUHVcE=;
	b=ag54R3SXF4OPgG1P4q2JZk57Nu12q1BCLgI8bnXqu4HjbpvsoDCZDV0NO87oZKMGBz
	zRiIAlh/+DOT13EQ0AV8Y7YfolDT3hAiwdGvZrcKi5RywRCbAkxjLU3c3GQmbc2oHe6G
	I79fiZhCy9oxb6iOP69ghxJlYBd311FWd14Dq9x+nlUIFJ5WGaMW2vSWkSQNpqhc+LhO
	oMX/sNEW74JxLijEh1AoJ1RFN6KsgGEzEovI64iZK9Jgi4D7KdxgCtfoBJ1ihjcK5Tmg
	0hF2nKR5+ka7jl80bg8EknV3quFvqwsiJfDArW1vGFPUuilPwQ76uZPJ6iGh97GkoJzl
	8pqg==
X-Gm-Message-State: ALyK8tKnzE97BDo3zIgSCzWX0fGb15FT0xEiDLw6GD7wwf5M8Q/EyRy69dMkLynmATunTA==
X-Received: by 10.194.80.106 with SMTP id q10mr655649wjx.155.1467332349656;
	Thu, 30 Jun 2016 17:19:09 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	t198sm5373859wmt.16.2016.06.30.17.19.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jun 2016 17:19:08 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 17:18:44 -0700
Message-Id: <1467332324-27040-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] buildstats-summary: round the floating point percentage
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
X-List-Received-Date: Fri, 01 Jul 2016 00:19:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was rounded in python 2, but python 3 changed the default behavior of /.
We could switch to the same behavior as previous by switching to // rather
than /, but there's value in keeping at least one decimal point, to avoid the
misleading case where it says 0% but the reuse is non-zero.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/buildstats-summary.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index d73350b..b8ac52c 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -30,7 +30,11 @@ python buildstats_summary () {
                 header_printed = True
                 bb.note("Build completion summary:")
 
-            bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(t, 100*len(sstate)/(len(sstate)+len(no_sstate)), len(sstate), len(no_sstate)))
+            sstate_count = len(sstate)
+            no_sstate_count = len(no_sstate)
+            total_count = sstate_count + no_sstate_count
+            bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(
+                t, round(100 * sstate_count / total_count, 1), sstate_count, no_sstate_count))
 }
 addhandler buildstats_summary
 buildstats_summary[eventmask] = "bb.event.BuildCompleted"
-- 
2.8.0


