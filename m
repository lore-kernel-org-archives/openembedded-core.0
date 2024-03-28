Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0CDC54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:32:59 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.19759.1711639970338914420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 08:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=U8/YJIYf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789e4a4d3a5so60528785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711639969; x=1712244769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsA2UBwxif/ML8f7JvwAQiNmiNATDgKIOcSdRDdm5KA=;
        b=U8/YJIYfxDQWxzajKln03JSGbx4Dyk0KW7CxY5eEZldzzxRtmJfVI5JCR6JWyrwFYY
         dYgkK7iWORhJCEyxJcMH7Ne2zJUkF8vfXUSCG18pm46ehhsaHoo8rM66GD5sZ3T6IOq6
         m9LURC+7KfYgSQ4FuMc8hLSlyuFvpltFXUJr/KAHBnGF+TGyWbyyzplduONe1AlfA2Xj
         XiyINPuxipHAMdoKXsK6kRBYJM4tAA2onA2CoZSaEba81iercOAgnDyeWU6eeAsKTQc+
         r2pYqF08++7gZQaRtHu+IjDWqP9wAUCIIaSDFi5Uvv8dxEyd8sv+U+GrjNI3y8BjY9T/
         NKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711639969; x=1712244769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsA2UBwxif/ML8f7JvwAQiNmiNATDgKIOcSdRDdm5KA=;
        b=C437xxmquMym2uoXnAAMM32FG67M9RNgZL1bSmhW+9n3XoPUsTTpRlXrv6iG1/3m+G
         fVhLgVbceEkBEAHsc6BxCS/75F3SA7sFIYszbyZDw4lbURVvSj7dajeCq6Uz+r1ATlwH
         CR8hhw4E4p9OoJKJCJlTDIuheY47GbfYoXvHLI4axPud3eLFSF1plJuAs9tdLnAv97Vg
         oBPYYi5Fh3fCG5b7mgMvWZ917hNV2daaiOi64L4be9oqspbQ6I071gXoRkK0VHm9htbv
         TUnnpEuQjb6T/Lhx/AaqMz8iDigSqZpXX1e8e2pIqK2j7Z8kYVi7l7zFwXI4xix1PBad
         5n2w==
X-Gm-Message-State: AOJu0YxBbY9ywG4UQo7ScJmAMpYo/eLN/OG8H3IW/H95ixqNVkgVDEGe
	7QDqfY5D3Aq0BMYH/xbhj1eee4M9Q+46zRNrZvIsYDakvGDYKY8ryXcqC+xhUdviEy4aS2yaC60
	=
X-Google-Smtp-Source: AGHT+IG5Aq/+JJDnzenDNgzTmmZh5Pda9cuUdt7CceBq5OiIXaTESxVejrjYNW/2jfL14g7Cj1DEEQ==
X-Received: by 2002:a05:620a:1278:b0:789:ec27:d478 with SMTP id b24-20020a05620a127800b00789ec27d478mr3009338qkl.75.1711639969197;
        Thu, 28 Mar 2024 08:32:49 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b16-20020a05620a0f9000b0078a51bf149bsm603581qkn.114.2024.03.28.08.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:32:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipeutils: use UPSTREAM_CHECK_URI in get_recipe_upstream_version
Date: Thu, 28 Mar 2024 11:32:43 -0400
Message-Id: <20240328153243.4101823-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 15:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197580

Currently, get_recipe_upstream_version blindly takes the first entry in
SRC_URI to see if the recipe is at the latest version.  If
UPSTREAM_CHECK_URI is specified in a recipe, it is probably what should
be used to check for the latest version.  Use that as the first check,
otherwise default back to the first entry in SRC_URI.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oe/recipeutils.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index de1fbdd3a8c8..a42609060cd9 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1041,8 +1041,13 @@ def get_recipe_upstream_version(rd):
         ru['datetime'] = datetime.now()
         return ru
 
-    # XXX: we suppose that the first entry points to the upstream sources
-    src_uri = src_uris.split()[0]
+    # If UPSTREAM_CHECK_URI is specified, assume it is correct and use
+    # it.  Otherwise, use the first SRC_URI specified to determine the
+    # latest version.
+    if rd.getVar('UPSTREAM_CHECK_URI'):
+        src_uri = str(rd.getVar('UPSTREAM_CHECK_URI'))
+    else:
+        src_uri = src_uris.split()[0]
     uri_type, _, _, _, _, _ =  decodeurl(src_uri)
 
     (pv, pfx, sfx) = get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri_type)
-- 
2.30.2


