Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732CCCD5BD1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4344.1779824014625463234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=kuyv8LBH;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-914cf9248ceso271906885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824014; x=1780428814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh5zO5eMw6EF2svQ49U8kHpnlE3VQeKYz8FEUFx2/x4=;
        b=kuyv8LBHGd2EbukvpBrBPsd6vEwJeQz0a4F+wZUqLwKHfE7Aqjf2Qe3uJ9/fDtP13/
         vSWTmWgXbcO9YcSAkI5mrAOw7G5psXqZm3OKlkUfdlIA+pSUWIPzGaZ4fh/3E/mhry1n
         b9Dp9rV0KNtBx9+HkSawTAs2dldwAdB3+XyzWLOwFVdtVfOgqeL1I/m8RHqbh33a9fCS
         EVMvBMdZlAbZBUxJaaYvdua5QzT0Gp11FNtFyBwRSLGanEW15/fSCS9nnaFAr0Zp0eR1
         S+QRMBEjdnwD3zVLo9L7lg8X6VcRbR2QrGf6hnJpfn+/eEo732y1umd4ubN0/uYtMy/u
         J8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824014; x=1780428814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wh5zO5eMw6EF2svQ49U8kHpnlE3VQeKYz8FEUFx2/x4=;
        b=EzM8slCEK31+vrkxM1NoOxgcXXasdPd6tGN29gXDBSKgyhh81YaEjnMBzEq2NOG5Lg
         MgytVgEpCNDcD4lvPAbZwnvtJgG4u2KLeL+gtA0rB1Sz4n7si5b9aZ9FehMq6rc0FzKO
         ci+8hwHU/gpad8VbuEch2zBVw/gLYKEBGkldb+2Rv3xfDE+tLIN+E8NIYVhHM3RFJCuL
         luTCnAZt3u65FCmlLtA5evMKgR+RixV6HimjLJz85Md8DOwHMQyWhV/7aLPQs5ZIbn1b
         TzyvCSYQxrUfEQgSf+JvBIk4BXU7byzjiU4XulmjHh8oJZdAekVzZFP7euiLLlQ3dPxd
         MTOw==
X-Gm-Message-State: AOJu0Yzjf95ychHJ6A7lTJQWZDEdC+XvJqZ2fJjQg8cLGJPhinvkox8R
	SUIAW2dlqEdkPaTBtB3YRmzZiIHY0xALHlmeHDHBO1U5Q9KsbebjqchQ5iqEKE/yJAfvrr0ztDu
	Kt2J5H3E=
X-Gm-Gg: Acq92OFMU6wQIDGVl0hGH3MY1vXGCwVghPvN7BQ3ENAgby0NTSNzcxp8cth0GTdJZfg
	FvyjEhvOiZKoCJdkycF8oMisdP2nft1uuxVDpzP8m/2dEZFAX460A6ozXBIxiekdSaI91bfcJlR
	vJcNkd8ozXBNV4M3Tk+7Ym/iqsFh2iHsjw+VMb2gSZZ+myl4se2jzjZjx90X91pjDav5HzSPYB4
	lQmsU19x4j9aMQrDaA/y9RESifdlEnLPlAEER/67MEZclXC5iIA4vlAgZJwIsAZ0XQLtOsNzVTF
	QTGBitbRQUlifT3zBWsGNWPFrhjB6id6XniUY0bqNuRiBNIUcQh0Ax6XAICrSVPLx+eTc4FdzdS
	ksDClRlTO69gMVF4+EqqS09Uw0ZOF+smZQcrzajew9drYaGrn0RwGFUP2k7xuXbqwMIkX9ht3fo
	BvVgstpxD/izZfAPOL1g03i5l6CNWrg8e95nSJE+HfnKUtjOY=
X-Received: by 2002:a05:620a:2794:b0:90f:fdb3:b752 with SMTP id af79cd13be357-914b4934c7cmr2844477285a.17.1779824013499;
        Tue, 26 May 2026 12:33:33 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87d2060sm297631885a.23.2026.05.26.12.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 5/6] patchtest: tests: base: add helper functions, cleanup
Date: Tue, 26 May 2026 15:33:16 -0400
Message-ID: <20260526193317.807459-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526193317.807459-1-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237623

- Encapsulate the package name acquisition logic in _find_pn()
- Simplify the _getvar() function used across the test suite
- Drastically shorten the get_metadata_stats() function
- Reword and clean up some vague comments and typos

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/base.py | 112 ++++++++++++-------------------
 1 file changed, 44 insertions(+), 68 deletions(-)

diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 8263932dda..30c207f016 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -133,18 +133,17 @@ class Metadata(Base):
     def setUpClassLocal(cls):
         cls.tinfoil = cls.setup_tinfoil()
 
-        # get info about added/modified/remove recipes
+        # get info about added/modified/removed recipes
         cls.added, cls.modified, cls.removed = cls.get_metadata_stats(cls.patchset)
 
     @classmethod
     def tearDownClassLocal(cls):
-        cls.tinfoil.shutdown()
+        if cls.tinfoil:
+            cls.tinfoil.shutdown()
 
     @classmethod
     def setup_tinfoil(cls, config_only=False):
