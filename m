Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA911D46613
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:03:37 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2514.1768503816076518051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y6tN1owz;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8887e471148so974366d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503815; x=1769108615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHU0XiQUApRchJKzBWkRSnMPfbgtSv3bRvQw2Aa5NZ0=;
        b=Y6tN1owz1KIHVyYVD2KNEiz6WedHDY4B93ucCYA3YUW8gqItKB6z8QUFuGR59NdwZh
         Lit3RR3d3aFReQjjagyHAWVqIJjkhTJb+OJBY0tyS5q/0PoRutSiYy0cNxD0Ndl5FX1M
         AlNyNqNydPhHdcEBB0q9IzPDlxZ0L+jaIuzw5wNBqD0Oi9N+XctFDcYWuhAJAF04oE5X
         Wh1aDCclPhaZnfBCcEC0FegMboiM2bqYKPxK19oa/VY3NX+zmkq5G6PapXqu+WiYIjD3
         TqgsXsa50haIv3O4OKdBBhYiA1RuvItsXpLtpHcfUUk82mXPxH+Yzfi5XDIxqBtPBkad
         xFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503815; x=1769108615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHU0XiQUApRchJKzBWkRSnMPfbgtSv3bRvQw2Aa5NZ0=;
        b=sh8n+A4YDw/P5XqgpqweLyjzwlkhwYM2wlasWsBURRoLMSqAQw9z5P6Dy+/IG5ryyq
         U6IMyXIbSSHoNxTqq61z6jPpmh4sND8TdyOMcaf3cDHiJv8PqMImmCpS89L5mLKTAO4S
         I0nVTgRIKb31zN5ps4bWYDkOq/gv/A/8yM17sZPBHIVkEwnbPOjBH3aluagYC1zxAwgR
         ylRYco6b4HXModrkHVPoRyJLrDcSJY/yz8bzjalVub49SPyAKM3Om1J7tYniMdPDR8Mk
         v/NJLDnIsDbWdaCV4s9zqb8ynO8dc4Us8Kbv7is2J5VoQ/jGk+WM+MslJ6sZwK45grNu
         ZfPQ==
X-Gm-Message-State: AOJu0YwWO9sh/EYM5x6bRKl5MohDln5QbgiasxlnDpdcyUXZALqh21bj
	psEZ4dIyo44JfwxCaHhanNATFB9PGNCSGLPo9fTUy8tJZBu1B3rbar0QXELwfUvcYYc=
X-Gm-Gg: AY/fxX4IZXdHxzMbwauQ0aRSfhVKojMZQGjglcnPSlfftTH4icbZbtmhBfAAY53o1Zx
	IY4xJ5dnmCstCDer2zrMpILkSzceiWPbzL7VgtmGcvSOrpHWVMqDK6oqUumDnIjFcighPVj5pKx
	uFGJCnYyUZkn+fcx+g2SJn6vSNV0UuRTubrMIXwVM5p99OJ12uT0N3bU8Kao8K5t5vAY3UaV4F7
	1Qu1ysYjyC2hk+63SWz1OOt0HZIzR/1ZV1QxwHEvpi05JAyszX/RuVM5tRSxc0cVNV3QzOPS+55
	0vqYPhD7nqfDHHykbABrUSokyDixVUGCRnKttRRUx526Pa1A72MxBWsO3cZgvedyiUVNV6hfsAR
	5A8yxpurhMNRR6XCPaTFiZASjzrBWtqQywM9o6d3HCQTRRu+HGBsRcUSDyew27OMjQxX58A/0nf
	cqVtAcKsbekcLF0irLrHJG6Q4Bj+e8uNTty2Q59deQcOo7nPAXZmnFB1Q=
X-Received: by 2002:a05:6214:5c8f:b0:890:7086:e147 with SMTP id 6a1803df08f44-8942dbfae9dmr4753136d6.2.1768503814871;
        Thu, 15 Jan 2026 11:03:34 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm17016385a.16.2026.01.15.11.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:03:34 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 1/4] generate-cve-exclusions: Add --output-json option
Date: Thu, 15 Jan 2026 14:03:27 -0500
Message-ID: <20260115190331.2276779-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
References: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229428

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

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
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

