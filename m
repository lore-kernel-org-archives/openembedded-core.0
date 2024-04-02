Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3324DC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:09:14 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.2209.1712081347025032937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OEZ6nFaw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42ee23c64e3so24474891cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712081346; x=1712686146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4f2uSbxFJRUIcNQ6XWYNFN5c4+m2Gs4SfqM2ltduEc=;
        b=OEZ6nFawHmAxwcr1szMoF/6gqTMfDZu4VGLd/HfJRSVoxC6oMkRsdzJwf/jGIFKdgy
         upJ7LSO+UXUreMEI6y5S/jbTHaqHAvXEpfoKhyoxvjpM7eB7MRnB3HSs0I7W3k2IcubK
         krxcGPkRJJ6sRYeaEm5yj463Cj+SxMVX0JzrHj93JctsSvA93i7asuxPfWl4I7ac/dD7
         e8A4tsmMowZZ0B6/jHSgKdA1HSNetjvVSIdoom4hdzi7dvO7PPNMrx5BXNW88PWTYkV6
         k4vTPzWdgqgFfzHJTQyndfvqElgpVT7p1ec/ArgFA7cYxYeq52LsqWzpS4F/0qB3Fi7a
         TheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081346; x=1712686146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4f2uSbxFJRUIcNQ6XWYNFN5c4+m2Gs4SfqM2ltduEc=;
        b=SxlatBFR0zdUS2/y4MYEWW4xJ0H3L+SPOnvIrgM0OxT7wMgaTyBnfYlgNtf2t++Olg
         4XeDpFNT8E5rqiwnczx0v/6SH/r4bN6O91yNJZT0NIvaAobTIFGqZwLfej0J6HapMCYg
         79E8H2G4sSkkxxqEOkFcdNzxA/pZXTvxHkV/IFsrmMX+kSxJV28Z4ZljIh1qDyhmw139
         odRV8O6nfurxv3xp4yRZsHJLEu9hjyhz97mNRe0r5fL8ms/Ocp+2J0Qt+LKO9P4pEXAs
         2UJiwUC12yPdL+tW+wTvUVXbyU8J+Ey+BOsOvpjLfSINsTk1+kgV1uVyCyHI7OqYpwyy
         09Ww==
X-Gm-Message-State: AOJu0Yzkd/6iDViOi2EAPjNsQxfOMFkAXiGbZrzlHgJXxCpjz2u61aVW
	miLepmQLGxBtr23pkLzy3XPkWekwJsQVtEqBIkAjsWZj599F/1SPxUMsSPufy2y8rCc6Lfg5Ark
	=
X-Google-Smtp-Source: AGHT+IF45KcDLmR3P8lCRJtehBEXqR2NuJTky8fX2fszZfyTFKOihD6NEUAHi1RXz354Yq9p7cjX8w==
X-Received: by 2002:ac8:5f81:0:b0:432:ccf1:52f8 with SMTP id j1-20020ac85f81000000b00432ccf152f8mr499163qta.51.1712081345661;
        Tue, 02 Apr 2024 11:09:05 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i2-20020ac84882000000b00432feda5986sm1448999qtq.35.2024.04.02.11.09.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 11:09:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] recipeutils: use UPSTREAM_CHECK_URI in get_recipe_upstream_version
Date: Tue,  2 Apr 2024 14:09:00 -0400
Message-Id: <20240402180900.2306005-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 18:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197876

Currently, get_recipe_upstream_version blindly takes the first entry in
SRC_URI to see if the recipe is at the latest version.  If
UPSTREAM_CHECK_URI is specified in a recipe, it is probably what should
be used to check for the latest version.  Use that as the first check,
otherwise default back to the first entry in SRC_URI.

wget was doing it's own check for UPSTREAM_CHECK_URI.  Removing this in
favor of the common one now being done in recipeutils.py.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 bitbake/lib/bb/fetch2/wget.py | 37 +++++++++++++++--------------------
 meta/lib/oe/recipeutils.py    |  9 +++++++--
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index dc025800e659..0342f895646d 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -629,27 +629,22 @@ class Wget(FetchMethod):
             return ('', '')
         bb.debug(3, "latest_versionstring, regex: %s" % (package_regex.pattern))
 
-        uri = ""
-        regex_uri = d.getVar("UPSTREAM_CHECK_URI")
-        if not regex_uri:
-            path = ud.path.split(package)[0]
-
-            # search for version matches on folders inside the path, like:
-            # "5.7" in http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
-            dirver_regex = re.compile(r"(?P<dirver>[^/]*(\d+\.)*\d+([-_]r\d+)*)/")
-            m = dirver_regex.findall(path)
-            if m:
-                pn = d.getVar('PN')
-                dirver = m[-1][0]
-
-                dirver_pn_regex = re.compile(r"%s\d?" % (re.escape(pn)))
-                if not dirver_pn_regex.search(dirver):
-                    return (self._check_latest_version_by_dir(dirver,
-                        package, package_regex, current_version, ud, d), '')
-
-            uri = bb.fetch.encodeurl([ud.type, ud.host, path, ud.user, ud.pswd, {}])
-        else:
-            uri = regex_uri
+        path = ud.path.split(package)[0]
+
+        # search for version matches on folders inside the path, like:
+        # "5.7" in http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
+        dirver_regex = re.compile(r"(?P<dirver>[^/]*(\d+\.)*\d+([-_]r\d+)*)/")
+        m = dirver_regex.findall(path)
+        if m:
+            pn = d.getVar('PN')
+            dirver = m[-1][0]
+
+            dirver_pn_regex = re.compile(r"%s\d?" % (re.escape(pn)))
+            if not dirver_pn_regex.search(dirver):
+                return (self._check_latest_version_by_dir(dirver,
+                    package, package_regex, current_version, ud, d), '')
+
+        uri = bb.fetch.encodeurl([ud.type, ud.host, path, ud.user, ud.pswd, {}])
 
         return (self._check_latest_version(uri, package, package_regex,
                 current_version, ud, d), '')
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


