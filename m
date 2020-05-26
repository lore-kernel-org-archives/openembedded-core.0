Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.46498.1590478596873409946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 00:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XZNtC4E5;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id 82so11749086lfh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FEIJvjTlI0A9zBhaqMQbW0/BIawDLaGQidFJYklPNdI=;
        b=XZNtC4E5rEiHuOK8oLgGg45MNHI6hs2tjkUYx2v4QhUF0Ze0K8uORzezkL9IpYvLGc
         D6XmKX98avE4vEnKkUTc2dwmYdnCryt3+wRW8ZthoHiYyPXbPXC7T3PEIeb6C89O+KLa
         GL3M0M1PVXXQA7szCVoD8+X0bfbjLCgLnN3QQtYXBEcslc6E4W4fYRbyjPCGS5ncOqI3
         K2+uJuQ5fBIvEPk7F8+9MT8WyqNEIdZyXl6YpdQ95Ju5daEMMt/aejvjMC2RuIxbcNOD
         38i11uMLJO0vLYz3dedxjRKTtuaOimRC931PP3ZR7PjObdNqjjQbZTt1smqboXaL4LIs
         xSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FEIJvjTlI0A9zBhaqMQbW0/BIawDLaGQidFJYklPNdI=;
        b=pjyH0mXD1Q4I+NS4AU9Fsra3hpbzgZ9HzlTPFXHAKoGEn+nII0GJe4mJSzNFiT2zUP
         U7TWDnOW4D+VsHRXN9kCBggB/j1T6jKyDeuB3SVIlKBXJNVA+nwUnB/TKQVXJ45tJaa6
         +qi/CYBr3hueNKt6nZq5NBGtq/RGURe8GOQUwEq53wMzLD1jwiy1WVp5qiZyVWzeU2Dq
         WpnBRfYtk1jjLvGkMVLV/FsbKjIksznadxGfUvGv2r5aqvqvN59FHdrq0rCnwbcwrbST
         JtXNPop0TRJ3h5jXLERcMngVb1g2FwG8581zRhmZANN+RIIDIgrpna9npipcd+kj9d3l
         pQ2g==
X-Gm-Message-State: AOAM531/IJGAtfJ2ptTtiPVwaoyYr5yNXX3h/f67rX29lnviVCtWqM3Y
	N/jGhQH96t9AeO+MKnlkiYXc5PSbt2A=
X-Google-Smtp-Source: ABdhPJy7C25LTP+0ggD2WoFi39/U1qurtDYP+yMTLYK5d3XVamDtw8T1CkN5O92xWyOksC+Hp2hG6A==
X-Received: by 2002:a19:be11:: with SMTP id o17mr16202294lff.187.1590478594371;
        Tue, 26 May 2020 00:36:34 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id i26sm5750361lfc.21.2020.05.26.00.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 00:36:33 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] features_check: Factorize code for checking features
Date: Tue, 26 May 2020 09:36:23 +0200
Message-Id: <20200526073623.38078-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DISTRO/MACHINE/COMBINED features should be treated identically, so
convert the expanded code to a loop. This fixes some of the COMBINED error
messages which were previously referring to MACHINE features. There
should be no functional changes.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/features_check.bbclass | 110 ++++++++--------------------
 1 file changed, 32 insertions(+), 78 deletions(-)

diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index 876d32e315..4ba827d4ab 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -1,23 +1,13 @@
-# Allow checking of required and conflicting DISTRO_FEATURES
+# Allow checking of required and conflicting features
 #
-# ANY_OF_DISTRO_FEATURES:     ensure at least one item on this list is included
-#                             in DISTRO_FEATURES.
-# REQUIRED_DISTRO_FEATURES:   ensure every item on this list is included
-#                             in DISTRO_FEATURES.
-# CONFLICT_DISTRO_FEATURES:   ensure no item in this list is included in
-#                             DISTRO_FEATURES.
-# ANY_OF_MACHINE_FEATURES:    ensure at least one item on this list is included
-#                             in MACHINE_FEATURES.
-# REQUIRED_MACHINE_FEATURES:  ensure every item on this list is included
-#                             in MACHINE_FEATURES.
-# CONFLICT_MACHINE_FEATURES:  ensure no item in this list is included in
-#                             MACHINE_FEATURES.
-# ANY_OF_COMBINED_FEATURES:   ensure at least one item on this list is included
-#                             in COMBINED_FEATURES.
-# REQUIRED_COMBINED_FEATURES: ensure every item on this list is included
-#                             in COMBINED_FEATURES.
-# CONFLICT_COMBINED_FEATURES: ensure no item in this list is included in
-#                             COMBINED_FEATURES.
+# xxx = [DISTRO,MACHINE,COMBINED]
+#
+# ANY_OF_xxx_FEATURES:        ensure at least one item on this list is included
+#                             in xxx_FEATURES.
+# REQUIRED_xxx_FEATURES:      ensure every item on this list is included
+#                             in xxx_FEATURES.
+# CONFLICT_xxx_FEATURES:      ensure no item in this list is included in
+#                             xxx_FEATURES.
 #
 # Copyright 2019 (C) Texas Instruments Inc.
 # Copyright 2013 (C) O.S. Systems Software LTDA.
