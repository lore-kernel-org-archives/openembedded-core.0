Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id CE53C60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:40:07 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ts6so10486496pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TjFpDschnTCuk+k/VP0awppe/ZPqfbdo3qVoyKhltIE=;
	b=SGd+b9fBNHZztYVtfsPdNX1lp85Pmnkt/cmpAkM/PM3TkoYv2FhT+8AUVFKmcYGXpZ
	FjIjTGThagneniRW5ktVOYddDISW0IwgJh29zvaBCQKk8qHTyh3sQcX8cMtpVYgq5Qg6
	wh+8NsSDFiqZ/4T2ujxJKE3MtC5aG0uYyB9oRS0VJjta4flMaxwvZZEkE9Sdu0VtaR09
	DFmnIYuXbpPVXnfWqFYKrGRWeqzjpxUdPp+V7BQMwoC8v7VGMjBl3RjQ9JVssTrz/QN3
	zib73fiiwhT5DxMbf119VaMkYoWXUjiFUWAT4DFHcsS7sTXMempWczrs/PiAkWZ5QQnW
	pdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TjFpDschnTCuk+k/VP0awppe/ZPqfbdo3qVoyKhltIE=;
	b=UKXrfq2CHULTWJCpxpAbRgbcmR2HS+0nM7ktFEAz64Jt1YN+8KPwHwdg9DRMlNrQJf
	5iNTS5TKXy765nTRR+/VOPbeLL4aGkuMopgt+pyqP/VdmMwM//r7ezVM0V26Zrf768wr
	vo+6MY/NxPbVeO2DMvlSBFkNpjbvSiMT0W3yGYH4zPyjdbpWbfBv8fodqgcYXjUjyCoK
	Rau+nNc5dCzrSvicGgJKLiLN8wEKAUjJ4VfvhYvcwAuowaUmMcPBne3DMdmGhunYjm20
	8yj6ZlRUusvMCI3iFsD2HEWVQNsoMOkNSwvAgmgumOouxhKRyK9gZFDAlFIOTedd5YE2
	Lacg==
X-Gm-Message-State: ALyK8tLTRnLnMMntcr+eR80cfroeOZOoKo1ekZT7bCXJ6fUifwVpj/FiAfTS+2orIfzLoA==
X-Received: by 10.66.118.169 with SMTP id kn9mr247950pab.109.1467405607995;
	Fri, 01 Jul 2016 13:40:07 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	b71sm7748827pfc.51.2016.07.01.13.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 13:40:06 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 13:39:50 -0700
Message-Id: <1467405590-12602-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] buildstats-summary: round the floating point percentage
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
X-List-Received-Date: Fri, 01 Jul 2016 20:40:08 -0000

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
index d73350b..b86abcc 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -30,7 +30,11 @@ python buildstats_summary () {
                 header_printed = True
                 bb.note("Build completion summary:")
 
-            bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(t, 100*len(sstate)/(len(sstate)+len(no_sstate)), len(sstate), len(no_sstate)))
+            sstate_count = len(sstate)
+            no_sstate_count = len(no_sstate)
+            total_count = sstate_count + no_sstate_count
+            bb.note("  {0}: {1:.1f}% sstate reuse({2} setscene, {3} scratch)".format(
+                t, round(100 * sstate_count / total_count, 1), sstate_count, no_sstate_count))
 }
 addhandler buildstats_summary
 buildstats_summary[eventmask] = "bb.event.BuildCompleted"
-- 
2.8.0


