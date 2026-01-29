Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D979D73E8C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 21:10:22 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25888.1769721017795944210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 13:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gQR6F/KN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8946421dd8fso2714766d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 13:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769721017; x=1770325817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sibQHT+4601KjxE2rEQ2qrSn1NvvggnTN773EtcAZBs=;
        b=gQR6F/KNfMTnA45vP3VvtXYicY1mTb3yGhw3VYh+4VCJB+JQIJsi62nhZsdIt7AUQ7
         QdBKM2Ww57sudzKqCkV/2o2JFZxGtXPYKN4Iy/VvWAH5q7O57qXb/sFoo11y8QMu1iJf
         9Lx1SCJe9llX+t0oAVtCqstYA6vaYiOJiLupHxZWtNZuwSiZNhWjToX5bmvGp0HClIjr
         GEYFwQnYJJPq7EPzKBw1t7hAmEd9tTTptvwpWDSq/ZLB5CArR6Wzd4Q+0OystksVrCf3
         ISLQsSo+Ghk7JthTjgFzEtGAshXjGZBo1euGeygv5OEtGmFyTUpW7rjMycSmApvM3GiK
         0o1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721017; x=1770325817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sibQHT+4601KjxE2rEQ2qrSn1NvvggnTN773EtcAZBs=;
        b=IXPh2u2iBLhNrrHHfiK7LlXRRrlGqlPBjwjMK+t+TBBwj0sO3BkglueRAIj/iQxxBJ
         3aaVT4VNF+05pEQcrdY9y+Y3llcp167f8HLCAPTeoZoLoi6+inioHhLwS+9ZkpQ05VEz
         ZJJYW/qNLEz/FMPekEYZTsybC5ML05KTIDdsHBSILjk+nogaRplwKn0YWUUWDJcn6LR9
         H9+Bsc0QDYWhZ1EvZi2XyvS8eyScu22mmcAb1QBNqDhtTTILRRiKdpUbAozhXVMNm/MD
         jQvDfhGg46a+IYTEKJ78aeHLLqr8TdDmnam9Nr3JwGQJiYePjuiN0rriTDSh3Z4asMF6
         MNGA==
X-Gm-Message-State: AOJu0YwEw0bI96ZS5Fq1/sii+mMFTbPRTTDbRP19R9FtymUp75IjHsQh
	idhqsEqLY3EpSMeQAIqyeQhgWyVoJ+IKuPWDKrW2XKuPVgyh0vc30rQD0ME11b8Rhu4=
X-Gm-Gg: AZuq6aKDC8eWdt79nYVumO33c1iEVSjrUEQpZsIPn63bvZybGkec6VbOQRDWJM2NLmi
	mvoMZf/aQg5TqW3PgnveEQz7QzhBdCETOFrEbey34SB4alr3dVYlMEpgh2AdGo/613rSMttrhF1
	vllp7xzSgRJQNfIIEeSpj5L/aQuV2rD7BHlqwedO2LQ0RP3jNqJHBy7R6rHWv5nr5M2+XomCAW6
	HcFfeVQKzMQ6dci0EFaWs3DsppDW13UvbZXmtO0Qgp8kiklQ/pPCxqqWmi1w/gwhOqs4kVJRAnA
	Qg+W6dU0HPs4iHeNZ1lSDBXQCYBlQJjeEWTzoaAnNSGY7pjtZMlLf6Mrhb98yQARamqUUJ2wsng
	5lv9wj8f1WUaM7h1KIY/wquboBIwOl56ut1DOdnhrDnD/s8RIYJwG9N4Nnd9hlOI+vxFrgHx8tU
	1VYwjS6wqfKzNQJT+U7gvIf8E//90G19P/MUTYiAvTjnH4zVFmFPiv954=
X-Received: by 2002:a05:6214:3316:b0:882:63cf:3970 with SMTP id 6a1803df08f44-894e9f3155fmr9420726d6.1.1769721016563;
        Thu, 29 Jan 2026 13:10:16 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5fb1sm45251326d6.9.2026.01.29.13.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:10:16 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 1/4] generate-cve-exclusions: Add output format option
Date: Thu, 29 Jan 2026 16:10:09 -0500
Message-ID: <20260129211012.623827-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129211012.623827-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260129211012.623827-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 21:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230160

This option "--output-json-file" can be used to return a json file instead of
the printing the output in a .inc file.
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

Add a second option "--output-inc-file" to also create a .inc at a given
location.

Both "--output-inc-file" and "--output-json-file" can be used at the
same time.

