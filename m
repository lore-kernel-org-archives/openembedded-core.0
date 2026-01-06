Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F17CCEFCEC
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:28:32 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96837.1767724106188108216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SUdRgNYx;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b29aebdf3cso23540485a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 10:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724105; x=1768328905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVE4nLj+3BtCLTmQkJXQCdG9/ceCHtDUVYkwlyOryAk=;
        b=SUdRgNYxFgBwXOpEaosYBtEu2HF1iJvPL1p4ic8lgDjSJLZGi8oy103gVKSsYPItRC
         GC4pSHk7Y3X4/MU8dpN0Ec6VLMU2hzeNkO/NdId6RVa78gCWIw170fEZQz0MEJjweSpU
         d84Dmt7GCqP59qLpoezZJpOzsT32foVJSRZzQYct4Cpq52gm4+srMKcg6rfhwIEUirF4
         Zj1YDR8jcfdINQY4b3Cmv6kzigHew6yL8lJOxLsSRywwmfaJCJcmg2N/sGhDzrgxU/Ar
         gapGFH7obiGMTMonzNdLr7F8e8sByowfJ4v/mXRgg04Sqg4TLoAIOp6pHsD60rGq5dz7
         00mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724105; x=1768328905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVE4nLj+3BtCLTmQkJXQCdG9/ceCHtDUVYkwlyOryAk=;
        b=OhaM+sokUSL3ZaPZQbSbCjmhgRZSzXQPls3MmxMiURoQKP9d5O62VGvqfPR6PHFpZA
         52Hfx0qa27BNMSGZFaA8aNFEcL8Z/ApcAofhplkkQ2kIaUVQI92jPSf+Jzvr9P3VI/mv
         w5QIntbJ81TPLLwgkux0gTTjwOegYLKkt61ZNrdXTjqKBk+vKAqxaM7RL+K9+Z6XP0Rl
         castKbn9oiRTGm0x3+B9wYi5vVUDG4+Q6iKaivfoNYpdIr55BIuM8M0cS2hE5G4p1tPY
         Xh8PbS1xyyffV6YQhDmYl1W/XzKv+Bls+y1nXRp+1KkLv6AiJMs8tMBUzZICEG2MKk5C
         guIg==
X-Gm-Message-State: AOJu0YwLUgKQ0WmmIqgB+8/9HDaTjgiTOI9QKGy9ZH/r8cDoXkC9IiEZ
	r5Gzu/9d3RBB7TMvnugTvAi6Z0CvjEQ/1WL1Sl87/RaDJuoyWlZ2d0xdP4A5S8+WDpk=
X-Gm-Gg: AY/fxX67KM7vwINJWCcab7Skl8mHbJszVZB0nVRJIXlq0HBjJu37gbwKebncyMOx4j7
	ui+KkBKia+A8kT759+9l9Nxd5pJCb5MjYTUP6si49DolAujO6oVjl1J80x6hvigTixtVdg9uOlP
	kZ2EVtegNSyxBYtrk/r2NuYgNRx2I1uElI4y3hr+4VnO3wIKHGlxUmEmt1UdUqIMwgcMsnMKCUh
	/UXFoWBMVmaYfn/+97khfsddHGvKmljlW2/FH7zy36YDqDceoKd/OieXb8/N5jz1K+RQ/JnZaus
	qpJSlkKK0q0zC/4s4muE6yPVUN7F7hwISyGLpBQQ+EZ1O5VgLF6iyPuXbi+26CXK/KML7Lw2Liq
	x6Cvvl7uRjAb2Dz18ZHjRHISyHZKM/shQF046WzFysmL9CieZZkd5DZq7XDeGZuWT4Goh8tL5Kd
	dmXm7keLeC3RKUBuh39lSnA5hRvo32q8852eMPKm3WOyVl++05/9iPWkM=
