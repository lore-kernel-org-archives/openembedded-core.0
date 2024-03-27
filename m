Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFB4C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 18:45:49 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.1716.1711565140304890328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 11:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wSMtCh4H;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.46, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7dec16fc4b2so5814241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711565139; x=1712169939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxf5SU48hDpnaNWUWtAys+O9K3sxwcXKLwlxdDvA7Ng=;
        b=wSMtCh4HuglxczLpXGhGDaAYPMWqeWNDXYWj0b5gw5ShB0Q2RmwlzunxnI5CmiTbMh
         DEosBYDAhkFCulqnMLQ7GRI03UMxNgxXR0XdmSTGmnLLadEvvJQIGl3N9EiCactvJVNs
         OjrRMxKqV7RlxhYorvaHdguFxEbIaeyMzISbL+BUNOBQIERRa+QDPhK81sHzZ4dD4YcL
         gfjXdOMq3p4z5ykVBIyP3LJu2Eo61zl7IvByrClddrXC8Deh84OgpWVYXS102v+hJh+D
         SJ9MBKoJ2X1NcQqmFzr35xGa7BaqGZ4DNHE2pNewHTbwxPzsvYrWMPTO8NFIQbYM6fm1
         kmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711565139; x=1712169939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxf5SU48hDpnaNWUWtAys+O9K3sxwcXKLwlxdDvA7Ng=;
        b=W1RG6Q5Ox14jJIPZ87MGQ9NS33fPhb7l1mMSLEs/vuXfah7WK4K/ruinfRC45n57cS
         2Zwu4HJEUdCzDCTC5JqA1+/L7lPvwhb+++enZzumVz7/bfVk6ahCcQJzSYAxVJwl4QCE
         uNe7KFoqHzdmMZqPJMdy70Pw9BVhSxyYSG/xCh2wd2hNG6R2ixRsQYYT04amO7LtPscJ
         22mDCkLkTZXVhk1t3y+9/CvrX+NogNbHfuxcQIbKxSMCGp4rQTkxNoy9dik86xKqHmoF
         FpW8VizCiUUYadMMwNXXJIFct5a/TqGKz2KYLmvnUwrLeMXX8j93U14ggrKamZ9KR7Sn
         4hAA==
X-Gm-Message-State: AOJu0YzXnEovfGeblqWJnaQPOmvIgD6HLuDtDLzw8fXYxXufx2UTArpn
	EwomlLPlDBV0YLkJCa5KStk8CK3NHaqPgQAogt0Rg51/BZ8NrYulWZ8tfK/TmTAujLwqBlZghLo
	=
X-Google-Smtp-Source: AGHT+IHIW5NQbfQ52PwqXI3O1essfPhOFSGdr95omMQ8JeOTxKFE94actG6XqYpv9TxOepjZlJVOpQ==
X-Received: by 2002:a05:6102:34c2:b0:478:3fce:314b with SMTP id a2-20020a05610234c200b004783fce314bmr1019428vst.25.1711565138982;
        Wed, 27 Mar 2024 11:45:38 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r14-20020a0cf80e000000b0069677500d0bsm5249177qvn.29.2024.03.27.11.45.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:45:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [RFC] recipeutils: check for SRC_URI name in get_recipe_upstream_version
Date: Wed, 27 Mar 2024 14:45:32 -0400
Message-Id: <20240327184532.226557-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 18:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197567

Previously, get_recipe_upstream_version took whatever the first entry in
SRC_URI was for determining the upstream version.  This does not work
for recipes that append to the SRC_URI, as theirs will never be first.
To work around this, add a new variable to specify the SRC_URI name
field and use that to match.  If nothing is specified, it will use the
first SRC_URI.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/ref-manual/devtool-reference.rst |  4 ++--
 documentation/ref-manual/variables.rst         |  8 ++++++++
 meta/lib/oe/recipeutils.py                     | 11 +++++++++--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 9319addc3c61..b774dcb1092b 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -340,8 +340,8 @@ being able to upgrade it, displayed in a table.
 
 This upgrade checking mechanism relies on the optional :term:`UPSTREAM_CHECK_URI`,
 :term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
-:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
-variables in package recipes.
+:term:`UPSTREAM_CHECK_COMMITS`, :term: `UPSTREAM_CHECK_SRCNAME`,  and
+:term:`UPSTREAM_VERSION_UNKNOWN` variables in package recipes.
 
 .. note::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 435481c9aa12..12372c1e67f3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9686,6 +9686,14 @@ system and gives an overview of their function and contents.
 
          UPSTREAM_CHECK_REGEX = "package_regex"
 
+   :term:`UPSTREAM_CHECK_SRCNAME`
+      By default, the first entry in :term:`SRC_URI` is what is used to
+      determine the latest upstream source code version.  If this is not
+      the desired behavior, the :term:`UPSTREAM_CHECK_SRCNAME` variable
+      is used to specify which of the other entries in SRC_URI should be
+      used for this determination.  The value should match the specified
+      name of the :term:`SRC_URI` entry.
+
    :term:`UPSTREAM_CHECK_URI`
       You can perform a per-recipe check for what the latest upstream
       source code version is by calling ``devtool latest-version recipe``. If
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index de1fbdd3a8c8..6fb9fbbc6abc 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1041,9 +1041,15 @@ def get_recipe_upstream_version(rd):
         ru['datetime'] = datetime.now()
         return ru
 
-    # XXX: we suppose that the first entry points to the upstream sources
+    # If the upstream name has been specified, take that one.
+    # Otherwise, default to the first URI in the list
     src_uri = src_uris.split()[0]
-    uri_type, _, _, _, _, _ =  decodeurl(src_uri)
+    if str(rd.getVar('UPSTREAM_CHECK_SRCNAME')):
+        for s in src_uris.split():
+            ud = bb.fetch2.FetchData(s, rd)
+            if ud.parm.get('name') == str(rd.getVar('UPSTREAM_CHECK_SRCNAME')):
+                src_uri = s
+    uri_type, _, _, _, _, _ = decodeurl(src_uri)
 
     (pv, pfx, sfx) = get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri_type)
     ru['current_version'] = pv
@@ -1127,6 +1133,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_COMMITS',
                  'UPSTREAM_CHECK_GITTAGREGEX',
                  'UPSTREAM_CHECK_REGEX',
+                 'UPSTREAM_CHECK_SRCNAME',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
                  'RECIPE_MAINTAINER',
-- 
2.30.2


