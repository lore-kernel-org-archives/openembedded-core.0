Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03266C982F7
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:12:57 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5248.1768590774691870849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNaJPCEk;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5014549c439so2715701cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590774; x=1769195574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHU0XiQUApRchJKzBWkRSnMPfbgtSv3bRvQw2Aa5NZ0=;
        b=HNaJPCEk0Ij+Phdx7PNjKiqap8r8zQY4Z8ZI1v10NCNfblpKjlG365xbGRgJEJgcmd
         IbUsKTbmWz4pyxcr1skuROE65GL3fcKpt66L0KVYvhJ9Fu5G/8x3HyvV4eeMWPqp5qhf
         CFAQHFlBCKrwwBd/PPqsWda6xlh1CWCiG16KoZXylNJDUOBoOHxwnqvwtmWPfxxpPWRp
         QYzBM4Z/7LLZO9HroHzNZtM4rfd0NR+4uQ4tUp6vmmeFKpjVONfXzdXauorspMyB3q6z
         o7Q8672l9tscaNLB+k81RsZYEZxMhZYwuEoUE1ZMk94+LcBhi9BtNzs0ld3lRoh73RA+
         qSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590774; x=1769195574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHU0XiQUApRchJKzBWkRSnMPfbgtSv3bRvQw2Aa5NZ0=;
        b=auDDntQH0UPH5xQOJNpR4OSItTrrUjnYLrYSsFwpq3pQCe1gBXJjtiDRu/sinBftV7
         ywiZT2jy5/VqVTO62sytOSR9QzU9lLJ44XTLznGzlzjB5mh+EoqaKD8vLJ+VuBs0kl++
         oVzD/bE+hexIzxGOFVamSI4FlhiS2zOidfsU192Jaj2l6h9/sUpkyOXH5QlTGspFPLa2
         +p+Mw8IK/6nAD3URPggwtrkW5XljLqZvBSln9MHmsavpvFiya0LQcx/znvgcdTpXCGTt
         DeWppmAjw1b9Kj1kAL0ig7lB5cWp6NjVbvgCKsHHNV3PKbajlMKuaban8+hCIrQINXhv
         oDdA==
X-Gm-Message-State: AOJu0YyNObA/JUvoeCJqX3TPYjUlrRUpTwuGVMnenhr6Bh+EAHQO5CaQ
	0x4FcnnIOQnOOwUXXP4K/21D/XP+8SB7KQ48WMp9j1IOXSj3xkoO9EeApx9YEeaulcY=
X-Gm-Gg: AY/fxX4HnfydveiaaXooFj5gNd/kt+Z1sZUwosMg1641GtI0F8spiZ1o01mdbDPG9Lp
	7n+AkxPrf2KRnsEKBo15QMTBiH/CM06/2j+ItFdcYs+mvjcQSLxxFabhsOFBZuDDpAIAw9ZDu51
	MPjmyKHx8NKRlNgkH1D1KPmJuln4twQd8CWVsWwV4vsjt0YIKKeueiSI+xDqkplxvHYfcoMGG3J
	bCdX9d8tV+J3TonrFiUBvC3klDM2+yUJTGtTHTh7oTkZ98EJqsCThVNt3EtPpwcqQvhQevdhk0Y
	gugoo+HxpyIBv4Gi5WIReEvlEbVtJPrUFwB3essNcMIPFhTihv/k96SZFvwuGwMgGZvZvZpW96E
	Vb0edW2RlxqC+GOGCuWlvO2fB87rHqQniska0Qh/QMMfz68Un9A1ML/hJrowM0mJMfLO0nqvfWG
	gbuII57vBek+XCoKHeE3FYMTEsctTtpb5kl1bKwlThCLQvNGNdf8OZ+4M=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr447792285a.5.1768590773380;
        Fri, 16 Jan 2026 11:12:53 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm287446685a.12.2026.01.16.11.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:12:52 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	antonin.godard@bootlin.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 1/4] generate-cve-exclusions: Add --output-json option
Date: Fri, 16 Jan 2026 14:05:17 -0500
Message-ID: <20260116190520.118714-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116190520.118714-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229559

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