X-Google-Smtp-Source: AGHT+IGNKCYeVwO8BuQyQNZvt1R3GGtg2YXQKW2Ch2t09TL+RzOTopq1Rye07UfZrw9zduUkB+y7mQ==
X-Received: by 2002:a05:620a:29c1:b0:89d:4a69:1502 with SMTP id af79cd13be357-8c37eb76e90mr392816985a.3.1767724104946;
        Tue, 06 Jan 2026 10:28:24 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a97fesm214003185a.4.2026.01.06.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:28:24 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH 1/4] generate-cve-exclusions: Add --output-json option
Date: Tue,  6 Jan 2026 13:28:19 -0500
Message-ID: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228909

This option "--output-json" can be used to return a json file instead of
the standard .inc file provided.
The JSON file can easily be manipulated contrary to the .inc file.

Example output structure of the JSON file:

```json
{
  "cve_status": {
    "CVE-2019-25160": {
      "active": false,
      "message": "fixed-version: Fixed from version 5.0"
    },
    "CVE-2019-25162": {
      "active": false,
      "message": "fixed-version: Fixed from version 6.0"
    },
...
```

Also, this commit doesn't affect or modify any existing behaviour of the
script.
---
 .../linux/generate-cve-exclusions.py          | 64 +++++++++++++++----
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index dfc16663a5..5a0a947e06 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -91,6 +91,7 @@ def main(argp=None):
     parser = argparse.ArgumentParser()
     parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/CVEProject/cvelistV5 or https://git.kernel.org/pub/scm/linux/security/vulns.git")
     parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
+    parser.add_argument("--output-json", action="store_true", help="Return CVE_STATUS mapping as JSON")
 
     args = parser.parse_args(argp)
     datadir = args.datadir.resolve()
@@ -99,7 +100,10 @@ def main(argp=None):
 
     data_version = subprocess.check_output(("git", "describe", "--tags", "HEAD"), cwd=datadir, text=True)
 
-    print(f"""
+    cve_status = {}
+
+    if not args.output_json:
+        print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at {datetime.datetime.now(datetime.timezone.utc)} for kernel version {version}
 # From {datadir.name} {data_version}
@@ -131,26 +135,58 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
             continue
         first_affected, fixed, backport_ver = get_fixed_versions(cve_info, base_version)
         if not fixed:
-            print(f"# {cve} has no known resolution")
+            cve_status[cve] = {
+                "active": True,
+                "message": "no known resolution"
+            }
+            if not args.output_json:
+                print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
-            print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
+            cve_status[cve] = {
+                "active": False,
+                "message": f"fixed-version: only affects {first_affected} onwards"
+            }
+            if not args.output_json:
+                print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
         elif fixed <= version:
-            print(
-                f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"'
-            )
+            cve_status[cve] = {
+                "active": False,
+                "message": f"fixed-version: Fixed from version {fixed}"
+            }
+            if not args.output_json:
+                print(f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"')
         else:
             if backport_ver:
                 if backport_ver <= version:
-                    print(
-                        f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"'
-                    )
+                    cve_status[cve] = {
+                        "active": False,
+                        "message": f"cpe-stable-backport: Backported in {backport_ver}"
+                    }
+                    if not args.output_json:
+                        print(f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"')
                 else:
-                    print(f"# {cve} may need backporting (fixed from {backport_ver})")
+                    cve_status[cve] = {
+                        "active": True,
+                        "message": f"May need backporting (fixed from {backport_ver})"
+                    }
+                    if not args.output_json:
+                        print(f"# {cve} may need backporting (fixed from {backport_ver})")
             else:
-                print(f"# {cve} needs backporting (fixed from {fixed})")
-
-        print()
-
+                cve_status[cve] = {
+                    "active": True,
+                    "message": f"#Needs backporting (fixed from {fixed})"
+                }
+                if not args.output_json:
+                    print(f"# {cve} needs backporting (fixed from {fixed})")
+
+        if not args.output_json:
+            print()
+
+    # Emit structured output if --ret-struct was requested
+    if args.output_json:
+        print(json.dumps({
+            "cve_status": cve_status,
+        }, indent=2))
 
 if __name__ == "__main__":
     main()
-- 
2.43.0


