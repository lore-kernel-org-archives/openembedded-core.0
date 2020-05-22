Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.190.1590185311553148218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 15:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E66m3WNa;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id k7so5581816pjs.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TsJXRJBQTaf4CQLXA+AxOQOUt42Q0QUFWyayaGrywDU=;
        b=E66m3WNaPibL/Zdpz+hirpE6rJicu1G/tU5fHHc+5exoThKKDxMd0pq08aPpsEwVFk
         AunKxiMN/Qhy9hzxK+zn73WcdmT3VK2Amb7WoL1vi3R4nT47/di4x38FMicJcZ00iURP
         dSTTW1QzLKUkmgaAqi0AldsdBI6JNAapy8n104CgacgAZckxXcZf2tMqi+Lcw6+8wg6X
         Z7Ka/V4bxFDtl51SV0IfXwZ6a3HNhKyfGQZuuzWRrKPu0oXq1SWrex4PWycuPW0BC0Sl
         jBnOKd4Mz+xP0tRYLtK6mqld28V6cHEIBdZeur5bLAJlyHsjezFZFTD+SkA5M5TB7J3Q
         LhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TsJXRJBQTaf4CQLXA+AxOQOUt42Q0QUFWyayaGrywDU=;
        b=QVguxNbn2uX6CvJnE+PetydfRFc0aeqDWSQH0wa4ZxscKnrjOl/tRWRAt9zyxdTSJ6
         kfgq3b74HLkbgMsrxdvBOurpgngwUVVWdgTSEnT/qsJB1YK7PryiL3s2RT4WZAJec06a
         7JnH+rVPzorinAuABEgS3yncjQufuE5QvR0Pf8YI1QLVSD6KqPsLzzpMNbbyjJ5Sh33M
         TV9XfRZrMwUfBI+l45CDwFDtbW64vbfm/MzyO/ag7NxQKC38hhw3FPl9k/PhwUxHPP9p
         HfMdEyvcwa+a2tS/SldQ961h9C56gPOpZ6cSTgArxULj2VOiVG1gtJYjAuDRzB2eW53J
         GX/Q==
X-Gm-Message-State: AOAM533+bekQItOoGXm2nPFBSEdkhrlwvxvcLIqrP2Zcjkj4cTASyJpO
	g3GBljcCfIddeFZtwniEGhhUUrRiBRo=
X-Google-Smtp-Source: ABdhPJwbGzDKrsNwxqFAle1nrNSBku7tD/b8u7mj6AMHU3snGspp4W7TmVqyZ/mcws4j8ix04oll7Q==
X-Received: by 2002:a17:902:aa43:: with SMTP id c3mr17067207plr.7.1590185310743;
        Fri, 22 May 2020 15:08:30 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:bdfd:cbde:b10d:fb32])
        by smtp.gmail.com with ESMTPSA id p8sm7041908pgm.73.2020.05.22.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 15:08:29 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] checklayer: Skip layers without a collection
Date: Fri, 22 May 2020 17:08:26 -0500
Message-Id: <20200522220826.27434-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

As in other places in the file, skip layers that don't define a
collection when searching for a layer to resolve a dependency. Fixes
KeyError exceptions when attempting to access the layer collections
later

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/checklayer/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 5aeec2f00f..1138000275 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -143,6 +143,9 @@ def detect_layers(layer_directories, no_auto):
 
 def _find_layer_depends(depend, layers):
     for layer in layers:
+        if 'collections' not in layer:
+            continue
+
         for collection in layer['collections']:
             if depend == collection:
                 return layer
-- 
2.17.1

