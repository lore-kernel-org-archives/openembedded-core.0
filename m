Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7A8CEFCF2
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:10:12 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98060.1767726610132419102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/kj73R/;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b29aebdf3cso24090285a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726609; x=1768331409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVE4nLj+3BtCLTmQkJXQCdG9/ceCHtDUVYkwlyOryAk=;
        b=J/kj73R/GLN7iJI9p6M64gjzITAY6ey6q35wfWH8gyaiEevJXPUGlpK6cJBf11IB37
         G8kQPBlx0D7Nsla/j9ZEheqFXE1/RWPyhgiOcukAGQyMshMHukuKuZ7i/fT4Drt/dE5j
         M3DGhJws+WvkpMPsKp5NzBHnOHP0ntUzp0zb6hXwSkgIag1FO1+0SOWzDcc3geERRuKe
         3ji55QVTvgi55pVgYcFvBuTC9SZSOrw93lQ2m8wZDFn9fq4Z5rtPubz/z1pMWIosPzaQ
         gozPIjF6KTW49SPGp4Qwxf0TFzgRRh6uSyFY7ndQw5lKmBccq82O5HzvwhACnbXjfNEr
         KhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726609; x=1768331409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVE4nLj+3BtCLTmQkJXQCdG9/ceCHtDUVYkwlyOryAk=;
        b=Xt7qkC+h/8+Bq3TgpSiok20WWA5LBuuYHJxpLsmrEtktgH4M7B4GwFw6jPGVja/7QD
         wQee8fwqkzKZCwawgwI74NZjUwgMoBnp8D5aDOcyBwuOhj8IzRAIv8+nFI5KW1OZSZrp
         4Kr1h20AkhDPTpSORR9Fi7uCfrPmprWhbizjr3T4k3uCKuGfiGWmACeMNW78PZ1tj0FY
         ZUbPk25d3ELgLLQ07Z8HKVXRtR45McnwtGc/25yXQBthEQiGToIL2sLvXo7UhmhU0eZ8
         4MoVYhaPXwoZy02QRSxvsx8Cpb43WSMWN3E07ILQrfJc3yP3wUF5JM6Cjcp1e0mA412f
         KCBA==
X-Gm-Message-State: AOJu0YzoIiKhK2Xk0SdZJS16M8C2rHx5PwuYWz6NPZQlVAxEPqLzaWRd
	9byE7YbHZ9Huq0SY6tmPuW8FpRS4MPdkje8fgpxd8Xim6Ymy/LgaMD1MuN1dJhCufEw=
X-Gm-Gg: AY/fxX7j8oOY2sc7jfzDRRKETaVcySgLKW1kXz8Iu49AHVte6EtCmgQF76IVeDWmwB6
	d/1VTN3/Lu0jeckCVYC2Tg4yG7Uz+TLjuIB1cWbF+9LQPWaTbb4uEQcEIcWlcmXenthGPU40k+v
	6wyXJfSdIbpC8luu+4BRSF31WFZW1Lho3weymQcIi95cC5m5MBPkg/HND9ELxV0gNW6iOSubSoR
	b9MRrBz4IIO9LAPnPC5q3MOsXnz3/PLhSFjwUSmvtQp5C7iEMuEJJDdxddybNxuiaR5n+GvT5U4
	d8WD5m6JTAkiD9lmfaFPHofuEdrUqSmmOzCsZRh4Qly4nCArcB6lpCqzWX1/Ik/CG7BoK3nUYq6
	pwKy45nC8/2JOTvPge+oe3OzZO778wUenFdKtgQQlq9AWQLyeuDsw5tbaQVCTbnComB2Dd9ACti
	LC6a6g2xM6tMoXYy6N2mQaBphkd+nwq/mHb8BpF9sOb4GAgO4YXV8qhlI=
X-Google-Smtp-Source: AGHT+IG4If8L0BGEfU/a5LMdUUardjtQlg3iXH7aD39dqc8XwX/QoYb9yYSdU1yDsyuTgTKvRo/MVA==
X-Received: by 2002:a05:620a:46a0:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c37ebeb027mr390459285a.10.1767726608850;
        Tue, 06 Jan 2026 11:10:08 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51c05csm220480485a.30.2026.01.06.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:10:08 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [[PATCH v2] 1/4] generate-cve-exclusions: Add --output-json option
Date: Tue,  6 Jan 2026 14:09:58 -0500
Message-ID: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228917

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