-        """Initialize tinfoil api from bitbake"""
-
-        # import relevant libraries
+        """Initialize tinfoil api from bitbake."""
         try:
             scripts_path = os.path.join(PatchtestParser.repodir, "scripts", "lib")
             if scripts_path not in sys.path:
@@ -156,21 +155,19 @@ class Metadata(Base):
             raise PatchtestOEError('Could not import tinfoil module')
 
         orig_cwd = os.path.abspath(os.curdir)
-
-        # Load tinfoil
         tinfoil = None
         try:
             builddir = os.environ.get('BUILDDIR')
             if not builddir:
                 logger.warn('Bitbake environment not loaded?')
-                return tinfoil
+                return None
             os.chdir(builddir)
             tinfoil = bb.tinfoil.Tinfoil()
             tinfoil.prepare(config_only=config_only)
-        except bb.tinfoil.TinfoilUIException as te:
+        except bb.tinfoil.TinfoilUIException:
             if tinfoil:
                 tinfoil.shutdown()
-            raise PatchtestOEError('Could not prepare properly tinfoil (TinfoilUIException)')
+            raise PatchtestOEError('Could not properly configure tinfoil (TinfoilUIException)')
         except Exception as e:
             if tinfoil:
                 tinfoil.shutdown()
@@ -180,69 +177,48 @@ class Metadata(Base):
 
         return tinfoil
 
+    @staticmethod
+    def _find_pn(data, path):
+        """Find the PN from tinfoil recipe cache data for a given file path."""
+        pn = None
+        pn_native = None
+        for _path, _pn in data:
+            if path in _path:
+                if 'native' in _pn:
+                    pn_native = _pn
+                else:
+                    pn = _pn
+                    break
+        else:
+            if pn_native:
+                return pn_native
+            path_basename = path.split('_')[0]
+            for _path, _pn in data:
+                _path_basename = _path.split('_')[0]
+                if path_basename == _path_basename:
+                    pn = _pn
+        return pn
+
     @classmethod
-    def get_metadata_stats(cls, patchset):
-        """Get lists of added, modified and removed metadata files"""
+    def _getvar(cls, path, varname):
+        """Return a recipe variable value via tinfoil if available."""
+        if cls.tinfoil:
+            data = list(cls.tinfoil.cooker.recipecaches[''].pkg_fn.items())
+            pn = cls._find_pn(data, path)
+            rd = cls.tinfoil.parse_recipe(pn)
+            return rd.getVar(varname)
 
-        def find_pn(data, path):
-            """Find the PN from data"""
-            pn = None
-            pn_native = None
-            for _path, _pn in data:
-                if path in _path:
-                    if 'native' in _pn:
-                        # store the native PN but look for the non-native one first
-                        pn_native = _pn
-                    else:
-                        pn = _pn
-                        break
-            else:
-                # sent the native PN if found previously
-                if pn_native:
-                    return pn_native
-
-                # on renames (usually upgrades), we need to check (FILE) base names
-                # because the unidiff library does not provided the new filename, just the modified one
-                # and tinfoil datastore, once the patch is merged, will contain the new filename
-                path_basename = path.split('_')[0]
-                for _path, _pn in data:
-                    _path_basename = _path.split('_')[0]
-                    if path_basename == _path_basename:
-                        pn = _pn
-            return pn
-
-        if not cls.tinfoil:
-            cls.tinfoil = cls.setup_tinfoil()
-
-        added_paths, modified_paths, removed_paths = [], [], []
+    @classmethod
+    def get_metadata_stats(cls, patchset):
+        """Return lists of absolute paths for added, modified and removed recipe files."""
         added, modified, removed = [], [], []
-
-        # get metadata filename additions, modification and removals
         for patch in patchset:
             if patch.path.endswith('.bb') or patch.path.endswith('.bbappend') or patch.path.endswith('.inc'):
+                abspath = os.path.join(os.path.abspath(PatchtestParser.repodir), patch.path)
                 if patch.is_added_file:
-                    added_paths.append(
-                        os.path.join(
-                            os.path.abspath(PatchtestParser.repodir), patch.path
-                        )
-                    )
+                    added.append(abspath)
                 elif patch.is_modified_file:
-                    modified_paths.append(
-                        os.path.join(
-                            os.path.abspath(PatchtestParser.repodir), patch.path
-                        )
-                    )
+                    modified.append(abspath)
                 elif patch.is_removed_file:
-                    removed_paths.append(
-                        os.path.join(
-                            os.path.abspath(PatchtestParser.repodir), patch.path
-                        )
-                    )
-
-        data = cls.tinfoil.cooker.recipecaches[''].pkg_fn.items()
-
-        added = [find_pn(data,path) for path in added_paths]
-        modified = [find_pn(data,path) for path in modified_paths]
-        removed = [find_pn(data,path) for path in removed_paths]
-
-        return [a for a in added if a], [m for m in modified if m], [r for r in removed if r]
+                    removed.append(abspath)
+        return added, modified, removed
-- 
2.54.0


