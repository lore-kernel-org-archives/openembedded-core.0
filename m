Return-Path: <ulfalizer@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25F2760079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 18:19:07 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id x79so28121799lff.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WHzs7DGYt0rM1P/58IkeVDeZ4jCYkZw+9y5POdUA80U=;
	b=Riav6jKhhdb6tnOEit4WzkgxoKFAVUvPe5njMwHTgykDLrBiO+6Tw7EFSHyW0o3Vja
	d7HPID8YGXHnGC3GH0/txpURMFhFFuaq7CsrFfYyPsvQD9svXCGJtM/W1ojeainJuzAg
	riaKysUqcycF5Qb/0dqUEURPSUl4TpZuNjXDo5t0q1wytQ5plsNqrVesojz6Y/sPIxQ8
	/sIJGhjaPMZUMTg4Y6H8f1i0un0oV0M2LhbVjInzRqNxdBHUTsWumQURs2z/b8q7BIdA
	v07Jg2xdbjPA7Fr8M3yxrabwSa/aYhew7Dlk24Gj+OZoowy1e3i+QDgPlIuGrP4D/F8l
	icKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WHzs7DGYt0rM1P/58IkeVDeZ4jCYkZw+9y5POdUA80U=;
	b=F83ZYNje1PJ3DOujny3WmqD6vvonslMjZfU/wIiOrcBpBCmrk8H4P38CoNeKa9mN7I
	0kWgk7scYEUT/2WnHrcRqDr3rZvj1ZGdLhn9KzkURpCHM6VoSYhyOAyx0PcidLbxM//h
	S9lJfGl1Uu8XB2qja5Vce07xuPUgiaYba9aRB/yypAYxqtLMdqvvEk7kGh0AxuIeyOD3
	Ytltt/RZOjsNcfjCYYeGytxJ21yM5St5veI+YUAeK6KB432tZbhvzF9X7WKRkVt+nJ1A
	rWLGCDkSw5TTGVxiLTts56nZJrBBbAgrMwruvsX6DXUssOZViDSsaw4wXb9aewG6soCp
	lKZQ==
X-Gm-Message-State: AA6/9Rl089A/GZC/3WX4oxRVUoZQdLZ7ejfuZu2mVA045pHZbc17SgI8mlFSsi93Sp8i7g==
X-Received: by 10.194.188.37 with SMTP id fx5mr12076797wjc.170.1476728347927; 
	Mon, 17 Oct 2016 11:19:07 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:31d2:84ae:c5a7:750c])
	by smtp.gmail.com with ESMTPSA id f2sm54916106wjr.2.2016.10.17.11.19.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 11:19:07 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 20:18:58 +0200
Message-Id: <1476728338-4451-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bitbake: bitbake-layers: Make show-recipes show PR
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
X-List-Received-Date: Mon, 17 Oct 2016 18:19:10 -0000

Only PE and PV were shown, which might have been an oversight. The
tuples passed to version_str() contain three elements (PE, PV, and PR),
not two.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 bitbake/lib/bblayers/query.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bblayers/query.py b/bitbake/lib/bblayers/query.py
index ee1e7c8..7ec903d 100644
--- a/bitbake/lib/bblayers/query.py
+++ b/bitbake/lib/bblayers/query.py
@@ -212,10 +212,10 @@ skipped recipes will also be listed, with a " (skipped)" suffix.
                         if not items_listed:
                             logger.plain('=== %s ===' % title)
                             items_listed = True
-                        print_item(preffile, p, self.version_str(pref[0][0], pref[0][1]), preflayer, True)
+                        print_item(preffile, p, self.version_str(*pref[0]), preflayer, True)
                         for (provfile, provlayer, provver) in provs:
                             if provfile != preffile:
-                                print_item(provfile, p, self.version_str(provver[0], provver[1]), provlayer, False)
+                                print_item(provfile, p, self.version_str(*provver), provlayer, False)
                         # Ensure we don't show two entries for BBCLASSEXTENDed recipes
                         preffiles.append(preffile)
 
-- 
2.7.4


