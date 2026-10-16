Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E12CCF2C4
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6031.1792189489301001904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=epqBHHvb;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-487049569b6so189617f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189487; x=1792794287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wup385dwxVDkfrVucYszYawy23niYe5oEAXYxmi5vQs=;
        b=epqBHHvbK5h2UkyOvoPfeSxyGZFLQS+f7ul2ux7yN4cF58cVKg2gLtvgwDqVhUAgPQ
         mITKc4VOLcsIf/RyYPo1+Eckyz09lImCSACgnTPtlO2xg4/XyOvjeM2YNy/NzOwytOXW
         35ed1POhHcWqB49IKF7vIrs7fojsi7WfiCjbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189487; x=1792794287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wup385dwxVDkfrVucYszYawy23niYe5oEAXYxmi5vQs=;
        b=GJMYY5j0zCRZ3+RPd3T2HoM4bK8NEOb53/TthPsCqBF26Ygsw5+/t5WLm0qDjACXLz
         yI2zWf6xGtXefSbF3MhHXJbeeSqxOErFd8GKX5x+Uqs1q96d2l1oYUem3W8gn3jW1GGQ
         XScbsNmvw8QKycwChPCsipT/SvbBUYCv/S5/VcqgwR2FV9UnMfzXU/BYcWfKBH8YBhH8
         mB2vg1jWfPfmlyeuaCOdMFUBloAOfVFXIU8o5gjJR58L8ch1P2EOlDmGjA0wRynllH92
         yvnmre9RK/lw5qQrFri6vk6eTBmj8JhaiedBMcQlcWODWZA1BJu0+3JiqgRBG6p3tZqO
         Mf8g==
X-Gm-Message-State: AFq9FYJUHIxqBaJulNDZuDizC/9zjH2ocZlCSuN/JMJGDgwBHfg/G6Lb
	RvyW9iClF7bQ5GuwExyHMwJkEqfguSvn9OFKgT3h5anuqaxg+CXqnTpHAO14elo8BlFLYkrXarn
	BNsSDPz8=
X-Gm-Gg: AYBFou2LqwXitbIkxeD+cz8Y5K2u8yt2wgvR4JUzozQKj9ehOHtD9pYkRomz2KD2MDo
	fjYSkTXsuUFWnks56LQSpKZ6w70gFsHKGVniKVpDOhd84trI8xyQdgfqx+OVMFahKyuyIccZm/P
	12fNTyQMykHhayYn4+Mk+37JkKxOc2J7Va9S5ya37ovbZk18DZVM+EkltXPUL8wXC8oCrHCZVQT
	ckNRUnMS5fFoZ2ZaJ9OEiodupE2qQPeTaYzC7hkoy9nSWHcp7V7X+r4YZX2mTI/fS5++aq8NEzq
	ID+tf1QrGvfqAFANVbNhyXAtBgImLsWRW4WoUyNtju4sIX4Yla5R7xE96ahZzDLECp9TnEl2tWL
	lvdkZDIPDqX8AcLluIACa5Dz8wn4OUEa6dl1prD+Bmk65vG97j9jw3a3B675eHIE2kqq0mWMOPc
	pVul0BLCcD2A5dzOBeOKoTgl8XboEclGYcg4V14mkJFg0jfGkVEg/eRBp1JSWy4RfJ+MCSO6Sb9
	Bqc2MJ4JxMYCRas/gAqiMDjU5pqQMDucOhd8zKbwDB0CRgxUzLMoaTKm3qB3/Na61lWrdyZuQ==
X-Received: by 2002:a05:6000:46dc:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e07f9d2damr1258264f8f.22.1792189487511;
        Fri, 16 Oct 2026 15:24:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 12/17] lib/oe/recipeutils: honor stable_upgrade for UPSTREAM_CHECK_COMMITS recipes
Date: Sat, 17 Oct 2026 00:24:14 +0200
Message-ID: <f5444604972b8b5a351418d6caf5baf2423fb92b.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248062

From: Daniel Turull <daniel.turull@ericsson.com>

Found running AUH --stable on wrynose: recipes with
UPSTREAM_CHECK_COMMITS set (gnu-config, gn, piglit, etc.) always
reported "-new-commits-available" regardless of stable_upgrade, since
that check ran before stable_upgrade was ever consulted.

AI-Generated: kiro:claude-sonnet-5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 439d13ce380c099fe6804c14930039da95dcbc3b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/recipeutils.py | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 99e7bc7acf4..522537e0d96 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1069,16 +1069,23 @@ def get_recipe_upstream_version(rd, stable_upgrade=False):
     else:
         ud = bb.fetch.FetchData(src_uri, rd)
         if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
-            bb.fetch.get_srcrev(rd)
-            upversion = None
-            revision = None
-            try:
-                revision = ud.method.latest_revision(ud, rd, ud.name)
+            if stable_upgrade:
+                # UPSTREAM_CHECK_COMMITS recipes only track git HEAD, not a
+                # version number, so there's no way to filter for a "stable"
+                # release; treat as no update available.
                 upversion = pv
-                if revision != ud.revision:
-                    upversion = upversion + "-new-commits-available"
-            except bb.fetch.FetchError as e:
-                bb.warn("Unable to obtain latest revision: {}".format(e))
+                revision = None
+            else:
+                bb.fetch.get_srcrev(rd)
+                upversion = None
+                revision = None
+                try:
+                    revision = ud.method.latest_revision(ud, rd, ud.name)
+                    upversion = pv
+                    if revision != ud.revision:
+                        upversion = upversion + "-new-commits-available"
+                except bb.fetch.FetchError as e:
+                    bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
             if stable_upgrade:
                 stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")

