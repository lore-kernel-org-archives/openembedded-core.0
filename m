Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00803C982ED
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:06 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1676.1789682884514637638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hltglKY6;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so564525e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682883; x=1790287683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rKFwj9kFzbVkF5uCqrnDDK4YU9WmY6KLEpz71ZeMACo=;
        b=hltglKY6mImcN7XEGwbpZwddc00GYHHrQPBum4RHRej3HVDqoPKMvqw+bKkary+rHd
         QR2D6J0B6mbbBFjcQCq1h8BtQVH9bYInwC5S8umXDRpKgfqyEufAl/aM3nIscit72Aaa
         iVadzxmECbySQJ3GCZHiDsVekjOAYN8LTHeFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682883; x=1790287683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rKFwj9kFzbVkF5uCqrnDDK4YU9WmY6KLEpz71ZeMACo=;
        b=VZO8jdYnEjzznupI+khfXSC57CboQ2V+i1OHqMgRbz5Ipue1hH6WiIzwuitVd4/ubN
         9MK7G5/ZTt/QBBSN5iBtS6RIh9A37VRw6FBtAs7uDwDMfaiOMXGVw9W3wBrgvSkN2Qkd
         4DYXnQzA8PL5mQ10S/lcF/ZuJ+mPe3B224cF5Dk8WMufA71yizAjjlpxv4Xd7eLQNBiq
         bFYqvCXm9QwSAdgrmXXyiJYmt3xmG5EnSP+EQkaesEi2326SLQ3/05eWbc+7lmLy8LKU
         Ydf1BO5bmm2bnUBubqLdXNdrTfmYm/mCgRZkaVJh/Q8f4/8+YPXwxviOGpNH3ZpIPyGh
         9FLg==
X-Gm-Message-State: AFuF++npyEjgZAJzMhTTjYOV7eBfVr0DnOYrzwCpSrSArPrr8pyXzC6E
	vaE5utbuO1zmTlzhzWZ2+2KPFtJHwOtsyA3KJDoKVynENYX1/8bL+7y80o58Z7M67J1N/bsLeEC
	WZxXEcF0=
X-Gm-Gg: AYBFou2iMnI+r6t2/1PQKZ2ynPv1zkbJgEBe7C0jmRUMk1HW6lclzsneiC8pG71utfq
	/sEcgkDqGujdilvdBzAJSTtaeLrXm+d6z0bh9XLWCxX1CkC9VMcW0Vr3lRZ54P7Fe/gwvn/6qCw
	rzDb1ZSsWLfigb8hg1prhHDwh12Ia8Uti2pgj98rOgUMtoxqTKLNRHGX6TJ9oov+WRNpNNdSH/4
	oTSngfT0shzC0k2HA6Wig2ILzx7DjKUWWk2FddSzNWB/fJpfMV201nlQLPYjMg0A8cgSa1FZmjb
	ynR/wpuU6bsJJuRktemiXVRnyxYsIyvU9TdVfFTTXwV9pq1QOgydxliLC9LylU3pjgKAZvoXS7u
	fq4ku5Tb5mUSJWZM7oZ5Y7sivWjZyCa+hE7WtiJVDSiDSBpJ3m6KRjATvd0sgxOiIedxL98lvav
	sJeGdMLm4u0+NkoG1yJ6KEcH3ZxUvFgyTEXsIfbVf6dQ0Yogz4OGZHMxDbeUKJH/NmLMa9gGkRK
	v524O9s8eYTkfoVHscdA0ZDxGMhQAFCCnLwZtl7rDkr0WdTbp5Qh8e9IohcHPw9VvWSiYxcaeY=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr3188365e9.11.1789682882744;
        Thu, 17 Sep 2026 15:08:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/79] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Fri, 18 Sep 2026 00:06:11 +0200
Message-ID: <62a6faf3006d874cd3ad941c83dd8b0c9af0e018.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246121

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set explicitly,
it means that there's no stable updates or the recipe hasn't been
checked yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ed8fdda035dcc21f3df71c0c996973224f4f683)
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536db..7c1df518a8d 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
+                if stable_release_regex:
+                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                else:
+                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGEX" means there's no stable upgrade
+                    pupver = (ru['current_version'], None)
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv = get_recipe_upstream_version(data, stable_upgrade)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
     pkgs_list = []
     data_copy_list = []
+    stable_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 

