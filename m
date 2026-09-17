Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83807C982E9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1584.1789682891419286015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ojMDLe8x;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so564875e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682890; x=1790287690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZlZ5QLf5AdD9LiGYnvaLvy8/7L8w0l0RsDOcX6JBxkU=;
        b=ojMDLe8xJifjWHu7pe1ntZVduyj4uXc3zfNqmKkjXnoXxvMSEaHW9CRs2E4NpCoDjC
         DoAU4sEA0u5aWMo7+l/+v33a4Udm94lqhdZ7oTSXMaNsMcgS+ljuTT6xCcprGOHkmzCN
         3s9ingnIAAHFK0MimaD2BGH1jUnPFTxgZk/3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682890; x=1790287690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZlZ5QLf5AdD9LiGYnvaLvy8/7L8w0l0RsDOcX6JBxkU=;
        b=i5yYlb+qqzA+t5q8obcIA6gQXVoHkyaZJHrRImnIdP9E6oLU6zAhxSxz2y+dTzW+YC
         wweGse9ILqfN83fdW+GOe4xISydPteX3KOG4SOAFsX2ph88OzMmGCNu+ZoxekegvNMVH
         Q6MBKSNBLeBY28yIg7xAVerLezIKIJtfxMQIS/p+SFkq780lCUX8vBU3BbSEeDCcjeNc
         8t2MltbrQntn6WAF2TychCErTWSBEE59g1tMSUxtyoX56yiTGERxHM6ClTYiQF+/WVVh
         o29Mr2DMXBpSVWjhI5s7/GRdaArYGKdjh50o1hBcRaHHm0WwtgHwz9u1CRe8B+7x3buU
         7O1Q==
X-Gm-Message-State: AFuF++ndGTur7MHSk6AnamSiiwGhtNM3eWkXeTM5uXc9VbjWBtURE+m3
	AfhbSePbrmGMcsEviuofssTONduZYLoDWh5PWj0ircRtPl6MiY2T/9a+6d8kimveB2goyWec0FE
	mFEPNXGY=
X-Gm-Gg: AYBFou3MXhcQlmBj6FAgykVhE2CFPFLtWFdrgNoVoPfd0VRPVPnAxXTTUfHgSJxTvWg
	RdXcFryW7C3sl/k9k5mD2WDtK1Ohf4rCLR1HYVUBMBNjiliWUBm3k9fUVWZI0RY5pjQxDYxWWsU
	763j5Xwdj2he9xtmegn1qJg31TPzgBTwNRmAhk+un8XjjT5VEpD5XzbCOD2vTx4xZek15Pv5BOn
	7ArFvuEwdi08YXnbJE4F3zjhHkh4SCg3kblhCQAlbS8ec4Jv23aUMPlah2xLhh9LUO6pCjJC8Op
	AGs82OKj15QcPA5/q1JPv5Ej17BV4bT5Y4xboZk5McCL0/0oUN6Bl/8zosKkQWKnkFx12ZgP8V1
	4I7f9fq9uaAjvM453qKdtC3IakY/eSChhqDEopoOwURVan2PcxnRS/zYvBrJEDOYGDTz9F9C2o8
	nwcyrqzzsAIoLx0Xq+tzfybI/QM2mEHc3FIB/a/xTiqchOOdSo8KeJXspyL+TiyW+EfZogUSaPa
	nye+Mi55ZFWD17EQtVXShxIGGdNNHX0CBSyrmt+Dd0Jp9mU4AqkoFi+fONaQka5/1LqmnrbICY=
X-Received: by 2002:a05:600c:6296:b0:49e:63cd:31fb with SMTP id 5b1f17b1804b1-49fc5714bdamr2943675e9.9.1789682889656;
        Thu, 17 Sep 2026 15:08:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/79] openssl: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:23 +0200
Message-ID: <e4db1edb8a4db4bc6dae50cec770323618c81a02.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246133

From: Daniel Turull <daniel.turull@ericsson.com>

OpenSSL's release strategy states that patch releases contain only bug and
security fixes, with no new features and no API or ABI breaking changes.
It maintains several series at once: 3.0.21, 3.4.6, 3.5.7 and 3.6.3 were
all released on 2026-06-09, with 4.0.0 already out. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://openssl-library.org/policies/releasestrat/

Checked the last three point releases. Each is labelled "a security patch
release" in its own NEWS.md header, and every entry is a CVE fix, the item
count matching the unique CVE count exactly: 15 CVEs in 3.5.7 (Jun 09
2026), 7 in 3.5.6 (Apr 07 2026), 12 in 3.5.5 (Jan 27 2026).

When a series reaches EOL the regex must be moved to the next maintained
series by hand, as that is a feature-level change.

One limit is worth stating, from this recipe's own history: 3.2.4 -> 3.2.5
was refused on scarthgap in July 2025 for intermittent ptest failures in a
dependent recipe, bisected to an upstream commit and reported upstream,
and the branch went to 3.2.6 instead. A fixes-only release can still fail
to integrate, so proposing an upgrade is not the same as it passing.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.0.2 -> 3.0.19 on the 3.0 LTS series;
scarthgap 3.2.1 -> 3.2.6 then, at EOL, 3.5.5 -> 3.5.7; wrynose picked up
3.5.7.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 75f78c58cf9e4b385ddf4f09668b7f1a49117d97)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssl/openssl_3.5.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
index cc148f07c7d..d8cae41291a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
@@ -24,6 +24,11 @@ SRC_URI[sha256sum] = "a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b95144
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
 
+# OpenSSL publishes bugfix/security-only releases on its per-minor branches.
+# When the tracked series reaches EOL, bump the regex manually to the next
+# maintained series.
+inherit upstream-stable-release-point
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""

