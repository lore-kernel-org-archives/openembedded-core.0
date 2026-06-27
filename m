Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F46C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 15:49:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58068.1782575357602524657
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 08:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rigOIjkQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so9258265e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782575356; x=1783180156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcXotzLFlfzQSjM0JKzrqaJno82a6dGnyQ6+yA3AdiQ=;
        b=rigOIjkQMNYnq1ZZEOfupkjmGxXrsGI7Xi80mWyag4HMgiOEPbDQ7pHLvN1WDx8weW
         18TJwD8Dr8Kq4bewavTtOyMQgUsuL9gbTfJE8f+fTFXqcdf3n90IIi22OpPN08aC77xu
         KRAl5b5OI04+ntUBkweU3L9XhPYcZAbV/DKHDK6nOGakNv8MPPFfYmbH6TDBPV701c4+
         kzZ6qe070iFqKUZbGOVEecBsCPNdcg2R0HkApxLXS/B4ifoesrBkFQ2UJar9a/E6FyXD
         hQ71wNiTquZR5XESQiq2cV1T8afaFZ83KKhUFdvlwv9Od/9nyrPIDsHr/WlC/NyHb7oB
         1FCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782575356; x=1783180156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcXotzLFlfzQSjM0JKzrqaJno82a6dGnyQ6+yA3AdiQ=;
        b=F0bhBwpnPjSodnyG4hJ8bZZZWqJxPhbclvtvfYVQ/ZhvEGu01RYUazq0Vr5vSJL4hI
         HkynNrV8G099K4hMs2yARZ5bPlmE4zfKDMZLqkVObIxcQEgf9SyqeSj2ifVglhn1c/DD
         s3ElZIYm/XPXtZmaByHMYfWgwWSejTwyXbWxNZ3Bmsn4+ve9QJ9sEkWTq205CrU4fxkf
         7432SLqqIMxDZ5lM3qiI+SHVXvzsqnXlgvBD8vOAA6lhcppYziaZygT4tksiZ918/oY2
         4pPCEraPC4W4d6keVeaUHtSGoPx9rBJDsWdxylRO1hu7Ap0ctiWb744A8+EtI238Uf8E
         Hv3w==
X-Gm-Message-State: AOJu0YzWuhImp3V/fmK5N7TEKVfNmyrNLVmD6GKTTk95NX0qapoQF+zX
	EqxUcoeEY6dFoFXRIVGIPNM2sHPYbmv8WyG6r0nbVmR/059YcuCpV56JN4SjtqzO2sY=
X-Gm-Gg: AfdE7cn3SbjIO4tP69VPa5LsFuUNc6isw9gPQrYY0IX0r67mqc61WI0qYsEgrFgAKfm
	Xoh8DsGR8FvMoilYjsWaLYnxAT50FFTWO7PFRxpOFB384neVhDVgLBbp2590iC8QBdJo4kSQgiL
	2BCRskETjAnw2WyBfdZBMtqIfak3bYI284sWxFArvUQG5JwsXyk0cilVWfdvZ+WHnxcWBxvrPrz
	xmf8eRDNsNpojp8wNR9QwrSXLfLpaOrliCVFRi5EVNbouXI0yQE4ZsY2KvTRdDRIGYYl7ucVsNa
	R+ayxCHzblSVM3JYmdEbrAEc32F6PnYqPV5hle7uAS5b2af8y8PWY7+UgBnhL2qr5STFBViySxv
	5Qxh30ImnQiXfEUlXtjK778afSRP7aLmd+os/rHVdAEgWbT67u6h3FNHMAIK94Zehg4J6iZRs/O
	hZlYalvohr2X0Z7qYqeXzbI5T7IIYixwrTVA9gpDSNXdrb+ie5QHvPv0LXsu3mWx+Js9L0w+E+q
	7/eg5mVIlJVIyZZ+VS35Uw1yZpI97uTskcYABaXNH9FjkP1pEjtwQ==
X-Received: by 2002:a05:600c:a016:b0:492:e5a5:5a46 with SMTP id 5b1f17b1804b1-492e5a55a84mr39673245e9.35.1782575355493;
        Sat, 27 Jun 2026 08:49:15 -0700 (PDT)
Received: from jan.telenet.be (2a02-1812-512-2c00-268f-e96f-7400-513c.ip6.access.telenet.be. [2a02:1812:512:2c00:268f:e96f:7400:513c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ffe204sm173362895e9.7.2026.06.27.08.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 08:49:15 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] pull-spdx-license.py: add the SPDX licenses exceptions
Date: Sat, 27 Jun 2026 17:49:04 +0200
Message-ID: <20260627154904.338233-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 15:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239697

Fetch and extract the SPDX exception licenses as the normal licenses are handled.

[YOCTO #16294]

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 scripts/pull-spdx-licenses.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/pull-spdx-licenses.py b/scripts/pull-spdx-licenses.py
index 597a62133f..de1f5b7bad 100755
--- a/scripts/pull-spdx-licenses.py
+++ b/scripts/pull-spdx-licenses.py
@@ -55,20 +55,22 @@ def main():
             data = json.load(response)
             version = data["tag_name"]
 
-    print(f"Pulling SPDX license list version {version}")
-    req = urllib.request.Request(
-        f"https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/licenses.json"
-    )
-    with urllib.request.urlopen(req) as response:
-        spdx_licenses = json.load(response)
+    spdx_licenses = {}
+    for jsonfile in ["licenses.json", "exceptions.json"]:
+        req = urllib.request.Request(
+            f"https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/{jsonfile}"
+        )
+        with urllib.request.urlopen(req) as response:
+            spdx_licenses.update(json.load(response))
+            print(len(spdx_licenses))
 
     with (TOP_DIR / "meta" / "files" / "spdx-licenses.json").open("w") as f:
         json.dump(spdx_licenses, f, sort_keys=True, indent=2)
 
-    total_count = len(spdx_licenses["licenses"])
+    total_count = len(spdx_licenses["licenses"] + spdx_licenses["exceptions"])
     updated = 0
-    for idx, lic in enumerate(spdx_licenses["licenses"]):
-        lic_id = lic["licenseId"]
+    for idx, lic in enumerate(spdx_licenses["licenses"] + spdx_licenses["exceptions"]):
+        lic_id = lic.get("licenseId") or lic.get("licenseExceptionId")
 
         print(f"[{idx + 1} of {total_count}] ", end="")
 
@@ -88,7 +90,7 @@ def main():
             continue
 
         with dest_license_file.open("w") as f:
-            f.write(lic_data["licenseText"])
+            f.write(lic_data.get("licenseText") or lic_data.get("licenseExceptionText"))
         updated += 1
         print("done")
 
-- 
2.47.3