This commit doesn't affect or modify any existing behaviour of the
script.

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../linux/generate-cve-exclusions.py          | 107 +++++++++++++++---
 1 file changed, 90 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index dfc16663a5..3df0e93e07 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -91,19 +91,38 @@ def main(argp=None):
     parser = argparse.ArgumentParser()
     parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/CVEProject/cvelistV5 or https://git.kernel.org/pub/scm/linux/security/vulns.git")
     parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
+    parser.add_argument("--output-json-file", type=pathlib.Path, help="Write CVE_STATUS mapping to this JSON file")
+    parser.add_argument("--output-inc-file", type=pathlib.Path, help="Write CVE_STATUS mapping to this INC file")
 
     args = parser.parse_args(argp)
     datadir = args.datadir.resolve()
     version = args.version
     base_version = Version(f"{version.major}.{version.minor}")
-
-    data_version = subprocess.check_output(("git", "describe", "--tags", "HEAD"), cwd=datadir, text=True)
-
-    print(f"""
+    print_to_stdout = not args.output_json_file and not args.output_inc_file
+
+    cve_status = {}
+    inc_lines = []
+    
+    if print_to_stdout:
+        data_version = subprocess.check_output(("git", "describe", "--tags", "HEAD"), cwd=datadir, text=True)
+        print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at {datetime.datetime.now(datetime.timezone.utc)} for kernel version {version}
 # From {datadir.name} {data_version}
 
+python check_kernel_cve_status_version() {{
+    this_version = "{version}"
+    kernel_version = d.getVar("LINUX_VERSION")
+    if kernel_version != this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+}}
+do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+""")
+    elif args.output_inc_file:
+        inc_lines.append(f"""
+# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
+# Generated at {datetime.datetime.now(datetime.timezone.utc)} for kernel version {version}
+
 python check_kernel_cve_status_version() {{
     this_version = "{version}"
     kernel_version = d.getVar("LINUX_VERSION")
@@ -131,26 +150,80 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
             continue
         first_affected, fixed, backport_ver = get_fixed_versions(cve_info, base_version)
         if not fixed:
-            print(f"# {cve} has no known resolution")
+            cve_status[cve] = {
+                "active": True,
+                "message": "no known resolution"
+            }
+            if not args.output_json_file:
+                print(f"# {cve} has no known resolution")
+            elif args.output_inc_file:
+                inc_lines.append(f'# {cve} has no known resolution')
         elif first_affected and version < first_affected:
-            print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
+            cve_status[cve] = {
+                "active": False,
+                "message": f"fixed-version: only affects {first_affected} onwards"
+            }
+            if not args.output_json_file:
+                print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
+            elif args.output_inc_file:
+                inc_lines.append(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
         elif fixed <= version:
-            print(
-                f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"'
-            )
+            cve_status[cve] = {
+                "active": False,
+                "message": f"fixed-version: Fixed from version {fixed}"
+            }
+            if not args.output_json_file:
+                print(f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"')
+            elif args.output_inc_file:
+                inc_lines.append(f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"')
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
+                    if not args.output_json_file:
+                        print(f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"')
+                    elif args.output_inc_file:
+                        inc_lines.append(f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"')
                 else:
-                    print(f"# {cve} may need backporting (fixed from {backport_ver})")
+                    cve_status[cve] = {
+                        "active": True,
+                        "message": f"May need backporting (fixed from {backport_ver})"
+                    }
+                    if not args.output_json_file:
+                        print(f"# {cve} may need backporting (fixed from {backport_ver})")
+                    elif args.output_inc_file:
+                        inc_lines.append(f'# {cve} may need backporting (fixed from {backport_ver})')
             else:
-                print(f"# {cve} needs backporting (fixed from {fixed})")
-
-        print()
-
+                cve_status[cve] = {
+                    "active": True,
+                    "message": f"#Needs backporting (fixed from {fixed})"
+                }
+                if not args.output_json_file:
+                    print(f"# {cve} needs backporting (fixed from {fixed})")
+                elif args.output_inc_file:
+                    inc_lines.append(f'# {cve} needs backporting (fixed from {fixed})')
+
+        if print_to_stdout:
+            print()
+        elif args.output_inc_file:
+            inc_lines.append("")
+
+    # Emit structured output if --ret-struct was requested
+    if args.output_json_file:
+        args.output_json_file.write_text(
+        json.dumps(
+                {
+                    "cve_status": cve_status,
+                },
+                indent=2
+            ),
+            encoding="utf-8"
+        )
+    if args.output_inc_file:
+        args.output_inc_file.write_text("\n".join(inc_lines), encoding="utf-8")
 
 if __name__ == "__main__":
     main()

