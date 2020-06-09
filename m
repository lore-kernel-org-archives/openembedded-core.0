Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.8219.1591711889858589208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DQeah9lY;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id y11so23610864ljm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4gFV/FbKuevfDZvVAjMkRqNFDP26Y0cMoC4T48MnNZ8=;
        b=DQeah9lYKngrXncvWsal6O8J+wtQ2aEUjLOE/P8OklrDwC7LqL3HokhaG3BmnMvaHa
         +cZHXzcKevYoZ6yNUP33TiNDtIRdQdSd0Tavp0pWVLOWsRcdxWcleFe6dVD7+mDY66ki
         6H+zqGfmOLxINjFGmpgY0V2jl0Ort1hENRsTcQmvZ0ER4Dn/XmQlHn2NE0XHRhFJ26BI
         95DrCxY6VFMwwME1JQU6hoqJ5ipDhEmWclInqy4ZGteVGyfGG/7ve2qgE2KK7eh5nsth
         yc4VQsE3Ryc+CIipmda8Z4Avy7bwShaF3pH3fUjW0+J0Iu9S/GQ7gP8BTG5JYkQ6vI+Y
         ERdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4gFV/FbKuevfDZvVAjMkRqNFDP26Y0cMoC4T48MnNZ8=;
        b=gAevHEJxTAtwfdQjPw/d4p+SmQOPElcXoNTVWFh3UJt88kmJ3Y4qAwRKRnfPB3zhXJ
         NZmbh1uy8pYd+tqaboSLeyMuQGTr6/UfLe8Y/XwAl3ENBYxpBMKGU7useKRqPweopvoB
         RLEhVBFe6pr0bToLu9p4g3Ei9Nzy5VSf8mW55sEZHbCnPVI56+ZsPVAixKMoclYap8nn
         Aireh+8z9U7TaEK82LEuV7KTdBI0tj5dsNwj7Jb0JIcClAtzixBS9gKQJc/yCc0jrfwf
         +vRLhS2336nOvvNixLY5bGWD0yRVlhXYq7vFbWCsfjVaL1BF+1l+DeR+Zf92a/pgAA8L
         OFqw==
X-Gm-Message-State: AOAM532Jd5ZPbgKxLOVGffozOLntGwuoWjMilLrfAAxwXJwtx9XlcnB5
	kmonkJxA4NjpQ4PJlwoK8E/Ore5+
X-Google-Smtp-Source: ABdhPJzzE8wGoMt10Dn5M/zCtcvdofw6UBY8AzuhWrGZloPdKMSbOFDnZEmd4ld/pcd849lUC6ot1A==
X-Received: by 2002:a2e:9987:: with SMTP id w7mr14517400lji.242.1591711887518;
        Tue, 09 Jun 2020 07:11:27 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id m6sm4369947ljg.3.2020.06.09.07.11.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 07:11:26 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 1/2] features_check: Warn if not used
Date: Tue,  9 Jun 2020 16:11:13 +0200
Message-Id: <20200609141114.1751767-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/features_check.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index 4ba827d4ab..31ce600374 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -12,11 +12,25 @@
 # Copyright 2019 (C) Texas Instruments Inc.
 # Copyright 2013 (C) O.S. Systems Software LTDA.
 
+FEATURES_CHECK_INCLUDE_STACK := "${BBINCLUDESTACK}"
+
 python () {
     if d.getVar('PARSE_ALL_RECIPES', False):
         return
 
+    unused = True
+
     for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
+        if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and \
+           d.overridedata.get('ANY_OF_' + kind + '_FEATURES') is None and \
+           d.getVar('REQUIRED_' + kind + '_FEATURES') is None and \
+           d.overridedata.get('REQUIRED_' + kind + '_FEATURES') is None and \
+           d.getVar('CONFLICT_' + kind + '_FEATURES') is None and \
+           d.overridedata.get('CONFLICT_' + kind + '_FEATURES') is None:
+            continue
+
+        unused = False
+
         # Assume at least one var is set.
         features = set((d.getVar(kind + '_FEATURES') or '').split())
 
@@ -39,4 +53,10 @@ python () {
             if conflicts:
                 raise bb.parse.SkipRecipe("conflicting %s feature%s '%s' (in %s_FEATURES)"
                     % (kind.lower(), 's' if len(conflicts) > 1 else '', ' '.join(conflicts), kind))
+
+    # Only warn if inherited directly in a .bb-file; if the class is inherited
+    # via an .inc/.bbclass it could be a false positive
+    inherited_from_bb = d.getVar('FEATURES_CHECK_INCLUDE_STACK').split()[-1].endswith('.bb')
+    if unused and inherited_from_bb:
+        bb.warn("Recipe inherits features_check but doesn't use it")
 }
