Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.1258.1615332710357890339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 15:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slBDk70t;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: idadelm@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id k12so23065002ljg.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 15:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCZkTw1hWjE5eN5qNNug79hkmbzVU6AJjvAPdsC0uZ4=;
        b=slBDk70tMxQ2e9hl7ERpkDjYW9W/YBoGN69WEXg4I4jmqJ0QrFiofMKd82bpTPxV5O
         2yZZ0yHwhEIiJAA+7HVUzyFrpxm71YyDWI+TVPivA6o2ZW8iwKEkXty9zNxc4lcrdXps
         LreuT1Wl2oK7s3tVthCnIjMh158hc6KNlfJqU8i0wDv4qLmB0bj/k17SBZXJIilp7PRb
         4+J81tjNMT1kW7Uj7Ake3ltyiqZ/qhRmkIBNMMH3bi71KlKiRYBSAMHoE3L2UIhJioUJ
         WzqVHkLmHkrXjfNKWuvHepxt0Z4Rmw8CRBRCynytMlNCdEt0s/qjs/QlSocomHQhFXnD
         bpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCZkTw1hWjE5eN5qNNug79hkmbzVU6AJjvAPdsC0uZ4=;
        b=Vw7yuk1rKvwRNhmMb3yh1zX7NmJ6FCIbaAPx/cPZPJM16nSl9j8x2uzk4HUelFLARP
         O+CKvPCByutPMof86CizyvoegD0FGh2cSkPZU6rII2Edpx9oy5IZcmJbhXjSgCljV/J5
         9INswNWYoK+Pa9cVKvqKJ8M9EO0j+so3BARPO9rz7hLOS1SfDyGUDIKfhVc4HqqXgKJ7
         dpjUaKZLNaugakMuU7nFUB061SOkz6rocABoWVsF/ptEEkBX/skoNcc2aI5EI9VM0qo6
         gAZxUedZfDhX8O+iXManV9mhlkcJuM/FKXjfpX/UHO4zWceKaxKUje0+dZwe8UG017DC
         cEPA==
X-Gm-Message-State: AOAM530qxdHzFXM9jsha5DA1Iw8jKxSBopIj6akby2dH2ssTdo5qp/pO
	wYQh4+5XcBBbcfOuqzup1yfIXNXK2wwrvw==
X-Google-Smtp-Source: ABdhPJwKEP1eZukuUXoFueZ1JIG5WIRsUZo/e4LWD5ldURS5C3sg4Q1jcaIUJqIs57CZqrXjyMToJA==
X-Received: by 2002:a2e:b175:: with SMTP id a21mr68148ljm.5.1615332708004;
        Tue, 09 Mar 2021 15:31:48 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.101.11])
        by smtp.gmail.com with ESMTPSA id h19sm2261765lfc.87.2021.03.09.15.31.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 15:31:47 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH 1/4] oe.license: Add functions to split and canonicalise license strings.
Date: Wed, 10 Mar 2021 00:31:27 +0100
Message-Id: <20210309233130.104839-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions ensures recipe LICENSE strings are split into their individual licenses and then canonicalised to easily enable their matching with licenses of sources during the packaging process.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/lib/oe/license.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 665d32ecbb..9e9957be1d 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -236,3 +236,26 @@ def list_licenses(licensestr):
     except SyntaxError as exc:
         raise LicenseSyntaxError(licensestr, exc)
     return visitor.licenses
+
+def canonical_license(license, d):
+    """
+    Return the canonical (SPDX) form of the license if available (so GPLv3
+    becomes GPL-3.0), for the license named 'X+', return canonical form of
+    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
+    or the passed license if there is no canonical form.
+    """
+    lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
+    if not lic and license.endswith('+'):
+        lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'))
+        if lic:
+            lic += '+'
+    return lic or license
+
+def split_spdx_lic(licensestr,d):
+    """
+    Split the license strings and returns a set of the
+    canonicalised licenses.
+    """
+    split_lic = list_licenses(licensestr)
+    spdx_lic = set([canonical_license(l, d) for l in split_lic])
+    return spdx_lic
\ No newline at end of file
-- 
2.25.1