@@ -26,63 +16,27 @@ python () {
     if d.getVar('PARSE_ALL_RECIPES', False):
         return
 
-    # Assume at least one var is set.
-    distro_features = set((d.getVar('DISTRO_FEATURES') or '').split())
-
-    any_of_distro_features = set((d.getVar('ANY_OF_DISTRO_FEATURES') or '').split())
-    if any_of_distro_features:
-        if set.isdisjoint(any_of_distro_features, distro_features):
-            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % ' '.join(any_of_distro_features))
-
-    required_distro_features = set((d.getVar('REQUIRED_DISTRO_FEATURES') or '').split())
-    if required_distro_features:
-        missing = set.difference(required_distro_features, distro_features)
-        if missing:
-            raise bb.parse.SkipRecipe("missing required distro feature%s '%s' (not in DISTRO_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
-
-    conflict_distro_features = set((d.getVar('CONFLICT_DISTRO_FEATURES') or '').split())
-    if conflict_distro_features:
-        conflicts = set.intersection(conflict_distro_features, distro_features)
-        if conflicts:
-            raise bb.parse.SkipRecipe("conflicting distro feature%s '%s' (in DISTRO_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
-
-    # Assume at least one var is set.
-    machine_features = set((d.getVar('MACHINE_FEATURES') or '').split())
-
-    any_of_machine_features = set((d.getVar('ANY_OF_MACHINE_FEATURES') or '').split())
-    if any_of_machine_features:
-        if set.isdisjoint(any_of_machine_features, machine_features):
-            raise bb.parse.SkipRecipe("one of '%s' needs to be in MACHINE_FEATURES" % ' '.join(any_of_machine_features))
-
-    required_machine_features = set((d.getVar('REQUIRED_MACHINE_FEATURES') or '').split())
-    if required_machine_features:
-        missing = set.difference(required_machine_features, machine_features)
-        if missing:
-            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in MACHINE_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
-
-    conflict_machine_features = set((d.getVar('CONFLICT_MACHINE_FEATURES') or '').split())
-    if conflict_machine_features:
-        conflicts = set.intersection(conflict_machine_features, machine_features)
-        if conflicts:
-            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in MACHINE_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
-
-    # Assume at least one var is set.
-    combined_features = set((d.getVar('COMBINED_FEATURES') or '').split())
-
-    any_of_combined_features = set((d.getVar('ANY_OF_COMBINED_FEATURES') or '').split())
-    if any_of_combined_features:
-        if set.isdisjoint(any_of_combined_features, combined_features):
-            raise bb.parse.SkipRecipe("one of '%s' needs to be in COMBINED_FEATURES" % ' '.join(any_of_combined_features))
-
-    required_combined_features = set((d.getVar('REQUIRED_COMBINED_FEATURES') or '').split())
-    if required_combined_features:
-        missing = set.difference(required_combined_features, combined_features)
-        if missing:
-            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in COMBINED_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
-
-    conflict_combined_features = set((d.getVar('CONFLICT_COMBINED_FEATURES') or '').split())
-    if conflict_combined_features:
-        conflicts = set.intersection(conflict_combined_features, combined_features)
-        if conflicts:
-            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in COMBINED_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
+    for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
+        # Assume at least one var is set.
+        features = set((d.getVar(kind + '_FEATURES') or '').split())
+
+        any_of_features = set((d.getVar('ANY_OF_' + kind + '_FEATURES') or '').split())
+        if any_of_features:
+            if set.isdisjoint(any_of_features, features):
+                raise bb.parse.SkipRecipe("one of '%s' needs to be in %s_FEATURES"
+                    % (' '.join(any_of_features), kind))
+
+        required_features = set((d.getVar('REQUIRED_' + kind + '_FEATURES') or '').split())
+        if required_features:
+            missing = set.difference(required_features, features)
+            if missing:
+                raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES)"
+                    % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind))
+
+        conflict_features = set((d.getVar('CONFLICT_' + kind + '_FEATURES') or '').split())
+        if conflict_features:
+            conflicts = set.intersection(conflict_features, features)
+            if conflicts:
+                raise bb.parse.SkipRecipe("conflicting %s feature%s '%s' (in %s_FEATURES)"
+                    % (kind.lower(), 's' if len(conflicts) > 1 else '', ' '.join(conflicts), kind))
 }
