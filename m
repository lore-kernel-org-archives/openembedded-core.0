Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.301.1591811577684229139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 10:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XiOYD1ZX;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id q13so2040981edi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t23LHuZDA0OpU+DivkeyKWH4Zp8i5uvbFLH1s/cwGSg=;
        b=XiOYD1ZXk+ZIrmhUNMozAflD3mr4+2fefOqk1vo5yUZButEKHFl/+88Yc9u176BoKL
         ToxsRmUDFUsu7i+Pq77QUTo6jzYEylQuqXEWLrRjVvYmHyJM48dWfVye6kyPcIfKC75k
         VN1ekCMGKF2xgLdnpeTTk3/2xTd0fOSSwb2K/JvwY5+yXgA77Eofszb2t8oJxiU45crh
         9lZTv2XN9HWTyWDIaI+3hcqp7Oeb87h1rvz0CV4gPTJScPzmK40FqJ5wxSyQt8hi8v7X
         ErVhdQB+U4HUHFVBn7ahiCxWd6r85rZVr+msDcE9REzkJw5mcAV6TUediORMxStp8WfC
         9IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t23LHuZDA0OpU+DivkeyKWH4Zp8i5uvbFLH1s/cwGSg=;
        b=pNEf7YQHOhMz5PZHi5/A21qeIAR19KbuNenzkCepj95Zq0Cyw2NqovwkavC9dNnQsZ
         YQY+SIa8yOOOuGRJHfzWM0OdzPvoPGW31KHg7SxQZ6lSJuvetoJLeltLgXCz+KooWhq4
         MEWERp6IbpT+Vrsx0oQ4VvAD8Sb8rPeD5SvqV2iS3hsXiGJCN0FZ2+9SNmE6tVYrAz0u
         w8S14NnQUTEtYGtt3ftbDAUaChs0Q8bVf6P5vgnEwiLOYKFpuWaF/FSkpy2fk9nsfqNM
         a4O54/4rDgGYn9IxlusoSu4WMafugjxI+YP2kv58VHm91zncnBss/R5EbRKQT07QNnMa
         P2Ww==
X-Gm-Message-State: AOAM531yWOhMPtRaUwz5vIDR1B429wgvQlJPUic3ioCboSCe2PKBkoyC
	HevI8H0RaaMlmdtkaVciv5XraPRL
X-Google-Smtp-Source: ABdhPJxJ1kjcPEPaRFYfPgz6wcXFaOopM/fZzD3Wy5Qv4T6Efi2atFdTUeeO25ZeHWVtkGecXRBVpg==
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr3295626edw.191.1591811575762;
        Wed, 10 Jun 2020 10:52:55 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id j31sm200606edb.12.2020.06.10.10.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:52:55 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] features_check: Warn if not used
Date: Wed, 10 Jun 2020 19:52:43 +0200
Message-Id: <20200610175245.38481-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/features_check.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

Changes since v1:
  Always warn if unused, regardless of where the class is
  included/inherited from
diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index 4ba827d4ab..b3c8047861 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -16,7 +16,19 @@ python () {
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
 
@@ -39,4 +51,7 @@ python () {
             if conflicts:
                 raise bb.parse.SkipRecipe("conflicting %s feature%s '%s' (in %s_FEATURES)"
                     % (kind.lower(), 's' if len(conflicts) > 1 else '', ' '.join(conflicts), kind))
+
+    if unused:
+        bb.warn("Recipe inherits features_check but doesn't use it")
 }
