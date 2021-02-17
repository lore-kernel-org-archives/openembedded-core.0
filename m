Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.3222.1613534461959436823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 20:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z4mNmMh4;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id e7so2380213lft.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 20:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pp0+g9twxQ4dDACTMFxPfyh5fM4MF4BX05GfmA4m90k=;
        b=Z4mNmMh4FCXmwapcUSW3Ho8nHORPdy/c5YspPHh9v6+49R1nXYUnvSNsV89uTaAK/O
         adyNbWthFxFQ/SclXFBPgFkxp7HfVhWZEqw0FMICb5S22kS433Ulx8rlUCAf04kMQMoL
         x4nGWjQ6pt+3N0dOLmS+99QlGCHEydP9N4rBTqG8K9B/gdWZpgl7icSgNsFdCBV1lTev
         sZQvwQ0MP85pLQUKJaEBjeM8ZlxiaJqrmsoAIXsaXzyOJ+/ATBtO3ahUvfxHr6b4ijCg
         QSWcQmTL6WTx7bAf6co5lI553nXl7CRFn1Zm+uBoYuwIkWkXt5b2dExifvqIWTEF01Oj
         isPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pp0+g9twxQ4dDACTMFxPfyh5fM4MF4BX05GfmA4m90k=;
        b=EtMtCNTdpJpEhW/UEYD3rrnhqdphP3E/nrouaTNlXCyMVRnsj92DZ3zTD7ZcX5UXH6
         DFBa0fQw6p+muWyns5QhKRVz54pAEEbKaALqetMov+bunPGDu/4YKCmykvuEx1l+uL5A
         UQQs9lZNkorIYILix8xxo0KyH8Rc4ZarjwFvKubAoREbJVnl8sveIlY2HL3ntnCB/ylW
         I0KNrkMtHCm+uGYGO0YejGksFVxV51/qQrkbQkwLN5iHcXi+FP9oum1f7yI94ds+LW9t
         K3pwDNhN1Sd73XN68bUNdP1CczwSgmOWak7XzAsGc4QkeGTf8nGgPIPmOIS45AdP7f+b
         3cew==
X-Gm-Message-State: AOAM532UYxxbfJCdG6AAZC2Xw4MrrcOiYtMe0Dj6bfGZm4STVvafX+DT
	MojlWpGQC5bvMLvmLBhMzczh54aHV7g/dQ==
X-Google-Smtp-Source: ABdhPJwGnWWhpCNWtb6IrfOFyWlwaHv0eBKPcS/ckEGXPEZID+Mlq9GHo/T8MG0QX/ksI1ksULQUVQ==
X-Received: by 2002:ac2:5470:: with SMTP id e16mr13724317lfn.258.1613534460029;
        Tue, 16 Feb 2021 20:01:00 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.101.17])
        by smtp.gmail.com with ESMTPSA id 5sm101464lff.176.2021.02.16.20.00.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:00:59 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
Date: Wed, 17 Feb 2021 05:00:32 +0100
Message-Id: <20210217040033.21541-5-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217040033.21541-1-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions that will later be used in package.bbclass simply make the source and recipe licenses in the same format so that they can easily be compared and the ouput warnings filtered accordingly.
split_spdx_lic() splits the license strings and returns a set of the canonicalised licenses.
rem_false_lics() does two things:
- Converts '-or-later' licenses to their canonicalised form
- Gets rid of "WITH Linux-syscall-note" from license string if specified in local.conf

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/license.bbclass | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dc91118340..576464cb26 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -435,3 +435,30 @@ python do_populate_lic_setscene () {
     sstate_setscene(d)
 }
 addtask do_populate_lic_setscene
+
+
+def split_spdx_lic(d, licensestr):
+    """
+    Split the license strings and returns a set of the
+    canonicalised licenses.
+    """
+    import oe.license
+    split_lic = oe.license.list_licenses(licensestr)
+    spdx_lic = set([canonical_license(d, l) for l in split_lic])
+    return spdx_lic
+
+def rem_false_lics(d, pkglic):
+    pkglicsperpkg = set([])
+    for l in pkglic:
+        if l.endswith('-or-later'):
+            # Converts '-or-later' licenses to their canonicalised form
+            lic_ = l.replace('-or-later', '+')
+            pkglicsperpkg.add(lic_)
+        elif l.endswith(' WITH Linux-syscall-note'):
+        # Gets rid of "WITH Linux-syscall-note from license sring"
+            if d.getVar("LICENSE_WITH_LINUX_SYS") == "1":
+                lic_ = l.replace(' WITH Linux-syscall-note', '')
+                pkglicsperpkg.add(lic_)
+        else:
+            pkglicsperpkg.add(l)
+    return pkglicsperpkg
\ No newline at end of file
-- 
2.25.1

