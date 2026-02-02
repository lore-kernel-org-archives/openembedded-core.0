Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05C1E7FDD8
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:55:39 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1151.1770065736940382835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 12:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X1RFrRkK;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50332392929so4363181cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065736; x=1770670536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sibQHT+4601KjxE2rEQ2qrSn1NvvggnTN773EtcAZBs=;
        b=X1RFrRkK1OWU1fZOE3tB0esc10R1vMHqUesWJLwGnLk+aNNSJ01FkS7GTMUu9SiM5t
         FhC20/leKggT/P+uhw3s80eLq4oDBYkAYEU3nWYKdilbyN0Jn84sIKc2glPbuLfBdDDU
         E0ARrnbDW6X5VABLo4og8V3e/fhVypZJBuZC0L4VUht387SsWjMHFzN+o1FhLHWZsxwT
         GSNrNRz4gvQ5Iz7O0tY9Vh0o+Zvdl+eIYTRq1U9ECcx+Dh1VbyeRcBMMHxhLGvbofx9t
         2UxvSm1c4sPRA4ahTy5ELHYLxMv5O63NyhSFplcdfWR0tkH8gSQaWU72UX4iMNiQiZpZ
         HgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065736; x=1770670536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sibQHT+4601KjxE2rEQ2qrSn1NvvggnTN773EtcAZBs=;
        b=Nb/rZAaC6G6mSNS+f+E6Z/EXF7h59tU4EGiFONi8VyTTGyP46XkSxavDDrjzHosFky
         pQcp8TE0WdEReFeBi4Vc51KIVdUspjEuK+B87Xd+i01kyI9qKOPVF7cZ8HJAnPGpgbVz
         v7ch5OG1yEhKfCwHfiMhbzeTVtXkNfwXxvEPCiMcc2w01SGFaiI1zt5OPAQCmoiyGBrI
         0Ikd23/GRXqiNm8H9ZbLk+ZirWZzYlda4wok489m0GL4xUHPOohyC0JDal6JJI5VU9kC
         oCO0e0rmhQhxB4rDFXr4rg9P5f1JNj0MXJRiDoBEfTuEa2n3MzzadaXUpvO8btyZPRC2
         lUrA==
X-Gm-Message-State: AOJu0Yx8uvHQWyiz/ydBf6eBLWdGwvBhwwofOtgz6MLcnAi2yCi66jBa
	k/4eZFh2OI3lVCOZpbkUR1nE716hVsPv4MO+G4o1NBzZtn7sbSwUGwaxx8aWvRNzS/4=
X-Gm-Gg: AZuq6aL8HaDnAcRCCvXM1cDK95uxgynizl42gMvYTyE7t9gwVOb6F8v3zxbFuEd4Kwa
	SS1RefvN1+DlQxai3OmQSkOK+QWi3CRfEJBe8exYkrUVv3uqV5RZbn8PbcVwBwHDOctipPs67Qm
	9vN7fCATL3TZaHLK6ODx20kk8dEenmrtL6XUITPLJ+pEziN5OzL/F8XofafGv4Ih0jOXbWYkKRm
	fN9jYzU3DnJG4fDFHyXTWmq+6q8Tpl9KccvsM4j7mwPH6KO9d1N4ob7kXTA/VqvpJaKfgHpf7cL
	uRXKmdv1I5ZIjwvj1KnLx3IB5nYVh7U9O3ztBEYZ/IoeoizGoTZ9uBL3hxZZAMhWZtVVDnIzsPa
	SjqhNjku17fu4Z3OoqcUl2sFanFSNr0rANODoFpEePjoHqDh10fNypUZMZQ9rTJHblyItn39mVw
	9JS1N3ElLYQGmhygreMH9glHBsPbgIUTNQ2IqVJ35x93gRnWIi9NXFgxQ=
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1257264985a.2.1770065735743;
        Mon, 02 Feb 2026 12:55:35 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d28c71sm1356221285a.33.2026.02.02.12.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:55:35 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v7 1/4] generate-cve-exclusions: Add output format option
Date: Mon,  2 Feb 2026 15:52:27 -0500
Message-ID: <20260202205231.2134908-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202205231.2134908-1-valentin.boudevin@gmail.com>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
 <20260202205231.2134908-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230400

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

