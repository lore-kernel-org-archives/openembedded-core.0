Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA962CEFD0F
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:47:02 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100227.1767732416640527087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WeKRzVqK;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8887165aaabso315236d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767732416; x=1768337216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHU0XiQUApRchJKzBWkRSnMPfbgtSv3bRvQw2Aa5NZ0=;
        b=WeKRzVqKjRokFzTu3qePsooHTPOnbJ8xNDNnOoE9GmI4FVSR6nlA9WfqwAwPtVuV6z
         B+aruLKtm5pcRiFYxVY5TdG5YoVKzAQ5Vj3BnoLKcwsW0D5Alv04g0xiLP9Zbpzq6u71
         kdwSs++f1YgxF6M8KLFsWRiYO9flcxt6Fa/LsZKuJ68dv3m+x5Y4O9Hdl8nkdxO87+PO
         l3XOTQ37HjH49i0zmm3rT6QJ8zpakqZaLi/PLvDoYDuPmK2Syj/F8XgbeyvmOYvqfWGh
         xmXLDBLjW1Nrnz0058q548vN7h5IPTwW8i/XBXUJuXLtxLB3AEpnoMkIHfauKoruDLfk
         QHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732416; x=1768337216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHU0XiQUApRchJKzBWkRSnMPfbgtSv3bRvQw2Aa5NZ0=;
        b=VajBTDjiPB2HDKPmgWY/IR1/K/m53Rua6cevkTjncQIsnk1Lr93xn5C+L3LOiwYVSy
         o8M/K49yk+MGjbIfXZ0TDewqQRVm7qJAqICU2/KfiA+Os2pejAeIN/oA9m9n29+Mzv/C
         CDyjtGY1Tzp6kORkGvU8l5p4L2BaU2/+ZuEA3dGLYlRG1PK0irftNxI7gB4Ev2jMX902
         UwslNcRlZ/cl2WO/3rCI/qujDhINGL4liOsYXrIAhbNVdh+xdRTQsyY2+M5hVUR+Vg+1
         VX0rWCNufqlleKjb3kwDryp3WxFnjU4Z4wAufQw7NPCCw49eBe0WQq1O3GXAIhFxNXbg
         FdEA==
X-Gm-Message-State: AOJu0YwJhjKy4jxS/Zm2D5V/7U0wXgTpcQA0nqpvY58fMjf7/9fjUVzE
	fLJ3kv+tklv1JrxvruJ26dUfJWro2GWQdUtyFImaFRQKVZOFG7/wHVODGBQb54i7gMk=
X-Gm-Gg: AY/fxX4LoDNplKwjxwGgEpyYkcXKyVL87tVV2yC/vK+isNqnjPKD3cSLAcaiSnTFmM0
	LgUk0molydNp1BG/qxCSWhJ8e+UeWijAF9LXVxs4IMIV/d1oOCv0fbqiSVnREqJjtBAEM79LxYg
	tJ+11TY8GSnCcAoZsBe2lbjxrzqPDSS4oEtREVwkTCVRCnLCXBJ6UlFguRVqjU5PFPtnmf8L4wS
	q0vb3Ri+xQeqOaRoyeuJM7YrsC2Kanbtweqj4MWev4SdjA1xZbDDETIvxJMQVHMJM822meyaWDQ
	p28TA24xrSKRc+BMiJKM/y6gRFrxIbRrxeF0CphWd08Zd2rY3iC+/chSLOXM+b4vEyLMI+3/A/e
	kaAIIls+PaQxjpKL2cDnvgIHmdoL9nWa+4323e83UMKAyZeWJKpPfZOgdpZmllBIHcioqSoJvmV
	CvseZkQq5ppc/fcPdtB5/A8SVLHywwRmxP0qGQVcJGBwlc6tDmgSPbb5M=
X-Google-Smtp-Source: AGHT+IG2x4M8jeh2VjJmgsxMVBmz+kH6SDL8gDZgg+JAu+GMWu6UfYpDFZxW6uljKbZ096IfwRtoBw==
X-Received: by 2002:a05:6214:1306:b0:87c:19b6:398e with SMTP id 6a1803df08f44-890841754e9mr3015036d6.2.1767732415619;
        Tue, 06 Jan 2026 12:46:55 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm20361976d6.8.2026.01.06.12.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:46:55 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 1/4] generate-cve-exclusions: Add --output-json option
Date: Tue,  6 Jan 2026 15:46:43 -0500
Message-ID: <20260106204646.3417382-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
References: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228925

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

